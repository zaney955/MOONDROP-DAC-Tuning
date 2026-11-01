"""Local ECHO-B visual editor. Opening/editing/importing never accesses USB."""
import argparse
import cmath
import hashlib
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
import json
import math
import os
from pathlib import Path
import secrets
import shutil
import subprocess
import sys
import tempfile
import threading
import time
from urllib.parse import urlsplit
import webbrowser

import preset

WEB = preset.ROOT / 'web'
MAX_BODY = 65536


def source_snapshot():
    paths = {preset.ROOT / 'Makefile'}
    for directory, pattern in [('tools', '*.py'), ('tools', '*.c'), ('web', '*'), ('presets', '*.json')]:
        paths.update((preset.ROOT / directory).rglob(pattern))
    return {str(path.relative_to(preset.ROOT)): path.read_bytes()
            for path in sorted(paths) if path.is_file()}


def source_version(snapshot):
    digest = hashlib.sha256()
    for name, content in sorted(snapshot.items()):
        digest.update(name.encode() + b'\0' + hashlib.sha256(content).digest())
    return digest.hexdigest()


def reload_environment():
    env = os.environ.copy()
    # Use a fresh, unwritten bytecode-cache namespace even for same-size edits
    # within one second; timestamp-based .pyc validation must not hide edits.
    env['PYTHONPYCACHEPREFIX'] = str(Path(tempfile.gettempdir()) / ('echo-editor-' + secrets.token_hex(12)))
    env['PYTHONDONTWRITEBYTECODE'] = '1'
    return env


def check_sources(snapshot):
    for required in ('web/index.html', 'web/app.js', 'web/style.css'):
        if required not in snapshot:
            raise ValueError(f'缺少网页资源：{required}')
    for name, content in snapshot.items():
        if name.endswith('.py'):
            compile(content, name, 'exec')
    node = shutil.which('node')
    if node:
        result = subprocess.run([node, '--check', str(WEB / 'app.js')],
                                capture_output=True, text=True, timeout=10)
        if result.returncode:
            raise ValueError(result.stderr.strip()[-2000:])
    result = subprocess.run([sys.executable, '-B', str(Path(__file__).resolve()), '--check'],
                            cwd=preset.ROOT, env=reload_environment(), capture_output=True,
                            text=True, timeout=15)
    if result.returncode:
        raise ValueError(result.stderr.strip()[-2000:] or '新版本启动检查未通过')


def restart_server(server):
    # No active device job can cross this point. Keep the session and historical
    # outcome in an inherited anonymous file, never in the repository or argv.
    with server.guard:
        if server.job and not server.job['done']:
            raise ValueError('设备操作尚未结束，不能重载')
        server.reload_pending = True
        state = dict(token=server.token, job=server.job,
                     last_run=str(server.last_run) if server.last_run else None)
    with tempfile.TemporaryFile() as handoff:
        handoff.write(json.dumps(state, ensure_ascii=False).encode())
        handoff.seek(0)
        os.set_inheritable(handoff.fileno(), True)
        env = reload_environment()
        env['ECHO_EDITOR_HANDOFF_FD'] = str(handoff.fileno())
        os.execve(sys.executable, [sys.executable, '-B', str(Path(__file__).resolve()),
                                  '--port', str(server.server_port)], env)


def restore_session(server, state):
    server.token = state['token']
    job = state.get('job')
    if job and not job['done']:
        raise ValueError('不能恢复进行中的设备操作')
    server.job = job
    server.last_run = Path(state['last_run']) if state.get('last_run') else None


