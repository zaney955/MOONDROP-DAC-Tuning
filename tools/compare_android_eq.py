"""Compare official Android native EQ outputs against this repo, without USB."""
import argparse
import cmath
import csv
import hashlib
import json
import math
from pathlib import Path
import zipfile

from android_eq_oracle import OfficialOracle
import preset


def response(coefficients, scale, frequency, fs):
    b0,b1,b2,p,q=[v/scale for v in coefficients]
    z=cmath.exp(-2j*math.pi*frequency/fs)
    value=abs((b0+b1*z+b2*z*z)/(1-p*z-q*z*z))
    return 20*math.log10(value) if value else None


def valid(coefficients):
    if any(not -(1<<23)<=v<(1<<23) for v in coefficients):return 'coefficient_overflow'
    p,q=coefficients[3:]
    if not (-preset.SCALE<q<preset.SCALE and preset.SCALE-p-q>0 and preset.SCALE+p-q>0):return 'quantized_unstable'
    return None


def matrix():
    for frequency in (60,180,1000,3000,7500,10000,15000,20000):
        for q in (0.7,0.8,0.9,1,1.2,2,5):
            for gain in (-6,-3,3,6):
                yield dict(type='peak',frequency_hz=frequency,q=q,gain_db=gain)
    for kind in ('low_shelf','high_shelf'):
        for frequency in (80,1000,5000,10000):
            for gain in (-12,-6,3,6,12):
                yield dict(type=kind,frequency_hz=frequency,q=1,gain_db=gain)
    for kind in ('peak','low_shelf','high_shelf'):
        yield dict(type=kind,frequency_hz=1000,q=1,gain_db=0)
    for path in sorted((preset.ROOT/'presets').glob('*.json')):
        for filt in json.loads(path.read_text())['filters']:
            yield filt


