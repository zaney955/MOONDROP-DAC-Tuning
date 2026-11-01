"""Device registry shared by the web editor and tools/dac.py.

Documents express the model explicitly. Each adapter owns its compiler, USB
transport, readback and persistence evidence; none falls back to another model.
"""
import cmath
import hashlib
import json
import math
import plistlib
import struct
import subprocess

import echo_a
import echo_b
import preset

DEFAULT = 'MOONDROP ECHO-B'


def normalize_document(doc):
    doc = dict(doc)
    if doc.get('device') == 'MOONDROP ECHO-A' and 'preamp_db' in doc:
        if 'output_gain_db' in doc:
            raise ValueError('不能同时提供 preamp_db 与 output_gain_db')
        doc['output_gain_db'] = doc.pop('preamp_db')
    return doc


class EchoB:
    id, name, vid, pid = 'echo-b', DEFAULT, 0x35d8, 0x149b

    def capability(self):
        return dict(id=self.id, name=self.name, vid=self.vid, pid=self.pid, bands=8,
                    types=['peak', 'low_shelf', 'high_shelf'], rates=list(preset.RATES.values()),
                    output_min=preset.OUTPUT_GAIN_MIN_DB, output_max=preset.OUTPUT_GAIN_MAX_DB,
                    output_step='any', gain_min=None, gain_max=None, gain_step=.1,
                    output_label='整体输出数字增益', output_help='末级数字增益，仅调节音量，不影响 EQ 曲线。',
                    detail='9 段 DSP · 8 段可调 EQ', rate_label='预览采样率')

    def compile(self, doc):
        return preset.compile_preset(normalize_document(doc))

    def build_targets(self, action):
        return ['bin/echo_probe'] if action == 'read' else ['build']

    def prepare(self, directory, doc, plan, binary):
        preset.save_json(directory/'preset.json', normalize_document(doc))
        preset.save_json(directory/'plan.json', plan)
        (directory/'plan.bin').write_bytes(binary)
        preset.save_json(directory/'manifest.json', dict(
            plan_sha256=hashlib.sha256(binary).hexdigest(), source='dac-workflow', device=self.name))

    def read(self, directory):
        return echo_b.read_device(directory)

    def apply(self, directory, plan):
        return preset.apply_plan(directory, plan)

    def verify_run(self, directory):
        return preset.verify_run(directory)


