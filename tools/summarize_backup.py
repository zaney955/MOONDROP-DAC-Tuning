"""Validate and decode an ECHO-B metadata capture; never writes to a device."""
import hashlib
import json
import struct
import sys
from pathlib import Path


def decode(path):
    raw = Path(path).read_bytes()
    rows = [json.loads(line) for line in raw.splitlines()]
    if [(r['command'], r['argument']) for r in rows] != [(90,90)] + [(221,n) for n in range(1,10)]:
        raise ValueError('Incomplete or unexpected capture sequence')
    bands = []
    for row in rows:
        b = bytes.fromhex(row['hex'])
        if len(b) != 62 or row['length'] != 62 or b[0] != 1 or b[4] != row['command'] or b[5] != 0x81 or b[7:10] != bytes.fromhex('232db3'):
            raise ValueError('Invalid response header')
        if row['command'] == 90:
            mode = struct.unpack_from('<i', b, 14)[0]
        else:
            n, f, q, t = struct.unpack_from('<4i', b, 14)
            if n != row['argument']:
                raise ValueError('Stale band response')
            bands.append(dict(band=n, frequency_hz=f, q=q/256, type_code=t,
                              gain_label_db=int.from_bytes(b[30:33], 'little', signed=True)))
    return dict(device='MOONDROP ECHO-B 35d8:149b', scope='metadata_only',
                factory_default_verified=False, full_restore_verified=False,
                raw_sha256=hashlib.sha256(raw).hexdigest(), mode=mode, bands=bands)


if __name__ == '__main__':
    print(json.dumps(decode(sys.argv[1]), indent=2))
