"""Offline regression checks; never touches USB."""
import copy
import json
import math
import struct
import unittest

from preset import ROOT, SCALE, compile_preset, read_coefficients


class PresetTests(unittest.TestCase):
    def setUp(self):
        self.doc = json.loads((ROOT/'presets/global-minus-2db.json').read_text())

    def test_global_attenuation_is_flat_at_all_rates_and_encoded(self):
        plan, binary = compile_preset(self.doc)
        self.assertEqual(len(binary), 56*62)
        for rows in plan['coefficients_q22'].values():
            self.assertEqual(rows[:8], [[SCALE, 0, 0, 0, 0]]*8)
            self.assertAlmostEqual(20*math.log10(rows[8][0]/SCALE), -2, places=5)
            self.assertEqual(rows[8][1:], [0]*4)
        for response in plan['response_check'].values():
            self.assertAlmostEqual(response['min_gain_db'], -2, places=5)
            self.assertEqual(response['min_gain_db'], response['max_gain_db'])
        for operation in range(50, 55):
            self.assertEqual(struct.unpack_from('<4I', binary, operation*62+10),
                             (4+operation-50, 9, 3, plan['coefficients_q22']['48000'][8][0]))
        self.assertEqual(struct.unpack_from('<I', binary, 55*62+10)[0], 255)

    def test_matches_previously_verified_muffled_plan(self):
        doc = copy.deepcopy(self.doc)
        doc['preamp_db'] = 0
        doc['filters'] = [dict(type='high_shelf', frequency_hz=f, q=1, gain_db=-12) for f in (500, 1200, 3000)]
        plan, binary = compile_preset(doc)
        old = ROOT/'profiles/muffled-persistence-test'
        self.assertEqual(binary, (old/'test.bin').read_bytes())
        _, actual = read_coefficients(old/'readback-coefficients.jsonl')
        self.assertEqual(actual, plan['coefficients_q22']['48000'])

    def test_invalid_inputs_fail_before_any_io(self):
        for value in (float('nan'), float('inf'), 1, -61, True):
            doc = dict(self.doc, preamp_db=value)
            with self.assertRaises(ValueError):
                compile_preset(doc)
        with self.assertRaises(ValueError):
            compile_preset(dict(self.doc, preamp=-2))


if __name__ == '__main__':
    unittest.main()
