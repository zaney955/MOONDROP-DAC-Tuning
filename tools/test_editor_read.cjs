// Device reads are mocked; this regression never accesses USB.
const {chromium} = require('playwright');
const assert = require('node:assert/strict');

(async () => {
  const browser = await chromium.launch({headless: true, channel: 'chrome'});
  try {
    const page = await browser.newPage({viewport: {width: 1280, height: 1000}, acceptDownloads: true});
    const errors = [], writes = [];
    const fixture = {version: 1, device: 'MOONDROP ECHO-B', name: '当前设备调音',
      description: 'device fixture', output_gain_db: -19.999991716494,
      filters: [{type: 'peak', frequency_hz: 3200, q: 1.1015625, gain_db: -1.1},
        {type: 'low_shelf', frequency_hz: 120, q: 1, gain_db: 1.5}]};
    const expected = {...fixture, filters: [...fixture.filters].sort((a, b) => a.frequency_hz - b.frequency_hz)};
    let job = null, requests = 0, accept = false, loseResponse = false;
    page.on('pageerror', error => errors.push(error.message));
    page.on('dialog', dialog => accept ? dialog.accept() : dialog.dismiss());
    await page.route('**/api/apply', route => { writes.push('apply'); return route.abort(); });
    await page.route('**/api/verify', route => { writes.push('verify'); return route.abort(); });
    await page.route('**/api/read', route => {
      requests++;
      job = {id: `read-${requests}`, action: 'read', done: false, message: '正在读取当前设备', error: null, run: null};
      return loseResponse ? route.abort() : route.fulfill({status: 202, json: {job, can_verify: false}});
    });
    await page.route('**/api/job', route => route.fulfill({json: {job, can_verify: false}}));
    const valid = () => page.locator('#validation').filter({hasText: '校验通过'}).waitFor();
    await page.goto(process.env.EDITOR_URL || 'http://127.0.0.1:8765/');
    await valid();
    assert.equal(requests, 0, 'opening page must not access device');
    await page.locator('#name').fill('保留我的草稿');
    await page.locator('#read-device').click();
    assert.equal(requests, 0, 'cancel must not start USB read');
    accept = true;
    await page.locator('#output').fill('');
    await page.locator('#read-device').click();
    await page.locator('#job-summary').filter({hasText: '正在读取当前设备'}).waitFor();
    assert(await page.locator('#read-device').isDisabled());
    assert(await page.locator('#apply').isDisabled());
    assert(await page.locator('#new').isDisabled());
    job = {...job, done: true, message: '已读取当前设备配置', preset: fixture, matching_sample_rates: [96000]};
    await page.locator('#notice').filter({hasText: '已载入当前设备调音'}).waitFor();
    await valid();
    assert.equal(await page.locator('#name').inputValue(), fixture.name);
    assert.equal(Number(await page.locator('#output').inputValue()), fixture.output_gain_db);
    assert.equal(await page.locator('.chart-handle').count(), 2);
    const frequencies = await page.locator('.chart-handle').evaluateAll(nodes => nodes.map(node =>
      Number(node.getAttribute('aria-label').match(/(\d+) Hz/)[1])));
    assert.deepEqual(frequencies, [120, 3200], 'readback is numbered by ascending frequency');
    assert.equal(await page.locator('#rate').inputValue(), '96000');
    assert(await page.locator('#undo').isDisabled());
    const download = page.waitForEvent('download');
    await page.locator('#export').click();
    let json = '';
    for await (const chunk of await (await download).createReadStream()) json += chunk;
    assert.deepEqual(JSON.parse(json), expected);
    await page.locator('#name').fill('读后继续编辑');
    await page.waitForResponse(response => response.url().endsWith('/api/job'));
    assert.equal(await page.locator('#name').inputValue(), '读后继续编辑');
    await page.locator('#read-device').click();
    job = {...job, done: true, error: '未找到设备', message: '读取失败'};
    await page.locator('#notice').filter({hasText: '读取失败：未找到设备'}).waitFor();
    assert.equal(await page.locator('#name').inputValue(), '读后继续编辑');
    assert(!await page.locator('#read-device').isDisabled());
    loseResponse = true;
    await page.locator('#read-device').click();
    await page.locator('#notice').filter({hasText: '读取请求未能确认'}).waitFor();
    job = {...job, done: true, message: '已读取当前设备配置', preset: fixture, matching_sample_rates: [48000]};
    await page.locator('#notice').filter({hasText: '已载入当前设备调音'}).waitFor();
    assert.equal(await page.locator('#name').inputValue(), fixture.name);
    await page.reload();
    await valid();
    assert.notEqual(await page.locator('#name').inputValue(), fixture.name);
    assert.equal(requests, 3);
    assert.deepEqual(writes, []);
    assert.deepEqual(errors, []);
    console.log('PASS: explicit read, discard/cancel, fractional parameters, export, failure preservation, lost response recovery, no repeated load or writes.');
  } finally {
    await browser.close();
  }
})().catch(error => { console.error(error); process.exitCode = 1; });
