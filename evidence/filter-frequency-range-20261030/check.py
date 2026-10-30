"""Offline frequency boundary check; never opens USB or changes production limits.

Run from the repository root with tools on PYTHONPATH. Add the existing Android
analysis dependencies to PYTHONPATH and pass --official to emulate that library.
"""
import cmath
import hashlib
import json
from pathlib import Path
import sys

import preset


def coefficient_check(cf, scale):
    p, q = cf[3] / scale, cf[4] / scale
    radius = max(abs((p + cmath.sqrt(p*p + 4*q))/2),
                 abs((p - cmath.sqrt(p*p + 4*q))/2))
    return dict(signed_24bit=all(-(1 << 23) <= x < (1 << 23) for x in cf),
                stable=radius < 1, max_pole_radius=radius)


def run():
    oracle = None
    if '--official' in sys.argv:
        from android_eq_oracle import OfficialOracle
        oracle = OfficialOracle(preset.ROOT / 'evidence/android-arm64/libcxaudiodsplib_embca_jni.so')
    frequencies = (0, 1, 5, 10, 15, 19, 20, 20000, 20001, 21000, 22000,
                   22040, 22049, 22050, 23000, 23999, 24000, 30000, 48000, 65535)
    rows = []
    for kind in preset.TYPES:
        for gain in (-6, 3):
            for frequency in frequencies:
                filt = dict(type=kind, frequency_hz=frequency, q=1, gain_db=gain)
                for fs in preset.RATES.values():
                    cf = preset.biquad(filt, fs)
                    row = dict(filter=filt, sample_rate_hz=fs,
                               inside_nyquist=0 < frequency < fs/2,
                               coefficients_q22=cf, tool=coefficient_check(cf, preset.SCALE))
                    if oracle:
                        try:
                            native = oracle.convert(kind, frequency, 1, gain, fs)
                            if native['status'] == 0:
                                scale = 2**(25-native['Gain'])
                                native['check'] = coefficient_check(native['coefficients'], scale)
                                native['identity'] = native['coefficients'] == [scale, 0, 0, 0, 0]
                            row['official'] = native
                        except Exception as error:
                            row['official_error'] = f'{type(error).__name__}: {error}'
                    rows.append(row)
    original_number = preset.number
    compile_rows = []
    for relaxed in (False, True):
        # Only relax the frequency guard in this isolated process. All actual
        # coefficient generation, encoding, response and stability checks remain.
        preset.number = lambda value, lo=None, hi=None: original_number(
            value, None if relaxed and (lo, hi) == (20, 20000) else lo,
            None if relaxed and (lo, hi) == (20, 20000) else hi)
        for frequency in frequencies:
            doc = dict(version=1, device='MOONDROP ECHO-B', name='offline frequency check',
                       output_gain_db=-16,
                       filters=[dict(type='peak', frequency_hz=frequency, q=1, gain_db=-6)])
            row = dict(frequency_hz=frequency, relaxed_frequency_guard=relaxed)
            try:
                plan, payload = preset.compile_preset(doc)
                row.update(result='pass', frame_bytes=len(payload))
            except Exception as error:
                row.update(result='rejected', error=str(error))
            compile_rows.append(row)
    preset.number = original_number
    sources = ['tools/preset.py', 'tools/android_eq_oracle.py',
               'evidence/android-arm64/libcxaudiodsplib_embca_jni.so']
    result = dict(scope='Offline model and optional official ARM64 emulation; no USB operations',
                  official_emulated=bool(oracle),
                  limitations=['Not Android UI behavior or firmware acceptance',
                               'No analog measurement or persistence test',
                               'Official libm imports use host math',
                               'Parameter samples are not universal safe bounds'],
                  source_sha256={p: hashlib.sha256((preset.ROOT/p).read_bytes()).hexdigest() for p in sources},
                  compile_checks=compile_rows, coefficient_checks=rows)
    output = Path(__file__).with_name('results.json')
    output.write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n')
    print(f'{len(rows)} coefficient cases; {len(compile_rows)} compile cases; {output}', flush=True)


if __name__ == '__main__':
    run()
