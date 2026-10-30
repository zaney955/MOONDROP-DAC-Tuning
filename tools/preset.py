"""ECHO-B complete listening presets: list/build offline, apply writes, verify only reads."""
import argparse
import cmath
from contextlib import contextmanager
from datetime import datetime, timezone
import fcntl
import hashlib
import json
import math
from pathlib import Path
import struct
import subprocess
import sys
import time

from summarize_backup import decode

ROOT = Path(__file__).resolve().parent.parent
SCALE = 1 << 22
OUTPUT_GAIN_MIN_DB = 20 * math.log10(1 / SCALE)
OUTPUT_GAIN_MAX_DB = 20 * math.log10(((1 << 23) - 1) / SCALE)
RATES = {4: 44100, 5: 48000, 6: 96000, 7: 192000, 8: 384000}
IDENTITY = [SCALE, 0, 0, 0, 0]
TYPES = {'peak': 0, 'low_shelf': 1, 'high_shelf': 2}


def save_json(path, value):
    temporary = path.with_name(path.name + '.tmp')
    temporary.write_text(json.dumps(value, ensure_ascii=False, indent=2) + '\n')
    temporary.replace(path)


def timestamp():
    return datetime.now(timezone.utc).strftime('%Y%m%dT%H%M%S.%fZ')


@contextmanager
def device_lock():
    # Cooperating CLI processes serialize all reads/writes. Never delete this file.
    with (ROOT/'.echo-b.lock').open('a') as lock:
        try:
            fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError:
            raise ValueError('另一条 apply/verify 命令正在使用耳放；本次未执行设备操作') from None
        try:
            yield
        finally:
            fcntl.flock(lock, fcntl.LOCK_UN)


class OperationError(Exception):
    def __init__(self, message, exit_code):
        super().__init__(message)
        self.exit_code = exit_code


class RunStatus:
    def __init__(self, directory, action):
        self.directory = directory
        self.data = dict(action=action, stage='prepared', status='running',
                         write_attempted=False, save_command_acknowledged=False,
                         readback_verified=False, physical_unplug_tested=False)

    def update(self, stage, message, **fields):
        self.data.update(fields, stage=stage, message=message, updated_at_utc=timestamp())
        save_json(self.directory/'status.json', self.data)
        with (self.directory/'events.jsonl').open('a') as output:
            output.write(json.dumps(self.data, ensure_ascii=False)+'\n')
        print(f'[{stage}] {message}', flush=True)


def number(value, lo, hi):
    if type(value) not in (int, float) or not math.isfinite(value) or not lo <= value <= hi:
        raise ValueError(f'Expected finite number in [{lo}, {hi}]: {value!r}')
    return value


def biquad(filt, fs):
    gain = filt['gain_db']
    if gain == 0:
        return IDENTITY.copy()
    a = 10 ** (gain / 40)
    w = 2 * math.pi * filt['frequency_hz'] / fs
    c, s = math.cos(w), math.sin(w)
    if filt['type'] == 'peak':
        alpha = s / (2 * filt['q'])
        b0, b1, b2 = 1 + alpha*a, -2*c, 1 - alpha*a
        a0, a1, a2 = 1 + alpha/a, -2*c, 1 - alpha/a
    else:
        # RBJ shelf slope S=1. Metadata q is 1 for this supported shelf form.
        t = math.sqrt(2*a) * s
        if filt['type'] == 'high_shelf':
            b0, b1, b2 = a*((a+1)+(a-1)*c+t), -2*a*((a-1)+(a+1)*c), a*((a+1)+(a-1)*c-t)
            a0, a1, a2 = (a+1)-(a-1)*c+t, 2*((a-1)-(a+1)*c), (a+1)-(a-1)*c-t
        else:
            b0, b1, b2 = a*((a+1)-(a-1)*c+t), 2*a*((a-1)-(a+1)*c), a*((a+1)-(a-1)*c-t)
            a0, a1, a2 = (a+1)+(a-1)*c+t, -2*((a-1)+(a+1)*c), (a+1)+(a-1)*c-t
    return [round(x/a0*SCALE) for x in (b0, b1, b2, -a1, -a2)]


