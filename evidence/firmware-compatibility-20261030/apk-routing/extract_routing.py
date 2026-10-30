"""Offline byte/resource/instruction inspection only; never loads target code or USB."""
import hashlib
import json
import re
import struct
import sys
import zipfile
from pathlib import Path

from loguru import logger
logger.remove()
from androguard.core.axml import ARSCParser, AXMLPrinter
from androguard.core.dex import DEX
from elftools.elf.elffile import ELFFile

root = Path(sys.argv[1]).resolve()
out = Path(sys.argv[2]).resolve()
out.mkdir(parents=True, exist_ok=True)
apk = root / 'evidence/moondrop-android-release.apk'
library = root / 'evidence/android-arm64/libCxAudioHidLib.so'
with zipfile.ZipFile(apk) as z:
    resources = ARSCParser(z.read('resources.arsc'))
    resolved = resources.get_resolved_res_configs(0x7f140001)
    for _, path in resolved:
        (out / 'devicelist.xml').write_bytes(AXMLPrinter(z.read(path)).get_xml())
    dex = DEX(z.read('classes.dex'))
    with (out / 'target-routing.asm').open('w') as f:
        for cls in dex.get_classes():
            cn = cls.get_name()
            for method in cls.get_methods():
                if not method.get_code():
                    continue
                instructions = list(method.get_instructions_idx())
                body = '\n'.join(i.get_output() for _, i in instructions)
                hit = (cn in ['Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;',
                              'Lcom/conexant/universalfunction/DeviceId;']
                       or re.search(r'identifyDeviceById|DeviceId;-><init>|FirmwareDetect|5275|13784|149[Bb]|35[Dd]8|ECHO-B', body))
                if not hit:
                    continue
                f.write(f'\n{cn} {method.get_name()}{method.get_descriptor()} code_off=0x{method.get_code_off():x}\n')
                for offset, instruction in instructions:
                    f.write(f'{offset:04x}: {instruction.get_name():26} {instruction.get_output()}\n')

with library.open('rb') as f:
    elf = ELFFile(f)
    symbols = elf.get_section_by_name('.dynsym')
    relocs = {}
    for section in elf.iter_sections():
        if section['sh_type'] != 'SHT_RELA':
            continue
        for relocation in section.iter_relocations():
            symbol = symbols.get_symbol(relocation['r_info_sym'])
            relocs[relocation['r_offset']] = {
                'target': int(symbol['st_value']) + relocation['r_addend'],
                'symbol': symbol.name,
            }

    def read_va(address, count=256):
        for segment in elf.iter_segments():
            if segment['p_type'] == 'PT_LOAD' and segment['p_vaddr'] <= address < segment['p_vaddr'] + segment['p_filesz']:
                start = address - segment['p_vaddr']
                return segment.data()[start:start + count]
        raise ValueError(hex(address))

    def cstring(address):
        return read_va(address).split(b'\0')[0].decode(errors='replace')

    table = []
    for index in range(9):
        address = 0x451c0 + index * 0x30
        raw = read_va(address, 0x30)
        table.append({
            'index': index,
            'va': hex(address),
            'raw_hex': raw.hex(),
            'fields32': list(struct.unpack('<12I', raw)),
            'relocations': {
                hex(k - address): v | {'string': cstring(v['target'])}
                for k, v in relocs.items() if address <= k < address + 0x30
            },
        })
    (out / 'native-DeviceInfo-table.json').write_text(json.dumps(table, indent=2) + '\n')
    addresses = [0x2f009, 0x2f00e, 0x2f048, 0x2f063, 0x2f08a, 0x2baf9]
    (out / 'native-hid-field-strings.json').write_text(json.dumps({hex(a): cstring(a) for a in addresses}, indent=2) + '\n')

identity = {str(p.relative_to(root)): hashlib.sha256(p.read_bytes()).hexdigest() for p in [apk, library]}
(out / 'source-identity.json').write_text(json.dumps(identity, indent=2) + '\n')
print('Wrote offline resource/instruction/ELF evidence; target execution and device access: none.')
