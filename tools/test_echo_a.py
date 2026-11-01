import copy
import json
import math
from pathlib import Path
import struct
import unittest

import echo_a


class EchoATest(unittest.TestCase):
    def setUp(self):
        self.doc=json.loads((Path(__file__).resolve().parents[1]/'presets/echo-a/nicehck/yuandao-10th/yuandao-10th-foam-balanced-v1.json').read_text())

    def response(self,freq):
        z=complex(math.cos(2*math.pi*freq/echo_a.RATE),-math.sin(2*math.pi*freq/echo_a.RATE))
        db=0
        for frame in echo_a.compile_preset(self.doc,0)[:8]:
            b0,b1,b2,c1,c2=[v/echo_a.SCALE for v in struct.unpack('<5i',frame[7:27])]
            db+=20*math.log10(abs((b0+b1*z+b2*z*z)/(1-c1*z-c2*z*z)))
        return db

    def test_intended_response(self):
        self.assertAlmostEqual(self.response(20),1,delta=.01)
        self.assertAlmostEqual(self.response(1600),-1,delta=.01)
        self.assertAlmostEqual(self.response(18000),0,delta=.02)
        self.assertLessEqual(max(self.response(20*1000**(n/1000)) for n in range(1001)),1.01)

    def test_wire_layout(self):
        fs=echo_a.compile_preset(self.doc,7)
        self.assertEqual(len(fs),9)
        self.assertTrue(all(len(f)==63 for f in fs))
        self.assertEqual(fs[0][27:36],struct.pack('<HHhBBB',110,256,256,1,0,7))
        self.assertEqual(fs[8][:5],bytes([1,3,2,0,0]))
        self.assertEqual([f[4] for f in fs[:8]],list(range(8)))

    def test_wrong_device_and_unsupported_type(self):
        self.doc['device']='MOONDROP ECHO-B'
        with self.assertRaises(ValueError):echo_a.compile_preset(self.doc,0)
        self.doc['device']='MOONDROP ECHO-A';self.doc['filters'][0]['type']='high_shelf'
        with self.assertRaises(ValueError):echo_a.compile_preset(self.doc,0)

    def test_reject_gain_q_and_nonfinite(self):
        for key,val in [('output_gain_db',.1),('output_gain_db',-31)]:
            d=copy.deepcopy(self.doc);d[key]=val
            with self.assertRaises(ValueError):echo_a.compile_preset(d,0)
        for key,val in [('gain_db',11),('q',0),('frequency_hz',float('nan')),('q',2)]:
            d=copy.deepcopy(self.doc);d['filters'][0][key]=val
            with self.assertRaises(ValueError):echo_a.compile_preset(d,0)

    def test_verify_checks_coefficients_not_only_labels(self):
        fs=echo_a.compile_preset(self.doc,0)
        reads=[bytes(63),bytes(63)]+[bytes([128,9,0])+f[3:] for f in fs[:8]]+[bytes([128,3,2,0,0]).ljust(63,b'\0')]
        self.assertTrue(echo_a.verify(fs,reads)['verified'])
        d=bytearray(reads[2]);d[7]^=1;reads[2]=bytes(d)
        with self.assertRaises(ValueError):echo_a.verify(fs,reads)


if __name__=='__main__':unittest.main()
