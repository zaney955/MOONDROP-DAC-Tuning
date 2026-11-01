"""Model routing and end-to-end ECHO-A workflow using fake HID processes."""
import copy
import json
from pathlib import Path
import plistlib
import subprocess
import tempfile
import unittest
from unittest.mock import patch

import devices
import echo_a
import editor
import preset


def read_rows(doc, slot=0):
    frames=echo_a.compile_preset(doc,slot)
    version=bytes([128,12,0])+b'0.1'+bytes(57)
    bands=[bytes([128,9,0])+f[3:] for f in frames[:8]]
    gain=bytes([128,3,2,0,frames[8][4]])+bytes(58)
    return [version,bands[0],*bands,gain]


class FakeA:
    def __init__(self, doc, failure=None):
        self.state=read_rows(doc,3)
        self.writes=0;self.reads=0;self.failure=failure

    def __call__(self,args,**kw):
        if args[0]=='make':return subprocess.CompletedProcess(args,0)
        if args[1]=='apply':
            self.writes+=1
            if self.failure=='write':return subprocess.CompletedProcess(args,6)
            binary=Path(args[2]).read_bytes()
            assert binary[:4]==b'EQA1'
            assert binary[4:697]==b''.join(self.state)
            fs=[binary[697+i*63:697+(i+1)*63] for i in range(9)]
            bands=[bytes([128,9,0])+f[3:] for f in fs[:8]]
            self.state=[self.state[0],bands[0],*bands,bytes([128,3,2,0,fs[8][4]])+bytes(58)]
            return subprocess.CompletedProcess(args,0)
        assert args[1]=='read'
        self.reads+=1
        if self.failure=='after' and self.writes:return subprocess.CompletedProcess(args,1)
        expected=[(12,-1),(9,-1)]+[(9,i) for i in range(8)]+[(3,-1)]
        rows=[dict(command=cmd,band=i,hex=d.hex()) for (cmd,i),d in zip(expected,self.state)]
        kw['stdout'].write(('\n'.join(json.dumps(x) for x in rows)+'\n').encode())
        return subprocess.CompletedProcess(args,0)


class DevicesTests(unittest.TestCase):
    def setUp(self):
        self.doc=dict(version=1,device='MOONDROP ECHO-A',name='A fixture',output_gain_db=-20,
                      filters=[dict(type='low_shelf',frequency_hz=110,q=1,gain_db=1),
                               dict(type='peak',frequency_hz=1600,q=1,gain_db=-1)])

    def test_compile_and_preview_are_device_specific(self):
        preview=editor.preview(self.doc)
        self.assertEqual(list(preview['curves']),['93750'])
        self.assertAlmostEqual(preview['curves']['93750']['total'][0],1,delta=.01)
        for gain in [-30,0]:
            editor.validate_document(dict(self.doc,output_gain_db=gain))
        for gain in [-31,.1,-20.5]:
            with self.assertRaises(ValueError):editor.validate_document(dict(self.doc,output_gain_db=gain))
        for kind in ['high_shelf','low_pass']:
            d=copy.deepcopy(self.doc);d['filters'][0]['type']=kind
            with self.assertRaises(ValueError):editor.validate_document(d)
        with self.assertRaises(ValueError):editor.validate_document(dict(self.doc,device='unknown'))
        b=dict(self.doc,device='MOONDROP ECHO-B');b['filters'][0]['gain_db']=11
        self.assertEqual(len(editor.preview(b)['curves']),5)

    def test_legacy_a_import_normalizes_without_retargeting(self):
        old=dict(self.doc);old['preamp_db']=old.pop('output_gain_db')
        self.assertEqual(editor.preview(old)['preset'],self.doc)
        self.assertEqual(devices.for_document(old).id,'echo-a')
        with self.assertRaises(ValueError):devices.normalize_document(dict(old,output_gain_db=-20))

    def test_a_read_apply_verify_and_slot_preservation(self):
        backend=devices.get('echo-a');fake=FakeA(self.doc)
        changed=copy.deepcopy(self.doc);changed['filters'][1]['gain_db']=-.7
        with tempfile.TemporaryDirectory() as temp,patch.object(preset.subprocess,'run',fake):
            root=Path(temp);reading=root/'read';reading.mkdir()
            actual,rates=backend.read(reading)
            self.assertEqual(rates,[93750]);self.assertEqual(fake.writes,0)
            self.assertEqual(actual['filters'],self.doc['filters'])
            run=root/'apply';run.mkdir();plan,binary=backend.compile(changed)
            backend.prepare(run,changed,plan,binary);backend.apply(run,plan)
            self.assertEqual(fake.writes,1)
            self.assertEqual(json.loads((run/'plan.json').read_text())['slot'],3)
            check=backend.verify_run(run)
            self.assertTrue(json.loads((check/'status.json').read_text())['readback_verified'])
            self.assertEqual(fake.writes,1)
            # Hardware gain is Q8.8; the editable read must reproduce its bytes.
            doc=backend.document(fake.state)
            self.assertEqual(doc['filters'][1]['gain_db'],-179/256)

    def test_uncertain_write_never_retries_and_readonly_recovery(self):
        backend=devices.get('echo-a')
        for failure in ['write','after']:
            fake=FakeA(self.doc,failure)
            with self.subTest(failure=failure),tempfile.TemporaryDirectory() as temp,patch.object(preset.subprocess,'run',fake):
                run=Path(temp);plan,binary=backend.compile(self.doc);backend.prepare(run,self.doc,plan,binary)
                with self.assertRaises(ValueError):backend.apply(run,plan)
                self.assertEqual(fake.writes,1)
                self.assertEqual(json.loads((run/'status.json').read_text())['status'],'write_uncertain')
                fake.failure=None;backend.verify_run(run)
                self.assertEqual(fake.writes,1)

    def test_tamper_rejected_before_device_read(self):
        backend=devices.get('echo-a');fake=FakeA(self.doc)
        with tempfile.TemporaryDirectory() as temp,patch.object(preset.subprocess,'run',fake):
            run=Path(temp);plan,binary=backend.compile(self.doc);backend.prepare(run,self.doc,plan,binary)
            backend.apply(run,plan);reads=fake.reads
            data=bytearray((run/'plan.bin').read_bytes());data[-1]^=1;(run/'plan.bin').write_bytes(data)
            with self.assertRaises(ValueError):backend.verify_run(run)
            self.assertEqual(fake.reads,reads)

    def test_usb_inventory_is_readonly_and_matches_vid_pid(self):
        nodes=[{'IORegistryEntryChildren':[{'idVendor':0x3302,'idProduct':0x12c5,'USB Product Name':'ECHO-A'}]}]
        result=subprocess.CompletedProcess([],0,stdout=plistlib.dumps(nodes))
        for data in [nodes,nodes[0]]:
            result.stdout=plistlib.dumps(data)
            with patch.object(devices.subprocess,'run',return_value=result) as call:
                self.assertEqual(devices.connected()[0]['device'],'MOONDROP ECHO-A')
                self.assertEqual(call.call_args.args[0],['ioreg','-a','-l','-p','IOUSB'])


if __name__=='__main__':unittest.main()
