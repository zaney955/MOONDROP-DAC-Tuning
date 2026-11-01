"""Offline ECHO-A plan compiler/readback verifier. Device I/O is echo_a_hid.c.

ECHO-B plans are deliberately rejected. WalkPlay coefficients are signed Q30
at 93750 Hz; no frequency compensation or ECHO-B Q22 tables are used.
"""
import argparse
import cmath
import json
import math
from pathlib import Path
import struct

RATE = 93750
SCALE = 1 << 30


def number(x, lo, hi):
    if type(x) not in (int, float) or not math.isfinite(x) or not lo <= x <= hi:
        raise ValueError(f'Expected finite number in [{lo}, {hi}]: {x!r}')
    return x


def coefficients(f):
    a = 10 ** (f['gain_db'] / 40)
    w = 2 * math.pi * f['frequency_hz'] / RATE
    c, s = math.cos(w), math.sin(w)
    if f['type'] == 'peak':
        alpha = s / (2 * f['q'])
        b0, b1, b2 = 1 + alpha*a, -2*c, 1 - alpha*a
        a0, a1, a2 = 1 + alpha/a, -2*c, 1 - alpha/a
    else:  # RBJ low shelf, S=1, same slope form as Contour.
        t = math.sqrt(2*a) * s
        b0, b1, b2 = a*((a+1)-(a-1)*c+t), 2*a*((a-1)-(a+1)*c), a*((a+1)-(a-1)*c-t)
        a0, a1, a2 = (a+1)+(a-1)*c+t, -2*((a-1)+(a+1)*c), (a+1)+(a-1)*c-t
    vals = [math.floor(x/a0*SCALE + .5) for x in (b0,b1,b2)]
    vals += [-math.floor(x/a0*SCALE + .5) for x in (a1,a2)]
    if any(not -(1<<31) <= x < (1<<31) for x in vals):
        raise ValueError('Signed Q30 overflow')
    a1, a2 = -vals[3]/SCALE, -vals[4]/SCALE
    root = cmath.sqrt(a1*a1-4*a2)
    if any(abs(p)>=1 for p in ((-a1+root)/2,(-a1-root)/2)):
        raise ValueError('Unstable quantized filter')
    return vals


def snapshot(path):
    rows = [json.loads(l) for l in Path(path).read_text().splitlines() if l.strip()]
    if len(rows) != 11:
        raise ValueError('Need a complete 11-response read, not an apply transcript')
    expected = [(12,-1),(9,-1)] + [(9,i) for i in range(8)] + [(3,-1)]
    result = []
    for x,(cmd,i) in zip(rows,expected):
        d = bytes.fromhex(x['hex'])
        if (x['command'],x['band']) != (cmd,i) or len(d)!=63 or d[:2]!=bytes([128,cmd]):
            raise ValueError('Malformed read response')
        if cmd==9 and (d[2:4]!=b'\0\0' or (i>=0 and d[4]!=i)):
            raise ValueError('Malformed band response')
        result.append(d)
    if result[0][2:6] != b'\x000.1' or result[-1][2:4] != b'\x02\0':
        raise ValueError('Unsupported firmware or gain response')
    slot=result[1][35]
    if any(d[35]!=slot for d in result[2:10]) or result[1]!=result[2]:
        raise ValueError('Inconsistent slot or bulk response')
    return result


def compile_preset(doc, slot):
    doc=dict(doc)
    if 'output_gain_db' in doc:
        if 'preamp_db' in doc:raise ValueError('Ambiguous output gain fields')
        doc['preamp_db']=doc.pop('output_gain_db')
    if set(doc)-{'version','device','name','description','preamp_db','filters'} or doc.get('version')!=1 or doc.get('device')!='MOONDROP ECHO-A':
        raise ValueError('Expected ECHO-A version 1 preset')
    if not isinstance(doc.get('name'),str) or not doc['name'].strip():raise ValueError('name is required')
    if 'description' in doc and not isinstance(doc['description'],str):raise ValueError('description must be text')
    gain=number(doc.get('preamp_db', 0),-30,0)
    if gain!=int(gain):raise ValueError('ECHO-A preamp requires whole dB')
    fs=doc['filters']
    if not isinstance(fs,list) or len(fs)>8:raise ValueError('At most 8 bands')
    fs=fs+[dict(type='peak',frequency_hz=1000,gain_db=0,q=.75) for _ in range(8-len(fs))]
    frames=[]
    for i,f in enumerate(fs):
        if set(f)!={'type','frequency_hz','gain_db','q'} or f['type'] not in ('peak','low_shelf'):
            raise ValueError('Only peak and S=1 low shelf supported')
        freq=number(f['frequency_hz'],20,20000);q=number(f['q'],.1,10);g=number(f['gain_db'],-10,10)
        if freq!=int(freq) or (f['type']=='low_shelf' and q!=1):raise ValueError('Integer Hz; shelf S=1')
        # Quantize metadata first, then design coefficients consistently.
        qr=math.floor(q*256+.5);gr=math.floor(g*256+.5)
        normalized=dict(f,q=qr/256,gain_db=gr/256)
        p=bytes([1,9,0x18,0,i,0,0])+struct.pack('<5i',*coefficients(normalized))
        p+=struct.pack('<HHhBBBB',int(freq),qr,gr,2 if f['type']=='peak' else 1,0,slot,0)
        frames.append(p.ljust(63,b'\0'))
    frames.append(bytes([1,3,2,0,int(gain)&255]).ljust(63,b'\0'))
    return frames


def verify(frames, actual):
    mismatches=[f'band {i}' for i in range(8) if frames[i][4:36]!=actual[i+2][4:36]]
    if frames[8][4]!=actual[10][4]:mismatches.append('preamp')
    if mismatches:raise ValueError('Readback mismatch: '+', '.join(mismatches))
    return {'verified':True,'bands':8,'coefficient_bytes':160,'preamp_db':struct.unpack('b',actual[-1][4:5])[0],
            'slot':actual[1][35],'physical_unplug_tested':False,'analog_output_measured':False}


def main():
    p=argparse.ArgumentParser(description=__doc__)
    sub=p.add_subparsers(dest='cmd',required=True)
    build=sub.add_parser('build');build.add_argument('preset');build.add_argument('before');build.add_argument('output')
    check=sub.add_parser('verify');check.add_argument('plan');check.add_argument('readback')
    restore=sub.add_parser('restore-plan');restore.add_argument('original');restore.add_argument('current');restore.add_argument('output')
    args=p.parse_args()
    if args.cmd=='build':
        before=snapshot(args.before);doc=json.loads(Path(args.preset).read_text())
        frames=compile_preset(doc,before[1][35])
        Path(args.output).write_bytes(b'EQA1'+b''.join(before+frames))
    elif args.cmd=='restore-plan':
        old=snapshot(args.original);now=snapshot(args.current);frames=[]
        if old[1][35]!=now[1][35]:raise ValueError('Slot changed')
        for d in old[2:10]:frames.append(bytes([1,9,0x18])+d[3:])
        frames.append(bytes([1,3,2,0,old[-1][4]]).ljust(63,b'\0'))
        Path(args.output).write_bytes(b'EQA1'+b''.join(now+frames))
    else:
        plan=Path(args.plan).read_bytes()
        if len(plan)!=1264 or plan[:4]!=b'EQA1':raise ValueError('Invalid plan')
        frames=[plan[697+i*63:697+(i+1)*63] for i in range(9)]
        print(json.dumps(verify(frames,snapshot(args.readback)),indent=2))


if __name__=='__main__':main()