class ReloadWatcher:
    def __init__(self, server, restart=restart_server, check=check_sources):
        self.server, self.restart, self.check = server, restart, check
        self.observed = server.version
        self.changed_at = 0
        self.prepared = self.failed = None
        self.stopped = threading.Event()

    def step(self, now):
        snapshot = source_snapshot()
        version = source_version(snapshot)
        if version == self.server.version:
            self.observed = version
            self.prepared = self.failed = None
            with self.server.guard:
                self.server.reload_pending = False
                self.server.reload_error = None
            return False
        if version != self.observed:
            self.observed, self.changed_at = version, now
            return False
        if now - self.changed_at < .6 or version == self.failed:
            return False
        if version != self.prepared:
            try:
                self.check(snapshot)
            except Exception as error:
                self.failed = version
                self.server.reload_error = str(error)
                print(f'[reload] 新代码检查失败，继续运行原版本：{error}', flush=True)
                return False
            self.prepared = version
            self.server.reload_error = None
        with self.server.guard:
            self.server.reload_pending = True
            if self.server.job and not self.server.job['done']:
                return False
        # An editor may have saved another file while checks were running.
        if source_version(source_snapshot()) != version:
            return False
        print('[reload] 代码已更新，设备操作已结束，正在重载服务…', flush=True)
        self.restart(self.server)
        return True

    def run(self):
        while not self.stopped.wait(.3):
            try:
                if self.step(time.monotonic()):
                    return
            except Exception as error:
                self.server.reload_error = str(error)

    def start(self):
        self.server.auto_reload = True
        threading.Thread(target=self.run, daemon=True, name='editor-reload').start()


def validate_document(doc):
    # Keep malformed JSON shapes away from the compiler's lower-level operations.
    if not isinstance(doc, dict) or not isinstance(doc.get('filters'), list):
        raise ValueError('配置必须是 JSON 对象，并包含 filters 数组')
    if 'description' in doc and not isinstance(doc['description'], str):
        raise ValueError('description 必须是文字')
    for f in doc['filters']:
        if not isinstance(f, dict) or not isinstance(f.get('type'), str):
            raise ValueError('每段滤波器必须包含有效的 type')
    return preset.compile_preset(doc)


def preview(doc):
    plan, _ = validate_document(doc)
    frequencies = [20 * 1000 ** (i / 600) for i in range(601)]
    curves = {}
    for rate, rows in plan['coefficients_q22'].items():
        bands = []
        # Plot EQ alone using actual quantized coefficients. Output gain remains
        # in the compiled plan and full-chain clipping checks below.
        for row in rows[:len(doc['filters'])]:
            values = []
            b0, b1, b2, p, q = [v / preset.SCALE for v in row]
            for frequency in frequencies:
                z = cmath.exp(-2j * math.pi * frequency / int(rate))
                magnitude = abs((b0 + b1*z + b2*z*z) / (1 - p*z - q*z*z))
                values.append(20 * math.log10(magnitude) if magnitude else -300)
            bands.append(values)
        curves[rate] = dict(bands=bands, total=[sum(band[i] for band in bands)
                                               for i in range(len(frequencies))])
    return dict(preset=doc, frequencies=frequencies, curves=curves,
                response_check=plan['response_check'],
                quantized_q=[b['q'] for b in plan['bands'][:len(doc['filters'])]],
                peak_db=max(r['max_gain_db'] for r in plan['response_check'].values()))


