"""Visual-editor HTTP, curve and device-boundary tests. No real USB access."""
import copy
import http.client
import json
import math
from pathlib import Path
import tempfile
import threading
import unittest
from unittest.mock import Mock, patch

import editor
import preset
from test_workflow import FakeUSB


class EditorTests(unittest.TestCase):
    def setUp(self):
        self.doc = json.loads((preset.ROOT / 'presets/echo-b/general/original-default.json').read_text())

    def test_device_parameters_recover_fractional_gain_at_every_rate(self):
        self.doc['output_gain_db'] = -16
        self.doc['filters'] = [dict(type=kind, frequency_hz=freq, gain_db=gain, q=q)
                               for kind, freq, gain, q in [('low_shelf', 120, 1.5, 1),
                                   ('peak', 90, -.7, .9), ('peak', 3200, -1.1, 1.1),
                                   ('high_shelf', 8000, .3, 1)]]
        plan, _ = preset.compile_preset(self.doc)
        metadata = dict(mode=0, bands=plan['bands'])
        for band in metadata['bands']:
            band['gain_label_db'] = int(band['gain_db'])
        for rate, coefficients in plan['coefficients_q22'].items():
            with self.subTest(rate=rate):
                doc, rates = editor.device_document(metadata, coefficients)
                rebuilt, _ = preset.compile_preset(doc)
                self.assertIn(int(rate), rates)
                self.assertEqual(rebuilt['coefficients_q22'][rate], coefficients)
                self.assertEqual([f['gain_db'] for f in doc['filters']], [1.5, -.7, -1.1, .3])
                self.assertAlmostEqual(doc['output_gain_db'], -16, places=4)

    def test_read_device_is_readonly_and_does_not_replace_last_write(self):
        self.doc['filters'] = [dict(type='peak', frequency_hz=1000, gain_db=-1.9, q=1)]
        fake = FakeUSB('lost_once_readonly', plan=preset.compile_preset(self.doc)[0])
        with tempfile.TemporaryDirectory() as temp:
            server = editor.EditorServer(('127.0.0.1', 0))
            self.addCleanup(server.server_close)
            previous = server.last_run = Path(temp) / 'previous-write'
            job = dict(action='read', done=False, error=None, run=None)
            def command(args, **kwargs):
                if args[0] == 'make':
                    return preset.subprocess.CompletedProcess(args, 0)
                return fake(args, **kwargs)
            with patch.object(preset, 'ROOT', Path(temp)), patch.object(preset.subprocess, 'run', command), patch.object(preset.time, 'sleep'):
                server.run_job(job, None, None, None)
            self.assertTrue(job['done'])
            self.assertIsNone(job['error'])
            self.assertEqual(fake.writes, 0)
            self.assertEqual(fake.reads, 5)
            self.assertEqual(server.last_run, previous)
            self.assertEqual(job['preset']['filters'][0]['gain_db'], -1.9)
            state = json.loads((Path(job['run']) / 'status.json').read_text())
            self.assertEqual(state['status'], 'read_complete')
            self.assertFalse(state['write_attempted'])
            self.assertEqual(state['read_reconnect_attempts'], 1)

    def test_read_rejects_configuration_changes_and_saves_failure_evidence(self):
        plan, _ = preset.compile_preset(self.doc)
        fake = FakeUSB(plan=plan)
        with tempfile.TemporaryDirectory() as temp:
            def command(args, **kwargs):
                if fake.reads == 2:
                    fake.plan['bands'][0]['frequency_hz'] += 1
                return fake(args, **kwargs)
            with patch.object(preset.subprocess, 'run', command):
                with self.assertRaisesRegex(ValueError, '配置发生变化'):
                    editor.read_device(Path(temp))
            self.assertEqual(fake.writes, 0)
            self.assertFalse((Path(temp) / 'preset.json').exists())
            self.assertEqual(json.loads((Path(temp) / 'status.json').read_text())['status'], 'read_failed')

    def test_unsupported_device_state_is_not_approximated(self):
        plan, _ = preset.compile_preset(self.doc)
        metadata = dict(mode=0, bands=plan['bands'])
        for scenario in ('mode', 'output', 'coefficients'):
            meta, rows = copy.deepcopy(metadata), copy.deepcopy(plan['coefficients_q22']['48000'])
            if scenario == 'mode':
                meta['mode'] = 1
            elif scenario == 'output':
                rows[8][1] = 1
            else:
                rows[0][0] += 1
            with self.subTest(scenario=scenario), self.assertRaises(ValueError):
                editor.device_document(meta, rows)

    def test_arbitrary_integer_frequencies_and_actual_quantized_curves(self):
        self.doc['filters'] = [dict(type='peak', frequency_hz=f, gain_db=0 if f == 20 else -2.3, q=.9)
                               for f in (20, 137, 2836, 20000)]
        data = editor.preview(self.doc)
        plan, _ = preset.compile_preset(self.doc)
        self.assertEqual(data['preset'], self.doc)
        self.assertEqual(data['quantized_q'], [.8984375] * 4)
        for rate, curves in data['curves'].items():
            self.assertEqual(len(curves['total']), 601)
            self.assertEqual(len(curves['bands']), 4)
            output_db = 20 * math.log10(plan['coefficients_q22'][rate][8][0] / preset.SCALE)
            self.assertAlmostEqual(max(curves['total']), plan['response_check'][rate]['max_gain_db'] - output_db, places=8)
            self.assertAlmostEqual(min(curves['total']), plan['response_check'][rate]['min_gain_db'] - output_db, places=8)

    def test_eq_curves_do_not_change_with_output_gain(self):
        self.doc['filters'] = [dict(type='low_shelf', frequency_hz=120, gain_db=1.5, q=1),
                               dict(type='peak', frequency_hz=3200, gain_db=-1.1, q=1.1)]
        reference = editor.preview(dict(self.doc, output_gain_db=0))
        for gain in (preset.OUTPUT_GAIN_MIN_DB, -60, -20, preset.OUTPUT_GAIN_MAX_DB):
            with self.subTest(gain=gain):
                result = editor.preview(dict(self.doc, output_gain_db=gain))
                self.assertEqual(result['curves'], reference['curves'])
                self.assertNotEqual(result['peak_db'], reference['peak_db'])

    def test_flat_extreme_output_gain_remains_in_exportable_document(self):
        self.doc['filters'] = []
        for gain in (preset.OUTPUT_GAIN_MIN_DB, -16, preset.OUTPUT_GAIN_MAX_DB):
            self.doc['output_gain_db'] = gain
            result = editor.preview(self.doc)
            self.assertEqual(result['preset']['output_gain_db'], gain)
            for curves in result['curves'].values():
                self.assertEqual(curves['total'], [0] * 601)
                self.assertEqual(curves['bands'], [])
            exported = json.loads(json.dumps(result['preset']))
            self.assertEqual(preset.compile_preset(exported), preset.compile_preset(self.doc))

    def test_rejects_bad_imports_before_any_hardware_or_filesystem_mutation(self):
        bad = [[], None, {}, dict(self.doc, description=[]), dict(self.doc, extra=1),
               dict(self.doc, filters=[{'type': []}]),
               dict(self.doc, filters=[dict(type='peak', frequency_hz=1000, gain_db=.05, q=1)]), dict(self.doc, output_gain_db=7),
               dict(self.doc, filters=[dict(type='peak', frequency_hz=137.5, gain_db=-1, q=1)]),
               dict(self.doc, filters=[dict(type='high_shelf', frequency_hz=1000, gain_db=24, q=1)])]
        with patch.object(preset.subprocess, 'run') as command, patch.object(preset, 'save_json') as save:
            for doc in bad:
                with self.subTest(doc=doc), self.assertRaises((ValueError, KeyError)):
                    editor.preview(doc)
            command.assert_not_called()
            save.assert_not_called()

    def test_apply_reuses_ack_readback_workflow_and_verify_never_writes(self):
        self.doc['filters'] = [dict(type='peak', frequency_hz=1000, gain_db=-1.9, q=1)]
        fake = FakeUSB(plan=preset.compile_preset(self.doc)[0])
        with tempfile.TemporaryDirectory() as temp:
            server = editor.EditorServer(('127.0.0.1', 0))
            self.addCleanup(server.server_close)
            job = dict(action='apply', done=False, error=None, run=None)
            compiled = preset.compile_preset(self.doc)
            def command(args, **kwargs):
                if args[0] == 'make':
                    return preset.subprocess.CompletedProcess(args, 0)
                return fake(args, **kwargs)
            with patch.object(preset, 'ROOT', Path(temp)), patch.object(preset.subprocess, 'run', command):
                server.run_job(job, compiled, copy.deepcopy(self.doc), None)
                self.assertTrue(job['done'])
                self.assertIsNone(job['error'])
                self.assertEqual(fake.writes, 1)
                run = Path(job['run'])
                status = json.loads((run / 'status.json').read_text())
                self.assertEqual(status['status'], 'saved_verified')
                self.assertEqual(json.loads((run / 'preset.json').read_text()), self.doc)
                verify = dict(action='verify', done=False, error=None, run=None)
                server.run_job(verify, None, None, run)
                self.assertIsNone(verify['error'])
                self.assertEqual(fake.writes, 1)
                self.assertEqual(json.loads((Path(verify['run']) / 'status.json').read_text())['status'], 'readback_verified')

    def test_uncertain_write_is_not_retried_or_reported_success(self):
        fake = FakeUSB('partial_write')
        with tempfile.TemporaryDirectory() as temp:
            server = editor.EditorServer(('127.0.0.1', 0))
            self.addCleanup(server.server_close)
            job = dict(action='apply', done=False, error=None, run=None)
            def command(args, **kwargs):
                if args[0] == 'make':
                    return preset.subprocess.CompletedProcess(args, 0)
                return fake(args, **kwargs)
            with patch.object(preset, 'ROOT', Path(temp)), patch.object(preset.subprocess, 'run', command):
                server.run_job(job, preset.compile_preset(self.doc), self.doc, None)
            self.assertIsNotNone(job['error'])
            self.assertEqual(fake.writes, 1)
            self.assertEqual(json.loads((Path(job['run']) / 'status.json').read_text())['status'], 'write_uncertain')

    def test_job_reports_reconnecting_then_verified_and_keeps_failed_recovery_honest(self):
        self.doc['filters'] = [dict(type='peak', frequency_hz=137, gain_db=-1.9, q=.9)]
        compiled = preset.compile_preset(self.doc)
        for failure, expected in [('disconnected_after', 'saved_verified'),
                                  ('disconnected_forever_after', 'saved_unverified'),
                                  ('reconnect_mismatch', 'saved_unverified')]:
            with self.subTest(failure=failure), tempfile.TemporaryDirectory() as temp:
                server = editor.EditorServer(('127.0.0.1', 0))
                self.addCleanup(server.server_close)
                job = dict(action='apply', done=False, error=None, run=None)
                server.job = job
                fake = FakeUSB(failure, plan=compiled[0])
                progress = []
                def command(args, **kwargs):
                    if args[0] == 'make':
                        return preset.subprocess.CompletedProcess(args, 0)
                    return fake(args, **kwargs)
                def read_progress(_):
                    progress.append(server.job_status()['job']['device_status'])
                with patch.object(preset, 'ROOT', Path(temp)), patch.object(preset.subprocess, 'run', command), patch.object(preset.time, 'sleep', read_progress):
                    server.run_job(job, compiled, copy.deepcopy(self.doc), None)
                final = server.job_status()['job']
                self.assertTrue(final['done'])
                self.assertEqual(final['device_status']['status'], expected)
                self.assertEqual(final['device_status']['readback_verified'], expected == 'saved_verified')
                self.assertEqual(final['error'] is None, expected == 'saved_verified')
                self.assertEqual(fake.writes, 1)
                self.assertTrue(any('重新连接' in state['message'] for state in progress))
                self.assertTrue(all(state['save_command_acknowledged'] and not state['readback_verified'] for state in progress))


