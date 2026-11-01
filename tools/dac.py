"""MOONDROP multi-device tuning CLI. List/build offline; read/verify never write."""
import argparse
import json
from pathlib import Path
import subprocess

import devices
import preset


def main():
    p=argparse.ArgumentParser(description=__doc__)
    sub=p.add_subparsers(dest='action',required=True)
    sub.add_parser('devices')
    listing=sub.add_parser('list');listing.add_argument('--device',choices=[b.id for b in devices.BACKENDS])
    for action in ('build','apply'):
        cmd=sub.add_parser(action);cmd.add_argument('preset',help='JSON path, or name relative to presets/')
    read=sub.add_parser('read');read.add_argument('--device',required=True,choices=[b.id for b in devices.BACKENDS])
    verify=sub.add_parser('verify');verify.add_argument('run',type=Path)
    args=p.parse_args()
    if args.action=='devices':
        print(json.dumps(devices.connected(),ensure_ascii=False,indent=2));return
    if args.action=='list':
        for path in sorted((preset.ROOT/'presets').rglob('*.json')):
            doc=devices.normalize_document(json.loads(path.read_text()))
            b=devices.for_document(doc)
            if args.device and b.id!=args.device:continue
            print(f'{path.relative_to(preset.ROOT/"presets").with_suffix("")} · {b.name} · {doc["name"]}')
        return
    if args.action in ('build','apply'):
        doc=devices.normalize_document(json.loads(preset.resolve_preset(args.preset).read_text()))
        b=devices.for_document(doc);plan,binary=b.compile(doc)
        directory=preset.ROOT/('profiles/compiled' if args.action=='build' else 'runs')/(preset.timestamp()+'-'+b.id+'-'+args.action)
        directory.mkdir(parents=True,exist_ok=False)
        b.prepare(directory,doc,plan,binary)
        if args.action=='build':print(directory);return
    else:
        b=devices.for_run(args.run) if args.action=='verify' else devices.get(args.device)
        if args.action=='read':
            directory=preset.ROOT/'runs'/(preset.timestamp()+'-'+b.id+'-read')
            directory.mkdir(parents=True,exist_ok=False)
    subprocess.run(['make',*b.build_targets(args.action)],cwd=preset.ROOT,check=True)
    with preset.device_lock():
        if args.action=='apply':b.apply(directory,plan)
        elif args.action=='read':b.read(directory)
        else:directory=b.verify_run(args.run.resolve())
    print(directory)


if __name__=='__main__':main()