def device_document(metadata, coefficients):
    """Recover editable RBJ parameters only when they reproduce every read row.

    The device exposes the active rate's coefficients and integer gain labels,
    not the original JSON or fractional gain. Never trust labels as DSP values.
    """
    if metadata['mode'] != 0:
        raise ValueError('当前设备不是自定义 EQ 模式；已保存原始读数，未切换设备模式')
    output = coefficients[8]
    if output[0] <= 0 or output[1:] != [0, 0, 0, 0]:
        raise ValueError('第 9 段不是编辑器支持的整体输出增益；已保存原始读数')
    filters, matching_rates = [], set(preset.RATES.values())
    names = {value: key for key, value in preset.TYPES.items()}
    for band, row in zip(metadata['bands'][:8], coefficients[:8]):
        kind = names.get(band['type_code'])
        if kind is None:
            raise ValueError(f'第 {band["band"]} 段滤波器类型不受支持；已保存原始读数')
        label = band['gain_label_db']
        candidates = {}
        # Truncation toward zero leaves at most 19 possible tenths of a dB.
        for tenth in range(label * 10 - 9, label * 10 + 10):
            gain = tenth / 10
            if int(gain) != label:
                continue
            filt = dict(type=kind, frequency_hz=band['frequency_hz'], q=band['q'], gain_db=gain)
            rates = {rate for rate in matching_rates if preset.biquad(filt, rate) == row}
            if rates:
                candidates[tenth] = (filt, rates)
        if len(candidates) != 1:
            raise ValueError(f'第 {band["band"]} 段实际系数无法精确还原为当前编辑器参数；'
                             '已保存原始读数，未用整数标签近似替代')
        filt, matching_rates = next(iter(candidates.values()))
        filters.append(filt)
    # Remove only the compiler's unused trailing slots, retaining custom flat EQ.
    while filters:
        index = len(filters) - 1
        if filters[index] != dict(type='low_shelf', frequency_hz=500*(index+1), q=1, gain_db=0):
            break
        filters.pop()
    doc = dict(version=1, device='MOONDROP ECHO-B', name='当前设备调音',
               description='从设备只读载入；增益已与实际 Q22 系数核对。设备不保存原配置名称和备注。',
               output_gain_db=20 * math.log10(output[0] / preset.SCALE), filters=filters)
    plan, _ = validate_document(doc)
    rates = [rate for rate in matching_rates if plan['coefficients_q22'][str(rate)] == coefficients]
    if not rates:
        raise ValueError('读回配置无法精确复现实际系数；已保存原始读数')
    return doc, sorted(rates)


def read_device(directory):
    status = preset.RunStatus(directory, 'read')
    try:
        status.update('read', '正在只读读取设备参数与实际系数')
        preset.capture(directory, 'current', on_retry=status.read_retry)
        status.update('confirm_read', '正在再次读取，确认配置在采集期间保持一致')
        preset.capture(directory, 'confirmed', on_retry=status.read_retry)
        metadata = preset.decode(directory / 'current-metadata.jsonl')
        confirmed = preset.decode(directory / 'confirmed-metadata.jsonl')
        mode, coefficients = preset.read_coefficients(directory / 'current-coefficients.jsonl')
        if ((metadata['mode'], metadata['bands']) != (confirmed['mode'], confirmed['bands'])
                or (mode, coefficients) != preset.read_coefficients(directory / 'confirmed-coefficients.jsonl')):
            raise ValueError('读取期间设备配置发生变化，请关闭其他控制程序后重试')
        doc, rates = device_document(metadata, coefficients)
        preset.save_json(directory / 'preset.json', doc)
        status.update('complete', '已读取当前设备配置；未写入设备', status='read_complete',
                      matching_sample_rates=rates)
        return doc, rates
    except Exception as error:
        status.update('failed', '读取未完成，当前草稿已保留；未写入设备', status='read_failed', error=str(error))
        raise


