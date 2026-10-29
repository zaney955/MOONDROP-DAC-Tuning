"""Generate a strongly muffled, attenuation-only test and original-flat restore plan."""
import cmath
import json
import math
import struct
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
OUT = ROOT / 'profiles' / 'muffled-persistence-test'
OUT.mkdir(parents=True, exist_ok=True)
SCALE = 1 << 22
RATES = {4:44100, 5:48000, 6:96000, 7:192000, 8:384000}

def shelf(f, fs):
    # RBJ high shelf, -12 dB, slope=1; packed [b0,b1,b2,-a1,-a2], Q22.
    a=10**(-12/40); w=2*math.pi*f/fs; c=math.cos(w)
    t=2*math.sqrt(a)*math.sin(w)/2*math.sqrt(2)
    b0=a*((a+1)+(a-1)*c+t); b1=-2*a*((a-1)+(a+1)*c); b2=a*((a+1)+(a-1)*c-t)
    a0=(a+1)-(a-1)*c+t; a1=2*((a-1)-(a+1)*c); a2=(a+1)-(a-1)*c-t
    cf=[round(x/a0*SCALE) for x in [b0,b1,b2,-a1,-a2]]
    assert all(-(1<<23)<=x<(1<<23) for x in cf)
    p,q=cf[3]/SCALE,cf[4]/SCALE
    assert max(abs((p+cmath.sqrt(p*p+4*q))/2),abs((p-cmath.sqrt(p*p+4*q))/2))<1
    return cf

def frame(cmd, values):
    return bytes([1,0,13,0,cmd,0,0,0x23,0x2d,0xb3])+struct.pack('<13I',*[x&0xffffffff for x in values+[0]*(13-len(values))])

original=json.loads((ROOT/'backups/ECHO-B-original-current-state.json').read_text())
assert original['mode']==0
for row in original['coefficients']:
    assert list(row['coefficients'].values())==[SCALE,0,0,0,0] and row['gain_field']==3

for name in ['test','restore-original-flat']:
    bands=[]
    for n in range(1,10):
        old=original['metadata'][n-1]
        active=name=='test' and n<=3
        bands.append(dict(band=n,frequency_hz=[500,1200,3000][n-1] if active else old['frequency_hz'],
                          q=1,type_code=2 if active else old['type_code'],gain_db=-12 if active else 0))
    coeffs={str(fs):[shelf(b['frequency_hz'],fs) if b['gain_db'] else [SCALE,0,0,0,0] for b in bands] for fs in RATES.values()}
    plan=[frame(0x5a,[0x5a,0])]
    plan += [frame(0xdc,[0,b['band'],b['frequency_hz'],256,b['type_code'],b['gain_db']&0xffffff]) for b in bands]
    plan += [frame(0xdc,[idx,n,3]+coeffs[str(fs)][n-1]) for n in range(1,10) for idx,fs in RATES.items()]
    plan += [frame(0xdc,[255])]
    assert len(plan)==56
    response={}
    for fs in RATES.values():
        vals=[]
        for i in range(601):
            f=20*(20000/20)**(i/600); z=cmath.exp(-2j*math.pi*f/fs); h=1
            for cf in coeffs[str(fs)]:
                b0,b1,b2,p,q=[x/SCALE for x in cf];h*=(b0+b1*z+b2*z*z)/(1-p*z-q*z*z)
            vals.append(20*math.log10(abs(h)))
        assert max(vals)<0.1
        response[str(fs)]={'max_gain_db':max(vals),'min_gain_db':min(vals)}
    doc=dict(name=name,bands=bands,coefficients_q22=coeffs,response_check=response,
             note='Restore plan reproduces the backed-up flat running EQ at five rates; it is not an original flash-image restore.')
    (OUT/(name+'.json')).write_text(json.dumps(doc,indent=2)+'\n')
    (OUT/(name+'.bin')).write_bytes(b''.join(plan))
print(OUT)
