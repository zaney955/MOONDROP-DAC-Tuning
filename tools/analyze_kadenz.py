"""Reproduce Kadenz descriptive statistics and offline EQ checks; no USB I/O."""
import bisect
import cmath
import csv
import hashlib
import json
import math
from pathlib import Path

from preset import SCALE, compile_preset

ROOT = Path(__file__).resolve().parent.parent
MODEL = ROOT/'headphones'/'moondrop'/'kadenz'
DATA = MODEL/'measurements'
OUT = MODEL/'analysis'
FREQUENCIES = [20, 30, 50, 80, 100, 150, 200, 300, 500, 800, 1000,
               1500, 2000, 2500, 3000, 4000, 5000, 6000, 8000, 10000, 12000, 14000, 16000]
BANDS = [(20, 60), (60, 200), (200, 500), (500, 1000), (1000, 2000),
         (2000, 4000), (4000, 8000), (8000, 12000), (12000, 19896.974609)]
TONE_BANDS = [(20, 60), (60, 120), (120, 250), (250, 500), (500, 1000),
              (1000, 2000), (2000, 4000), (4000, 6000), (6000, 10000),
              (10000, 20000)]


def interpolate(x, y, f):
    if not x[0] <= f <= x[-1]:
        raise ValueError('No extrapolation allowed')
    i = bisect.bisect_left(x, f)
    if x[i] == f:
        return y[i]
    weight = math.log(f/x[i-1])/math.log(x[i]/x[i-1])
    return y[i-1]*(1-weight) + y[i]*weight


def mean_log(x, y, lo, hi):
    grid = [lo] + [f for f in x if lo < f < hi] + [hi]
    vals = [interpolate(x, y, f) for f in grid]
    return sum((a+b)/2*math.log(f2/f1) for f1, f2, a, b in zip(grid, grid[1:], vals, vals[1:])) / math.log(hi/lo)


def response_db(rows, frequency, fs):
    z = cmath.exp(-2j*math.pi*frequency/fs)
    h = 1
    for row in rows:
        b0, b1, b2, p, q = [value/SCALE for value in row]
        h *= (b0+b1*z+b2*z*z)/(1-p*z-q*z*z)
    return 20*math.log10(abs(h))


def analyze_listening_preset():
    source = ROOT/'presets/kadenz-death-metal-structure-v1.json'
    raw = source.read_bytes()
    plan, binary = compile_preset(json.loads(raw))
    # A denser grid than the compiler's 601-point check; no hardware claims.
    grid = [20*1000**(i/6000) for i in range(6001)]
    rows_by_rate = plan['coefficients_q22']
    tones = {fs: [response_db(rows[:8], f, int(fs)) for f in grid]
             for fs, rows in rows_by_rate.items()}
    result = dict(preset=str(source.relative_to(ROOT)),
                  source_sha256=hashlib.sha256(raw).hexdigest(),
                  write_plan_sha256=hashlib.sha256(binary).hexdigest(),
                  method='Quantized Q22 theoretical steady-state response; 6001 log-spaced points, 20 Hz to 20 kHz. Tone excludes band 9. Band means integrate dB over log frequency, not loudness or energy. Band extrema also include exact endpoints. Cross-rate differences include digital frequency warping and quantization. Prefix peaks do not prove internal headroom or transient clipping safety. Theoretical EQ at 20 kHz does not extend the acoustic measurements beyond 19896.974609 Hz.',
                  device_written=False, acoustic_output_measured=False,
                  rates={})
    for fs, rows in rows_by_rate.items():
        tone = tones[fs]
        output = response_db(rows[8:], 1000, int(fs))
        result['rates'][fs] = dict(
            tone_min_db=min(tone), tone_max_db=max(tone),
            output_gain_quantized_db=output,
            total_min_db=min(tone)+output, total_max_db=max(tone)+output,
            maximum_abs_difference_from_48000_db=max(abs(a-b) for a, b in zip(tone, tones['48000'])),
            tone_at_hz_db={str(f): response_db(rows[:8], f, int(fs))
                           for f in sorted(set(FREQUENCIES + [60, 120, 180, 250, 5500, 20000]))},
            prefix_max_db_before_output_gain=[max(response_db(rows[:n], f, int(fs)) for f in grid)
                                              for n in range(1, len(plan['preset']['filters'])+1)])
        result['rates'][fs]['tone_bands'] = []
        for lo, hi in TONE_BANDS:
            values = [response_db(rows[:8], f, int(fs)) for f in (lo, hi)]
            values += [v for f, v in zip(grid, tone) if lo < f < hi]
            result['rates'][fs]['tone_bands'].append(dict(
                low_hz=lo, high_hz=hi, mean_gain_db=mean_log(grid, tone, lo, hi),
                min_gain_db=min(values), max_gain_db=max(values)))
    (OUT/'death-metal-structure-v1.json').write_text(json.dumps(result, ensure_ascii=False, indent=2)+'\n')
    with (OUT/'death-metal-structure-v1.csv').open('w', newline='') as file:
        writer = csv.writer(file, lineterminator='\n')
        writer.writerow(['frequency_hz'] + [f'tone_{fs}_db' for fs in rows_by_rate])
        writer.writerows([f] + [tones[fs][i] for fs in rows_by_rate] for i, f in enumerate(grid))