class EchoA(EchoB):
    id, name, vid, pid = 'echo-a', 'MOONDROP ECHO-A', 0x3302, 0x12c5

    def capability(self):
        return dict(id=self.id, name=self.name, vid=self.vid, pid=self.pid, bands=8,
                    types=['peak', 'low_shelf'], rates=[echo_a.RATE],
                    output_min=-30, output_max=0, output_step=1,
                    gain_min=-10, gain_max=10, gain_step='any',
                    output_label='数字前级增益', output_help='整数 dB，范围 −30 至 0；为 EQ 留出数字余量。',
                    detail='8 段 EQ · 峰值 / 低架 · 单段 ±10 dB', rate_label='固定 DSP 设计率')

    def native_document(self, doc):
        doc = normalize_document(doc)
        native = dict(doc)
        native['preamp_db'] = native.pop('output_gain_db', 0)
        return native

    def compile(self, doc, slot=0):
        doc = normalize_document(doc)
        frames = echo_a.compile_preset(self.native_document(doc), slot)
        rows = [list(struct.unpack('<5i', f[7:27])) for f in frames[:8]]
        gains = []
        for i in range(601):
            z = cmath.exp(-2j*math.pi*(20*1000**(i/600))/echo_a.RATE)
            h = 1
            for row in rows:
                b0,b1,b2,p,q = [v/echo_a.SCALE for v in row]
                h *= (b0+b1*z+b2*z*z)/(1-p*z-q*z*z)
            gains.append(20*math.log10(abs(h)) + doc.get('output_gain_db', 0))
        bands=[dict(q=struct.unpack('<H',f[29:31])[0]/256) for f in frames[:8]]
        plan = dict(device_backend=self.id, preset=doc, bands=bands, slot=slot,
                    coefficients_q30={str(echo_a.RATE):rows}, coefficient_scale=echo_a.SCALE,
                    target_frames=[f.hex() for f in frames],
                    response_check={str(echo_a.RATE):dict(min_gain_db=min(gains), max_gain_db=max(gains))})
        # Offline target has no preflight snapshot; it cannot be applied by C.
        return plan, b'EQA0'+b''.join(frames)

    def build_targets(self, action):
        return ['bin/echo_a_hid']

    def capture(self, directory, prefix, status):
        path=directory/(prefix+'.jsonl')
        with path.open('xb') as out, (directory/(prefix+'.stderr')).open('xb') as err:
            result=subprocess.run([str(preset.ROOT/'bin/echo_a_hid'),'read'], stdout=out, stderr=err, timeout=20)
        if result.returncode:
            raise ValueError(f'ECHO-A 只读查询失败 (exit {result.returncode})：'+
                             (directory/(prefix+'.stderr')).read_text(errors='replace')[-2000:])
        return echo_a.snapshot(path)

    def document(self, state):
        filters=[]
        for i,d in enumerate(state[2:10]):
            freq,q,g=struct.unpack('<HHh',d[27:33])
            vals=list(struct.unpack('<5i',d[7:27]))
            # Original factory neutral sections use vendor-designed denominators;
            # both numerator and denominator must cancel before skipping them.
            if d[33]==2 and g==0 and vals==[echo_a.SCALE,-vals[3],-vals[4],vals[3],vals[4]]:
                filters.append(None)
                continue
            kind={1:'low_shelf',2:'peak'}.get(d[33])
            if kind is None or (kind=='low_shelf' and q!=256):
                raise ValueError(f'ECHO-A 第 {i+1} 段类型或斜率暂不支持编辑；原始数据已保存')
            f=dict(type=kind,frequency_hz=freq,q=q/256,gain_db=g/256)
            if echo_a.coefficients(f)!=vals:
                raise ValueError(f'ECHO-A 第 {i+1} 段参数不能精确复现系数；原始数据已保存，不作近似替代')
            filters.append(f)
        while filters and filters[-1] is None:
            filters.pop()
        filters=[f or dict(type='peak',frequency_hz=1000,q=.75,gain_db=0) for f in filters]
        doc=dict(version=1,device=self.name,name='当前设备调音',
                 description='ECHO-A 只读载入；Q30 系数与寄存器已核对，DSP 固定设计率 93750 Hz。',
                 output_gain_db=struct.unpack('b',state[-1][4:5])[0],filters=filters)
        self.compile(doc,state[1][35])
        return doc

    def read(self, directory):
        status=preset.RunStatus(directory,'read')
        try:
            status.update('read','正在只读读取 ECHO-A 的参数、系数与前级',device=self.name)
            first=self.capture(directory,'current',status)
            status.update('confirm_read','正在再次读取，确认配置未改变')
            second=self.capture(directory,'confirmed',status)
            if first!=second:raise ValueError('读取期间设备配置发生变化')
            doc=self.document(first)
            preset.save_json(directory/'preset.json',doc)
            status.update('complete','已读取 ECHO-A；未写入设备',status='read_complete',matching_sample_rates=[echo_a.RATE])
            return doc,[echo_a.RATE]
        except Exception as error:
            status.update('failed','读取失败，当前草稿已保留；未写入设备',status='read_failed',error=str(error))
            raise

    def apply(self, directory, plan):
        status=preset.RunStatus(directory,'apply')
        try:
            status.update('before_read','读取 ECHO-A 写入前备份',device=self.name)
            before=self.capture(directory,'before',status)
            plan,_=self.compile(plan['preset'],before[1][35])
            frames=[bytes.fromhex(f) for f in plan['target_frames']]
            binary=b'EQA1'+b''.join(before+frames)
            self.prepare(directory,plan['preset'],plan,binary)
            status.update('write','正在发送 ECHO-A EQ 与提交序列；不自动重试',write_attempted=True)
            with (directory/'write-log.jsonl').open('xb') as out, (directory/'write-stderr.txt').open('xb') as err:
                result=subprocess.run([str(preset.ROOT/'bin/echo_a_hid'),'apply',str(directory/'plan.bin')],
                                      stdout=out,stderr=err,timeout=40)
            if result.returncode:
                raise ValueError(f'ECHO-A 写入/读回 exit {result.returncode}；'+
                                 (directory/'write-stderr.txt').read_text(errors='replace')[-2000:])
            status.update('after_read','提交序列已发送，正在重新打开连接只读核对',commit_sequence_sent=True)
            actual=self.capture(directory,'after',status)
            verification=echo_a.verify(frames,actual)
            preset.save_json(directory/'verification.json',verification)
            status.update('complete','ECHO-A 写入及读回核对通过；物理拔插保持未验证',
                          status='saved_verified',readback_verified=True)
        except Exception as error:
            attempted=status.data['write_attempted']
            status.update('failed','写入状态未确认，请只读复核，不要重复写入' if attempted else '写入前失败，未发送 EQ',
                          status='write_uncertain' if attempted else 'not_written',error=str(error))
            raise

    def verify_run(self, directory):
        binary=(directory/'plan.bin').read_bytes()
        manifest=json.loads((directory/'manifest.json').read_text())
        plan=json.loads((directory/'plan.json').read_text())
        if (len(binary)!=1264 or binary[:4]!=b'EQA1' or plan.get('device_backend')!=self.id or
                hashlib.sha256(binary).hexdigest()!=manifest['plan_sha256'] or
                binary[697:]!=b''.join(bytes.fromhex(f) for f in plan['target_frames'])):
            raise ValueError('ECHO-A 历史计划完整性检查失败')
        check=directory/'checks'/preset.timestamp()
        check.mkdir(parents=True,exist_ok=False)
        status=preset.RunStatus(check,'verify')
        status.data['source_run']=str(directory)
        try:
            status.update('after_read','只读核对 ECHO-A 历史计划；不重新计算或发送 EQ')
            actual=self.capture(check,'after',status)
            result=echo_a.verify([binary[697+i*63:697+(i+1)*63] for i in range(9)],actual)
            preset.save_json(check/'verification.json',result)
            status.update('complete','ECHO-A 当前状态与计划匹配；本次未写入',status='readback_verified',readback_verified=True)
        except Exception as error:
            status.update('failed','只读复核未通过；未写入设备',status='readback_failed',error=str(error))
            raise
        return check