class HTTPTests(unittest.TestCase):
    def setUp(self):
        self.server = editor.EditorServer(('127.0.0.1', 0))
        self.thread = threading.Thread(target=self.server.serve_forever, daemon=True)
        self.thread.start()
        self.doc = json.loads((preset.ROOT / 'presets/echo-b/general/original-default.json').read_text())

    def tearDown(self):
        self.server.shutdown()
        self.server.server_close()
        self.thread.join()

    def request(self, method, path, body=None, headers=None):
        client = http.client.HTTPConnection('127.0.0.1', self.server.server_port)
        client.request(method, path, body, headers or {})
        response = client.getresponse()
        result = response.read()
        client.close()
        return response.status, result

    def post(self, path, doc, **headers):
        return self.request('POST', path, json.dumps(doc), {
            'Content-Type': 'application/json', 'X-Editor-Token': self.server.token, **headers})

    def test_loading_and_preview_are_offline(self):
        with patch.object(preset.subprocess, 'run') as command:
            code, body = self.request('GET', '/api/bootstrap')
            self.assertEqual(code, 200)
            self.assertTrue(json.loads(body)['presets'])
            self.assertEqual(self.request('GET', '/')[0], 200)
            self.assertEqual(self.post('/api/preview', self.doc)[0], 200)
            command.assert_not_called()

    def test_rejects_cross_origin_and_missing_token_and_bad_hosts(self):
        self.assertEqual(self.post('/api/apply', self.doc, Origin='https://untrusted.example')[0], 403)
        self.assertEqual(self.post('/api/apply', self.doc, Host='untrusted.example')[0], 403)
        self.assertEqual(self.post('/api/apply', self.doc, **{'X-Editor-Token': ''})[0], 403)
        self.assertEqual(self.request('GET', '/api/bootstrap', headers={'Host': 'untrusted.example'})[0], 403)

    def test_invalid_import_or_apply_and_large_body_never_start_worker(self):
        with patch.object(self.server, 'run_job') as worker:
            self.assertEqual(self.post('/api/preview', {'filters': []})[0], 400)
            self.assertEqual(self.post('/api/apply', {'filters': []})[0], 400)
            code, _ = self.request('POST', '/api/preview', ' ' * 65537, {
                'Content-Type': 'application/json', 'X-Editor-Token': self.server.token})
            self.assertEqual(code, 400)
            worker.assert_not_called()

    def test_concurrent_actions_and_verify_without_run_are_rejected(self):
        self.assertEqual(self.post('/api/verify', {})[0], 400)
        self.server.job = dict(done=False)
        with patch.object(self.server, 'run_job') as worker:
            self.assertEqual(self.post('/api/apply', self.doc)[0], 400)
            self.assertEqual(self.post('/api/read', {})[0], 400)
            worker.assert_not_called()

    def test_read_endpoint_requires_token_and_starts_only_explicitly(self):
        self.assertEqual(self.post('/api/read', {}, **{'X-Editor-Token': ''})[0], 403)
        with patch.object(self.server, 'start_job', return_value={'job': {'id': 'read-fixture'}}) as start:
            self.assertEqual(self.post('/api/read', {})[0], 202)
            start.assert_called_once_with('read')

    def test_stale_page_cannot_start_device_operation(self):
        with patch.object(self.server, 'run_job') as worker:
            code, _ = self.post('/api/apply', self.doc, **{'X-Editor-Version': 'older-page'})
            self.assertEqual(code, 409)
            worker.assert_not_called()
        self.server.auto_reload = True
        self.assertEqual(self.post('/api/apply', self.doc)[0], 409)
        self.assertEqual(self.post('/api/read', {})[0], 409)
        self.assertEqual(self.post('/api/preview', self.doc)[0], 200)
        self.server.reload_pending = True
        self.assertEqual(self.post('/api/apply', self.doc, **{'X-Editor-Version': self.server.version})[0], 503)

    def test_assets_and_bootstrap_use_the_same_frozen_snapshot(self):
        original = self.server.sources['web/style.css']
        changed = dict(self.server.sources, **{'web/style.css': original + b'/* new */'})
        with patch.object(editor, 'source_snapshot', return_value=changed):
            self.assertEqual(self.request('GET', '/style.css')[1], original)
        bootstrap = json.loads(self.request('GET', '/api/bootstrap')[1])
        version = json.loads(self.request('GET', '/api/version')[1])
        self.assertEqual(bootstrap['version'], version['version'])
        self.assertIn(version['version'].encode(), self.request('GET', '/')[1])