def frame(cmd, values):
    return bytes([1, 0, 13, 0, cmd, 0, 0, 0x23, 0x2d, 0xb3]) + struct.pack(
        '<13I', *[v & 0xffffffff for v in values + [0]*(13-len(values))])


def compile_preset(doc):
    allowed = {'version', 'device', 'name', 'description', 'output_gain_db', 'filters'}
    if not isinstance(doc, dict) or set(doc) - allowed or doc.get('version') != 1 or doc.get('device') != 'MOONDROP ECHO-B':
        raise ValueError('Unknown fields, version or device')
    if not isinstance(doc.get('name'), str) or not doc['name'].strip():
        raise ValueError('name is required')
    if 'output_gain_db' not in doc:
        raise ValueError('预设缺少 output_gain_db；请明确填写整体输出数字增益，不会自动按 0 dB 写入')
    output_gain_db = number(doc['output_gain_db'], OUTPUT_GAIN_MIN_DB, OUTPUT_GAIN_MAX_DB)
    filters = doc['filters']
    if not isinstance(filters, list) or len(filters) > 8:
        raise ValueError('At most 8 filters; band 9 is reserved for overall output gain')
    bands = [dict(band=n, frequency_hz=500*n, q=1, type_code=1, gain_db=0) for n in range(1, 10)]
    normalized = []
    for i, filt in enumerate(filters):
        if not isinstance(filt, dict) or set(filt) != {'type', 'frequency_hz', 'q', 'gain_db'}:
            raise ValueError('Filter fields: type, frequency_hz, q, gain_db')
        if filt['type'] not in TYPES:
            raise ValueError('Filter type must be peak, low_shelf or high_shelf')
        freq = number(filt['frequency_hz'], 20, 20000)
        # Preset input policy, not a universal hardware limit; see
        # docs/devices/echo-b-filter-gain-range.md for coefficient acceptance tests.
        gain = number(filt['gain_db'], -12, 12)
        q = number(filt['q'], 0.1, 10)
        if freq != round(freq) or gain != round(gain):
            raise ValueError('This version supports integer Hz and integer filter gain dB')
        if filt['type'] != 'peak' and q != 1:
            raise ValueError('Shelf filters currently require q=1 (slope S=1)')
        q = round(q*256)/256
        normalized.append(dict(filt, q=q))
        bands[i] = dict(band=i+1, frequency_hz=int(freq), q=q, type_code=TYPES[filt['type']], gain_db=int(gain))
    coeffs, response = {}, {}
    for fs in RATES.values():
        rows = [biquad(f, fs) for f in normalized]
        rows += [IDENTITY.copy() for _ in range(8-len(rows))]
        rows.append([round(SCALE*10**(output_gain_db/20)), 0, 0, 0, 0])
        for cf in rows:
            if any(not -(1 << 23) <= x < (1 << 23) for x in cf):
                raise ValueError(f'Coefficient exceeds signed 24-bit range at {fs} Hz')
            p, q = cf[3]/SCALE, cf[4]/SCALE
            if max(abs((p+cmath.sqrt(p*p+4*q))/2), abs((p-cmath.sqrt(p*p+4*q))/2)) >= 1:
                raise ValueError(f'Unstable quantized filter at {fs} Hz')
        gains = []
        for i in range(601):
            f = 20 * 1000**(i/600)
            z, h = cmath.exp(-2j*math.pi*f/fs), 1
            for cf in rows:
                b0, b1, b2, p, q = [x/SCALE for x in cf]
                h *= (b0+b1*z+b2*z*z)/(1-p*z-q*z*z)
            gains.append(20*math.log10(abs(h)))
        response[str(fs)] = dict(min_gain_db=min(gains), max_gain_db=max(gains))
        coeffs[str(fs)] = rows
    plan = dict(preset=doc, bands=bands, coefficients_q22=coeffs, response_check=response,
                note='Band 9 implements overall digital output gain directly; Android metadata labels do not encode it.')
    return plan, encode_plan(plan)


