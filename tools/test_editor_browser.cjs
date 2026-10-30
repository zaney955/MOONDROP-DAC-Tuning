// Optional browser regression: run against tools/editor.py with Playwright on NODE_PATH.
// All actions edit drafts; this test never calls device apply/verify.
const {chromium}=require('playwright');
const assert=require('node:assert/strict');
(async()=>{
 const browser=await chromium.launch({headless:true,channel:'chrome'});
 try {
 const page=await browser.newPage({viewport:{width:1440,height:1100}});
 const errors=[],device=[];
 let previews=0,inflight=0,maxInflight=0;
 page.on('pageerror',e=>errors.push(e.message));
 page.on('request',r=>{if(/\/api\/(apply|verify)$/.test(r.url()))device.push(r.url());});
 page.on('dialog',d=>d.accept());
 await page.goto((process.env.EDITOR_URL || 'http://127.0.0.1:8765/'));
 const valid=()=>page.locator('#validation').filter({hasText:'校验通过'}).waitFor();
 await valid();
 await page.locator('#new').click();await valid();
 await page.locator('#add').click();
 await valid();
 const handle=()=>page.locator('.chart-handle[data-band="0"]');
 const center=async()=>{
  await handle().scrollIntoViewIfNeeded();
  const b=await handle().locator('.dot').boundingBox();
  return {x:b.x+b.width/2,y:b.y+b.height/2};
 };
 const values=async()=>({f:Number(await page.locator('#band-0-frequency_hz').inputValue()),g:Number(await page.locator('#band-0-gain_db').inputValue())});
 await page.route('**/api/preview',async route=>{
  previews++;inflight++;maxInflight=Math.max(maxInflight,inflight);
  try{const response=await route.fetch();await new Promise(r=>setTimeout(r,70));await route.fulfill({response});}finally{inflight--;}
 });
 // Fractional number input, native slider keyboard steps, export and import.
 const gainInput=page.locator('#band-0-gain_db'),gainSlider=page.locator('#gain-slider-0');
 assert.equal(await gainInput.getAttribute('step'),'0.1');
 assert.equal(await gainSlider.getAttribute('step'),'0.1');
 await gainInput.fill('-1.9');await valid();
 assert.equal(Number(await gainSlider.inputValue()),-1.9);
 await gainSlider.focus();await page.keyboard.press('ArrowRight');await valid();
 assert.equal((await values()).g,-1.8);
 await gainInput.fill('0.05');
 assert.equal(await gainInput.evaluate(el=>el.validity.stepMismatch),true);
 await gainInput.fill('0.3');await valid();
 const fractionalDownloadPromise=page.waitForEvent('download');
 await page.locator('#export').click();
 const fractionalDownload=await fractionalDownloadPromise;
 const stream=await fractionalDownload.createReadStream();let json='';
 for await (const chunk of stream) json+=chunk.toString();
 const fractionalExport=JSON.parse(json);assert.equal(fractionalExport.filters[0].gain_db,.3);
 await gainInput.fill('-2.7');await valid();
 await page.locator('#file').setInputFiles({name:'fractional.json',mimeType:'application/json',buffer:Buffer.from(json)});
 await page.locator('#notice').filter({hasText:'已导入'}).waitFor();
 assert.equal(await page.locator('.band-row').count(),0);
 await handle().click();
 await page.waitForFunction(()=>Number(document.querySelector('#band-0-gain_db').value)===.3);
 await valid();assert.equal((await values()).g,.3);
 await gainInput.fill('0');await valid();
 const start=await center();
 // Capture the root SVG, keep redrawing throughout one uninterrupted drag.
 await page.mouse.move(start.x+4,start.y+3);
 await page.mouse.down();
 await page.waitForTimeout(50);
 assert.deepEqual(await values(),{f:1000,g:0},'off-center grab must not change values');
 for(let i=1;i<=12;i++){
  await page.mouse.move(start.x+4+80*i/12,start.y+3-35*i/12);
  await page.waitForTimeout(30);
 }
 const during=await values();
 assert(during.f>1000&&during.g>0,JSON.stringify(during));
 assert.equal(during.g,Math.round(during.g*10)/10);
 assert.notEqual(during.g,Math.round(during.g),'mouse drag must retain sub-dB gain');
 assert.equal(await page.locator('.chart-handle.dragging').count(),1);
 assert.equal(await page.locator('#chart-wrap').evaluate(el=>el.hasPointerCapture(1)),true);
 assert(previews>=2,'continuous gesture must request live curves');
 assert(maxInflight<=1,`expected single request in flight, got ${maxInflight}`);
 await page.mouse.up();
 await valid();
 assert.equal(await page.locator('.dragging').count(),0);
 assert.equal(await page.locator('#frequency-slider-0').getAttribute('aria-valuetext'),`${during.f} Hz`);
 assert.equal(Number(await page.locator('#gain-slider-0').inputValue()),during.g);
 // Dragging off the plot clamps the frequency at both exact endpoints.
 let p=await center(); await page.mouse.move(p.x,p.y);await page.mouse.down();
 await page.mouse.move(-200,p.y); assert.equal((await values()).f,20);
 await page.mouse.move(2000,p.y); assert.equal((await values()).f,20000);
 await page.keyboard.press('Escape'); await page.mouse.up();await valid();
 assert.deepEqual(await values(),during,'Escape restores the whole gesture');
 // Keyboard and focus must survive chart reconstruction after compiler replies.
 await handle().focus();await page.keyboard.press('ArrowRight');await valid();
 assert.equal((await values()).f,during.f+1);
 assert.equal(await handle().evaluate(el=>document.activeElement===el),true);
 await page.keyboard.press('ArrowUp');await valid();
 assert.equal((await values()).g,Math.round((during.g+.1)*10)/10);
 await page.keyboard.press('Shift+ArrowDown');await valid();
 assert.equal((await values()).g,Math.round((during.g-.9)*10)/10);
 // Wheel Q editing changes bandwidth, preserving frequency/gain and page position.
 const qField=()=>page.locator('#band-0-q');
 const qValue=async()=>Number(await qField().inputValue());
 const frequencyGain=await values();
 const beforeCurve=await page.locator('.band-curve').first().getAttribute('d');
 p=await center();await page.mouse.move(p.x,p.y);
 const scrollBefore=await page.evaluate(()=>scrollY);
 await page.mouse.wheel(0,-120);
 await page.waitForFunction(()=>Number(document.querySelector('#band-0-q').value)>1);
 await valid();
 assert.equal(await qValue(),1.3);
 assert.deepEqual(await values(),frequencyGain);
 assert.equal(await page.evaluate(()=>scrollY),scrollBefore);
 assert.notEqual(await page.locator('.band-curve').first().getAttribute('d'),beforeCurve);
 assert.match(await handle().getAttribute('aria-label'),/Q 1.3/);
 await page.mouse.wheel(0,120);
 await page.waitForFunction(()=>Number(document.querySelector('#band-0-q').value)===1);
 await valid();
 assert.equal(await qValue(),1);
 await page.keyboard.down('Shift');await page.mouse.wheel(0,-120);await page.keyboard.up('Shift');
 await page.waitForFunction(()=>Number(document.querySelector('#band-0-q').value)>1);
 await valid();assert.equal(await qValue(),1.03);
 // Normalize line/page deltas and accumulate tiny trackpad movements.
 await qField().fill('1');await valid();
 await handle().dispatchEvent('wheel',{deltaY:-3,deltaMode:1,bubbles:true,cancelable:true});
 assert.equal(await qValue(),1.1);await valid();
 await qField().fill('1');await valid();
 await handle().dispatchEvent('wheel',{deltaY:-1,deltaMode:2,bubbles:true,cancelable:true});
 assert.equal(await qValue(),1.9);await valid();
 await qField().fill('1');await valid();
 for(let i=0;i<4;i++)await handle().dispatchEvent('wheel',{deltaY:-10,deltaMode:0,bubbles:true,cancelable:true});
 assert.equal(await qValue(),1.1);await valid();
 await qField().fill('9.99');await valid();
 await handle().dispatchEvent('wheel',{deltaY:-120,bubbles:true,cancelable:true});
 assert.equal(await qValue(),10);await valid();
 await qField().fill('.11');await valid();
 await handle().dispatchEvent('wheel',{deltaY:120,bubbles:true,cancelable:true});
 assert.equal(await qValue(),.1);await valid();
 await handle().dispatchEvent('wheel',{deltaY:-120,ctrlKey:true,bubbles:true,cancelable:true});
 assert.equal(await qValue(),.1,'browser zoom must not adjust Q');
 await handle().dispatchEvent('wheel',{deltaY:0,deltaX:120,bubbles:true,cancelable:true});
 assert.equal(await qValue(),.1,'horizontal wheel must not adjust Q');
 // Export the wheel-adjusted Q as an ordinary preset field.
 await qField().fill('1');await valid();
 await handle().dispatchEvent('wheel',{deltaY:-120,bubbles:true,cancelable:true});await valid();
 const qDownloadPromise=page.waitForEvent('download');await page.locator('#export').click();
 const qDownload=await qDownloadPromise;
 const qExported=JSON.parse(await require('node:fs/promises').readFile(await qDownload.path(),'utf8'));
 assert.equal(qExported.filters[0].q,1.3);
 assert.equal(qExported.filters[0].frequency_hz,frequencyGain.f);
 // The surrounding chart continues to scroll the document normally.
 await page.locator('.response .section-head').hover();
 const oldScroll=await page.evaluate(()=>scrollY);await page.mouse.wheel(0,150);
 await page.waitForFunction(old=>scrollY>old,oldScroll);
 // Shelf center moves at half the requested dB: still edits whole filter gain.
 await page.locator('#band-0-gain_db').fill('0');
 await page.locator('#type-0').selectOption('low_shelf');await valid();
 await handle().dispatchEvent('wheel',{deltaY:-120,bubbles:true,cancelable:true});
 assert.equal(await qValue(),1,'shelf slope must stay fixed');
 const shelfBefore=await values();p=await center();
 await page.mouse.move(p.x,p.y);await page.mouse.down();
 await page.mouse.move(p.x,p.y-20);const shelfDuring=await values();
 assert(shelfDuring.g>shelfBefore.g);
 assert.equal(shelfDuring.g,Math.round(shelfDuring.g*10)/10);
 // Browser pointer cancellation restores values and releases captured gesture.
 await page.locator('#chart-wrap').dispatchEvent('pointercancel',{pointerId:1,isPrimary:true,pointerType:'mouse'});
 await page.mouse.up();await valid();
 assert.deepEqual(await values(),shelfBefore);
 assert.equal(await page.locator('.dragging').count(),0);
 // Requests returning after release cannot replace the final validation result.
 await page.waitForTimeout(180);assert.match(await page.locator('#validation').textContent(),/校验通过/);
 assert.equal(device.length,0,'dragging and keyboard edits must never call USB routes');
 assert.deepEqual(errors,[]);
 // The graph and inspector form one surface; only the selected filter exists
 // in the parameter panel. Configuration details follow; write stays last.
 const selectionFixture={version:1,device:'MOONDROP ECHO-B',name:'selection-regression',output_gain_db:-20,
  filters:[{type:'peak',frequency_hz:150,gain_db:-2,q:.9},{type:'peak',frequency_hz:1000,gain_db:1,q:.8},{type:'peak',frequency_hz:3000,gain_db:-1,q:1.2}]};
 await page.locator('#file').setInputFiles({name:'selection.json',mimeType:'application/json',buffer:Buffer.from(JSON.stringify(selectionFixture))});
 await page.locator('#notice').filter({hasText:'已导入 selection.json'}).waitFor();await valid();
 assert.equal(await page.locator('.chart-handle').count(),3);
 assert.equal(await page.locator('.band-row').count(),0);
 assert.equal(await page.locator('#delete').isDisabled(),true);
 assert.equal(await page.locator('.response #chart').count(),1);
 assert.equal(await page.locator('.response #bands').count(),1);
 assert.equal(await page.locator('.response #output').count(),1);
 assert.equal(await page.locator('#settings').evaluate(el=>el.lastElementChild.classList.contains('apply-bar')),true);
 await page.locator('.chart-handle[data-band="1"]').click();
 assert.equal(await page.locator('.band-row').count(),1);
 assert.equal(await page.locator('#band-0-frequency_hz').count(),0);
 assert.equal(await page.locator('#band-1-frequency_hz').inputValue(),'1000');
 assert.equal(await page.locator('.chart-handle[aria-pressed="true"]').getAttribute('data-band'),'1');
 await page.locator('#band-1-frequency_hz').fill('2836');
 await page.locator('#band-1-gain_db').fill('.3');
 await page.locator('#output').fill('-18.5');await valid();
 await page.locator('.chart-handle[data-band="0"]').click();
 await page.locator('#band-0-frequency_hz').fill('');
 await page.locator('.chart-handle[data-band="1"]').click();
 assert.equal(await page.locator('#band-1-frequency_hz').inputValue(),'2836');
 assert.equal(await page.locator('.chart-handle[data-band="0"]').count(),1,'incomplete filter must remain selectable');
 await page.locator('#export').click();
 assert.equal(await page.locator('.chart-handle[aria-pressed="true"]').getAttribute('data-band'),'0');
 assert.equal(await page.locator('#band-0-frequency_hz').inputValue(),'');
 await page.locator('#band-0-frequency_hz').fill('150');await valid();
 for(let i=3;i<8;i++){await page.locator('#add').click();await valid();}
 assert.equal(await page.locator('.chart-handle').count(),8);
 assert.equal(await page.locator('.band-row').count(),1);
 assert.equal(await page.locator('#add').isDisabled(),true);
 const newestIndex=await page.locator('.chart-handle[aria-pressed="true"]').getAttribute('data-band');
 assert.equal(await page.locator(`#band-${newestIndex}-frequency_hz`).count(),1);
 for(let i=7;i>=0;i--){
  await page.locator(`.chart-handle[data-band="${i}"]`).focus();await page.keyboard.press('Enter');
  await page.locator('#delete').click();await valid();
  assert.equal(await page.locator('.band-row').count(),0);
 }
 assert.equal(await page.locator('.chart-handle').count(),0);
 assert.equal(await page.locator('#delete').isDisabled(),true);
 assert.equal(await page.locator('#output').inputValue(),'-18.5');
 await page.locator('#add').click();await valid();
 assert.equal(await page.locator('#band-0-frequency_hz').count(),1);
 assert.equal(device.length,0,'select/add/delete/output edits must never start device operations');
 assert.deepEqual(errors,[]);
 // Real touch input through CDP validates touch-action and pointer capture.
 const touch=await browser.newPage({viewport:{width:390,height:1000},hasTouch:true,isMobile:true});
 touch.on('dialog',d=>d.accept());
 touch.on('pageerror',e=>errors.push(e.message));
 await touch.goto((process.env.EDITOR_URL || 'http://127.0.0.1:8765/'));
 await touch.locator('#validation').filter({hasText:'校验通过'}).waitFor();
 await touch.locator('#add').click();await touch.locator('#validation').filter({hasText:'校验通过'}).waitFor();
 await touch.locator('#chart').scrollIntoViewIfNeeded();
 const b=await touch.locator('.dot').boundingBox(),x=b.x+b.width/2,y=b.y+b.height/2;
 const cdp=await touch.context().newCDPSession(touch);
 await cdp.send('Input.dispatchTouchEvent',{type:'touchStart',touchPoints:[{x,y}]});
 const touchGains=[];
 for(let i=1;i<=6;i++){
  await cdp.send('Input.dispatchTouchEvent',{type:'touchMove',touchPoints:[{x:x+20*i/6,y:y-23*i/6}]});
  await touch.waitForTimeout(40);
  touchGains.push(Number(await touch.locator('#band-0-gain_db').inputValue()));
 }
 const touchF=Number(await touch.locator('#band-0-frequency_hz').inputValue());
 const touchG=Number(await touch.locator('#band-0-gain_db').inputValue());
 assert(touchF>1000&&touchG>0,`touch ${touchF},${touchG}`);
 assert.equal(touchG,Math.round(touchG*10)/10);
 assert(touchGains.some(g=>g!==Math.round(g)),'touch drag must retain sub-dB gain');
 assert(touchGains.every(g=>g===Math.round(g*10)/10),'touch gain uses 0.1 dB steps');
 await cdp.send('Input.dispatchTouchEvent',{type:'touchEnd',touchPoints:[]});
 await touch.locator('#validation').filter({hasText:'校验通过'}).waitFor();
 assert.equal(await touch.locator('.dragging').count(),0);
 assert.equal(await touch.evaluate(()=>document.documentElement.scrollWidth>innerWidth),false);
 assert.deepEqual(errors,[]);
 console.log('PASS: graph-first single-filter selection, integrated output/add/delete, 8 bands, incomplete input recovery, write-last layout, fractional import/export, mouse/touch drag, wheel Q, keyboard/cancel, no USB operations.');
 } finally { await browser.close(); }
})().catch(e=>{console.error(e);process.exit(1)});
