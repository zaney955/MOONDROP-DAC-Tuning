#!/usr/bin/env python3
"""Disassemble selected DEX methods offline with existing androguard. Executes no APK code."""
import argparse
import hashlib
import json
import zipfile
from pathlib import Path
from loguru import logger
logger.remove()
from androguard.core.dex import DEX

p=argparse.ArgumentParser(description=__doc__)
p.add_argument('apk', type=Path)
p.add_argument('out', type=Path)
a=p.parse_args();a.out.mkdir(parents=True,exist_ok=True)
selectors={
 'spv-parser.asm':lambda c,m:(c=='Law0;' and m=='c'),
 'spv-start.asm':lambda c,m:(c=='Lns4;' and m=='y'),
 'spv-handler.asm':lambda c,m:('UsbDeviceHandler;' in c and ('handleStartSpvUpgrade' in m or 'handleEnterSpvUpdateMode' in m)),
}
z=zipfile.ZipFile(a.apk);d=DEX(z.read('classes.dex'));result={x:[] for x in selectors}
for c in d.get_classes():
 for m in c.get_methods():
  for name,select in selectors.items():
   if not select(c.get_name(),m.get_name()):continue
   result[name].append(f'{c.get_name()} {m.get_name()}{m.get_descriptor()} code_off=0x{m.get_code_off():x}')
   at=0
   for i in m.get_instructions():
    result[name].append(f'{at:04x}: {i.get_name():24} {i.get_output()}');at+=i.get_length()
for name,lines in result.items():(a.out/name).write_text('\n'.join(lines)+'\n')
(a.out/'apk-identity.json').write_text(json.dumps({'apk':str(a.apk.resolve()),'sha256':hashlib.sha256(a.apk.read_bytes()).hexdigest(),'classes.dex_sha256':hashlib.sha256(z.read('classes.dex')).hexdigest(),'scope':'Offline DEX disassembly only; no APK code executed or device IO.'},indent=2)+'\n')
