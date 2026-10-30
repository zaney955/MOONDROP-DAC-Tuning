#!/usr/bin/env python3
"""Offline byte inspection of SPV upgrade containers; never opens a USB device."""
import argparse
import hashlib
import json
import re
import struct
import zlib
from pathlib import Path

MAGIC = 0x40565053
USER_MASK = 0xFFFFFF00
USER_TAG = 0x4F414D00
ADDR_MASK = 0xFFFFFF


def sha(b):
    return hashlib.sha256(b).hexdigest()


def u32(b, at):
    return struct.unpack_from('<I', b, at)[0]


def offsets(b, needle):
    return [m.start() for m in re.finditer(re.escape(needle), b)]


def cstr(b, at, limit=64):
    end = min(len(b), at + limit)
    nul = b.find(b'\0', at, end)
    return b[at:nul if nul >= 0 else end].decode('utf-8', errors='replace')


def parse(path):
    b = path.read_bytes()
    r = {'path': str(path.resolve()), 'size': len(b), 'sha256': sha(b),
         'prefix_96_hex': b[:96].hex(), 'spv_magic_offsets': offsets(b, b'SPV@'),
         'claims_scope': 'Static bytes only; no runtime configuration or chip compatibility established.'}
    if len(b) < 4096 or u32(b, 4) != MAGIC:
        r['raw_spv_parser_accepted'] = False
        r['raw_spv_rejection'] = 'Too short or tag at offset 4 differs from 0x40565053'
        if len(b) >= 12:
            r['header_word_4'] = hex(u32(b, 4))
            r['header_word_4_equals_size_minus_8'] = u32(b, 4) == len(b) - 8
        return r
    r['raw_spv_parser_accepted'] = True
    flag = u32(b, 12)
    if flag & USER_MASK == USER_TAG:
        date_at, time_at, count_at, entries_at, stride = 20, 24, 28, 32, 16
        r['layout'] = 'AMA-tag branch; 16-byte bin records'
        r['encrypt_address_declared'] = hex(u32(b, 8))
        r['encrypt_size_declared'] = u32(b, 16)
    else:
        date_at, time_at, count_at, entries_at, stride = 36, 40, 44, 64, 32
        r['layout'] = 'alternate branch; 32-byte bin records'
    n = u32(b, count_at)
    if not 0 < n <= 100:
        raise ValueError(f'Invalid count {n}')
    r['user_flag'] = hex(flag)
    r['build_date_address'] = hex(u32(b, date_at))
    r['build_time_address'] = hex(u32(b, time_at))
    r['build_date'] = cstr(b, u32(b, date_at) & ADDR_MASK)
    r['build_time'] = cstr(b, u32(b, time_at) & ADDR_MASK)
    r['whole_file_crc32_computed'] = f'0x{zlib.crc32(b) & 0xffffffff:08x}'
    r['bins'] = []
    active = []
    for i in range(n):
        at = entries_at + i * stride
        address, size, checksum = u32(b, at + 4), u32(b, at + 8), u32(b, at + 12)
        start = address & ADDR_MASK
        end = start + size
        data = b[start:end] if end <= len(b) else b''
        v = {'index': i, 'record_offset': hex(at), 'name': cstr(b, at, 4),
             'address': hex(address), 'file_offset': hex(start), 'size': size,
             'end_offset_exclusive': hex(end), 'within_file': end <= len(b),
             'declared_checksum': hex(checksum), 'payload_sha256': sha(data)}
        total = sum(data) & 0xffffffff
        v['payload_byte_sum'] = hex(total)
        chk_at = at + 12
        excluded = sum(b[chk_at:chk_at+4]) if start <= chk_at and chk_at + 4 <= end else 0
        v['checksum_field_byte_sum_excluded_if_inside_payload'] = excluded
        v['byte_sum_minus_own_checksum_field'] = hex((total - excluded) & 0xffffffff)
        v['additive_checksum_observed_match'] = checksum == ((total - excluded) & 0xffffffff)
        r['bins'].append(v)
        if size and end <= len(b):
            active.append((start, end, v['name']))
    r['active_ranges'] = [{'start': hex(a), 'end_exclusive': hex(z), 'bin': name} for a, z, name in active]
    r['gaps'] = []
    for (_, end, _), (start, _, _) in zip(sorted(active), sorted(active)[1:]):
        if start > end:
            gap = b[end:start]
            r['gaps'].append({'start': hex(end), 'end_exclusive': hex(start), 'size': len(gap),
                              'all_zero': not any(gap), 'sha256': sha(gap)})
    r['usb_style_string_descriptors'] = []
    for at in range(len(b) - 4):
        ln = b[at]
        if b[at+1] != 3 or ln < 4 or ln > 126 or ln % 2 or at + ln > len(b):
            continue
        data = b[at+2:at+ln]
        try:
            s = data.decode('utf-16le')
        except UnicodeDecodeError:
            continue
        if not s or not all(32 <= ord(ch) < 127 for ch in s):
            continue
        if len(s) < 3:
            continue
        r['usb_style_string_descriptors'].append({'descriptor_offset': hex(at),
            'text_offset': hex(at+2), 'length': ln, 'text': s,
            'inside_sent_bin': next((name for a,z,name in active if a <= at and at+ln <= z), None),
            'bytes_hex': b[at:at+ln].hex(), 'status': 'syntactically plausible; runtime selection unproved'})
    r['strict_usb_device_descriptor_candidates'] = []
    for at in offsets(b, b'\x12\x01'):
        if at+18 > len(b):
            continue
        d = b[at:at+18]
        if struct.unpack_from('<H', d, 2)[0] not in [0x100,0x110,0x200,0x201,0x210,0x300,0x310,0x320]:
            continue
        if d[7] not in [8,16,32,64,9] or not 1 <= d[17] <= 8:
            continue
        r['strict_usb_device_descriptor_candidates'].append({'offset': hex(at), 'bytes_hex': d.hex(),
            'vid': hex(struct.unpack_from('<H',d,8)[0]), 'pid': hex(struct.unpack_from('<H',d,10)[0])})
    r['raw_target_id_byte_occurrences_not_evidence_of_fields'] = {
        'vid_35d8_little_endian': [hex(x) for x in offsets(b, bytes.fromhex('d835'))],
        'pid_149b_little_endian': [hex(x) for x in offsets(b, bytes.fromhex('9b14'))],
        'adjacent_vid_pid_35d8_149b': [hex(x) for x in offsets(b, bytes.fromhex('d8359b14'))]}
    return r


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('files', nargs='+', type=Path)
    p.add_argument('--output', type=Path)
    args = p.parse_args()
    results = [parse(x) for x in args.files]
    r = {'method': 'stdlib byte parsing, modeled on official SPA class cj parseBinFiles and APK Law0.c',
         'files': results,
         'identical_groups': [[x['path'] for x in results if x['sha256'] == h]
                             for h in sorted({x['sha256'] for x in results})
                             if sum(x['sha256'] == h for x in results) > 1]}
    text = json.dumps(r, indent=2, ensure_ascii=False) + '\n'
    if args.output:
        args.output.write_text(text)
    else:
        print(text, end='')


if __name__ == '__main__':
    main()