def main():
    OUT.mkdir(parents=True, exist_ok=True)
    result = {'method': 'dB interpolated linearly over log frequency; per-curve 500 Hz=0 dB; band means are integrals of dB over log frequency, not acoustic energy or loudness', 'rigs': {}}
    curves = {}
    for rig in ['5128', '4128']:
        doc = json.loads((DATA/f'processed/kadenz-{rig}.json').read_text())
        raw = (DATA/f'raw/kadenz{rig}.txt').read_bytes()
        digest = hashlib.sha256(raw).hexdigest()
        assert digest == doc['metadata']['original_sha256']
        original_rows = [tuple(map(float, line.split())) for line in raw.decode(doc['metadata']['source_encoding_used']).splitlines() if line.strip() and not line.startswith('*')]
        rows = doc['data']
        assert original_rows == [(r['frequency_hz'], r['spl_db'], r['phase_degrees']) for r in rows]
        x, y = [r['frequency_hz'] for r in rows], [r['spl_db'] for r in rows]
        assert len(x) == 957 and all(a < b for a, b in zip(x, x[1:]))
        assert all(math.isfinite(v) for r in original_rows for v in r)
        base = interpolate(x, y, 500)
        relative = [v-base for v in y]
        curves[rig] = (x, relative)
        stats = dict(sha256=digest, point_count=len(x), original_500_hz_db=base,
                     anchors_relative_db={str(f): interpolate(x, relative, f) for f in FREQUENCIES},
                     bands=[], extrema={})
        for lo, hi in BANDS:
            stats['bands'].append(dict(low_hz=lo, high_hz=hi, mean_relative_db=mean_log(x, relative, lo, hi)))
        for name, lo, hi in [('bass_max', 20, 200), ('lower_mid_min', 200, 1000),
                             ('presence_max', 1000, 4000), ('lower_treble_min', 4000, 8000), ('treble_peak', 7000, 9000)]:
            points = [(f, v) for f, v in zip(x, relative) if lo <= f <= hi]
            f, v = (min if name.endswith('min') else max)(points, key=lambda row: row[1])
            stats['extrema'][name] = dict(frequency_hz=f, relative_db=v)
        result['rigs'][rig] = stats
    assert curves['5128'][0] == curves['4128'][0]
    x = curves['5128'][0]
    diff = [a-b for a, b in zip(curves['5128'][1], curves['4128'][1])]
    result['cross_rig_differences_not_eq'] = [dict(low_hz=lo, high_hz=hi,
        mean_signed_difference_db=mean_log(x, diff, lo, hi),
        maximum_abs_sample_difference_db=max(abs(v) for f, v in zip(x, diff) if lo <= f <= hi)) for lo, hi in BANDS]
    (OUT/'statistics.json').write_text(json.dumps(result, ensure_ascii=False, indent=2)+'\n')
    with (OUT/'normalized-500hz.csv').open('w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(['frequency_hz', '5128_relative_db', '4128_relative_db', '5128_minus_4128_db_NOT_EQ'])
        writer.writerows(zip(x, curves['5128'][1], curves['4128'][1], diff))
    lines = ['# 可复算统计表', '', '各曲线单独以 500 Hz 为 0 dB；这是曲线内部相对量，不是偏离中性目标的量。', '', '| Hz | 5128 / dB | 4128 / dB |', '|---:|---:|---:|']
    for f in FREQUENCIES:
        lines.append(f"| {f} | {result['rigs']['5128']['anchors_relative_db'][str(f)]:+.2f} | {result['rigs']['4128']['anchors_relative_db'][str(f)]:+.2f} |")
    lines += ['', '频段均值：沿对数频率对 dB 做梯形积分后除以频段对数宽度；不代表响度或声能。', '', '| Hz | 5128 / dB | 4128 / dB |', '|---:|---:|---:|']
    for a, b in zip(result['rigs']['5128']['bands'], result['rigs']['4128']['bands']):
        lines.append(f"| {a['low_hz']:g}–{a['high_hz']:g} | {a['mean_relative_db']:+.2f} | {b['mean_relative_db']:+.2f} |")
    (OUT/'summary.md').write_text('\n'.join(lines)+'\n')
    cases = [('sub_bass', 'low_shelf', 80, 2, 1), ('less_bass', 'low_shelf', 120, -2, 1),
             ('midbass', 'peak', 180, -2, 0.8), ('body', 'peak', 700, 1, 0.8),
             ('presence', 'peak', 3000, -2, 1), ('clarity', 'peak', 5500, 1, 1),
             ('sibilance', 'peak', 7500, -2, 2), ('air', 'high_shelf', 10000, 1, 1)]
    checks = []
    for name, kind, frequency, gain, q in cases:
        preset = dict(version=1, device='MOONDROP ECHO-B', name=name, output_gain_db=-3,
                      filters=[dict(type=kind, frequency_hz=frequency, gain_db=gain, q=q)])
        plan, binary = compile_preset(preset)
        assert len(binary) == 56*62
        checks.append(dict(example=preset, quantized_response=plan['response_check'],
                           device_written=False, device_auditioned=False))
    (OUT/'filter-examples.json').write_text(json.dumps(checks, ensure_ascii=False, indent=2)+'\n')
    analyze_listening_preset()
    print(OUT)


if __name__ == '__main__':
    main()
