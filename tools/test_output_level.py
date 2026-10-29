"""Complete presets own their output level; no external settings are applied."""
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
        for doc in (self.flat, self.metal):
            doc['output_trim_db'] = -18

    def test_minus_18_retains_filters_and_shape_at_every_rate(self):
        for source in (self.flat, self.metal):
            base, _ = preset.compile_preset(dict(source, output_trim_db=0))
            reduced, _ = preset.compile_preset(source)
            self.assertEqual(reduced['preset'], source)
            self.assertEqual(reduced['bands'], base['bands'])
            self.assertEqual(reduced['gain_staging']['effective_preamp_db'], source['preamp_db']-18)
            for fs, rows in reduced['coefficients_q22'].items():
                self.assertEqual(rows[:8], base['coefficients_q22'][fs][:8])
                delta = 20*math.log10(rows[8][0]/base['coefficients_q22'][fs][8][0])
                self.assertAlmostEqual(delta, -18, places=4)
                for field in ('min_gain_db', 'max_gain_db'):
                    self.assertAlmostEqual(reduced['response_check'][fs][field]-base['response_check'][fs][field], -18, places=4)

    def test_invalid_or_missing_trim_is_rejected_before_device_access(self):
        with tempfile.TemporaryDirectory() as temp, patch.object(preset.subprocess, 'run') as command:
            path = Path(temp)/'invalid.json'
            for value in (1, -41, float('nan'), float('inf'), True, None, '-18', 'missing'):
                doc = dict(self.flat, output_trim_db=value)
                if value == 'missing':
                    del doc['output_trim_db']
                preset.save_json(path, doc)
                with patch('sys.argv', ['preset.py', 'apply', str(path)]), self.assertRaises(ValueError):
                    preset.main()
            command.assert_not_called()
        with self.assertRaises(ValueError):
            preset.compile_preset(dict(self.flat, preamp_db=-55))

    def test_switching_presets_uses_only_each_file_and_snapshots_it(self):
        with tempfile.TemporaryDirectory() as temp, patch.object(preset, 'ROOT', Path(temp)):
            # A stale settings file must have no effect on a self-contained preset.
            settings = Path(temp)/'settings'
            settings.mkdir()
            (settings/'output-level.json').write_text('{broken old settings')
            source = Path(temp)/'sample.json'
            for trim in (-18, -6, 0):
                doc = dict(self.metal, output_trim_db=trim)
                preset.save_json(source, doc)
                with patch('sys.argv', ['preset.py', 'build', str(source)]), contextlib.redirect_stdout(io.StringIO()):
                    preset.main()
                folder = Path(temp)/'profiles/compiled/sample'
                plan = preset.load_run_plan(folder)
                self.assertEqual(plan['gain_staging']['effective_preamp_db'], -2+trim)
                self.assertEqual(plan['preset'], doc)
                self.assertEqual(json.loads((folder/'preset.json').read_text()), doc)
                self.assertEqual(json.loads(source.read_text()), doc)

    def test_historical_plan_verification_does_not_require_new_preset_field(self):
        folder = preset.ROOT/'runs/20261029T162816.528160Z-original-default'
        plan = preset.load_run_plan(folder)
        self.assertNotIn('output_trim_db', plan['preset'])
        self.assertEqual(plan['gain_staging']['output_trim_db'], -12)

    def test_all_editable_presets_are_complete_and_valid(self):
        for path in (preset.ROOT/'presets').glob('*.json'):
            doc = json.loads(path.read_text())
            self.assertIn('output_trim_db', doc, str(path))
            preset.compile_preset(doc)


if __name__ == '__main__':
    unittest.main()