BACKENDS = [EchoB(),EchoA()]


def get(name):
    for backend in BACKENDS:
        if name in (backend.name,backend.id):return backend
    raise ValueError(f'不支持的设备型号：{name}')


def for_document(doc):
    return get(doc.get('device'))


def for_run(directory):
    plan=json.loads((directory/'plan.json').read_text())
    return for_document(plan['preset'])


def capabilities():
    return [b.capability() for b in BACKENDS]


def connected():
    """Read macOS's registry only. No HID open, USB commands or settings writes."""
    result=subprocess.run(['ioreg','-a','-l','-p','IOUSB'],capture_output=True,timeout=10)
    if result.returncode:raise ValueError('无法读取 macOS USB 设备列表')
    found=[]
    def walk(nodes):
        if isinstance(nodes,dict):nodes=[nodes]
        for node in nodes:
            if not isinstance(node,dict):raise ValueError('macOS USB 注册表格式无效')
            for b in BACKENDS:
                if node.get('idVendor')==b.vid and node.get('idProduct')==b.pid:
                    found.append(dict(device=b.name,id=b.id,product=node.get('USB Product Name'),
                                      serial=node.get('USB Serial Number'),location=node.get('locationID')))
            walk(node.get('IORegistryEntryChildren',[]))
    try:
        walk(plistlib.loads(result.stdout))
    except (plistlib.InvalidFileException, TypeError) as error:
        raise ValueError('macOS USB 注册表无法解析') from error
    return found
