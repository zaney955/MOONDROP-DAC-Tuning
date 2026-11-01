// Optional integration test: requires Playwright and installed Google Chrome.
// Edits only a temporary project copy. Never opens or writes a USB device.
const {chromium} = require('playwright');
const assert = require('node:assert/strict');
const fs = require('node:fs/promises');
const os = require('node:os');
const path = require('node:path');
const net = require('node:net');
const {spawn} = require('node:child_process');

(async () => {
  const root = await fs.mkdtemp(path.join(os.tmpdir(), 'echo-reload-test-'));
  const project = path.resolve(__dirname, '..');
  let browser, server, logs = '';
  try {
    for (const name of ['tools', 'web', 'presets', 'Makefile']) {
      await fs.cp(path.join(project, name), path.join(root, name), {recursive: true,
        filter: (source) => !source.includes('__pycache__')});
    }
    const socket = net.createServer();
    await new Promise((resolve) => socket.listen(0, '127.0.0.1', resolve));
    const port = socket.address().port;
    await new Promise((resolve) => socket.close(resolve));
    const url = `http://127.0.0.1:${port}`;
    server = spawn(process.env.PYTHON || 'python3', ['-B', path.join(root, 'tools/editor.py'), '--port', String(port)],
      {cwd: root, env: {...process.env, PYTHONDONTWRITEBYTECODE: '1'}});
    server.stdout.on('data', (data) => { logs += data; });
    server.stderr.on('data', (data) => { logs += data; });
    let ready = false;
    for (let attempt = 0; attempt < 100; attempt++) {
      try { ready = (await fetch(url + '/api/version')).ok; } catch {}
      if (ready) break;
      await new Promise((resolve) => setTimeout(resolve, 100));
    }
    assert(ready, 'temporary editor failed to start');
    browser = await chromium.launch({headless: true, channel: 'chrome'});
    const page = await browser.newPage({viewport: {width: 1440, height: 1100}, acceptDownloads: true});
    const errors = [], deviceRequests = [], dialogs = [];
    page.on('pageerror', (error) => errors.push(error.message));
    page.on('dialog', async (dialog) => { dialogs.push(dialog.type()); await dialog.accept(); });
    page.on('request', (request) => {
      if (/\/api\/(apply|verify)$/.test(request.url())) deviceRequests.push(request.url());
    });
    const valid = () => page.locator('#validation').filter({hasText: '校验通过'}).waitFor();
    const version = () => page.locator('meta[name="editor-version"]').getAttribute('content');
    await page.goto(url);
    await valid();
    const initial = await (await page.request.get(url + '/api/bootstrap')).json();
    assert.equal(initial.auto_reload, true);
    // Preset libraries can change independently; this scenario needs one band.
    await page.locator('#new').click();
    await page.locator('#add').click();
    await page.locator('#name').fill('自动重载 · 未导出草稿');
    await page.locator('#description').fill('保留参数、原始输入和未导出状态');
    await page.locator('#band-0-frequency_hz').fill('2836');
    await page.locator('#band-0-gain_db').fill('.3');
    await page.locator('#band-0-q').fill('1.2');
    await page.locator('#rate').selectOption('96000');
    await valid();
    const before = await version();
    const editorPath = path.join(root, 'tools/editor.py');
    const originalEditor = await fs.readFile(editorPath, 'utf8');
    const updatedEditor = originalEditor.replace('return dict(preset=devices.normalize_document(doc), frequencies=frequencies,',
      "return dict(reload_marker='new-backend', preset=devices.normalize_document(doc), frequencies=frequencies,");
    assert.notEqual(updatedEditor, originalEditor);
    const reloaded = page.waitForEvent('load', {timeout: 30000});
    await fs.writeFile(editorPath, updatedEditor);
    await fs.appendFile(path.join(root, 'web/style.css'), '\n:root { --reload-test: 1; }\n');
    // Existing server keeps serving its original asset snapshot until exec.
    const immediateCss = await (await fetch(url + '/style.css')).text();
    assert(!immediateCss.includes('--reload-test'));
    await reloaded;
    await page.waitForFunction(() => document.querySelector('#name').value === '自动重载 · 未导出草稿');
    await valid();
    assert.notEqual(await version(), before);
    assert.equal(await page.locator('#band-0-frequency_hz').inputValue(), '2836');
    assert.equal(Number(await page.locator('#band-0-gain_db').inputValue()), .3);
    assert.equal(Number(await page.locator('#band-0-q').inputValue()), 1.2);
    assert.equal(await page.locator('.band-row').count(), 1);
    assert.equal(await page.locator('.chart-handle[aria-pressed="true"]').getAttribute('data-band'), '0');
    assert.equal(await page.locator('#rate').inputValue(), '96000');
    assert.match(await page.locator('#draft-state').textContent(), /未导出/);
    assert.equal(await page.evaluate(() => getComputedStyle(document.documentElement).getPropertyValue('--reload-test').trim()), '1');
    const bootstrap = await (await page.request.get(url + '/api/bootstrap')).json();
    assert.equal(bootstrap.version, await version());
    assert.equal(bootstrap.token, initial.token, 'session token must survive reload');
    const preview = await page.request.post(url + '/api/preview', {headers: {
      'X-Editor-Token': bootstrap.token, 'X-Editor-Version': bootstrap.version},
      data: {version: 1, device: 'MOONDROP ECHO-B', name: 'check', output_gain_db: -16,
        filters: [{type: 'peak', frequency_hz: 2836, gain_db: .3, q: 1.2}]}});
    assert.equal((await preview.json()).reload_marker, 'new-backend');
    // JavaScript syntax errors also retain the working browser generation.
    const appPath = path.join(root, 'web/app.js');
    const originalApp = await fs.readFile(appPath, 'utf8');
    const beforeBadJs = await version();
    await fs.appendFile(appPath, '\nconst = invalid;\n');
    await page.locator('#notice').filter({hasText: '代码更新暂未加载'}).waitFor({timeout: 20000});
    assert.equal(await version(), beforeBadJs);
    const repairedJs = page.waitForEvent('load', {timeout: 30000});
    await fs.writeFile(appPath, originalApp + '\n// repaired JS generation\n');
    await repairedJs;
    await page.waitForFunction(() => document.querySelector('#name').value === '自动重载 · 未导出草稿');
    await valid();
    // Python syntax errors retain the working generation, then recover after a fix.
    await page.locator('#band-0-frequency_hz').fill('');
    const stable = await version();
    await fs.appendFile(editorPath, '\nthis is invalid python !!!\n');
    await page.locator('#notice').filter({hasText: '代码更新暂未加载'}).waitFor({timeout: 20000});
    assert.equal(await version(), stable);
    assert.equal(await page.locator('#band-0-frequency_hz').inputValue(), '');
    const recovered = page.waitForEvent('load', {timeout: 30000});
    await fs.writeFile(editorPath, updatedEditor + '\n# recovered generation\n');
    await recovered;
    await page.waitForFunction(() => document.querySelector('#name').value === '自动重载 · 未导出草稿');
    assert.notEqual(await version(), stable);
    assert.equal(await page.locator('#band-0-frequency_hz').inputValue(), '', 'incomplete input must survive reload');
    assert.equal(Number(await page.locator('#band-0-gain_db').inputValue()), .3);
    await page.locator('#band-0-frequency_hz').fill('137');
    await valid();
    const download = page.waitForEvent('download');
    await page.locator('#export').click();
    const file = await download;
    const result = JSON.parse(await fs.readFile(await file.path(), 'utf8'));
    assert.equal(result.filters[0].frequency_hz, 137);
    assert.equal(result.filters[0].gain_db, .3);
    assert.equal(result.filters[0].q, 1.2);
    // Preserve undo/redo branches, including incomplete values, across reload.
    await page.keyboard.press('Meta+z');
    assert.equal(await page.locator('#band-0-frequency_hz').inputValue(), '');
    await page.keyboard.press('Meta+z');await valid();
    assert.equal(await page.locator('#band-0-frequency_hz').inputValue(), '2836');
    const historyReload = page.waitForEvent('load', {timeout: 30000});
    await fs.appendFile(path.join(root, 'web/style.css'), '\n/* history reload check */\n');
    await historyReload;await valid();
    assert.equal(await page.locator('#band-0-frequency_hz').inputValue(), '2836');
    assert.equal(await page.locator('#redo').isDisabled(), false);
    await page.keyboard.press('Meta+Shift+z');
    assert.equal(await page.locator('#band-0-frequency_hz').inputValue(), '');
    await page.keyboard.press('Meta+Shift+z');await valid();
    assert.equal(await page.locator('#band-0-frequency_hz').inputValue(), '137');
    assert.deepEqual(deviceRequests, []);
    assert.deepEqual(dialogs, [], 'automatic reload must not prompt or discard draft');
    assert.deepEqual(errors, []);
    assert.equal(server.exitCode, null);
    console.log('PASS: real code edits reload backend + page together; frozen assets, stable token, draft/invalid input/rate and undo/redo recovery, syntax-error fallback and repair, export, no USB operations.');
  } catch (error) {
    console.error(logs);
    throw error;
  } finally {
    if (browser) await browser.close();
    if (server && server.exitCode === null) {
      server.kill('SIGINT');
      await new Promise((resolve) => server.once('exit', resolve));
    }
    await fs.rm(root, {recursive: true, force: true});
  }
})().catch((error) => { console.error(error); process.exitCode = 1; });