def encode_plan(plan):
    """Pack existing coefficients, without recalculating EQ for historical verification."""
    bands, coeffs = plan['bands'], plan['coefficients_q22']
    frames = [frame(0x5a, [0x5a, 0])]
    frames += [frame(0xdc, [0, b['band'], b['frequency_hz'], round(b['q']*256), b['type_code'], b['gain_db'] & 0xffffff]) for b in bands]
    frames += [frame(0xdc, [idx, n, 3] + coeffs[str(fs)][n-1]) for n in range(1, 10) for idx, fs in RATES.items()]
    frames += [frame(0xdc, [255])]
    return b''.join(frames)


def resolve_preset(value):
    path = Path(value).expanduser()
    if not path.is_file():
        path = ROOT / 'presets' / (value.removesuffix('.json') + '.json')
    return path.resolve()


def capture(directory, prefix):
    for suffix, args in [('metadata', []), ('coefficients', ['--coefficients'])]:
        canonical = directory/f'{prefix}-{suffix}.jsonl'
        if canonical.exists():
            raise FileExistsError(f'Refusing to overwrite capture: {canonical}')
        for attempt in range(1, 4):
            name = f'{prefix}-{suffix}-attempt{attempt}'
            raw, diagnostic = directory/(name+'.jsonl'), directory/(name+'.stderr.txt')
            with raw.open('xb') as out, diagnostic.open('xb') as err:
                result = subprocess.run([str(ROOT/'bin/echo_probe')] + args,
                                        stdout=out, stderr=err, timeout=20)
            if result.returncode == 0:
                (decode if suffix == 'metadata' else read_coefficients)(raw)
                with canonical.open('xb') as out:
                    out.write(raw.read_bytes())
                break
            detail = diagnostic.read_text(errors='replace').strip()
            # Only exit 4 (bounded NotReady exhaustion) permits a fresh read-only probe.
            if result.returncode != 4 or attempt == 3:
                raise ValueError(f'{prefix}/{suffix} 读取失败 (exit {result.returncode}): {detail}; 日志 {raw}')
            print(f'[read_retry] {prefix}/{suffix} 设备暂未就绪；仅重读 ({attempt}/2)', flush=True)
            time.sleep(0.25*attempt)
    metadata = decode(directory/f'{prefix}-metadata.jsonl')
    mode, _ = read_coefficients(directory/f'{prefix}-coefficients.jsonl')
    if metadata['mode'] != mode:
        raise ValueError('Device mode changed between metadata and coefficient capture')


def read_coefficients(path):
    rows = [json.loads(line) for line in path.read_text().splitlines()]
    if [(r['command'], r['argument']) for r in rows] != [(90, 90)] + [(190, n) for n in range(1, 10)]:
        raise ValueError('Incomplete coefficient capture')
    result = []
    for row in rows:
        b = bytes.fromhex(row['hex'])
        if len(b) != 62:
            raise ValueError('Invalid coefficient response length')
        count = struct.unpack_from('<h', b, 2)[0]
        if len(b) != 62 or row['length'] != 62 or b[:2] != b'\x01\x00' or b[4:10] != bytes([row['command'], 0x81, 0, 0x23, 0x2d, 0xb3]) or not 0 <= count <= 13:
            raise ValueError('Invalid coefficient response')
        if row['command'] == 90:
            mode = struct.unpack_from('<I', b, 14)[0]
            continue
        channel, band, gain = struct.unpack_from('<3I', b, 10)
        if count != 8 or channel != 0 or band != row['argument'] or gain != 3:
            raise ValueError('Unexpected coefficient identity')
        result.append([((x & 0xffffff) ^ 0x800000) - 0x800000 for x in struct.unpack_from('<5I', b, 22)])
    return mode, result


