// Real browser gestures against local preview APIs; never applies to the device.
const {chromium} = require('playwright');
const assert = require('node:assert/strict');
const fs = require('node:fs/promises');

(async () => {
  const browser = await chromium.launch({channel: 'chrome', headless: true});
  try {
    const page = await browser.newPage({viewport: {width: 1440, height: 1100}});
    const errors = [], deviceRequests = [];
    page.on('pageerror', (error) => errors.push(error.message));
    page.on('dialog', (dialog) => dialog.accept());
    page.on('request', (request) => {
      if (/\/api\/(apply|verify)$/.test(request.url())) deviceRequests.push(request.url());
    });
    const valid = () => page.locator('#validation').filter({hasText: '校验通过'}).waitFor();
    const fixture = {version: 1, device: 'MOONDROP ECHO-B', name: 'independent-handles', output_gain_db: -20,
      filters: [{type: 'peak', frequency_hz: 700, gain_db: 4, q: .7},
        {type: 'peak', frequency_hz: 1000, gain_db: -3, q: .8},
        {type: 'low_shelf', frequency_hz: 1300, gain_db: 12, q: 1},
        {type: 'high_shelf', frequency_hz: 4000, gain_db: -8, q: 1}]};
    await page.goto(process.env.EDITOR_URL || 'http://127.0.0.1:8765/');
    await valid();
    await page.locator('#file').setInputFiles({name: 'handles.json', mimeType: 'application/json',
      buffer: Buffer.from(JSON.stringify(fixture))});
    await page.locator('#notice').filter({hasText: '已导入 handles.json'}).waitFor();await valid();
    await page.locator('#chart').scrollIntoViewIfNeeded();
    async function geometry() {
      return page.locator('#chart').evaluate((svg) => {
        const rect = svg.getBoundingClientRect(), labels = svg.querySelectorAll('.chart-artwork > g > text');
        return {left: rect.left, top: rect.top, width: rect.width, height: rect.height,
          max: Number(labels[0].textContent), min: Number(labels[6].textContent)};
      });
    }
    async function positions() {
      return page.locator('.chart-handle').evaluateAll((nodes) => nodes.map((node) => {
        const rect = node.getBoundingClientRect();
        return {x: rect.x + rect.width / 2, y: rect.y + rect.height / 2};
      }));
    }
    async function assertStill(before, except = -1) {
      const after = await positions();
      before.forEach((point, i) => {
        if (i === except) return;
        assert(Math.abs(point.x - after[i].x) < .02, `untouched band ${i} moved horizontally`);
        assert(Math.abs(point.y - after[i].y) < .02, `untouched band ${i} moved vertically`);
      });
    }
    async function assertGainPosition(index, gain) {
      const g = await geometry(), point = (await positions())[index];
      const db = g.max - ((point.y - g.top) / g.height * 360 - 18) / 298 * (g.max - g.min);
      assert(Math.abs(db - gain) < .02, `band ${index}: position ${db}, gain ${gain}`);
    }
    async function assertAllGains() {
      const gains = await page.locator('.chart-handle').evaluateAll((nodes) => nodes.map((node) =>
        Number(node.getAttribute('aria-label').match(/，([-\d.]+) dB/)[1])));
      for (let i = 0; i < gains.length; i++) await assertGainPosition(i, gains[i]);
    }
    async function assertReadout() {
      const readout = page.locator('#chart-readout');
      await readout.waitFor({state: 'visible'});
      const index = Number(await readout.getAttribute('data-band'));
      const frequency = Number(await page.locator(`#band-${index}-frequency_hz`).inputValue());
      const gain = Number(await page.locator(`#band-${index}-gain_db`).inputValue());
      const type = await page.locator(`#type-${index}`).inputValue();
      assert.equal(await readout.locator('[data-value="frequency"]').textContent(), `频率  ${frequency} Hz`);
      assert.equal(await readout.locator('[data-value="gain"]').textContent(), `增益  ${gain > 0 ? '+' : ''}${gain.toFixed(2)} dB`);
      assert.equal(await readout.locator('[data-value="q"]').textContent(), type === 'peak'
        ? `Q  ${Number(await page.locator(`#band-${index}-q`).inputValue())}` : 'S  1（架式固定）');
      assert.equal(await readout.evaluate((node) => getComputedStyle(node).pointerEvents), 'none');
      const box = await readout.boundingBox(), chart = await page.locator('#chart').boundingBox();
      assert(box.x >= chart.x && box.x + box.width <= chart.x + chart.width + .1, 'readout stays inside chart horizontally');
      assert(box.y >= chart.y && box.y + box.height <= chart.y + chart.height + .1, 'readout stays inside chart vertically');
    }
    async function assertConnectors(indices = [2, 3]) {
      const links = await page.locator('.shelf-connector').evaluateAll((nodes) => nodes.map((node) => {
        const index = Number(node.dataset.band), svg = node.ownerSVGElement;
        const line = node.querySelector('line'), ring = node.querySelector('circle');
        const curve = svg.querySelector(`.band-curve[data-band="${index}"]`);
        const targetX = line.x2.baseVal.value;
        let low = 0, high = curve.getTotalLength();
        for (let i = 0; i < 32; i++) {
          const middle = (low + high) / 2;
          if (curve.getPointAtLength(middle).x < targetX) low = middle;
          else high = middle;
        }
        const point = curve.getPointAtLength((low + high) / 2);
        const rect = svg.getBoundingClientRect();
        const handle = document.querySelector(`.chart-handle[data-band="${index}"]`).getBoundingClientRect();
        return {index, x1: line.x1.baseVal.value, x2: targetX,
          y1: line.y1.baseVal.value, y2: line.y2.baseVal.value, curveY: point.y,
          ringX: ring.cx.baseVal.value, ringY: ring.cy.baseVal.value,
          handleX: (handle.x + handle.width / 2 - rect.x) / rect.width * svg.viewBox.baseVal.width,
          handleY: (handle.y + handle.height / 2 - rect.y) / rect.height * 360,
          pointerEvents: getComputedStyle(node).pointerEvents};
      }));
      assert.deepEqual(links.map((link) => link.index), indices, 'connectors only for shelves');
      links.forEach((link) => {
        assert.equal(link.x1, link.x2, 'vertical connector');
        assert(Math.abs(link.handleX - link.x1) < .03);
        assert(Math.abs(link.handleY - link.y1) < .03, 'starts at control point');
        assert(Math.abs(link.curveY - link.y2) < .04, 'ends on actual rendered band curve');
        assert.equal(link.ringX, link.x2);assert.equal(link.ringY, link.y2);
        assert.equal(link.pointerEvents, 'none', 'decoration must not intercept dragging');
      });
    }
    const before = await positions();
    assert.equal(await page.locator('#chart-readout').isVisible(), false, 'no selection has no readout');
    for (let i = 0; i < fixture.filters.length; i++) await assertGainPosition(i, fixture.filters[i].gain_db);
    await assertConnectors();
    const totalBefore = await page.locator('.total-curve').getAttribute('d');
    const point = before[1];
    await page.mouse.move(point.x, point.y);await page.mouse.down();
    for (let step = 1; step <= 8; step++) {
      await page.mouse.move(point.x, point.y - 75 * step / 8);
      await page.waitForTimeout(90);
      await assertStill(before, 1);
      await assertConnectors();
      await assertReadout();
    }
    assert.notEqual(await page.locator('.total-curve').getAttribute('d'), totalBefore, 'total updates during drag');
    await page.mouse.up();await valid();await page.waitForTimeout(250);
    await assertAllGains();
    const gain = Number(await page.locator('#band-1-gain_db').inputValue());
    assert(gain > -3);await assertGainPosition(1, gain);
    const selected = page.locator('.band-curve.selected');
    assert.equal(await selected.getAttribute('data-band'), '1');
    assert.equal(await selected.evaluate((node) => node === node.parentNode.lastElementChild), true);
    assert(Number(await selected.evaluate((node) => getComputedStyle(node).opacity))
      > Number(await page.locator('.band-curve[data-band="0"]').evaluate((node) => getComputedStyle(node).opacity)));
    await page.locator('#band-1-q').fill('2');await valid();await assertAllGains();
    await assertReadout();
    await page.locator('.chart-handle[data-band="1"]').dispatchEvent('wheel', {deltaY: -40, bubbles: true, cancelable: true});
    await assertReadout();await valid();await assertAllGains();
    const beforeOutput = await page.locator('.total-curve').getAttribute('d');
    await page.locator('#output').fill('-6');await valid();await assertAllGains();
    assert.notEqual(await page.locator('.total-curve').getAttribute('d'), beforeOutput);
    await page.locator('#rate').selectOption('44100');await assertAllGains();await assertConnectors();
    // Shelf control uses the full gain parameter: same dB/pixel ratio as peak.
    await page.locator('.chart-handle[data-band="2"]').click();
    await assertReadout();
    await page.locator('#chart').scrollIntoViewIfNeeded();
    const shelfBefore = await positions(), g = await geometry(), shelf = shelfBefore[2];
    await page.mouse.move(shelf.x, shelf.y);await page.mouse.down();
    await page.mouse.move(shelf.x, shelf.y - 20);
    await assertReadout();
    const shelfGain = Number(await page.locator('#band-2-gain_db').inputValue());
    const expected = Math.round((fixture.filters[2].gain_db + 20 * 360 / g.height * (g.max - g.min) / 298) * 10) / 10;
    assert.equal(shelfGain, expected);
    await assertConnectors();
    await page.mouse.up();await valid();await assertAllGains();
    await assertGainPosition(2, shelfGain);await assertConnectors();
    assert.equal(await page.locator('.shelf-connector.selected').getAttribute('data-band'), '2');
    assert(Number(await page.locator('.shelf-connector.selected').evaluate((node) => getComputedStyle(node).opacity))
      > Number(await page.locator('.shelf-connector[data-band="3"]').evaluate((node) => getComputedStyle(node).opacity)));
    // Type changes preserve the gain parameters even when the axis adapts.
    await page.locator('#type-2').selectOption('peak');await valid();
    await assertConnectors([3]);await assertAllGains();await assertReadout();
    await page.locator('#type-2').selectOption('low_shelf');await valid();
    await assertConnectors();await assertAllGains();await assertReadout();
    const download = page.waitForEvent('download');await page.locator('#export').click();
    const exported = JSON.parse(await fs.readFile(await (await download).path(), 'utf8'));
    assert.deepEqual(exported.filters[0], fixture.filters[0]);
    assert.deepEqual(exported.filters[3], fixture.filters[3]);
    assert.equal(exported.filters[1].frequency_hz, 1000);
    assert.equal(exported.filters[2].frequency_hz, 1300);
    assert.equal(exported.output_gain_db, -6);
    const beforeOutputRange = await geometry();
    await page.locator('#output').fill('-60');await valid();
    assert((await geometry()).min < beforeOutputRange.min, 'axis automatically includes the lower total');
    const beforeFit = await geometry();await page.locator('#fit-chart').click();
    assert.deepEqual(await geometry(), beforeFit, 'explicit fit agrees with the automatic range');
    await assertGainPosition(0, 4);await assertGainPosition(2, shelfGain);await assertConnectors();
    await page.locator('#output').fill('-6');await valid();
    const contracted = await geometry();
    assert(contracted.max - contracted.min < beforeFit.max - beforeFit.min, 'range contracts when output returns');
    await page.keyboard.press('Meta+z');await valid();
    assert.equal((await geometry()).min, beforeFit.min, 'undo restores the wider range');
    await page.keyboard.press('Meta+Shift+z');await valid();
    assert.equal((await geometry()).min, contracted.min, 'redo restores the smaller range');
    await page.screenshot({path: '/tmp/echo-independent-handles.png', fullPage: true});
    // Right/top/bottom boundaries, relabeling, and a narrow touch-sized chart.
    // Use peak here: a large shelf at 20 kHz exceeds this device's Q22 range.
    await page.locator('#type-2').selectOption('peak');await valid();
    await page.locator('#band-2-frequency_hz').fill('20000');
    await page.locator('#band-2-gain_db').focus();await valid();
    await page.waitForFunction(() => document.querySelector('#chart-readout').dataset.band === '3');
    await page.locator('#band-3-gain_db').fill('16');await valid();await assertReadout();
    await page.locator('#chart-wrap').screenshot({path: '/tmp/echo-point-readout-desktop.png'});
    await page.setViewportSize({width: 390, height: 1000});
    await page.locator('#chart').scrollIntoViewIfNeeded();
    await page.waitForTimeout(100);await assertReadout();
    await page.locator('#band-3-gain_db').fill('-20');await valid();await assertReadout();
    await page.locator('#chart-wrap').screenshot({path: '/tmp/echo-point-readout-mobile.png'});
    assert.equal(await page.evaluate(() => document.documentElement.scrollWidth > innerWidth), false);
    await page.locator('#delete').click();await valid();
    assert.equal(await page.locator('#chart-readout').isVisible(), false);
    // Small edits get a tighter range, with zero and both signs always visible.
    await page.locator('#file').setInputFiles({name: 'range.json', mimeType: 'application/json', buffer: Buffer.from(JSON.stringify({
      version: 1, device: 'MOONDROP ECHO-B', name: 'auto-range', output_gain_db: 0,
      filters: [{type: 'peak', frequency_hz: 1000, gain_db: 1.2, q: 1}]}))});
    await page.locator('#notice').filter({hasText: '已导入 range.json'}).waitFor();await valid();
    await page.locator('.chart-handle[data-band="0"]').click();
    const smallRange = await geometry();
    assert(smallRange.max - smallRange.min <= 8, 'small gain uses a narrow range');
    assert(smallRange.min < 0 && smallRange.max > 1.2, 'zero and control have headroom');
    await page.locator('#band-0-gain_db').fill('16');await valid();
    const largeRange = await geometry();
    assert(largeRange.max > 16 && largeRange.max - largeRange.min > smallRange.max - smallRange.min);
    await assertAllGains();
    await page.locator('#reset-band').click();await valid();
    const flatRange = await geometry();
    assert.equal(flatRange.max - flatRange.min, 6, 'reset contracts to the minimum range');
    await page.locator('#band-0-gain_db').fill('');
    await page.locator('#curve-state').filter({hasText: '无有效曲线'}).waitFor();
    assert.deepEqual(await geometry(), flatRange, 'invalid input retains the valid scale');
    await page.locator('#band-0-gain_db').fill('-2.3');await valid();
    const negativeRange = await geometry();
    assert(negativeRange.min < -2.3 && negativeRange.max > 0, 'negative gains and zero have headroom');
    const bounds = await page.locator('.total-curve,.band-curve').evaluateAll((nodes) => nodes.map((node) => {
      const box = node.getBBox();return {min: box.y, max: box.y + box.height};
    }));
    assert(bounds.every((box) => box.min >= 18 && box.max <= 316), 'every rendered curve fits');
    await page.locator('#chart-wrap').screenshot({path: '/tmp/echo-auto-range-mobile.png'});
    assert.deepEqual(errors, []);assert.deepEqual(deviceRequests, []);
    console.log('PASS: dynamic axis expansion/contraction, reset/undo/redo and invalid input, small/negative gains, fixed drag scale, exact handles/shelf connectors, desktop/mobile readouts; no USB operations.');
  } finally { await browser.close(); }
})().catch((error) => { console.error(error);process.exitCode = 1; });
