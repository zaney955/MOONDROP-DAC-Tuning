// Browser history regression. All actions edit drafts; no device operations.
const {chromium} = require('playwright');
const assert = require('node:assert/strict');

(async () => {
  const browser = await chromium.launch({channel: 'chrome', headless: true});
  try {
    const page = await browser.newPage({viewport: {width: 1440, height: 1100}});
    const errors = [], deviceRequests = [];
    page.on('pageerror', e => errors.push(e.message));
    page.on('dialog', d => d.accept());
    page.on('request', r => {if (/\/api\/(apply|verify)$/.test(r.url())) deviceRequests.push(r.url());});
    const valid = () => page.locator('#validation').filter({hasText: '校验通过'}).waitFor();
    const gain = () => page.locator('#band-0-gain_db');
    const handle = () => page.locator('.chart-handle[data-band="0"]');
    const exportDoc = async () => {
      const waiting = page.waitForEvent('download');
      await page.locator('#export').click();
      let json = '';for await (const chunk of await (await waiting).createReadStream()) json += chunk;
      return JSON.parse(json);
    };
    const shortcut = async key => {await page.keyboard.press(key);await valid();};
    const load = async fixture => {
      await page.locator('#file').setInputFiles({name: 'history.json', mimeType: 'application/json', buffer: Buffer.from(JSON.stringify(fixture))});
      await page.locator('#notice').filter({hasText: '已导入 history.json'}).waitFor();await valid();
    };
    const fixture = {version: 1, device: 'MOONDROP ECHO-B', name: 'history', description: 'original', output_gain_db: -16,
      filters: [{type: 'peak', frequency_hz: 94, gain_db: 4.3, q: .7},
        {type: 'peak', frequency_hz: 1000, gain_db: -3.2, q: 1}]};
    await page.goto(process.env.EDITOR_URL || 'http://127.0.0.1:8765/');await valid();
    await load(fixture);
    assert(await page.locator('#undo').isDisabled());assert(await page.locator('#redo').isDisabled());
    await handle().click();

    // A continuous input session is one edit; shortcuts work while editing.
    await gain().fill('5');await gain().pressSequentially('.6');await valid();
    await shortcut('Meta+z');assert.equal(Number(await gain().inputValue()), 4.3);
    assert.equal(await gain().evaluate(el => document.activeElement === el), true);
    await shortcut('Meta+Shift+z');assert.equal(Number(await gain().inputValue()), 5.6);
    await shortcut('Control+z');assert.equal(Number(await gain().inputValue()), 4.3);
    await shortcut('Control+y');assert.equal(Number(await gain().inputValue()), 5.6);
    await shortcut('Control+z');await shortcut('Control+Shift+z');
    assert.equal(Number(await gain().inputValue()), 5.6);
    // Empty numeric fields survive redo and can be undone without validation.
    await gain().blur();await gain().fill('');
    await page.keyboard.press('Meta+z');await valid();assert.equal(Number(await gain().inputValue()), 5.6);
    await page.keyboard.press('Meta+Shift+z');assert.equal(await gain().inputValue(), '');
    await page.keyboard.press('Meta+z');await valid();
    await page.locator('#undo').click();await valid();
    assert.deepEqual(await exportDoc(), fixture);
    await page.locator('#redo').click();await valid();
    // A new edit after undo clears the redo branch.
    await page.locator('#undo').click();await valid();await gain().fill('2.1');await valid();
    assert(await page.locator('#redo').isDisabled());

    // Continuous range and wheel events undo together, without losing Q.
    await load(fixture);await handle().click();
    await page.locator('#gain-slider-0').evaluate(el => {
      for (const value of ['5', '6', '7']) {el.value = value;el.dispatchEvent(new Event('input', {bubbles: true}));}
      el.dispatchEvent(new Event('change', {bubbles: true}));
    });await valid();
    await shortcut('Meta+z');assert.deepEqual(await exportDoc(), fixture);
    await shortcut('Meta+Shift+z');assert.equal(Number(await gain().inputValue()), 7);
    await load(fixture);await handle().click();
    await handle().evaluate(el => {
      for (let i = 0; i < 3; i++) el.dispatchEvent(new WheelEvent('wheel', {deltaY: -40, bubbles: true, cancelable: true}));
    });await valid();
    assert.equal(Number(await page.locator('#band-0-q').inputValue()), 1);
    await shortcut('Meta+z');assert.deepEqual(await exportDoc(), fixture);

    // Metadata, output, type/Q, deletion, and reset all share history.
    await load(fixture);await handle().click();
    await page.locator('#description').fill('新的备注');await valid();
    await shortcut('Meta+z');assert.equal(await page.locator('#description').inputValue(), 'original');
    await shortcut('Meta+Shift+z');assert.equal(await page.locator('#description').inputValue(), '新的备注');
    await page.locator('#output').fill('-20');await valid();
    await shortcut('Meta+z');assert.equal(Number(await page.locator('#output').inputValue()), -16);
    await page.locator('#type-0').selectOption('low_shelf');await valid();
    await shortcut('Meta+z');assert.equal(await page.locator('#type-0').inputValue(), 'peak');
    assert.equal(Number(await page.locator('#band-0-q').inputValue()), .7);
    await page.locator('#delete').click();await valid();assert.equal(await page.locator('.chart-handle').count(), 1);
    await shortcut('Meta+z');assert.equal(await page.locator('.chart-handle').count(), 2);
    assert.equal(Number(await gain().inputValue()), 4.3);
    await page.locator('#reset-eq').click();await valid();
    assert((await exportDoc()).filters.every(f => f.gain_db === 0));
    await page.locator('#undo').click();await valid();
    assert.deepEqual((await exportDoc()).filters, fixture.filters);
    await page.locator('#redo').click();await valid();
    assert((await exportDoc()).filters.every(f => f.gain_db === 0));

    // One uninterrupted drag makes one history entry, including a reorder.
    await load(fixture);await handle().scrollIntoViewIfNeeded();
    let box = await handle().boundingBox();
    await page.mouse.move(box.x + box.width / 2, box.y + box.height / 2);await page.mouse.down();
    for (let step = 1; step <= 12; step++) await page.mouse.move(box.x + box.width / 2 + step * 30, box.y + box.height / 2 - step * 2);
    await page.mouse.up();await valid();
    const dragged = await exportDoc();assert.notDeepEqual(dragged, fixture);
    await shortcut('Meta+z');assert.deepEqual(await exportDoc(), fixture);
    assert(await page.locator('#undo').isDisabled());
    await shortcut('Meta+Shift+z');assert.deepEqual(await exportDoc(), dragged);
    // Canceling a drag does not discard an existing redo branch.
    await shortcut('Meta+z');
    box = await handle().boundingBox();
    await page.mouse.move(box.x + box.width / 2, box.y + box.height / 2);await page.mouse.down();
    await page.mouse.move(box.x + box.width / 2 + 35, box.y + box.height / 2 - 10);
    await page.keyboard.press('Escape');await page.mouse.up();await valid();
    assert.deepEqual(await exportDoc(), fixture);assert.equal(await page.locator('#redo').isDisabled(), false);
    await shortcut('Meta+Shift+z');assert.deepEqual(await exportDoc(), dragged);

    // Sorting after typed frequency changes is part of the original edit.
    await load(fixture);await handle().click();
    await page.locator('#band-0-frequency_hz').fill('2000');await page.locator('#band-0-frequency_hz').blur();await valid();
    await shortcut('Meta+z');assert.deepEqual(await exportDoc(), fixture);
    await shortcut('Meta+Shift+z');assert.equal((await exportDoc()).filters[1].frequency_hz, 2000);
    await page.locator('#add').click();await valid();assert.equal(await page.locator('.chart-handle').count(), 3);
    await shortcut('Meta+z');assert.equal(await page.locator('.chart-handle').count(), 2);
    await shortcut('Meta+Shift+z');assert.equal(await page.locator('.chart-handle').count(), 3);

    // Browser Edit-menu events and IME protection.
    await page.locator('#name').fill('renamed');await valid();
    await page.locator('#name').evaluate(el => el.dispatchEvent(new KeyboardEvent('keydown', {key: 'z', metaKey: true, isComposing: true, bubbles: true, cancelable: true})));
    assert.equal(await page.locator('#name').inputValue(), 'renamed');
    await page.locator('#name').evaluate(el => el.dispatchEvent(new InputEvent('beforeinput', {inputType: 'historyUndo', bubbles: true, cancelable: true})));await valid();
    assert.equal(await page.locator('#name').inputValue(), 'history');
    await page.locator('#name').evaluate(el => el.dispatchEvent(new InputEvent('beforeinput', {inputType: 'historyRedo', bubbles: true, cancelable: true})));await valid();
    assert.equal(await page.locator('#name').inputValue(), 'renamed');

    // Device jobs block both buttons and keyboard history, without device I/O.
    await page.route('**/api/job', route => route.fulfill({json: {can_verify: false, job: {id: 'fake', action: 'apply', done: false, message: 'test busy'}}}));
    await page.locator('#undo').waitFor({state: 'visible'});
    await page.waitForFunction(() => document.querySelector('#undo').disabled && document.querySelector('#name').disabled);
    await page.keyboard.press('Meta+z');assert.equal(await page.locator('#name').inputValue(), 'renamed');
    await page.unroute('**/api/job');
    await page.waitForFunction(() => !document.querySelector('#name').disabled);

    await page.setViewportSize({width: 320, height: 1000});await page.locator('#undo').scrollIntoViewIfNeeded();
    assert.equal(await page.evaluate(() => document.documentElement.scrollWidth > innerWidth), false);
    await page.screenshot({path: '/tmp/echo-history-mobile.png', fullPage: true});
    await page.setViewportSize({width: 1440, height: 1100});await page.evaluate(() => scrollTo(0, 0));
    await page.screenshot({path: '/tmp/echo-history-desktop.png', fullPage: true});
    assert.deepEqual(errors, []);assert.deepEqual(deviceRequests, []);
    console.log('PASS: grouped input/drag, canceled drag with redo, sorting, add/delete/reset, invalid input, metadata/output/type/Q, Mac/Windows shortcuts, Edit-menu/IME, busy lock, focus, mobile; no USB requests.');
  } finally {await browser.close();}
})().catch(e => {console.error(e);process.exit(1);});
