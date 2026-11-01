"""Offline regression checks; never touches USB."""
import copy
import cmath
import contextlib
import io
import json
import math
import struct
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

import preset
from preset import ROOT, SCALE, compile_preset, read_coefficients, OUTPUT_GAIN_MIN_DB, OUTPUT_GAIN_MAX_DB


class PresetTests(unittest.TestCase):
    def setUp(self):
        self.doc = json.loads((ROOT/'presets/echo-b/general/original-default.json').read_text())
        self.doc['output_gain_db'] = -2  # Synthetic attenuation fixture, not a user preset.

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
        doc['output_gain_db'] = 0
        doc['filters'] = [dict(type='high_shelf', frequency_hz=f, q=1, gain_db=-12) for f in (500, 1200, 3000)]
        plan, binary = compile_preset(doc)
        old = ROOT/'profiles/muffled-persistence-test'
        self.assertEqual(binary, (old/'test.bin').read_bytes())
        _, actual = read_coefficients(old/'readback-coefficients.jsonl')
        self.assertEqual(actual, plan['coefficients_q22']['48000'])

    def test_invalid_inputs_fail_before_any_io(self):
        for value in (float('nan'), float('inf'), OUTPUT_GAIN_MAX_DB + 0.01, OUTPUT_GAIN_MIN_DB - 0.01, True):
            doc = dict(self.doc, output_gain_db=value)
            with self.assertRaises(ValueError):
                compile_preset(doc)
        with self.assertRaises(ValueError):
            compile_preset(dict(self.doc, preamp=-2))

    def filter_doc(self, gain, kind='peak', q=1):
        return dict(self.doc, output_gain_db=0,
                    filters=[dict(type=kind, frequency_hz=1000, q=q, gain_db=gain)])

    @staticmethod
    def response_db(coefficients, frequency, fs):
        b0,b1,b2,p,q = [value/SCALE for value in coefficients]
        z = cmath.exp(-2j*math.pi*frequency/fs)
        return 20*math.log10(abs((b0+b1*z+b2*z*z)/(1-p*z-q*z*z)))

    def test_peak_gain_beyond_old_limit_keeps_standard_db_meaning(self):
        for gain in (-24, 24):
            plan, binary = compile_preset(self.filter_doc(gain))
            for fs, rows in plan['coefficients_q22'].items():
                self.assertAlmostEqual(self.response_db(rows[0], 1000, int(fs)), gain, delta=0.001)
            # Preserve the requested integer label rather than silently clamping it.
            self.assertEqual(struct.unpack_from('<I', binary, 62+30)[0], gain & 0xffffff)

    def test_fractional_gain_coefficients_and_integer_labels_are_independent(self):
        for gain in (-1.9, -1.5, -0.1, 0.1, 0.2, 0.5, 1.5, 1.9):
            with self.subTest(gain=gain):
                plan, binary = compile_preset(self.filter_doc(gain))
                self.assertEqual(plan['bands'][0]['gain_db'], gain)
                self.assertEqual(plan['bands'][0]['gain_label_db'], int(gain))
                self.assertEqual(struct.unpack_from('<I', binary, 62+30)[0], int(gain) & 0xffffff)
                integer_plan, _ = compile_preset(self.filter_doc(int(gain)))
                for fs, rows in plan['coefficients_q22'].items():
                    self.assertNotEqual(rows[0], integer_plan['coefficients_q22'][fs][0])
                    self.assertAlmostEqual(self.response_db(rows[0], 1000, int(fs)), gain, delta=.001)
                    operation = 10 + list(plan['coefficients_q22']).index(fs)
                    encoded = struct.unpack_from('<5I', binary, operation*62+22)
                    self.assertEqual(encoded, tuple(v & 0xffffffff for v in rows[0]))

    def test_fractional_shelves_and_float_arithmetic(self):
        for kind in ('low_shelf', 'high_shelf'):
            plan, _ = compile_preset(self.filter_doc(-1.3, kind))
            for fs, rows in plan['coefficients_q22'].items():
                self.assertAlmostEqual(self.response_db(rows[0], 1000, int(fs)), -.65, delta=.005)
        noisy, binary = compile_preset(self.filter_doc(.1 + .2))
        clean, expected = compile_preset(self.filter_doc(.3))
        self.assertEqual(binary, expected)
        self.assertEqual(noisy['bands'], clean['bands'])

    def test_shelf_beyond_old_limit_keeps_s1_plateau_and_midpoint(self):
        for gain in (-24, 24):
            plan, _ = compile_preset(self.filter_doc(gain, 'low_shelf'))
            for fs, rows in plan['coefficients_q22'].items():
                fs = int(fs)
                # Fixed Q22 resolution is coarser at low frequencies / high Fs.
                self.assertAlmostEqual(self.response_db(rows[0], 0, fs), gain, delta=0.02)
                self.assertAlmostEqual(self.response_db(rows[0], 1000, fs), gain/2, delta=0.004)
                self.assertAlmostEqual(self.response_db(rows[0], fs/2, fs), 0, delta=0.00001)

    def test_gain_admission_depends_on_parameters_and_all_sample_rates(self):
        compile_preset(self.filter_doc(47, q=10))
        # The previously device-tested 48 kHz vector fits, but 44.1 kHz does not.
        cf = preset.biquad(self.filter_doc(47)['filters'][0], 48000)
        self.assertTrue(all(-(1<<23) <= value < (1<<23) for value in cf))
        with self.assertRaisesRegex(ValueError, '24-bit range at 44100 Hz'):
            compile_preset(self.filter_doc(47))
        with self.assertRaisesRegex(ValueError, '24-bit range'):
            compile_preset(self.filter_doc(24, q=0.1))

    def test_invalid_extreme_and_unstable_gain_fail_before_device_access(self):
        cases = [(float('nan'), 'finite'), (float('inf'), 'finite'),
                 (True, 'finite'), (None, 'finite'), ('24', 'finite'),
                 (0.05, '0.1 dB'), (-1.25, '0.1 dB'), (1e308, 'compute finite'),
                 (-1e308, 'compute finite'), (10**1000, 'finite'),
                 (-245, 'Unstable quantized filter')]
        with tempfile.TemporaryDirectory() as temp, patch.object(preset.subprocess, 'run') as command:
            path = Path(temp)/'invalid.json'
            for gain, message in cases:
                with self.subTest(gain=gain):
                    preset.save_json(path, self.filter_doc(gain))
                    with patch('sys.argv', ['preset.py', 'apply', str(path)]), contextlib.redirect_stdout(io.StringIO()):
                        with self.assertRaisesRegex(ValueError, message):
                            preset.main()
            command.assert_not_called()


if __name__ == '__main__':
    unittest.main()
