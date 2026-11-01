"""Offline v1/v2 EQ and unfoamed-image-reference comparison; no device I/O."""
from pathlib import Path
import bisect
import cmath
import csv
import hashlib
import json
import math
import struct
import sys

HERE = Path(__file__).resolve().parent
ROOT = next(p for p in HERE.parents if (p/'tools/echo_a.py').is_file())
sys.path.insert(0,str(ROOT/'tools'))
import devices
import echo_a
import editor

PRESETS = {
    'v1':'presets/echo-a/nicehck/yuandao-10th/custom/yuandao-10th-riff-impact-v1.json',
    'v2':'presets/echo-a/nicehck/yuandao-10th/custom/yuandao-10th-riff-impact-foam-v2.json',
}
SOURCE = 'headphones/nicehck/yuandao-10th/measurements/digitized/official-unfoamed-5128-image-estimate.csv'

def response(rows,f):
    z=cmath.exp(-2j*math.pi*f/echo_a.RATE)
    h=1
    for row in rows:
        b0,b1,b2,p,q=[v/echo_a.SCALE for v in row]
        h *= (b0+b1*z+b2*z*z)/(1-p*z-q*z*z)
    return 20*math.log10(abs(h))

def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    raw=list(csv.DictReader((ROOT/SOURCE).open()))
    fs=[float(r['frequency_hz']) for r in raw]
    source=[float(r['relative_to_1khz_estimate_db']) for r in raw]
    def measured(f):
        assert fs[0]<=f<=fs[-1]
        i=max(1,bisect.bisect_left(fs,f))
        t=math.log(f/fs[i-1])/math.log(fs[i]/fs[i-1])
        return source[i-1]*(1-t)+source[i]*t
    source_zero=measured(1000)
    dense=[20*1000**(i/12000) for i in range(12001)]
    models={}; results={}
    for key,path in PRESETS.items():
        doc=json.loads((ROOT/path).read_text())
        plan,binary=devices.for_document(doc).compile(doc)
        preview=editor.preview(doc)
        rows=plan['coefficients_q30'][str(echo_a.RATE)]
        assert binary[:4]==b'EQA0' and 'output_gain_db' not in doc
        poles=[]
        for row in rows:
            assert all(-(1<<31)<=v<(1<<31) for v in row)
            a1,a2=-row[3]/echo_a.SCALE,-row[4]/echo_a.SCALE
            d=cmath.sqrt(a1*a1-4*a2)
            poles.append(max(abs((-a1+d)/2),abs((-a1-d)/2)))
        assert max(poles)<1
        error=max(abs(response(rows,f)-v) for f,v in zip(preview['frequencies'],preview['curves'][str(echo_a.RATE)]['total']))
        assert error<1e-8
        values=[response(rows,f) for f in dense]
        hi=max(range(len(dense)),key=lambda i:values[i]);lo=min(range(len(dense)),key=lambda i:values[i])
        normalized=[]
        for f,frame in zip(doc['filters'],plan['target_frames']):
            b=bytes.fromhex(frame)
            normalized.append(dict(f,q=struct.unpack('<H',b[29:31])[0]/256,gain_db=struct.unpack('<h',b[31:33])[0]/256))
        results[key]={'preset':path,'sha256':digest(ROOT/path),'quantized_filters':normalized,
            'coefficients_q30':rows,'maximum_pole_radius':max(poles),'preview_max_error_db':error,
            'eq_minimum':{'db':values[lo],'frequency_hz':dense[lo]},
            'eq_maximum':{'db':values[hi],'frequency_hz':dense[hi]},
            'eq_at_1khz_db':response(rows,1000),'q30_range_and_stability':'passed','editor_preview':'passed'}
        models[key]=rows
    with (HERE/'comparison.csv').open('w',newline='') as stream:
        out=csv.writer(stream)
        out.writerow(['frequency_hz','official_unfoamed_image_estimate_rel1k_db','v1_eq_db','v2_eq_db','v2_minus_v1_eq_db','unfoamed_plus_v1_model_rel1k_db','unfoamed_plus_v2_model_rel1k_db'])
        for f,m in zip(fs,source):
            a,b=[response(models[k],f) for k in ['v1','v2']]
            out.writerow([f,round(m-source_zero,4),round(a,4),round(b,4),round(b-a,4),
                round(m-source_zero+a-results['v1']['eq_at_1khz_db'],4),
                round(m-source_zero+b-results['v2']['eq_at_1khz_db'],4)])
    points=[]
    for f in [40,60,90,150,250,500,850,1000,1600,2000,3000,4000,5500,8000,10000]:
        a,b=[response(models[k],f) for k in ['v1','v2']]
        points.append({'frequency_hz':f,'source_rel1k_db':measured(f)-source_zero,'v1_eq_db':a,'v2_eq_db':b,'v2_minus_v1_db':b-a})
    contrast={k:(measured(1600)-measured(3000))+(response(rows,1600)-response(rows,3000)) for k,rows in models.items()}
    record={'source_csv':SOURCE,'source_sha256':digest(ROOT/SOURCE),'source_points':len(raw),
        'intended_use':'3.5 mm Yuandao 10th + full foam + ECHO-A; preference-based audition revision',
        'method':'Actual 93750 Hz Q30 EQ. 12001-point scan, 20-20000 Hz. CSV reference is image-digitized UNFOAMED response; no foam correction assumed. Source+EQ columns are unfoamed reference models, independently normalized at 1 kHz, NOT predicted full-foam or personal response.',
        'not_an_optimization_objective':'No acoustic target, no claimed error minimum or proven improvement; finite changes selected for user preferences with uncertain foam response.',
        'models':results,'frequency_checks':points,'unfoamed_model_1600_minus_3000_db':contrast,
        'v2_suggested_manual_output_db':-3,'v2_modeled_peak_with_suggestion_db':results['v2']['eq_maximum']['db']-3,
        'comparison_gain_note':'Preset files omit output_gain_db and compile at 0 dB. Match loudness for A/B; 1 kHz normalization is for plots, not a loudness-matching claim.',
        'device_io_performed':False,'subjective_improvement_verified':False,
        'implementation_sha256':{f:digest(ROOT/f) for f in ['tools/echo_a.py','tools/devices.py','tools/editor.py']},
        'analyzer_sha256':digest(Path(__file__))}
    (HERE/'validation.json').write_text(json.dumps(record,ensure_ascii=False,indent=2)+'\n')
    print(json.dumps({'v2_minimum':results['v2']['eq_minimum'],'v2_maximum':results['v2']['eq_maximum'],'source_model_1600_minus_3000':contrast,'peak_at_minus3':record['v2_modeled_peak_with_suggestion_db'],'checks':'passed'},ensure_ascii=False,indent=2))

if __name__=='__main__':main()
