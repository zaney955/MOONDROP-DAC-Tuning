#!/usr/bin/env python3
"""Read DEX class locations and encoded static constants, without executing code."""
import argparse
import json
import re
import struct
import zipfile
from pathlib import Path


class Dex:
    def __init__(self, data):
        self.data = data
        if not data.startswith(b'dex\n'):
            raise ValueError('Not a standard DEX file')
        self.strings = []
        count, offset = self.words(56, 2)
        for i in range(count):
            pos = self.words(offset + i * 4, 1)[0]
            _, pos = self.uleb(pos)
            end = data.index(0, pos)
            self.strings.append(data[pos:end].decode('utf-8', errors='replace'))
        count, offset = self.words(64, 2)
        self.types = [self.strings[self.words(offset + i * 4, 1)[0]] for i in range(count)]
        count, offset = self.words(72, 2)
        self.prototypes = []
        for i in range(count):
            shorty, return_type, params = self.words(offset + i * 12, 3)
            parameter_types = []
            if params:
                n = self.words(params, 1)[0]
                parameter_types = [self.types[j] for j in struct.unpack_from('<' + 'H' * n, data, params + 4)]
            self.prototypes.append({'return_type': self.types[return_type], 'parameter_types': parameter_types})
        count, offset = self.words(80, 2)
        self.fields = []
        for i in range(count):
            owner, typ, name = struct.unpack_from('<HHI', data, offset + i * 8)
            self.fields.append({'owner': self.types[owner], 'type': self.types[typ], 'name': self.strings[name]})
        count, offset = self.words(88, 2)
        self.methods = []
        for i in range(count):
            owner, proto, name = struct.unpack_from('<HHI', data, offset + i * 8)
            self.methods.append({'owner': self.types[owner], 'prototype_index': proto, 'name': self.strings[name], **self.prototypes[proto]})

    def words(self, offset, count):
        return struct.unpack_from('<' + 'I' * count, self.data, offset)

    def uleb(self, pos):
        value = shift = 0
        while True:
            byte = self.data[pos]
            pos += 1
            value |= (byte & 127) << shift
            if byte < 128:
                return value, pos
            shift += 7
            if shift > 35:
                raise ValueError('Invalid ULEB128')

    def value(self, pos):
        header = self.data[pos]
        pos += 1
        kind, arg = header & 31, header >> 5
        if kind == 0x1e:
            return None, pos
        if kind == 0x1f:
            return bool(arg), pos
        if kind == 0x1c:
            return self.array(pos)
        if kind == 0x1d:
            typ, pos = self.uleb(pos)
            count, pos = self.uleb(pos)
            members = {}
            for _ in range(count):
                name, pos = self.uleb(pos)
                members[self.strings[name]], pos = self.value(pos)
            return {'annotation_type': self.types[typ], 'members': members}, pos
        size = arg + 1
        raw = self.data[pos:pos + size]
        pos += size
        unsigned = int.from_bytes(raw, 'little')
        if kind in (0, 2, 4, 6):
            return int.from_bytes(raw, 'little', signed=True), pos
        if kind == 3:
            return unsigned, pos
        if kind in (0x10, 0x11):
            width, fmt = (4, '<f') if kind == 0x10 else (8, '<d')
            return struct.unpack(fmt, b'\0' * (width - size) + raw)[0], pos
        if kind == 0x17:
            return {'string': self.strings[unsigned]}, pos
        if kind == 0x18:
            return {'type': self.types[unsigned]}, pos
        if kind in (0x19, 0x1b):
            return {'field': self.fields[unsigned]}, pos
        if kind == 0x1a:
            return {'method': self.methods[unsigned]}, pos
        return {'encoded_type': kind, 'index': unsigned}, pos

    def array(self, pos):
        size, pos = self.uleb(pos)
        result = []
        for _ in range(size):
            value, pos = self.value(pos)
            result.append(value)
        return result, pos

    def classes(self, pattern):
        count, offset = self.words(96, 2)
        result = []
        for i in range(count):
            class_idx, access, superclass, interfaces, source, annotations, class_data, static_values = self.words(offset + i * 32, 8)
            name = self.types[class_idx]
            if not pattern.search(name):
                continue
            entry = {'class': name, 'class_def_offset': offset + i * 32,
                     'class_data_offset': class_data, 'static_values_offset': static_values,
                     'source_file': self.strings[source] if source != 0xffffffff else None,
                     'static_fields': [], 'instance_fields': [], 'methods': []}
            values, _ = self.array(static_values) if static_values else ([], 0)
            if class_data:
                sizes = []
                pos = class_data
                for _ in range(4):
                    size, pos = self.uleb(pos)
                    sizes.append(size)
                for category, size in zip(('static_fields', 'instance_fields'), sizes[:2]):
                    idx = 0
                    for n in range(size):
                        diff, pos = self.uleb(pos)
                        flags, pos = self.uleb(pos)
                        idx += diff
                        field = dict(self.fields[idx], field_index=idx, access_flags=flags)
                        if category == 'static_fields':
                            field['value'] = values[n] if n < len(values) else None
                            field['encoded_value_present'] = n < len(values)
                            if isinstance(field['value'], int) and not isinstance(field['value'], bool):
                                field['hex'] = hex(field['value'])
                        entry[category].append(field)
                for category, size in zip(('direct', 'virtual'), sizes[2:]):
                    idx = 0
                    for _ in range(size):
                        diff, pos = self.uleb(pos)
                        flags, pos = self.uleb(pos)
                        code, pos = self.uleb(pos)
                        idx += diff
                        entry['methods'].append(dict(self.methods[idx], method_index=idx,
                                                     access_flags=flags, category=category, code_offset=code))
            result.append(entry)
        return result


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('apk', type=Path)
    parser.add_argument('--output', type=Path)
    parser.add_argument('--pattern', default=r'(?i)(conexant|CafCmdHelper|EQCoeffsList|EqParams)')
    args = parser.parse_args()
    result = {'source': str(args.apk), 'note': 'Static encoded DEX values only. Fields without encoded values may be initialized in <clinit>; no code executed.', 'dex_files': []}
    pattern = re.compile(args.pattern)
    with zipfile.ZipFile(args.apk) as archive:
        for name in archive.namelist():
            if re.fullmatch(r'classes\d*\.dex', name):
                dex = Dex(archive.read(name))
                result['dex_files'].append({'name': name, 'classes': dex.classes(pattern)})
    encoded = json.dumps(result, ensure_ascii=False, indent=2) + '\n'
    if args.output:
        args.output.write_text(encoded)
    else:
        print(encoded, end='')


if __name__ == '__main__':
    main()
