"""Inspect saved firmware bytes only; no network, USB, target loading or execution.

Run: python3 evidence/firmware-compatibility-20261030/analyze_offline.py
SPV header layout follows the saved official web parser; .hid target fields
follow the saved official native EepromPatch disassembly and log strings.
Matching fields alone do not prove that firmware is safe or compatible.
"""
import hashlib
import json
import struct
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
PREVIOUS = ROOT / 'evidence/firmware-readonly-20261030'


def identity(path):
    data = path.read_bytes()
    return data, {
        'file': str(path.relative_to(ROOT)),
        'size': len(data),
        'sha256': hashlib.sha256(data).hexdigest(),
    }


def u32(data, offset):
    return struct.unpack_from('<I', data, offset)[0]


def text(data, offset, limit=64):
    if not 0 <= offset < len(data):
        return None
    return data[offset:offset + limit].split(b'\0', 1)[0].decode('ascii', 'replace')


def spv(data):
    if len(data) < 4096 or data[4:8] != b'SPV@':
        raise ValueError('Not the selected official parser\'s SPV@ input')
    compact = u32(data, 12) & 0xffffff00 == 0x4f414d00
    table, stride, count_at = (32, 16, 28) if compact else (64, 32, 44)
    date_at, time_at = (20, 24) if compact else (36, 40)
    count = u32(data, count_at)
    if not 0 < count <= 100 or table + count * stride > len(data):
        raise ValueError('Invalid segment table bounds')
    segments = []
    for index in range(count):
        offset = table + index * stride
        address, size, checksum = struct.unpack_from('<III', data, offset + 4)
        start = address & 0xffffff
        end = start + size
        entry = {
            'name': text(data, offset, 4),
            'address': hex(address),
            'file_offset': hex(start),
            'size': size,
            'declared_checksum': hex(checksum),
            'nonempty': size > 0,
            'range_within_file': end <= len(data),
        }
        if size:
            if end > len(data):
                raise ValueError('Nonempty segment exceeds file bounds')
            payload = data[start:end]
            value = sum(payload)
            checksum_field = offset + 12
            if start <= checksum_field and checksum_field + 4 <= end:
                value -= sum(data[checksum_field:checksum_field + 4])
            entry.update(
                additive_byte_checksum=hex(value & 0xffffffff),
                additive_byte_checksum_matches=(value & 0xffffffff) == checksum,
                payload_sha256=hashlib.sha256(payload).hexdigest(),
            )
        segments.append(entry)
    strings = []
    for word in ('Marigold', 'MOONDROP'):
        target = word.encode('utf-16le')
        position = 0
        while (position := data.find(target, position)) >= 0:
            in_segments = [s['name'] for s in segments if s['size'] and
                           int(s['file_offset'], 16) <= position and
                           position + len(target) <= int(s['file_offset'], 16) + s['size']]
            strings.append({
                'text': word,
                'text_offset': hex(position),
                'preceding_two_bytes_hex': data[max(0, position - 2):position].hex(),
                'included_in_payload_segments': in_segments,
                'runtime_descriptor_selection_proven': False,
            })
            position += len(target)
    return {
        'magic': 'SPV@',
        'user_flag_bytes_hex': data[12:16].hex(),
        'compact_header': compact,
        'build_date': text(data, u32(data, date_at) & 0xffffff),
        'build_time': text(data, u32(data, time_at) & 0xffffff),
        'segments': segments,
        'string_descriptors': strings,
    }


def main():
    original, original_id = identity(PREVIOUS / 'official-ECHO-B-ota-1.0.0.bin')
    other, other_id = identity(HERE / 'BIANCA-catalog-candidate.bin')
    references = []
    for path in sorted(HERE.glob('*.hid')):
        data, record = identity(path)
        if len(data) < 32:
            raise ValueError(f'Short .hid header: {path}')
        vendor, product, update_type, signature, crc = struct.unpack_from('<5I', data)
        record.update(
            declared_target=f'{vendor:04x}:{product:04x}',
            update_type=update_type,
            signature_bytes=data[12:16].decode('ascii', 'replace'),
            crc=hex(crc),
            header_target_matches_35d8_149b=(vendor, product) == (0x35d8, 0x149b),
        )
        references.append(record)
    result = {
        'scope': 'Offline byte inspection only; no device or network access',
        'candidate': original_id,
        'comparison': other_id,
        'echo_b_and_bianca_bytes_identical': original == other,
        'candidate_spv_structure': spv(original),
        'hid_reference_headers': references,
        'matching_hid_reference_count': sum(r['header_target_matches_35d8_149b'] for r in references),
        'limitations': 'Simple sums are not signatures. Payload inclusion does not prove runtime descriptor selection. Catalog labels and matching USB IDs alone cannot prove compatibility.',
    }
    print(json.dumps(result, ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
