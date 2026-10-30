// Optional Playwright regression for read-only recovery status synchronization.
// Device responses are simulated; no mutation reaches the running editor.
const {chromium} = require('playwright');
const assert = require('node:assert/strict');

(async () => {
  const browser = await chromium.launch({headless: true, channel: 'chrome'});
  try {
    const page = await browser.newPage({viewport: {width: 1280, height: 1000}});
    const mutations = [], errors = [];
    let phase = 0, polls = 0;
    page.on('pageerror', (error) => errors.push(error.message));
    page.on('request', (request) => {
      if (/\/api\/(apply|verify)$/.test(request.url())) mutations.push(request.url());
    });
    await page.route('**/api/job', (route) => {
      polls++;
      const readonly = phase >= 2;
      const done = phase === 1 || phase === 3;
      const message = ['连接失效，正在重新连接；仅只读复核', '已写入并保存，重新读取后验证通过',
        '后台只读复核正在进行', '后台只读复核已通过'][phase];
      return route.fulfill({json: {can_verify: true, job: {
        id: readonly ? 'external-readonly' : 'apply-recovery', action: readonly ? 'verify' : 'apply',
        done, error: null, run: '/tmp/recovery-fixture', message, device_status: {
          stage: done ? 'complete' : 'after_read', status: done ? (readonly ? 'readback_verified' : 'saved_verified') : 'running',
          write_attempted: !readonly, save_command_acknowledged: !readonly, readback_verified: done,
          readback_recovered: done, read_reconnect_attempts: 1, message,
        },
      }}});
    });
    await page.goto(process.env.EDITOR_URL || 'http://127.0.0.1:8765/');
    await page.locator('#job-summary').filter({hasText: '正在重新连接'}).waitFor();
    assert.equal(await page.locator('#apply').isDisabled(), true);
    phase = 1;
    await page.locator('#job-summary').filter({hasText: '重新读取后验证通过'}).waitFor();
    assert.match(await page.locator('#job-detail').textContent(), /saved_verified/);
    assert.match(await page.locator('#job-detail').textContent(), /读回：通过/);
    assert.match(await page.locator('#job-detail').textContent(), /只读重新连接：1 次/);
    assert.equal(await page.locator('#apply').isDisabled(), false);
    phase = 2;
    await page.locator('#job-summary').filter({hasText: '后台只读复核正在进行'}).waitFor();
    phase = 3;
    await page.locator('#job-summary').filter({hasText: '后台只读复核已通过'}).waitFor();
    assert.match(await page.locator('#job-detail').textContent(), /readback_verified/);
    assert.match(await page.locator('#job-detail').textContent(), /写入已启动：否/);
    assert(polls >= 4);
    assert.deepEqual(mutations, []);
    assert.deepEqual(errors, []);
    console.log('PASS: reconnect progress -> verified UI, idle polling follows external read-only verification, controls unlock, no automatic mutation.');
  } finally {
    await browser.close();
  }
})().catch((error) => { console.error(error); process.exitCode = 1; });
