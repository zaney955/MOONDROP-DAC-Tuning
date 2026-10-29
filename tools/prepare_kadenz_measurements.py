"""从保留的官方 TXT 生成 UTF-8、CSV、JSON、对照表与 SVG；不修改原文件。"""
import csv
import hashlib
import json
import math
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent / 'headphones' / 'moondrop' / 'kadenz' / 'measurements'
DATA = ROOT / 'processed'
DATA.mkdir(exist_ok=True)
SOURCES = [
    {'url': 'https://cdn.moondroplab.tech/peq-config-file/UDFyUvjf1JV01ZnhvQSQ1kadenz5128.txt'},
    {'url': 'https://cdn.moondroplab.tech/peq-config-file/PT-Zgr2njD1VuGt3GMy8Hkadenz4128.txt'},
]
curves = {}
for rig, encoding in [('5128', 'gb18030'), ('4128', 'ascii')]:
    path = ROOT / 'raw' / f'kadenz{rig}.txt'
    raw = path.read_bytes()
    text = raw.decode(encoding)
    lines = text.splitlines()
    rows = [line.split() for line in lines if line.strip() and not line.startswith('*')]
    assert all(len(row) == 3 for row in rows)
    values = [[float(v) for v in row] for row in rows]
    assert all(math.isfinite(v) for row in values for v in row)
    assert all(a[0] < b[0] for a, b in zip(values, values[1:]))
    fields = ['frequency_hz', 'spl_db', 'phase_degrees']
    with (DATA / f'kadenz-{rig}.csv').open('w', encoding='utf-8', newline='') as f:
        writer = csv.writer(f)
        writer.writerow(fields)
        writer.writerows(rows)
    (DATA / f'kadenz-{rig}-utf8.txt').write_text(text, encoding='utf-8')
    metadata = {
        'official_label': f'kadenz 终章 {rig}',
        'measurement_system_label': rig,
        'source_page': 'https://hub.moondroplab.tech/',
        'source_file': next(x['url'] for x in SOURCES if rig in x['url']),
        'download_date': '2026-10-29',
        'source_encoding_used': encoding,
        'original_bytes': len(raw),
        'original_sha256': hashlib.sha256(raw).hexdigest(),
        'point_count': len(rows),
        'frequency_min_hz': values[0][0],
        'frequency_max_hz': values[-1][0],
        'header_verbatim': [line for line in lines if line.startswith('*')],
        'processing': 'CSV/JSON retain all original numeric rows, no normalization, EQ, resampling or extra smoothing.',
        'unconfirmed_conditions': ['nozzle', 'ear tips', 'insertion depth', 'sample identity', 'calibration', 'measurement date validity'],
    }
    result = {'metadata': metadata, 'data': [dict(zip(fields, row)) for row in values]}
    (DATA / f'kadenz-{rig}.json').write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    curves[rig] = {'rows': rows, 'values': values, 'metadata': metadata}

assert [r[0] for r in curves['5128']['rows']] == [r[0] for r in curves['4128']['rows']]
with (DATA / 'kadenz-5128-4128-comparison.csv').open('w', encoding='utf-8', newline='') as f:
    writer = csv.writer(f)
    writer.writerow(['frequency_hz', 'spl_db_5128', 'phase_degrees_5128', 'spl_db_4128', 'phase_degrees_4128'])
    writer.writerows([a + b[1:] for a, b in zip(curves['5128']['rows'], curves['4128']['rows'])])

# 仅预览图进行 500 Hz → 60 dB 对齐，按 log10(f) 在 dB 数值间插值。
def at500(values):
    for (f0,s0,_), (f1,s1,_) in zip(values,values[1:]):
        if f0 <= 500 <= f1:
            t = (math.log10(500)-math.log10(f0))/(math.log10(f1)-math.log10(f0))
            return s0+(s1-s0)*t
    raise ValueError('500 Hz outside data')

x = lambda f: 80 + math.log10(f/20)/3*1000
y = lambda db: 470 - (db-40)/40*360
svg = ['<svg xmlns="http://www.w3.org/2000/svg" width="1160" height="600" viewBox="0 0 1160 600">',
       '<rect width="1160" height="600" fill="#fafafa"/>',
       '<g font-family="Arial,sans-serif" fill="#222">',
       '<text x="80" y="35" font-size="23">Kadenz | Official published frequency responses</text>',
       '<text x="80" y="62" font-size="14">Preview only: aligned to 60 dB at 500 Hz. Source CSV / JSON keep original levels.</text>']
for f in [20,50,100,200,500,1000,2000,5000,10000,20000]:
    xx=x(f)
    svg.append(f'<path d="M{xx:.2f},110 V470" stroke="#ddd"/><text x="{xx:.2f}" y="495" text-anchor="middle" font-size="13">{f}</text>')
for db in range(40,81,5):
    yy=y(db)
    svg.append(f'<path d="M80,{yy} H1080" stroke="#ddd"/><text x="65" y="{yy+4}" text-anchor="end" font-size="13">{db}</text>')
for rig,color in [('5128','#5b42d6'),('4128','#c26b14')]:
    v=curves[rig]['values']; offset=60-at500(v)
    points=' '.join(f'{x(f):.3f},{y(s+offset):.3f}' for f,s,_ in v)
    svg.append(f'<polyline points="{points}" fill="none" stroke="{color}" stroke-width="2.2"/>')
    xx=80 if rig=='5128' else 330
    svg.append(f'<text x="{xx}" y="90" font-size="16" fill="{color}">Kadenz {rig}</text>')
svg += ['<text x="580" y="525" text-anchor="middle" font-size="15">Frequency (Hz, logarithmic)</text>',
        '<text x="80" y="558" font-size="13">Source: hub.moondroplab.tech | REW export: 1/24 octave smoothing, 1/96 octave steps</text>',
        '<text x="80" y="581" font-size="13">Different measurement systems; do not interpret their difference as an EQ correction.</text></g></svg>']
(ROOT/'frequency-response.svg').write_text('\n'.join(svg),encoding='utf-8')

# 确认 CSV 数字逐行等于原 TXT，且点数完全一致。
for rig in curves:
    with (DATA/f'kadenz-{rig}.csv').open() as f:
        parsed=list(csv.reader(f))[1:]
    assert parsed == curves[rig]['rows']
report = {rig: {'point_count': len(v['rows']), 'columns': 3, 'finite': True,
                  'strictly_increasing_frequency': True, 'csv_matches_source_text_numbers': True,
                  'frequency_min_hz': v['values'][0][0], 'frequency_max_hz': v['values'][-1][0],
                  'sha256': v['metadata']['original_sha256']} for rig,v in curves.items()}
(ROOT/'provenance'/'validation.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
print(json.dumps(report,ensure_ascii=False,indent=2))

