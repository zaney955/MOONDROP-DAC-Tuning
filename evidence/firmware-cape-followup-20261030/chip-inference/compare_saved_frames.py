"""Compare already saved ECHO-B replies with the static CAPE frame format."""
import json
import struct
import sys
from pathlib import Path

root = Path(sys.argv[1])
out = Path(sys.argv[2])
frames = []
for relative in ['backups/initial-read.jsonl', 'backups/coefficients-read.jsonl']:
    for line in (root / relative).read_text().splitlines():
        source = json.loads(line)
        data = bytes.fromhex(source['hex'])
        count, command, module = struct.unpack_from('<hHI', data, 2)
        row = dict(source=relative, report_length=len(data), report_id=data[0],
                   reserved=data[1], count=count, command=hex(command),
                   reply=bool(command & 0x8000), get=bool(command & 0x100),
                   module=hex(module), expected_command=source['command'])
        assert len(data) == 62 and data[:2] == b'\x01\x00'
        assert 0 <= count <= 13 and command & 0x8000 and command & 0x100
        assert module == 0xb32d2300 and command & 0xff == source['command']
        frames.append(row)
out.write_text(json.dumps({'scope': 'Saved captures only; no device access', 'frames': frames}, indent=2) + '\n')
print(f'{len(frames)} saved replies match the selected static CAPE framing.')
