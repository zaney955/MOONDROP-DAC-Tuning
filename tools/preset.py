"""Editable presets -> validated ECHO-B save plans. Only 'apply' touches USB."""
import argparse
import cmath
from datetime import datetime, timezone
import hashlib
import json
import math
from pathlib import Path
import struct
import subprocess
import sys

from summarize_backup import decode

ROOT = Path(__file__).resolve().parent.parent
SCALE = 1 << 22
RATES = {4: 44100, 5: 48000, 6: 96000, 7: 192000, 8: 384000}
IDENTITY = [SCALE, 0, 0, 0, 0]
TYPES = {'peak': 0, 'low_shelf': 1, 'high_shelf': 2}


def save_json(path, value):
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2) + '\n')


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
    allowed = {'version', 'device', 'name', 'description', 'preamp_db', 'filters'}
    if set(doc) - allowed or doc.get('version') != 1 or doc.get('device') != 'MOONDROP ECHO-B':
        raise ValueError('Unknown fields, version or device')
    if not isinstance(doc.get('name'), str) or not doc['name'].strip():
        raise ValueError('name is required')
    preamp = number(doc['preamp_db'], -60, 0)
    filters = doc['filters']
    if not isinstance(filters, list) or len(filters) > 8:
        raise ValueError('At most 8 filters; band 9 is reserved for global attenuation')
    bands = [dict(band=n, frequency_hz=500*n, q=1, type_code=1, gain_db=0) for n in range(1, 10)]
    normalized = []
    for i, filt in enumerate(filters):
        if not isinstance(filt, dict) or set(filt) != {'type', 'frequency_hz', 'q', 'gain_db'}:
            raise ValueError('Filter fields: type, frequency_hz, q, gain_db')
        if filt['type'] not in TYPES:
            raise ValueError('Filter type must be peak, low_shelf or high_shelf')
        freq = number(filt['frequency_hz'], 20, 20000)
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
        rows.append([round(SCALE*10**(preamp/20)), 0, 0, 0, 0])
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
    frames = [frame(0x5a, [0x5a, 0])]
    frames += [frame(0xdc, [0, b['band'], b['frequency_hz'], round(b['q']*256), b['type_code'], b['gain_db'] & 0xffffff]) for b in bands]
    frames += [frame(0xdc, [idx, n, 3] + coeffs[str(fs)][n-1]) for n in range(1, 10) for idx, fs in RATES.items()]
    frames += [frame(0xdc, [255])]
    return dict(preset=doc, bands=bands, coefficients_q22=coeffs, response_check=response,
                note='Band 9 implements global attenuation directly; Android metadata labels do not encode it.'), b''.join(frames)


def resolve_preset(value):
    path = Path(value).expanduser()
    if not path.is_file():
        path = ROOT / 'presets' / (value.removesuffix('.json') + '.json')
    return path.resolve()


def capture(directory, prefix):
    for suffix, args in [('metadata', []), ('coefficients', ['--coefficients'])]:
        with (directory / f'{prefix}-{suffix}.jsonl').open('xb') as out:
            subprocess.run([str(ROOT/'bin/echo_probe')] + args, stdout=out, check=True)
    decode(directory / f'{prefix}-metadata.jsonl')
    read_coefficients(directory / f'{prefix}-coefficients.jsonl')


def read_coefficients(path):
    rows = [json.loads(line) for line in path.read_text().splitlines()]
    if [(r['command'], r['argument']) for r in rows] != [(90, 90)] + [(190, n) for n in range(1, 10)]:
        raise ValueError('Incomplete coefficient capture')
    result = []
    for row in rows:
        b = bytes.fromhex(row['hex'])
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


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('action', choices=['list', 'build', 'apply'])
    parser.add_argument('preset', nargs='?')
    args = parser.parse_args()
    if args.action == 'list':
        for path in sorted((ROOT/'presets').glob('*.json')):
            doc = json.loads(path.read_text())
            print(f"{path.stem}: {doc['name']} (preamp {doc['preamp_db']} dB)")
        return
    if not args.preset:
        parser.error('build/apply requires a preset name or JSON path')
    source = resolve_preset(args.preset)
    doc = json.loads(source.read_text())
    plan, binary = compile_preset(doc)
    if args.action == 'build':
        directory = ROOT/'profiles'/'compiled'/source.stem
        directory.mkdir(parents=True, exist_ok=True)
    else:
        subprocess.run(['make', 'build'], cwd=ROOT, check=True)
        stamp = datetime.now(timezone.utc).strftime('%Y%m%dT%H%M%S.%fZ')
        directory = ROOT/'runs'/f'{stamp}-{source.stem}'
        directory.mkdir(parents=True)
    save_json(directory/'preset.json', doc)
    save_json(directory/'plan.json', plan)
    (directory/'plan.bin').write_bytes(binary)
    save_json(directory/'manifest.json', dict(plan_sha256=hashlib.sha256(binary).hexdigest(), source=str(source)))
    print(directory, flush=True)
    maximum = max(r['max_gain_db'] for r in plan['response_check'].values())
    print(f'20 Hz–20 kHz sampled peak: {maximum:.6f} dB', flush=True)
    if args.action == 'apply':
        # Capture success is mandatory before the first write. Captures cover the current rate only.
        capture(directory, 'before')
        with (directory/'write-log.jsonl').open('xb') as out:
            subprocess.run([str(ROOT/'bin/echo_apply_plan'), str(directory/'plan.bin')], stdout=out, check=True)
        capture(directory, 'after')
        verify(directory, plan)
        print('Saved and read back successfully. Physical unplug persistence is not tested.')


if __name__ == '__main__':
    try:
        main()
    except (ValueError, KeyError, OSError, subprocess.CalledProcessError) as error:
        sys.exit(f'ERROR: {error}')
