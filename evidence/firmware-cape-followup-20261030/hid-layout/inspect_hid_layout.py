#!/usr/bin/env python3
"""Read-only CAPE HID package metadata and byte comparisons. No USB/native calls."""
import argparse
import hashlib
import json
import re
import struct
from pathlib import Path


def positions(b, needle):
    return [m.start() for m in re.finditer(re.escape(needle), b)]


def inspect(path, baseline):
    b = path.read_bytes()
    if len(b) < 32 or len(b) % 4:
        raise ValueError(f'Invalid size/alignment: {path}')
    vid,pid,typ,signature,crc,w,x,y,z,reserved=struct.unpack_from('<5I4HI', b)
    if signature != 0x43534645:
        raise ValueError(f'Not EFSC HID header: {path}')
    descs=[]
    for at in positions(b,b'\x12\x01'):
        if at+18 > len(b):continue
        q=b[at:at+18]
        if struct.unpack_from('<H',q,2)[0] not in (0x100,0x110,0x200,0x210,0x300,0x310,0x320):continue
        if q[7] not in (8,16,32,64,9) or not 1 <= q[17] <= 8:continue
        descs.append({'offset':hex(at),'bytes_hex':q.hex(),'vid':hex(struct.unpack_from('<H',q,8)[0]),'pid':hex(struct.unpack_from('<H',q,10)[0]),'bcd_device':hex(struct.unpack_from('<H',q,12)[0]),'indexes':list(q[14:17]),'runtime_selection_proven':False})
    strings=[]
    for at in range(len(b)-4):
        n=b[at]
        if b[at+1]!=3 or n<6 or n>126 or n%2 or at+n>len(b):continue
        try:t=b[at+2:at+n].decode('utf-16le')
        except UnicodeDecodeError:continue
        if len(t)>=3 and all(32<=ord(v)<127 for v in t):strings.append({'descriptor_offset':hex(at),'text':t})
    half=len(b)//2
    diff=[i for i,(a,c) in enumerate(zip(b,baseline)) if a!=c]
    last=max(i for i,v in enumerate(b) if v!=255)
    return {'file':str(path.resolve()),'size':len(b),'sha256':hashlib.sha256(b).hexdigest(),
        'outer_header':{'vid':hex(vid),'pid':hex(pid),'update_type':typ,'signature':'EFSC','declared_crc':hex(crc),'crc_verified':False,'version_z_y_x_w':f'{z}.{y}.{x}.{w}','reserved':hex(reserved)},
        'body_file_range':[32,len(b)],'body_size':len(b)-32,'body_sha256':hashlib.sha256(b[32:]).hexdigest(),
        'body_4KiB_aligned':(len(b)-32)%4096==0,'body_offset_0_words_observed_unassigned_names':[hex(q) for q in struct.unpack_from('<16I',b,32)],
        'body_word8_plus_word12_equals_body_size':sum(struct.unpack_from('<II',b,40))==len(b)-32,
        'trailing_ff_bytes':len(b)-last-1,'last_non_ff_offset':hex(last),
        'usb_descriptor_candidates':descs,'usb_string_descriptor_candidates':strings,
        'different_byte_count_vs_baseline':len(diff),'same_range_0x120_to_0x14000_as_baseline':b[0x120:0x14000]==baseline[0x120:0x14000],
        'diff_counts_by_4KiB':{hex(at):sum(at<=i<at+4096 for i in diff) for at in range(0,len(b),4096) if any(at<=i<at+4096 for i in diff)},
        'generic_fwupd_equal_halves_input_mismatch':{'half_size':half,'selected_second_half_signature_at_half_plus_12_hex':b[half+12:half+16].hex(),'selected_first_half_body_size':half-32,'original_body_size':len(b)-32,'interpretation':'Generic prepare_firmware expects a pair of complete per-partition HID images, not this one complete HID package.'},
        'limitations':'Outer metadata + bytes only. Internal EFSC format, physical flash map, region coverage, runtime override and per-unit data preservation not established.'}


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('directory',type=Path);p.add_argument('--output',type=Path,required=True);a=p.parse_args()
    files=sorted(a.directory.glob('*.hid'));base=(a.directory/'FreeDSP-1.1-reference.hid').read_bytes()
    r={'source':'CAPE HID header follows fwupd commit 2796458862b73aa541ee1786bf73c9cb7d147103; inner-body words unnamed observations only.','baseline':'FreeDSP-1.1-reference.hid','files':[inspect(x,base) for x in files]}
    a.output.write_text(json.dumps(r,indent=2,ensure_ascii=False)+'\n')


if __name__=='__main__':main()
