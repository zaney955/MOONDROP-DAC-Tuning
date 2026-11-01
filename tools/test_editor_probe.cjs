// Real mouse, keyboard and touch inspection; never accesses USB.
const {chromium} = require('playwright');
const assert = require('node:assert/strict');

(async () => {
  const browser = await chromium.launch({channel: 'chrome', headless: true});
  const fixture = {version: 1, device: 'MOONDROP ECHO-B', name: 'curve-inspection', output_gain_db: -20,
    filters: [{type: 'peak', frequency_hz: 1000, gain_db: 4, q: 1},
      {type: 'low_shelf', frequency_hz: 2000, gain_db: 6, q: 1}]};
  const url = process.env.EDITOR_URL || 'http://127.0.0.1:8765/';
  const errors = [], deviceRequests = [];
  async function prepare(page) {
    page.on('pageerror', error => errors.push(error.message));
    page.on('dialog', dialog => dialog.accept());
    await page.route('**/api/{apply,verify,read}', route => { deviceRequests.push(route.request().url()); return route.abort(); });
    await page.goto(url);
    await page.locator('#validation').filter({hasText: '校验通过'}).waitFor();
    await page.locator('#file').setInputFiles({name: 'probe.json', mimeType: 'application/json',
      buffer: Buffer.from(JSON.stringify(fixture))});
    await page.locator('#notice').filter({hasText: '已导入 probe.json'}).waitFor();
    await page.locator('#validation').filter({hasText: '校验通过'}).waitFor();
    await page.locator('#chart').scrollIntoViewIfNeeded();
  }
  async function point(page, selector, ratio) {
    return page.locator(selector).evaluate((path, ratio) => {
      const svg = path.ownerSVGElement, rect = svg.getBoundingClientRect(), width = svg.viewBox.baseVal.width;
      const x = 52 + ratio * (width - 72);
      let low = 0, high = path.getTotalLength();
      for (let i = 0; i < 40; i++) {
        const middle = (low + high) / 2;
        if (path.getPointAtLength(middle).x < x) low = middle;
        else high = middle;
      }
      const value = path.getPointAtLength((low + high) / 2);
      return {x: rect.x + x * rect.width / width, y: rect.y + value.y * rect.height / 360};
    }, ratio);
  }
  async function check(page, band) {
    const readout = page.locator('#curve-readout');
    await readout.waitFor({state: 'visible'});
    // Read a single frame: the real touch pipeline can deliver its latest move
    // between separate automation round trips.
    const snapshot = await readout.evaluate((node, band) => {
      const svg = document.querySelector('#chart'), chart = svg.getBoundingClientRect();
      const frequency = Number(node.dataset.frequency), gain = Number(node.dataset.gain);
      const path = svg.querySelector(band === 'total' ? '.total-curve' : `.band-curve[data-band="${band}"]`);
      const width = svg.viewBox.baseVal.width, x = 52 + Math.log10(frequency / 20) / 3 * (width - 72);
      let low = 0, high = path.getTotalLength();
      for (let i = 0; i < 40; i++) {
        const middle = (low + high) / 2;
        if (path.getPointAtLength(middle).x < x) low = middle;
        else high = middle;
      }
      const point = path.getPointAtLength((low + high) / 2);
      const marker = svg.querySelector('#curve-probe circle').getBoundingClientRect();
      return {frequency, gain, band: node.dataset.band,
        frequencyText: node.querySelector('[data-value="frequency"]').textContent,
        gainText: node.querySelector('[data-value="gain"]').textContent,
        deltaX: marker.x + marker.width / 2 - (chart.x + x * chart.width / width),
        deltaY: marker.y + marker.height / 2 - (chart.y + point.y * chart.height / 360),
        box: node.getBoundingClientRect().toJSON(), chart: chart.toJSON(), pointerEvents: getComputedStyle(node).pointerEvents};
    }, band);
    const values = {frequency: snapshot.frequency, gain: snapshot.gain};
    assert.equal(snapshot.band, String(band));
    assert.equal(snapshot.frequencyText, `${Math.round(values.frequency)} Hz`);
    assert.equal(snapshot.gainText, `${values.gain > 0 ? '+' : ''}${values.gain.toFixed(2)} dB`);
    assert(Math.abs(snapshot.deltaX) < .06, `marker X differs: ${snapshot.deltaX}`);
    assert(Math.abs(snapshot.deltaY) < .06, `marker Y differs: ${snapshot.deltaY}`);
    const {box, chart} = snapshot;
    assert(box.x >= chart.x && box.x + box.width <= chart.x + chart.width + .1);
    assert(box.y >= chart.y && box.y + box.height <= chart.y + chart.height + .1);
    assert.equal(snapshot.pointerEvents, 'none');
    return values;
  }
  async function exported(page) {
    const wait = page.waitForEvent('download');
    await page.locator('#export').click();
    let json = '';
    for await (const chunk of await (await wait).createReadStream()) json += chunk;
    return JSON.parse(json);
  }
  try {
    const page = await browser.newPage({viewport: {width: 1440, height: 1100}, acceptDownloads: true});
    await prepare(page);
    let p = await point(page, '.total-curve', .47);
    await page.mouse.move(p.x, p.y);
    const before = await check(page, 'total');
    await page.mouse.down();
    p = await point(page, '.total-curve', .76);
    await page.mouse.move(p.x, p.y + 40, {steps: 8});
    const after = await check(page, 'total');
    assert(after.frequency > before.frequency * 3);
    assert.notEqual(after.gain, before.gain);
    await page.mouse.up();
    await page.screenshot({path: '/tmp/echo-curve-probe-desktop.png'});
    await page.mouse.move(0, 0);
    assert(await page.locator('#curve-readout').isHidden());
    p = await point(page, '.band-curve[data-band="0"]', .66);
    await page.mouse.move(p.x, p.y);
    await check(page, 0);
    await page.locator('#chart').focus();
    await page.keyboard.press('End');
    assert.equal((await check(page, 0)).frequency, 20000);
    await page.keyboard.press('Home');
    assert.equal((await check(page, 0)).frequency, 20);
    await page.keyboard.press('ArrowRight');
    assert((await check(page, 0)).frequency > 20);
    await page.keyboard.press('Escape');
    assert(await page.locator('#curve-readout').isHidden());
    assert.deepEqual(await exported(page), fixture, 'inspection must not change tuning');
    // Resize keeps a tracked point attached to its curve and the label in bounds.
    p = await point(page, '.total-curve', .47);
    await page.mouse.move(p.x, p.y);
    await check(page, 'total');
    await page.setViewportSize({width: 1000, height: 1100});
    await page.waitForFunction(() => {
      const svg = document.querySelector('#chart');
      return svg.viewBox.baseVal.width === Math.max(260, svg.clientWidth);
    });
    await check(page, 'total');
    await page.locator('#output').fill('');
    assert(await page.locator('#curve-readout').isHidden(), 'pending/invalid drafts hide the valid-snapshot probe');

    const touch = await browser.newPage({viewport: {width: 390, height: 1000}, hasTouch: true, isMobile: true, acceptDownloads: true});
    await prepare(touch);
    const cdp = await touch.context().newCDPSession(touch);
    p = await point(touch, '.total-curve', .47);
    await cdp.send('Input.dispatchTouchEvent', {type: 'touchStart', touchPoints: [{x: p.x, y: p.y}]});
    const touchBefore = await check(touch, 'total');
    const target = await point(touch, '.total-curve', .8);
    for (let i = 1; i <= 6; i++) await cdp.send('Input.dispatchTouchEvent', {type: 'touchMove',
      touchPoints: [{x: p.x + (target.x - p.x) * i / 6, y: p.y}]});
    const touchAfter = await check(touch, 'total');
    assert(touchAfter.frequency > touchBefore.frequency * 3);
    await cdp.send('Input.dispatchTouchEvent', {type: 'touchEnd', touchPoints: []});
    await check(touch, 'total');
    await touch.locator('#chart-wrap').screenshot({path: '/tmp/echo-curve-probe-mobile.png'});
    assert.equal(await touch.evaluate(() => document.documentElement.scrollWidth > innerWidth), false);
    assert.deepEqual(await exported(touch), fixture);
    // Native vertical scrolling cancels inspection instead of trapping the page.
    await touch.locator('#chart').scrollIntoViewIfNeeded();
    p = await point(touch, '.total-curve', .47);
    const scrollBefore = await touch.evaluate(() => scrollY);
    await cdp.send('Input.dispatchTouchEvent', {type: 'touchStart', touchPoints: [{x: p.x, y: p.y}]});
    for (let i = 1; i <= 6; i++) await cdp.send('Input.dispatchTouchEvent', {type: 'touchMove',
      touchPoints: [{x: p.x, y: p.y - i * 15}]});
    await cdp.send('Input.dispatchTouchEvent', {type: 'touchEnd', touchPoints: []});
    assert(await touch.evaluate(() => scrollY) > scrollBefore + 10, 'vertical page scrolling is preserved');
    assert(await touch.locator('#curve-readout').isHidden());
    // The large numbered handle keeps priority over curve inspection on touch.
    await touch.locator('#chart').scrollIntoViewIfNeeded();
    const handle = touch.locator('.chart-handle[data-band="0"]');
    const box = await handle.boundingBox();
    const center = {x: box.x + box.width / 2, y: box.y + box.height / 2};
    await cdp.send('Input.dispatchTouchEvent', {type: 'touchStart', touchPoints: [center]});
    await cdp.send('Input.dispatchTouchEvent', {type: 'touchMove', touchPoints: [{x: center.x + 10, y: center.y - 12}]});
    assert.notEqual(Number(await touch.locator('#band-0-gain_db').inputValue()), fixture.filters[0].gain_db);
    assert(await touch.locator('#curve-readout').isHidden());
    assert(await touch.locator('#chart-readout').isVisible());
    await touch.keyboard.press('Escape');
    await cdp.send('Input.dispatchTouchEvent', {type: 'touchEnd', touchPoints: []});
    await touch.locator('#validation').filter({hasText: '校验通过'}).waitFor();
    assert.deepEqual(await exported(touch), fixture, 'cancelled handle edit restores the draft');
    await touch.locator('#chart').scrollIntoViewIfNeeded();
    const chartBox = await touch.locator('#chart').boundingBox();
    await cdp.send('Input.dispatchTouchEvent', {type: 'touchStart', touchPoints: [{x: chartBox.x + 10, y: chartBox.y + 10}]});
    await cdp.send('Input.dispatchTouchEvent', {type: 'touchEnd', touchPoints: []});
    assert(await touch.locator('#chart-readout').isHidden(), 'tapping blank space closes point information');
    await handle.tap();
    assert(await touch.locator('#chart-readout').isVisible(), 'tapping the same point reopens information');
    await touch.locator('#chart-wrap').screenshot({path: '/tmp/echo-compact-point-mobile.png'});
    assert.deepEqual(errors, []);
    assert.deepEqual(deviceRequests, []);
    console.log('PASS: mouse/keyboard/touch curve inspection, exact marker/interpolated values, total and band curves, resize, cancel, native vertical scroll, unchanged tuning, no USB.');
  } finally { await browser.close(); }
})().catch(error => { console.error(error); process.exitCode = 1; });
