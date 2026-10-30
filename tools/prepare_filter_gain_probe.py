"""Prepare offline Q22 vectors for a muted, volatile ECHO-B acceptance probe.

Does not change the production compiler's +/-12 dB policy or touch USB.
"""
import argparse
import cmath
import json
import math
from pathlib import Path
import struct

from preset import SCALE, biquad, save_json

MATRIX = [('peak', 1000, 0.1), ('peak', 1000, 1), ('peak', 1000, 10),
          ('peak', 10000, 1), ('low_shelf', 1000, 1), ('high_shelf', 1000, 1),
          ('low_shelf', 10000, 1), ('high_shelf', 10000, 1)]
GAINS = [-120, -96, -60, -24, -13, -12, -0.5, 0, 0.5, 12, 13, 18, 24, 36, 48, 60, 72, 87, 96, 120]


def describe(kind, frequency, q, gain, fs):
    filt = dict(type=kind, frequency_hz=frequency, q=q, gain_db=gain)
    cf = biquad(filt, fs)
    reason = None
    if any(not -(1 << 23) <= v < (1 << 23) for v in cf):
        reason = 'coefficient_overflow'
    else:
        p, t = cf[3], cf[4]
        if not (-SCALE < t < SCALE and SCALE-p-t > 0 and SCALE+p-t > 0):
            reason = 'quantized_unstable'
    reference = frequency if kind == 'peak' else 0 if kind == 'low_shelf' else fs/2
    z = cmath.exp(-2j*math.pi*reference/fs)
    numerator = sum(cf[i]/SCALE*z**i for i in range(3))
    denominator = 1-cf[3]/SCALE*z-cf[4]/SCALE*z*z
    magnitude = abs(numerator/denominator) if denominator else None
    modeled = 20*math.log10(magnitude) if magnitude else None
    return dict(filter=filt, coefficient_design_rate_hz=fs, coefficients_q22=cf,
                offline_valid=reason is None, offline_rejection_reason=reason,
                reference_frequency_hz=reference, quantized_model_gain_db=modeled,
                model_error_db=modeled-gain if modeled is not None else None,
                model_gain_is_minus_infinity=magnitude == 0)


def prepare(directory, fs):
    matrix, cases, rejected = [], [], []
    for kind, frequency, q in MATRIX:
        scan = {gain: describe(kind, frequency, q, gain, fs) for gain in range(-120, 121)}
        boundaries = []
        selected = set(GAINS)
        for direction in (-1, 1):
            last = 0
            failure = None
            for magnitude in range(1, 121):
                gain = direction*magnitude
                if not scan[gain]['offline_valid']:
                    failure = gain
                    break
                last = gain
            boundaries.append(dict(direction=direction, last_contiguous_valid_integer_db=last,
                                   first_invalid_integer_db=failure,
                                   reason=scan[failure]['offline_rejection_reason'] if failure is not None else None,
                                   scan_limit_reached=failure is None))
            selected.add(last)
            if failure is not None:
                selected.add(failure)
        matrix.append(dict(type=kind, frequency_hz=frequency, q=q, integer_scan_boundaries=boundaries))
        for gain in sorted(selected):
            row = scan[gain] if gain in scan else describe(kind, frequency, q, gain, fs)
            if row['offline_valid']:
                row['case_index'] = len(cases)
                cases.append(row)
            else:
                rejected.append(row)
    if not 1 <= len(cases) <= 256:
        raise ValueError('Probe case count out of bounds')
    document = dict(scope='Coefficient acceptance only; analog output not measured; no metadata writes',
                    coefficient_design_rate_hz=fs, requested_gain_scan_db=[-120, 120],
                    matrix=matrix, cases=cases, offline_rejections_not_sent=rejected)
    payload = struct.pack('<I', len(cases))+b''.join(struct.pack('<5i', *row['coefficients_q22']) for row in cases)
    # Refuse to replace investigation inputs.
    with (directory/'filter-cases.bin').open('xb') as out:
        out.write(payload)
    with (directory/'filter-cases.json').open('x') as out:
        out.write(json.dumps(document, ensure_ascii=False, indent=2, allow_nan=False)+'\n')
    return document


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('directory', type=Path)
    parser.add_argument('--sample-rate', type=int, default=48000, choices=[44100, 48000, 96000, 192000, 384000])
    args = parser.parse_args()
    doc = prepare(args.directory, args.sample_rate)
    print(f'{len(doc["cases"])} valid coefficient vectors; {len(doc["offline_rejections_not_sent"])} offline rejections not sent')


if __name__ == '__main__':
    main()
