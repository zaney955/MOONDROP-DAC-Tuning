"""Offline DEX inspection; never executes APK code or accesses USB."""
import hashlib
import json
import re
import zipfile
from pathlib import Path
from loguru import logger
logger.remove()
from androguard.core.dex import DEX
root = Path(__file__).resolve().parents[2]
out = Path(__file__).resolve().parent
apk = root/'evidence/moondrop-android-release.apk'
focus = {
 'Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;': {'getEQMode','switchEQMode','saveEQParamsToFlash','getEQParamsFromFlash','getEQParamList'},
 'Lcom/conexant/conexantusbtypec/common/ApplicationData$CommonEQParams;': None,
 'Lcom/conexant/genericfeature/PersistEQParams;': None,
}
index=[]; refs=[]; texts=[]
with zipfile.ZipFile(apk) as z:
 for dn in z.namelist():
  if not re.fullmatch(r'classes\d*\.dex',dn): continue
  d=DEX(z.read(dn))
  for cls in d.get_classes():
   cn=cls.get_name()
   for m in cls.get_methods():
    if not m.get_code(): continue
    body=list(m.get_instructions_idx())
    lines=[f'{at:04x}: {i.get_name():24} {i.get_output()}' for at,i in body]
    header=f'{dn}: {cn} {m.get_name()}{m.get_descriptor()} code_off=0x{m.get_code_off():x}'
    selected=(cn in focus and (focus[cn] is None or m.get_name() in focus[cn]))
    refhit=any(re.search(r'->(switchEQMode|getEQMode|getPresetList|eqModeIndex)|(?i:custom.*eq|eq.*preset|eq.*mode)', i.get_output()) for _,i in body)
    if selected: texts.extend(['\n'+header,*lines]);index.append({'dex':dn,'class':cn,'method':m.get_name(),'descriptor':m.get_descriptor(),'code_offset':m.get_code_off()})
    if refhit and not selected and (cn.startswith('Lcom/conexant/') or (cn == 'Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;' and m.get_name() in {'handleSyGetEqParamsFromFlash','handleSySaveEqParamsToFlash','handleSySavePeqParamsToFlash','handleSySelectEqPreset'})): refs.extend(['\n'+header,*lines])
(out/'selected-methods.asm').write_text('\n'.join(texts)+'\n')
(out/'mode-references.asm').write_text('\n'.join(refs)+'\n')
(out/'identity-and-selection.json').write_text(json.dumps({'apk':str(apk),'sha256':hashlib.sha256(apk.read_bytes()).hexdigest(),'scope':'Offline Androguard DEX disassembly, not REA decompilation; no target execution or device I/O','selected_methods':index},indent=2)+'\n')
print('selected methods',len(index),'selected lines',len(texts),'reference lines',len(refs))
