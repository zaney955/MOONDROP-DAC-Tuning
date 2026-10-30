"""Offline gain and migration regressions; no real device I/O."""
import contextlib
import io
import json
import math
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

import preset


class OutputLevelTests(unittest.TestCase):
    def setUp(self):
        self.flat = json.loads((preset.ROOT/'presets/original-default.json').read_text())
        self.metal = json.loads((preset.ROOT/'presets/kadenz-death-metal-structure-v1.json').read_text())

    def test_minus_18_retains_filters_and_shape_at_every_rate(self):
        for source in (self.flat, self.metal):
            base, _ = preset.compile_preset(dict(source, output_gain_db=0))
            reduced, _ = preset.compile_preset(dict(source, output_gain_db=-18))
            self.assertEqual(reduced['bands'], base['bands'])
            for fs, rows in reduced['coefficients_q22'].items():
                self.assertEqual(rows[:8], base['coefficients_q22'][fs][:8])
                delta = 20*math.log10(rows[8][0]/base['coefficients_q22'][fs][8][0])
                self.assertAlmostEqual(delta, -18, places=4)
                for field in ('min_gain_db', 'max_gain_db'):
                    self.assertAlmostEqual(reduced['response_check'][fs][field]-base['response_check'][fs][field], -18, places=4)

    def test_invalid_or_missing_gain_is_rejected_before_device_access(self):
        with tempfile.TemporaryDirectory() as temp, patch.object(preset.subprocess, 'run') as command:
            path = Path(temp)/'invalid.json'
            for value in (preset.OUTPUT_GAIN_MAX_DB + 0.01, preset.OUTPUT_GAIN_MIN_DB - 0.01, float('nan'), float('inf'), True, None, '-18', 'missing'):
                with self.subTest(value=value):
                    doc = dict(self.flat, output_gain_db=value)
                    if value == 'missing':
                        del doc['output_gain_db']
                    preset.save_json(path, doc)
                    with patch('sys.argv', ['preset.py', 'apply', str(path)]), self.assertRaises(ValueError):
                        preset.main()
            command.assert_not_called()

    def test_legacy_fields_are_rejected_even_alongside_gain(self):
        for fields in ({'gain_db': -16}, {'preamp_db': -2}, {'output_trim_db': -16},
                       {'preamp_db': -2, 'output_trim_db': -16}):
            with self.subTest(fields=fields), self.assertRaises(ValueError):
                preset.compile_preset(dict(self.flat, **fields))
        legacy = dict(self.flat, preamp_db=0, output_trim_db=-16)
        del legacy['output_gain_db']
        with self.assertRaises(ValueError):
            preset.compile_preset(legacy)

    def test_switching_presets_uses_only_each_file_and_snapshots_it(self):
        with tempfile.TemporaryDirectory() as temp, patch.object(preset, 'ROOT', Path(temp)):
            # A stale settings file must have no effect on a self-contained preset.
            settings = Path(temp)/'settings'
            settings.mkdir()
            (settings/'output-level.json').write_text('{broken old settings')
            source = Path(temp)/'sample.json'
            for gain in (-60, -18.5, -6, 0):
                doc = dict(self.metal, output_gain_db=gain)
                preset.save_json(source, doc)
                output = io.StringIO()
                with patch('sys.argv', ['preset.py', 'build', str(source)]), contextlib.redirect_stdout(output):
                    preset.main()
                folder = Path(temp)/'profiles/compiled/sample'
                plan = preset.load_run_plan(folder)
                self.assertEqual(plan['preset'], doc)
                self.assertNotIn('gain_staging', plan)
                self.assertEqual(json.loads((folder/'preset.json').read_text()), doc)
                self.assertEqual(json.loads(source.read_text()), doc)
                actual_gain = 20*math.log10(plan['coefficients_q22']['48000'][8][0]/preset.SCALE)
                # Q22's half-LSB rounding can reach about 0.0011 dB at -60 dB.
                self.assertAlmostEqual(actual_gain, gain, delta=0.0011)
                self.assertIn(f'整体输出数字增益 {gain:g} dB', output.getvalue())

    def test_device_register_boundaries_and_positive_gain(self):
        cases = ((preset.OUTPUT_GAIN_MIN_DB, 1), (0, preset.SCALE),
                 (1.5, round(preset.SCALE*10**(1.5/20))),
                 (6, round(preset.SCALE*10**(6/20))),
                 (preset.OUTPUT_GAIN_MAX_DB, (1 << 23)-1))
        for gain, coefficient in cases:
            with self.subTest(gain=gain):
                plan, _ = preset.compile_preset(dict(self.flat, output_gain_db=gain))
                for rows in plan['coefficients_q22'].values():
                    self.assertEqual(rows[8], [coefficient, 0, 0, 0, 0])

    def test_positive_gain_build_warns_without_changing_requested_gain(self):
        with tempfile.TemporaryDirectory() as temp, patch.object(preset, 'ROOT', Path(temp)):
            source = Path(temp)/'positive.json'
            doc = dict(self.flat, output_gain_db=3)
            preset.save_json(source, doc)
            output = io.StringIO()
            with patch('sys.argv', ['preset.py', 'build', str(source)]), contextlib.redirect_stdout(output):
                preset.main()
            self.assertIn('满幅输入可能削波', output.getvalue())
            self.assertEqual(preset.load_run_plan(Path(temp)/'profiles/compiled/positive')['preset'], doc)

    def test_migrated_historical_presets_keep_exact_device_frames(self):
        folders = sorted((preset.ROOT/'runs').glob('*/plan.json'))
        checked = 0
        for path in folders:
            with self.subTest(run=path.parent.name):
                old = preset.load_run_plan(path.parent)
                doc = dict(old['preset'])
                if 'preamp_db' not in doc:
                    continue
                checked += 1
                trim = doc.pop('output_trim_db', old.get('gain_staging', {}).get('output_trim_db', 0))
                doc['output_gain_db'] = doc.pop('preamp_db') + trim
                plan, binary = preset.compile_preset(doc)
                self.assertEqual(binary, (path.parent/'plan.bin').read_bytes())
                self.assertEqual(plan['coefficients_q22'], old['coefficients_q22'])
                self.assertEqual(plan['bands'], old['bands'])
        self.assertGreater(checked, 0)

    def test_all_editable_presets_are_complete_and_valid(self):
        for path in (preset.ROOT/'presets').glob('*.json'):
            doc = json.loads(path.read_text())
            self.assertIn('output_gain_db', doc, str(path))
            self.assertNotIn('gain_db', doc, str(path))
            self.assertNotIn('preamp_db', doc, str(path))
            self.assertNotIn('output_trim_db', doc, str(path))
            preset.compile_preset(doc)


if __name__ == '__main__':
    unittest.main()