class EditorServer(ThreadingHTTPServer):
    daemon_threads = True

    def __init__(self, address):
        super().__init__(address, Handler)
        self.token = secrets.token_urlsafe(32)
        self.guard = threading.Lock()
        self.job = None
        self.last_run = None
        self.sources = source_snapshot()
        self.version = source_version(self.sources)
        self.reload_pending = False
        self.reload_error = None
        self.auto_reload = False

    def start_job(self, action, doc=None):
        compiled = validate_document(doc) if action == 'apply' else None
        with self.guard:
            if self.reload_pending:
                raise ValueError('代码正在重载，本次未启动设备操作')
            if self.job and not self.job['done']:
                raise ValueError('设备操作正在进行，请等待完成')
            if action == 'verify' and self.last_run is None:
                raise ValueError('本次服务尚无可复核的写入记录')
            job = dict(id=secrets.token_hex(8), action=action, done=False,
                       message='正在准备设备操作', run=None, error=None)
            self.job = job
            source = self.last_run
        threading.Thread(target=self.run_job, args=(job, compiled, doc, source), daemon=False).start()
        return self.job_status()

    def run_job(self, job, compiled, doc, source):
        try:
            job['message'] = '正在检查本机通信程序'
            build = subprocess.run(['make', 'bin/echo_probe' if job['action'] == 'read' else 'build'], cwd=preset.ROOT, capture_output=True,
                                   text=True, timeout=120)
            if build.returncode:
                raise ValueError('通信程序构建失败：' + build.stderr[-3000:])
            with preset.device_lock():
                if job['action'] == 'apply':
                    plan, binary = compiled
                    directory = preset.ROOT / 'runs' / (preset.timestamp() + '-visual-editor')
                    directory.mkdir(parents=True, exist_ok=False)
                    job['run'] = str(directory)
                    preset.save_json(directory / 'preset.json', doc)
                    preset.save_json(directory / 'plan.json', plan)
                    (directory / 'plan.bin').write_bytes(binary)
                    preset.save_json(directory / 'manifest.json', dict(
                        plan_sha256=hashlib.sha256(binary).hexdigest(), source='visual-editor'))
                    self.last_run = directory
                    preset.apply_plan(directory, plan)
                elif job['action'] == 'read':
                    directory = preset.ROOT / 'runs' / (preset.timestamp() + '-device-read')
                    directory.mkdir(parents=True, exist_ok=False)
                    job['run'] = str(directory)
                    document, rates = read_device(directory)
                    job.update(preset=document, matching_sample_rates=rates)
                else:
                    job['message'] = '正在只读复核上次写入的计划'
                    previous = set((source / 'checks').glob('*'))
                    try:
                        job['run'] = str(preset.verify_run(source))
                    finally:
                        checks = set((source / 'checks').glob('*')) - previous
                        if checks:
                            job['run'] = str(max(checks))
            job['message'] = '设备操作已完成'
        except Exception as error:
            job['error'] = str(error)
            job['message'] = '设备操作未完成，请查看详细状态'
        finally:
            job['done'] = True

    def job_status(self):
        with self.guard:
            if not self.job:
                return dict(job=None, can_verify=self.last_run is not None)
            job = dict(self.job)
            if job['run']:
                path = Path(job['run']) / 'status.json'
                if path.is_file():
                    job['device_status'] = json.loads(path.read_text())
            return dict(job=job, can_verify=self.last_run is not None)