def compare(oracle,filt,fs):
    kind,f,q,g=filt['type'],filt['frequency_hz'],filt['q'],filt['gain_db']
    native=oracle.convert(kind,f,q,g,fs)
    normalized=dict(filt,q=round(q*256)/256)
    tool=preset.biquad(normalized,fs)
    error=valid(tool)
    row=dict(filter=filt, sample_rate_hz=fs,
             official_input_q=int(q*256)/256,tool_input_q=normalized['q'],
             official=native,tool_coefficients_q22=tool,tool_coefficient_error=error)
    if native['status'] or error:
        return row
    scale=2**(25-native['Gain'])
    row['official_effective_scale']=scale
    row['same_normalized_coefficients']=all(a/scale==b/preset.SCALE for a,b in zip(native['coefficients'],tool))
    frequencies=[20*1000**(i/1000) for i in range(1001)]
    frequencies.append(f)
    differences=[]
    for frequency in frequencies:
        off=response(native['coefficients'],scale,frequency,fs)
        own=response(tool,preset.SCALE,frequency,fs)
        if off is None or own is None:continue
        differences.append((abs(off-own),frequency,off,own))
    worst=max(differences)
    row['response_comparison']=dict(max_abs_difference_db=worst[0],at_frequency_hz=worst[1],
        official_gain_at_worst_db=worst[2],tool_gain_at_worst_db=worst[3],
        official_gain_at_filter_frequency_db=response(native['coefficients'],scale,f,fs),
        tool_gain_at_filter_frequency_db=response(tool,preset.SCALE,f,fs))
    return row


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('output',type=Path)
    parser.add_argument('--apk',type=Path,default=preset.ROOT/'evidence/moondrop-android-release.apk')
    parser.add_argument('--library',type=Path,default=preset.ROOT/'evidence/android-arm64/libcxaudiodsplib_embca_jni.so')
    args=parser.parse_args()
    args.output.mkdir(parents=True,exist_ok=False)
    data=args.library.read_bytes()
    with zipfile.ZipFile(args.apk) as archive:
        assert archive.read('lib/arm64-v8a/'+args.library.name)==data,'ELF differs from APK member'
    oracle=OfficialOracle(args.library)
    filters=list(matrix());rows=[]
    for fs in preset.RATES.values():
        for filt in filters:rows.append(compare(oracle,filt,fs))
        print(f'Compared {len(filters)} filters at {fs} Hz',flush=True)
    comparable=[r for r in rows if 'response_comparison' in r]
    summary=dict(total=len(rows),comparable=len(comparable),
        normalized_coefficients_exactly_equal=sum(r['same_normalized_coefficients'] for r in comparable),
        official_conversion_rejected=sum(bool(r['official']['status']) for r in rows),
        tool_coefficients_rejected=sum(bool(r['tool_coefficient_error']) for r in rows),
        max_response_difference_db=max(r['response_comparison']['max_abs_difference_db'] for r in comparable))
    groups={}
    for kind in ('peak','low_shelf','high_shelf'):
        selected=[r for r in comparable if r['filter']['type']==kind and r['filter']['gain_db']!=0]
        same_q=[r for r in selected if r['official_input_q']==r['tool_input_q']]
        groups[kind]=dict(comparable_nonflat=len(selected),max_difference_db=max(r['response_comparison']['max_abs_difference_db'] for r in selected),
                         same_effective_q_cases=len(same_q),same_q_max_difference_db=max(r['response_comparison']['max_abs_difference_db'] for r in same_q))
    preset_comparisons=[]
    for path in sorted((preset.ROOT/'presets').glob('*.json')):
        doc=json.loads(path.read_text())
        if not doc['filters']:continue
        for fs in preset.RATES.values():
            selected=[next(r for r in rows if r['filter']==filt and r['sample_rate_hz']==fs) for filt in doc['filters']]
            assert all('response_comparison' in r for r in selected)
            differences=[]
            for frequency in [20*1000**(i/1000) for i in range(1001)]:
                off=sum(response(r['official']['coefficients'],r['official_effective_scale'],frequency,fs) for r in selected)
                own=sum(response(r['tool_coefficients_q22'],preset.SCALE,frequency,fs) for r in selected)
                differences.append((abs(off-own),frequency))
            worst=max(differences)
            preset_comparisons.append(dict(preset=path.name,sample_rate_hz=fs,filters_only=True,max_curve_difference_db=worst[0],at_frequency_hz=worst[1]))
    sources=dict(comparison_driver_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),apk_sha256=hashlib.sha256(args.apk.read_bytes()).hexdigest(),library_sha256=hashlib.sha256(data).hexdigest(),
        apk_source_url='https://download.moondroplab.com/moondroplink/android-release.apk',
        oracle_source_sha256=hashlib.sha256((preset.ROOT/'tools/android_eq_oracle.py').read_bytes()).hexdigest(),
        tool_source_sha256=hashlib.sha256((preset.ROOT/'tools/preset.py').read_bytes()).hexdigest())
    result=dict(scope='Official ARM64 coefficient converter emulated; no Android UI or USB execution',
        limitation='Host libm substitutes Android libm imports; physical Android bit-exact identity not asserted. Curves are computed, not analog recordings.',
        sources=sources,summary=summary,groups=groups,existing_presets_comparison=preset_comparisons,rows=rows,import_calls=dict(oracle.calls))
    (args.output/'comparison.json').write_text(json.dumps(result,ensure_ascii=False,indent=2,allow_nan=False)+'\n')
    with (args.output/'comparison.csv').open('w',newline='') as out:
        writer=csv.writer(out);writer.writerow(['type','frequency_hz','q_requested','gain_db','sample_rate_hz','official_status','official_Gain','tool_error','q_official','q_tool','max_curve_difference_db'])
        for r in rows:
            f=r['filter'];writer.writerow([f['type'],f['frequency_hz'],f['q'],f['gain_db'],r['sample_rate_hz'],r['official']['status'],r['official']['Gain'],r['tool_coefficient_error'],r['official_input_q'],r['tool_input_q'],r.get('response_comparison',{}).get('max_abs_difference_db')])
    print(json.dumps(dict(summary=summary,groups=groups),indent=2))


if __name__=='__main__':main()
