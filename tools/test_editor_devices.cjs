// Device calls are intercepted. Preview/validation use the real local server.
const {chromium} = require('playwright');
const assert = require('node:assert/strict');
(async () => {
  const browser = await chromium.launch({headless: true, channel: 'chrome'});
  try {
    const page = await browser.newPage({viewport: {width: 1280, height: 1000}, acceptDownloads: true});
    const errors = [], mutations = [], reads = [];
    let job = null;
    page.on('pageerror', e => errors.push(e.message));
    page.on('dialog', d => d.accept());
    await page.route('**/api/apply', route => {mutations.push(route.request().postDataJSON()); return route.abort();});
    await page.route('**/api/verify', route => {mutations.push('verify'); return route.abort();});
    await page.route('**/api/devices', route => route.fulfill({json: {devices: [{device: 'MOONDROP ECHO-A', id: 'echo-a'}]}}));
    await page.route('**/api/job', route => route.fulfill({json: {job, can_verify: false}}));
    const fixture = {version: 1, device: 'MOONDROP ECHO-A', name: 'A read fixture', output_gain_db: -20,
      filters: [{type: 'peak', frequency_hz: 1600, gain_db: -179 / 256, q: 1}]};
    await page.route('**/api/read', route => {
      reads.push(route.request().postDataJSON());
      job = {id: 'a-read', action: 'read', device: fixture.device, done: true, error: null,
        message: '已读取 ECHO-A', preset: fixture, matching_sample_rates: [93750]};
      return route.fulfill({status: 202, json: {job, can_verify: false}});
    });
    const valid = () => page.locator('#validation').filter({hasText: '校验通过'}).waitFor();
    await page.goto(process.env.EDITOR_URL || 'http://127.0.0.1:8766');
    await valid();
    assert.equal(await page.locator('#device-model option').count(), 2);
    assert.equal(reads.length, 0);
    await page.locator('#detect-device').click();
    await page.waitForFunction(() => document.querySelector('#device-model').value === 'MOONDROP ECHO-A');
    await valid();
    assert.equal(await page.locator('#device-model').inputValue(), fixture.device);
    assert.equal(await page.locator('#output').inputValue(), '');
    assert.equal(await page.locator('#output').getAttribute('min'), '-30');
    assert.equal(await page.locator('#output').getAttribute('max'), '0');
    assert.equal(await page.locator('#output').getAttribute('step'), '1');
    assert.equal(await page.locator('#rate option').count(), 1);
    assert.equal(await page.locator('#rate').inputValue(), '93750');
    assert.equal(await page.locator('.preset').count(), 1);
    await page.locator('#add').click();await valid();
    assert.deepEqual(await page.locator('#type-0 option').evaluateAll(ns => ns.map(n => n.value)), ['peak', 'low_shelf']);
    assert.equal(await page.locator('#band-0-gain_db').getAttribute('min'), '-10');
    assert.equal(await page.locator('#band-0-gain_db').getAttribute('max'), '10');
    await page.locator('#band-0-gain_db').fill('11');
    assert.equal(await page.locator('#band-0-gain_db').evaluate(n => n.validity.valid), false);
    await page.locator('#band-0-gain_db').fill('1');await valid();
    await page.locator('#output').fill('-20.5');
    assert.equal(await page.locator('#output').evaluate(n => n.validity.stepMismatch), true);
    await page.locator('#output').fill('-20');await valid();
    await page.locator('#read-device').click();
    await page.waitForFunction(() => document.querySelector('#name').value === 'A read fixture');
    await valid();
    assert.deepEqual(reads, [{device: fixture.device}]);
    await page.locator('.chart-handle[data-band="0"]').click();
    assert.equal(Number(await page.locator('#band-0-gain_db').inputValue()), -179 / 256);
    const downloaded = page.waitForEvent('download');await page.locator('#export').click();
    let exported = '';for await (const c of await (await downloaded).createReadStream()) exported += c;
    assert.deepEqual(JSON.parse(exported), fixture);
    await page.screenshot({path: '/tmp/moondrop-echo-a-desktop.png', fullPage: true});
    await page.setViewportSize({width: 390, height: 844});
    await page.waitForFunction(() => document.documentElement.scrollWidth <= innerWidth);
    assert(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth));
    await page.screenshot({path: '/tmp/moondrop-echo-a-mobile.png', fullPage: true});
    await page.setViewportSize({width: 1280, height: 1000});
    await page.locator('#device-model').selectOption('MOONDROP ECHO-B');await valid();
    assert.equal(await page.locator('#rate option').count(), 5);
    assert.equal(await page.locator('#output').getAttribute('step'), 'any');
    await page.locator('#add').click();await valid();
    assert.equal(await page.locator('#type-0 option').count(), 3);
    assert.deepEqual(mutations, []);assert.deepEqual(errors, []);
    await page.screenshot({path: '/tmp/moondrop-device-switch.png', fullPage: true});
    console.log('PASS: model routing, inventory, filtered presets, A limits and Q8.8 readback/export, B capabilities restored; no writes.');
  } finally { await browser.close(); }
})().catch(e => {console.error(e);process.exitCode = 1;});