class ReloadTests(unittest.TestCase):
    def setUp(self):
        self.server = editor.EditorServer(('127.0.0.1', 0))
        self.addCleanup(self.server.server_close)
        self.snapshot = dict(self.server.sources, **{'web/style.css': b'/* edited */'})
        self.restart, self.check = Mock(), Mock()
        self.watcher = editor.ReloadWatcher(self.server, restart=self.restart, check=self.check)

    def test_reload_debounces_saves_and_waits_for_active_device_job(self):
        self.server.job = dict(done=False)
        with patch.object(editor, 'source_snapshot', return_value=self.snapshot):
            self.assertFalse(self.watcher.step(0))
            self.assertFalse(self.watcher.step(.2))
            self.check.assert_not_called()
            self.assertFalse(self.watcher.step(.7))
            self.assertTrue(self.server.reload_pending)
            self.restart.assert_not_called()
            self.server.job['done'] = True
            self.assertTrue(self.watcher.step(.8))
        self.check.assert_called_once()
        self.restart.assert_called_once_with(self.server)

    def test_bad_code_keeps_running_snapshot_then_recovers_after_fix(self):
        self.check.side_effect = [ValueError('syntax fixture'), None]
        with patch.object(editor, 'source_snapshot', return_value=self.snapshot):
            self.watcher.step(0)
            self.watcher.step(.7)
            self.watcher.step(2)
        self.assertIn('syntax fixture', self.server.reload_error)
        self.assertFalse(self.server.reload_pending)
        self.restart.assert_not_called()
        fixed = dict(self.snapshot, **{'web/style.css': b'/* fixed */'})
        with patch.object(editor, 'source_snapshot', return_value=fixed):
            self.watcher.step(3)
            self.assertTrue(self.watcher.step(3.7))
        self.assertIsNone(self.server.reload_error)
        self.assertEqual(self.check.call_count, 2)

    def test_reverting_code_while_waiting_cancels_reload(self):
        self.server.job = dict(done=False)
        with patch.object(editor, 'source_snapshot', return_value=self.snapshot):
            self.watcher.step(0)
            self.watcher.step(.7)
        with patch.object(editor, 'source_snapshot', return_value=self.server.sources):
            self.watcher.step(1)
        self.assertFalse(self.server.reload_pending)
        self.restart.assert_not_called()

    def test_exec_handoff_retains_token_and_completed_job_without_repeating_it(self):
        self.server.job = dict(action='apply', done=True, error='saved_unverified', run=None)
        self.server.last_run = preset.ROOT / 'runs' / 'fixture'
        received = {}
        def fake_exec(binary, args, env):
            import os
            with os.fdopen(os.dup(int(env['ECHO_EDITOR_HANDOFF_FD']))) as handoff:
                received.update(json.load(handoff))
            self.assertIn('--port', args)
            self.assertIn('PYTHONPYCACHEPREFIX', env)
        with patch.object(editor.os, 'execve', fake_exec):
            editor.restart_server(self.server)
        self.assertEqual(received['token'], self.server.token)
        self.assertEqual(received['job'], self.server.job)
        self.assertEqual(received['last_run'], str(self.server.last_run))


if __name__ == '__main__':
    unittest.main()