class Handler(BaseHTTPRequestHandler):
    def send(self, code, data, content_type='application/json; charset=utf-8'):
        body = json.dumps(data, ensure_ascii=False, allow_nan=False).encode() if isinstance(data, (dict, list)) else data
        self.send_response(code)
        self.send_header('Content-Type', content_type)
        self.send_header('Content-Length', str(len(body)))
        self.send_header('Cache-Control', 'no-store')
        self.send_header('X-Content-Type-Options', 'nosniff')
        self.send_header('X-Editor-Version', self.server.version)
        self.send_header('Content-Security-Policy', "default-src 'self'; script-src 'self'; style-src 'self'; object-src 'none'; base-uri 'none'; frame-ancestors 'none'")
        self.end_headers()
        self.wfile.write(body)

    def local_request(self):
        # Reject DNS rebinding and cross-site requests; never bind to LAN interfaces.
        port = self.server.server_port
        hosts = {f'127.0.0.1:{port}', f'localhost:{port}'}
        return (self.headers.get('Host') in hosts and
                self.headers.get('Origin') in {None, *(f'http://{h}' for h in hosts)})

    def do_GET(self):
        if not self.local_request():
            return self.send(403, dict(error='只允许本机同源访问'))
        path = urlsplit(self.path).path
        if path == '/api/version':
            return self.send(200, dict(version=self.server.version, auto_reload=self.server.auto_reload,
                                      reloading=self.server.reload_pending, error=self.server.reload_error))
        if path == '/api/bootstrap':
            presets = [dict(id=Path(name).stem, preset=json.loads(content))
                       for name, content in self.server.sources.items()
                       if name.startswith('presets/') and name.endswith('.json')]
            return self.send(200, dict(token=self.server.token, presets=presets,
                                      version=self.server.version, auto_reload=self.server.auto_reload,
                                      output_min=preset.OUTPUT_GAIN_MIN_DB,
                                      output_max=preset.OUTPUT_GAIN_MAX_DB))
        if path == '/api/job':
            return self.send(200, self.server.job_status())
        files = {'/': ('index.html', 'text/html; charset=utf-8'),
                 '/app.js': ('app.js', 'text/javascript; charset=utf-8'),
                 '/style.css': ('style.css', 'text/css; charset=utf-8')}
        if path not in files:
            return self.send(404, dict(error='找不到此页面'))
        name, kind = files[path]
        content = self.server.sources['web/' + name]
        if name == 'index.html':
            content = content.replace(b'__EDITOR_VERSION__', self.server.version.encode())
        self.send(200, content, kind)

    def do_POST(self):
        if not self.local_request() or self.headers.get('X-Editor-Token') != self.server.token:
            return self.send(403, dict(error='访问令牌无效，请刷新本机页面'))
        client_version = self.headers.get('X-Editor-Version')
        if ((client_version is not None and client_version != self.server.version)
                or (client_version is None and self.server.auto_reload
                    and self.path in ('/api/apply', '/api/verify', '/api/read'))):
            return self.send(409, dict(error='页面代码已更新，请等待自动重载；本次未启动设备操作', reloading=True))
        if self.server.reload_pending:
            return self.send(503, dict(error='代码正在重载，请稍候；本次未启动设备操作', reloading=True))
        try:
            if self.headers.get_content_type() != 'application/json':
                raise ValueError('请使用 JSON 配置')
            length = int(self.headers.get('Content-Length', '0'))
            if not 0 < length <= MAX_BODY:
                raise ValueError('配置大小必须在 1–65536 字节之间')
            doc = json.loads(self.rfile.read(length))
            if self.path == '/api/preview':
                return self.send(200, preview(doc))
            if self.path == '/api/apply':
                return self.send(202, self.server.start_job('apply', doc))
            if self.path == '/api/verify':
                return self.send(202, self.server.start_job('verify'))
            if self.path == '/api/read':
                return self.send(202, self.server.start_job('read'))
            return self.send(404, dict(error='未知操作'))
        except (ValueError, TypeError, KeyError, OverflowError) as error:
            self.send(400, dict(error=str(error)))

    def log_message(self, *_):
        pass


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--port', type=int, default=8765)
    parser.add_argument('--open', action='store_true', help='在默认浏览器打开')
    parser.add_argument('--no-reload', action='store_true', help='关闭代码变更自动重载')
    parser.add_argument('--check', action='store_true', help=argparse.SUPPRESS)
    args = parser.parse_args()
    server = EditorServer(('127.0.0.1', 0 if args.check else args.port))
    if args.check:
        for name, content in server.sources.items():
            if name.startswith('presets/') and name.endswith('.json'):
                validate_document(json.loads(content))
        server.server_close()
        return
    handoff_fd = os.environ.pop('ECHO_EDITOR_HANDOFF_FD', None)
    if handoff_fd is not None:
        with os.fdopen(int(handoff_fd)) as handoff:
            restore_session(server, json.load(handoff))
    watcher = ReloadWatcher(server)
    if not args.no_reload:
        watcher.start()
    url = f'http://127.0.0.1:{server.server_port}'
    print(f'ECHO-B 可视化编辑器：{url}\n自动重载：{"关闭" if args.no_reload else "开启"}；Ctrl+C 关闭服务。', flush=True)
    if args.open:
        webbrowser.open(url)
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        print('\n正在退出；已启动的设备操作会继续完成。', flush=True)
    finally:
        watcher.stopped.set()
        server.server_close()


if __name__ == '__main__':
    main()
