// Optional Playwright + installed Chrome regression. Only edits browser drafts.
const {chromium} = require('playwright');
const assert = require('node:assert/strict');
const fs = require('node:fs/promises');

(async () => {
  const browser = await chromium.launch({channel: 'chrome', headless: true});
  try {
    const page = await browser.newPage({viewport: {width: 1440, height: 1100}, acceptDownloads: true});
    const errors = [], deviceRequests = [];
    const loadedFixture = {version: 1, device: 'MOONDROP ECHO-B', name: '载入排序', output_gain_db: -20,
      filters: [{type: 'peak', frequency_hz: 5000, gain_db: -1.1, q: 1.2},
        {type: 'low_shelf', frequency_hz: 120, gain_db: 1.5, q: 1},
        {type: 'peak', frequency_hz: 90, gain_db: 1.4, q: .9},
        {type: 'peak', frequency_hz: 120, gain_db: -1, q: 2}]};
    const expectedLoaded = {...loadedFixture, filters: [...loadedFixture.filters].sort((a, b) => a.frequency_hz - b.frequency_hz)};
    await page.route('**/api/bootstrap', async route => {
      const response = await route.fetch(), initial = await response.json();
      initial.presets.push({id: 'load-sorting-fixture', preset: loadedFixture});
      await route.fulfill({response, json: initial});
    });
    page.on('pageerror', (error) => errors.push(error.message));
    page.on('dialog', (dialog) => dialog.accept());
    page.on('request', (request) => {
      if (/\/api\/(apply|verify)$/.test(request.url())) deviceRequests.push(request.url());
    });
    await page.goto(process.env.EDITOR_URL || 'http://127.0.0.1:8765/');
    const valid = () => page.locator('#validation').filter({hasText: '校验通过'}).waitFor();
    await valid();
    await assertOrdered();
    await page.locator('#new').click();await valid();
    async function geometry() {
      await page.locator('#chart').scrollIntoViewIfNeeded();
      return page.locator('#chart').evaluate((svg) => {
        const rect = svg.getBoundingClientRect();
        const labels = svg.querySelectorAll('.chart-artwork > g > text');
        return {left: rect.left, top: rect.top, width: rect.width, height: rect.height,
          viewWidth: svg.viewBox.baseVal.width, max: Number(labels[0].textContent), min: Number(labels[6].textContent)};
      });
    }
    function coordinates(g, frequency, db) {
      return {x: g.left + (52 + Math.log10(frequency / 20) / 3 * (g.viewWidth - 72)) * g.width / g.viewWidth,
        y: g.top + (18 + (g.max - db) / (g.max - g.min) * 298) * g.height / 360};
    }
    const selected = async () => Number(await page.locator('.chart-handle[aria-pressed="true"]').getAttribute('data-band'));
    async function fields() {
      const index = await selected();
      return {frequency: Number(await page.locator(`#band-${index}-frequency_hz`).inputValue()),
        gain: Number(await page.locator(`#band-${index}-gain_db`).inputValue())};
    }
    async function assertOrdered() {
      const points = await page.locator('.chart-handle').evaluateAll((nodes) => nodes.map((node) => ({
        number: Number(node.textContent), x: node.getBoundingClientRect().x,
        frequency: Number(node.getAttribute('aria-label').match(/(\d+) Hz/)[1])})));
      points.forEach((point, index) => {
        assert.equal(point.number, index + 1);
        if (index) {
          assert(point.frequency >= points[index - 1].frequency, 'filter array must ascend by frequency');
          assert(point.x >= points[index - 1].x, 'labels must ascend left to right');
        }
      });
    }
    async function exportDoc() {
      const waiting = page.waitForEvent('download');
      await page.locator('#export').click();
      const file = await waiting;
      return JSON.parse(await fs.readFile(await file.path(), 'utf8'));
    }
    async function doubleClick(frequency, db) {
      const g = await geometry();
      const point = coordinates(g, frequency, db);
      await page.locator('#chart-wrap').evaluate((element) => element.addEventListener('dblclick', (event) => {
        element.dataset.testClickX = event.clientX;
        element.dataset.testClickY = event.clientY;
      }, {once: true, capture: true}));
      await page.mouse.dblclick(point.x, point.y);
      await valid();
      // Native MouseEvent coordinates may round fractional CSS pixels. Assert
      // against the received click rather than assuming subpixel precision.
      const x = Number(await page.locator('#chart-wrap').getAttribute('data-test-click-x'));
      const y = Number(await page.locator('#chart-wrap').getAttribute('data-test-click-y'));
      return {frequency: Math.round(20 * 1000 ** (((x - g.left) / g.width * g.viewWidth - 52) / (g.viewWidth - 72))),
        db: g.max - (((y - g.top) / g.height * 360 - 18) / 298) * (g.max - g.min)};
    }
    async function pointDb() {
      const g = await geometry();
      const dot = await page.locator('.chart-handle[aria-pressed="true"] .dot').boundingBox();
      return g.max - (((dot.y + dot.height / 2 - g.top) / g.height * 360 - 18) / 298) * (g.max - g.min);
    }
    // Presets and imports normalize before establishing the draft baseline.
    await page.locator('.preset[data-id="load-sorting-fixture"]').click();await valid();
    await assertOrdered();
    assert.equal(await page.locator('#draft-state').textContent(), '编辑草稿');
    assert(await page.locator('#undo').isDisabled());
    assert.deepEqual(await exportDoc(), expectedLoaded, 'preset sorting preserves each complete filter and equal-frequency order');
    await page.locator('#file').setInputFiles({name: 'load-sorting.json', mimeType: 'application/json',
      buffer: Buffer.from(JSON.stringify(loadedFixture))});
    await page.locator('#notice').filter({hasText: '已导入 load-sorting.json'}).waitFor();await valid();
    await assertOrdered();
    assert(await page.locator('#undo').isDisabled());
    assert.deepEqual(await exportDoc(), expectedLoaded, 'imports export in the same ascending order');
    await page.locator('.chart-handle[data-band="0"]').click();
    assert.deepEqual(await fields(), {frequency: 90, gain: 1.4});
    await page.locator('.chart-handle[data-band="1"]').click();
    assert.equal(await page.locator('#type-1').inputValue(), 'low_shelf');
    assert.deepEqual(await fields(), {frequency: 120, gain: 1.5});
    await page.locator('#new').click();await valid();
    // Output is -16 dB, but handles and new gains are independent of it.
    const first = await doubleClick(1000, -1.2);
    assert.equal(await page.locator('.chart-handle').count(), 1);
    let value = await fields();
    assert.equal(value.frequency, first.frequency);
    const firstGain = Math.round(first.db * 10) / 10;
    assert.equal(value.gain, firstGain);
    assert(Math.abs(await pointDb() - first.db) < .15);
    // Insert to the left of the first point; the new point becomes number 1.
    const second = await doubleClick(137, -2);
    assert.equal(await selected(), 0);
    assert.equal(await page.locator('.chart-handle').count(), 2);
    assert.equal((await fields()).frequency, second.frequency);
    assert(Math.abs(await pointDb() - second.db) < .15);
    await assertOrdered();
    const third = await doubleClick(5000, 1.5);
    assert.equal(await selected(), 2);
    assert(Math.abs(await pointDb() - third.db) < .15);
    await assertOrdered();
    const created = await exportDoc();
    assert.equal(created.output_gain_db, -16);
    assert.equal(created.filters.length, 3);
    assert.equal(created.filters[1].gain_db, firstGain, 'relabeling must retain the original filter gain');
    assert(created.filters.every((filter, index, all) => !index || filter.frequency_hz >= all[index - 1].frequency_hz));
    // Toolbar additions use the same sorting and selection behavior.
    await page.locator('#add').click();await valid();
    assert.equal(await page.locator('.chart-handle').count(), 4);
    await assertOrdered();
    let index = await selected();
    await page.locator(`#band-${index}-frequency_hz`).fill('2000');
    await page.locator(`#band-${index}-gain_db`).focus();
    await page.waitForFunction(() => document.querySelector('.chart-handle[aria-pressed="true"]').dataset.band === '2');
    await valid();
    assert.equal((await fields()).frequency, 2000);
    assert.equal(await page.locator('#band-2-gain_db').evaluate((node) => node === document.activeElement), true);
    await assertOrdered();
    // Double clicking a point or an axis label must not create another filter.
    let dot = await page.locator('.chart-handle[aria-pressed="true"] .dot').boundingBox();
    await page.mouse.dblclick(dot.x + dot.width / 2, dot.y + dot.height / 2);await valid();
    assert.equal(await page.locator('.chart-handle').count(), 4);
    let g = await geometry();
    await page.mouse.dblclick(g.left + 20, g.top + 90);
    assert.equal(await page.locator('.chart-handle').count(), 4);
    // Crossing another point changes ordinal, while selection follows the
    // dragged filter and its gain remains unchanged.
    g = await geometry();
    dot = await page.locator('.chart-handle[aria-pressed="true"] .dot').boundingBox();
    const destination = coordinates(g, 80, -16);
    await page.mouse.move(dot.x + dot.width / 2, dot.y + dot.height / 2);
    await page.mouse.down();
    await page.mouse.move(destination.x, dot.y + dot.height / 2, {steps: 6});
    await page.mouse.up();await valid();
    assert.equal(await selected(), 0);
    assert(Math.abs((await fields()).frequency - 80) <= 1);
    assert.equal((await fields()).gain, 0);
    await assertOrdered();
    // Escape restores the original parameters and ordering.
    const beforeCancel = await fields();
    g = await geometry();dot = await page.locator('.chart-handle[aria-pressed="true"] .dot').boundingBox();
    const far = coordinates(g, 8000, -16);
    await page.mouse.move(dot.x + dot.width / 2, dot.y + dot.height / 2);await page.mouse.down();
    await page.mouse.move(far.x, dot.y + dot.height / 2);
    await page.keyboard.press('Escape');await page.mouse.up();await valid();
    assert.deepEqual(await fields(), beforeCancel);await assertOrdered();
    while (await page.locator('.chart-handle').count() < 8) { await page.locator('#add').click();await valid(); }
    await assertOrdered();
    const capped = await fields();
    g = await geometry();const blank = coordinates(g, 333, g.min + (g.max - g.min) * .12);
    await page.mouse.dblclick(blank.x, blank.y);
    assert.equal(await page.locator('.chart-handle').count(), 8);
    assert.deepEqual(await fields(), capped);
    await page.locator('#notice').filter({hasText: '最多支持 8 段'}).waitFor();
    assert.deepEqual(errors, []);
    assert.deepEqual(deviceRequests, []);
    console.log('PASS: blank-chart double-click creates at requested gain/frequency, automatically selects and sorts; toolbar/commit/drag ordering, filter identity/export, no duplicate on points/axes, Escape, eight-band limit, no USB operations.');
  } finally { await browser.close(); }
})().catch((error) => { console.error(error); process.exitCode = 1; });
