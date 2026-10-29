"""Create a new, validated metadata backup. The probe implements only read requests."""
import datetime
import json
import subprocess
from pathlib import Path
from summarize_backup import decode

root = Path(__file__).resolve().parent.parent
subprocess.run(['make', 'build'], cwd=root, check=True)
stamp = datetime.datetime.now(datetime.timezone.utc).strftime('%Y%m%dT%H%M%S.%fZ')
folder = root / 'backups' / stamp
folder.mkdir(parents=True, exist_ok=False)
result = subprocess.run([str(root/'bin/echo_probe')], capture_output=True)
(folder/'raw.jsonl').write_bytes(result.stdout)
(folder/'diagnostic.txt').write_bytes(result.stderr)
if result.returncode:
    raise SystemExit('Read failed; diagnostics saved in '+str(folder))
parsed = decode(folder/'raw.jsonl')
parsed['captured_at_utc'] = stamp
(folder/'metadata.json').write_text(json.dumps(parsed, indent=2)+'\n')
print('Metadata backup (not a full DSP/firmware backup): '+str(folder))
