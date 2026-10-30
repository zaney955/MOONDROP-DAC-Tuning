"""Failure-path integration tests with fake subprocess I/O, never real USB."""
import contextlib
import io
import json
from pathlib import Path
import subprocess
import struct
import tempfile
import unittest
from unittest.mock import patch

import preset

ROOT = preset.ROOT
METADATA = (ROOT/'backups/initial-read.jsonl').read_bytes()
COEFFICIENTS = (ROOT/'backups/coefficients-read.jsonl').read_bytes()


def plan_capture(plan, coefficients=False):
    """Synthetic device replies; metadata independently truncates requested gain."""
    rows = [json.loads(s) for s in (COEFFICIENTS if coefficients else METADATA).splitlines()]
    for i, row in enumerate(rows[1:]):
        payload = bytearray.fromhex(row['hex'])
        if coefficients:
            values = [0, i+1, 3] + plan['coefficients_q22']['48000'][i]
        else:
            band = plan['bands'][i]
            values = [0, i+1, band['frequency_hz'], round(band['q']*256),
                      band['type_code'], int(band['gain_db']) & 0xffffff]
        struct.pack_into('<' + 'I'*len(values), payload, 10, *[v & 0xffffffff for v in values])
        row['hex'] = payload.hex()
    return ('\n'.join(json.dumps(r) for r in rows)+'\n').encode()


class FakeUSB:
    def __init__(self, failure=None, plan=None):
        self.plan = plan
        self.failure = failure
        self.writes = 0
        self.reads = 0
        self.after_reads = 0

    def __call__(self, args, **kwargs):
        if Path(args[0]).name == 'echo_apply_plan':
            self.writes += 1
            count = 10 if self.failure in ('partial_write', 'writer_timeout') else 55 if self.failure == 'missing_save_ack' else 56
            for n in range(count):
                kwargs['stdout'].write((json.dumps(dict(operation=n, ack=True, reply='test'))+'\n').encode())
            if self.failure == 'writer_timeout':
                raise subprocess.TimeoutExpired(args, 120)
            return subprocess.CompletedProcess(args, 5 if self.failure == 'partial_write' else 0)
        if Path(args[0]).name != 'echo_probe':
            raise AssertionError(f'Unexpected subprocess {args}')
        self.reads += 1
        if self.writes:
            self.after_reads += 1
        if self.failure == 'permission' or (self.failure == 'permission_after' and self.writes):
            kwargs['stderr'].write(b'Open: 0xe00002e2\n')
            return subprocess.CompletedProcess(args, 3)
        if self.failure == 'busy_forever' or (self.failure == 'busy_after' and self.writes):
            kwargs['stdout'].write(METADATA.splitlines(keepends=True)[0])
            kwargs['stderr'].write(b'GetReport: 0xe00002d8 (NotReady retry limit reached)\n')
            return subprocess.CompletedProcess(args, 4)
        if self.failure == 'transient_after' and self.writes and self.after_reads <= 2:
            kwargs['stderr'].write(b'GetReport: NotReady retry limit reached\n')
            return subprocess.CompletedProcess(args, 4)
        if self.failure == 'interrupt_after' and self.writes:
            raise KeyboardInterrupt()
        raw = COEFFICIENTS if '--coefficients' in args else METADATA
        if self.plan is not None:
            raw = plan_capture(self.plan, '--coefficients' in args)
        if self.failure == 'mismatch' and self.writes and '--coefficients' in args:
            raw = (ROOT/'profiles/muffled-persistence-test/readback-coefficients.jsonl').read_bytes()
        if self.failure == 'corrupt':
            raw = b'{}\n'
        kwargs['stdout'].write(raw)
        return subprocess.CompletedProcess(args, 0)


class WorkflowTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.run = Path(self.temp.name)/'run'
        self.run.mkdir()
        doc = json.loads((ROOT/'presets/original-default.json').read_text())
        doc['output_gain_db'] = 0  # FakeUSB replays the original unattenuated backup.
        self.plan, binary = preset.compile_preset(doc)
        preset.save_json(self.run/'plan.json', self.plan)
        (self.run/'plan.bin').write_bytes(binary)
        preset.save_json(self.run/'manifest.json', {'plan_sha256': preset.hashlib.sha256(binary).hexdigest()})

    def apply(self, fake):
        with patch.object(preset.subprocess, 'run', fake), patch.object(preset.time, 'sleep'), contextlib.redirect_stdout(io.StringIO()):
            preset.apply_plan(self.run, self.plan)

    def status(self):
        return json.loads((self.run/'status.json').read_text())

    def test_saved_then_not_ready_recovers_without_second_write(self):
        fake = FakeUSB('transient_after')
        self.apply(fake)
        self.assertEqual(fake.writes, 1)
        self.assertEqual(self.status()['status'], 'saved_verified')
        self.assertTrue((self.run/'after-metadata-attempt3.jsonl').exists())
        self.assertTrue((self.run/'after-metadata-attempt1.stderr.txt').exists())

    def test_before_permission_error_prevents_write_without_retries(self):
        fake = FakeUSB('permission')
        with self.assertRaises(preset.OperationError) as error:
            self.apply(fake)
        self.assertEqual(error.exception.exit_code, 2)
        self.assertEqual(fake.writes, 0)
        self.assertEqual(fake.reads, 1)
        self.assertEqual(self.status()['status'], 'not_written')

    def test_before_busy_exhaustion_is_bounded(self):
        fake = FakeUSB('busy_forever')
        with self.assertRaises(preset.OperationError):
            self.apply(fake)
        self.assertEqual(fake.reads, 3)
        self.assertEqual(fake.writes, 0)
        self.assertEqual(self.status()['status'], 'not_written')

    def test_saved_but_busy_exhaustion_reports_saved_unverified(self):
        fake = FakeUSB('busy_after')
        with self.assertRaises(preset.OperationError) as error:
            self.apply(fake)
        self.assertEqual(error.exception.exit_code, 4)
        self.assertEqual(fake.writes, 1)
        self.assertEqual(fake.after_reads, 3)
        self.assertTrue(self.status()['save_command_acknowledged'])
        self.assertEqual(self.status()['stage'], 'after_read')
        self.assertEqual(self.status()['status'], 'saved_unverified')

    def test_partial_write_does_not_retry_or_claim_saved(self):
        fake = FakeUSB('partial_write')
        with self.assertRaises(preset.OperationError) as error:
            self.apply(fake)
        self.assertEqual(error.exception.exit_code, 3)
        self.assertEqual(fake.writes, 1)
        self.assertEqual(fake.after_reads, 0)
        self.assertFalse(self.status()['save_command_acknowledged'])
        self.assertEqual(self.status()['acknowledged_operations'], 10)
        self.assertEqual(self.status()['status'], 'write_uncertain')

    def test_mismatch_is_saved_unverified_not_success(self):
        with self.assertRaises(preset.OperationError):
            self.apply(FakeUSB('mismatch'))
        self.assertEqual(self.status()['stage'], 'verify')
        self.assertEqual(self.status()['status'], 'saved_unverified')
        self.assertFalse(self.status()['readback_verified'])

    def test_writer_exit_zero_without_save_ack_is_not_success(self):
        fake = FakeUSB('missing_save_ack')
        with self.assertRaises(preset.OperationError):
            self.apply(fake)
        self.assertEqual(fake.writes, 1)
        self.assertFalse(self.status()['save_command_acknowledged'])
        self.assertEqual(self.status()['status'], 'write_uncertain')

    def test_writer_timeout_preserves_partial_evidence_without_retry(self):
        fake = FakeUSB('writer_timeout')
        with self.assertRaises(preset.OperationError):
            self.apply(fake)
        self.assertEqual(fake.writes, 1)
        self.assertEqual(self.status()['acknowledged_operations'], 10)
        self.assertEqual(self.status()['status'], 'write_uncertain')

    def test_permission_after_save_is_not_retried_or_mislabeled(self):
        fake = FakeUSB('permission_after')
        with self.assertRaises(preset.OperationError):
            self.apply(fake)
        self.assertEqual(fake.after_reads, 1)
        self.assertEqual(self.status()['status'], 'saved_unverified')

    def test_interruption_after_save_keeps_stage(self):
        with self.assertRaises(preset.OperationError):
            self.apply(FakeUSB('interrupt_after'))
        self.assertEqual(self.status()['status'], 'saved_unverified')

    def test_malformed_capture_cannot_reach_writer(self):
        fake = FakeUSB('corrupt')
        with self.assertRaises(preset.OperationError):
            self.apply(fake)
        self.assertEqual(fake.writes, 0)
        self.assertEqual(fake.reads, 1)

    def test_verify_reads_snapshot_without_writer_or_changing_old_logs(self):
        # A failed saved run remains historical evidence after successful recheck.
        with self.assertRaises(preset.OperationError):
            self.apply(FakeUSB('busy_after'))
        old_status = (self.run/'status.json').read_bytes()
        fake = FakeUSB()
        with patch.object(preset.subprocess, 'run', fake), contextlib.redirect_stdout(io.StringIO()):
            check = preset.verify_run(self.run)
        self.assertEqual(fake.writes, 0)
        self.assertEqual(fake.reads, 2)
        self.assertEqual((self.run/'status.json').read_bytes(), old_status)
        state = json.loads((check/'status.json').read_text())
        self.assertEqual(state['status'], 'readback_verified')
        self.assertFalse(state['write_attempted'])
        self.assertFalse(state['save_command_acknowledged'])

    def test_tampered_plan_is_rejected_before_device_access(self):
        self.plan['coefficients_q22']['48000'][0][0] -= 1
        preset.save_json(self.run/'plan.json', self.plan)
        fake = FakeUSB()
        with patch.object(preset.subprocess, 'run', fake), self.assertRaises(ValueError):
            preset.verify_run(self.run)
        self.assertEqual(fake.reads+fake.writes, 0)

    def test_fractional_apply_and_historical_verify_compare_exact_coefficients(self):
        doc = dict(self.plan['preset'], filters=[dict(type='peak', frequency_hz=1000, q=1, gain_db=-1.9)])
        self.plan, binary = preset.compile_preset(doc)
        preset.save_json(self.run/'plan.json', self.plan)
        (self.run/'plan.bin').write_bytes(binary)
        preset.save_json(self.run/'manifest.json', {'plan_sha256': preset.hashlib.sha256(binary).hexdigest()})
        fake = FakeUSB(plan=self.plan)
        self.apply(fake)
        self.assertEqual(self.status()['status'], 'saved_verified')
        with patch.object(preset.subprocess, 'run', fake), patch.object(preset, 'biquad', side_effect=AssertionError('must not recompile')), contextlib.redirect_stdout(io.StringIO()):
            preset.verify_run(self.run)
        self.assertEqual(fake.writes, 1)
        # Same integer label, different precise gain: must fail coefficient check.
        wrong_doc = dict(doc, filters=[dict(doc['filters'][0], gain_db=-1.8)])
        wrong, _ = preset.compile_preset(wrong_doc)
        (self.run/'after-coefficients.jsonl').write_bytes(plan_capture(wrong, True))
        with self.assertRaisesRegex(ValueError, 'Readback differs'):
            preset.verify(self.run, self.plan)
        result = json.loads((self.run/'verification.json').read_text())
        self.assertTrue(result['metadata_matches'])
        self.assertEqual(result['current_coefficients_match_rates'], [])
        # Correct coefficients cannot hide a bad label either.
        (self.run/'after-coefficients.jsonl').write_bytes(plan_capture(self.plan, True))
        wrong['bands'][0]['gain_db'] = -2
        (self.run/'after-metadata.jsonl').write_bytes(plan_capture(wrong))
        with self.assertRaisesRegex(ValueError, 'Readback differs'):
            preset.verify(self.run, self.plan)
        result = json.loads((self.run/'verification.json').read_text())
        self.assertFalse(result['metadata_matches'])
        self.assertIn('48000', result['current_coefficients_match_rates'])

    def test_legacy_integer_plan_without_separate_labels_still_verifies(self):
        for band in self.plan['bands']:
            del band['gain_label_db']
        preset.save_json(self.run/'plan.json', self.plan)
        self.assertEqual(preset.load_run_plan(self.run), self.plan)
        self.apply(FakeUSB())
        self.assertEqual(self.status()['status'], 'saved_verified')

    def test_short_reply_rejected_as_invalid_data(self):
        rows = [json.loads(s) for s in COEFFICIENTS.splitlines()]
        rows[0]['hex'] = '01'
        p = self.run/'short.jsonl'
        p.write_text('\n'.join(json.dumps(r) for r in rows))
        with self.assertRaisesRegex(ValueError, 'length'):
            preset.read_coefficients(p)

    def test_concurrent_device_session_is_rejected(self):
        with patch.object(preset, 'ROOT', Path(self.temp.name)):
            with preset.device_lock():
                with self.assertRaisesRegex(ValueError, '正在使用'):
                    with preset.device_lock():
                        self.fail('Second device operation entered')


if __name__ == '__main__':
    unittest.main()