def verify(directory, plan):
    metadata = decode(directory/'after-metadata.jsonl')
    mode, coefficients = read_coefficients(directory/'after-coefficients.jsonl')
    expected = [dict(band=b['band'], frequency_hz=b['frequency_hz'], q=b['q'], type_code=b['type_code'], gain_label_db=b['gain_db']) for b in plan['bands']]
    rates = [fs for fs, rows in plan['coefficients_q22'].items() if rows == coefficients]
    result = dict(metadata_matches=metadata['bands'] == expected, mode_matches=mode == metadata['mode'] == 0,
                  current_coefficients_match_rates=rates, physical_unplug_tested=False)
    save_json(directory/'verification.json', result)
    if not result['metadata_matches'] or not result['mode_matches'] or not rates:
        raise ValueError('Readback differs from preset; see verification.json')
    return result


def write_evidence(directory):
    """Only an ordered, complete set of positive ACKs confirms the save sequence."""
    rows = []
    try:
        for line in (directory/'write-log.jsonl').read_text().splitlines():
            row = json.loads(line)
            if row.get('operation') != len(rows) or row.get('ack') is not True:
                break
            rows.append(row)
    except (OSError, ValueError, AttributeError):
        pass
    complete = len(rows) == 56
    return dict(acknowledged_operations=len(rows), all_56_operations_acknowledged=complete,
                save_command_acknowledged=complete)


def apply_plan(directory, plan):
    status = RunStatus(directory, 'apply')
    try:
        status.update('before_read', '读取写入前状态；尚未发送 EQ 写入')
        capture(directory, 'before')
        status.update('write', '开始发送 EQ 保存序列；不会自动重试写入', write_attempted=True)
        with (directory/'write-log.jsonl').open('xb') as out, (directory/'write-stderr.txt').open('xb') as err:
            result = subprocess.run([str(ROOT/'bin/echo_apply_plan'), str(directory/'plan.bin')],
                                    stdout=out, stderr=err, timeout=120)
        evidence = write_evidence(directory)
        status.data.update(evidence)
        if result.returncode != 0 or not evidence['save_command_acknowledged']:
            detail = (directory/'write-stderr.txt').read_text(errors='replace').strip()
            raise ValueError(f'写入程序 exit {result.returncode}；成功 ACK {evidence["acknowledged_operations"]}/56；{detail}')
        status.update('after_read', '56 条操作及保存命令已确认；正在读取验证')
        capture(directory, 'after')
        status.update('verify', '核对已保存配置的模式、参数和当前运行系数')
        verification = verify(directory, plan)
        verification.update(evidence)
        save_json(directory/'verification.json', verification)
        status.update('complete', '已写入并保存，读回验证通过；物理拔插尚未验证',
                      status='saved_verified', readback_verified=True)
    except (Exception, KeyboardInterrupt) as error:
        stage = status.data['stage']
        if status.data['write_attempted']:
            status.data.update(write_evidence(directory))
        if status.data['save_command_acknowledged']:
            message = '保存命令已确认，但后续验证未完成或未通过；不要重复写入，请运行 verify'
            outcome, exit_code = 'saved_unverified', 4
        elif status.data['write_attempted']:
            message = '写入已启动，可能已部分生效或保存结果未知；未自动回滚或重写'
            outcome, exit_code = 'write_uncertain', 3
        else:
            message = '写入前读取失败；尚未发送 EQ 写入'
            outcome, exit_code = 'not_written', 2
        status.update(stage, message, status=outcome, error=str(error) or type(error).__name__)
        raise OperationError(f'{message}\n原因：{error}\n记录：{directory}', exit_code) from error


def load_run_plan(directory):
    plan = json.loads((directory/'plan.json').read_text())
    binary = (directory/'plan.bin').read_bytes()
    manifest = json.loads((directory/'manifest.json').read_text())
    if len(binary) != 56*62 or hashlib.sha256(binary).hexdigest() != manifest['plan_sha256']:
        raise ValueError('Historical plan.bin failed manifest integrity check')
    if encode_plan(plan) != binary:
        raise ValueError('Historical plan.json does not match plan.bin')
    return plan


def verify_run(directory):
    plan = load_run_plan(directory)
    check = directory/'checks'/timestamp()
    check.mkdir(parents=True, exist_ok=False)
    status = RunStatus(check, 'verify')
    status.data['source_run'] = str(directory)
    print(check, flush=True)
    try:
        status.update('after_read', '只读复核历史计划；不会发送 EQ 写入或保存命令')
        capture(check, 'after')
        status.update('verify', '比较当前设备与历史计划，不重新计算滤波系数')
        verify(check, plan)
        status.update('complete', '当前运行状态与计划匹配；本次未写入，物理拔插需另行记录',
                      status='readback_verified', readback_verified=True)
    except (Exception, KeyboardInterrupt) as error:
        status.update(status.data['stage'], '只读复核失败；本次未发送 EQ 写入',
                      status='readback_failed', error=str(error) or type(error).__name__)
        raise OperationError(f'只读复核未通过：{error}\n记录：{check}', 5) from error
    return check


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('action', choices=['list', 'build', 'apply', 'verify'])
    parser.add_argument('preset', nargs='?', help='preset name/JSON path; verify: historical run directory')
    args = parser.parse_args()
    if args.action == 'list':
        for path in sorted((ROOT/'presets').glob('*.json')):
            doc = json.loads(path.read_text())
            gain = doc.get('output_gain_db', '缺失，需补充')
            print(f"{path.stem}: {doc['name']} (output_gain {gain} dB)")
        return
    if not args.preset:
        parser.error('build/apply requires a preset; verify requires a historical run directory')
    if args.action == 'verify':
        directory = Path(args.preset).expanduser().resolve()
        load_run_plan(directory)  # Fail before device access on incomplete/corrupt records.
        subprocess.run(['make', 'build'], cwd=ROOT, check=True)
        with device_lock():
            verify_run(directory)
        return
    source = resolve_preset(args.preset)
    doc = json.loads(source.read_text())
    plan, binary = compile_preset(doc)
    if args.action == 'build':
        directory = ROOT/'profiles'/'compiled'/source.stem
        directory.mkdir(parents=True, exist_ok=True)
    else:
        subprocess.run(['make', 'build'], cwd=ROOT, check=True)
        stamp = timestamp()
        directory = ROOT/'runs'/f'{stamp}-{source.stem}'
        directory.mkdir(parents=True)
    save_json(directory/'preset.json', doc)
    save_json(directory/'plan.json', plan)
    (directory/'plan.bin').write_bytes(binary)
    save_json(directory/'manifest.json', dict(plan_sha256=hashlib.sha256(binary).hexdigest(), source=str(source)))
    print(directory, flush=True)
    print(f'整体输出数字增益 {doc["output_gain_db"]:g} dB', flush=True)
    maximum = max(r['max_gain_db'] for r in plan['response_check'].values())
    print(f'20 Hz–20 kHz sampled peak: {maximum:.6f} dB', flush=True)
    if maximum > 0:
        print('提示：组合频响超过 0 dB，满幅输入可能削波；请降低音源电平或调整 EQ。', flush=True)
    if args.action == 'apply':
        with device_lock():
            apply_plan(directory, plan)


if __name__ == '__main__':
    try:
        main()
    except OperationError as error:
        print(f'ERROR: {error}', file=sys.stderr)
        sys.exit(error.exit_code)
    except (ValueError, KeyError, OSError, subprocess.CalledProcessError) as error:
        sys.exit(f'ERROR: {error}\n若已生成运行目录，请结合 status.json 和 write-log.jsonl 判断设备阶段。')
