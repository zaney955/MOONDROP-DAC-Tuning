// Offline browser regression. Never access USB or submit a device operation.
const {chromium}=require('playwright');
const assert=require('node:assert/strict');
(async()=>{const browser=await chromium.launch({headless:true,channel:'chrome'});try{
 const page=await browser.newPage({viewport:{width:1280,height:1000},acceptDownloads:true});
 const errors=[],deviceRequests=[];page.on('pageerror',e=>errors.push(e.message));page.on('dialog',d=>d.accept());
 for(const route of ['apply','read','verify'])await page.route(`**/api/${route}`,r=>{deviceRequests.push(route);return r.abort()});
 const valid=()=>page.locator('#validation').filter({hasText:'校验通过'}).waitFor();
 const exported=async()=>{const d=page.waitForEvent('download');await page.locator('#export').click();let txt='';for await(const x of await(await d).createReadStream())txt+=x;return JSON.parse(txt)};
 const url=process.env.EDITOR_URL||'http://127.0.0.1:8766';
 await page.goto(url);await valid();
 const bootstrap=await(await page.request.get(url+'/api/bootstrap')).json();
 assert(bootstrap.presets.length>0);assert(bootstrap.presets.every(x=>x.preset.output_gain_db===0));
 assert(bootstrap.presets.every(x=>/^echo-[ab]\//.test(x.id)&&x.id.split('/').length>=3));
 assert.equal(await page.locator('#output').inputValue(),'0');
 for(const model of ['MOONDROP ECHO-B','MOONDROP ECHO-A']){
  await page.locator('#device-model').selectOption(model);await page.locator('#new').click();await valid();
  assert.equal(await page.locator('#output').inputValue(),'');
  assert.equal(await page.locator('#output-slider').inputValue(),'0');
  let doc=await exported();assert.equal(doc.device,model);assert(!Object.hasOwn(doc,'output_gain_db'));
  const response=await page.request.post(url+'/api/preview',{data:doc,headers:{'X-Editor-Token':bootstrap.token}});
  assert.equal(response.status(),200);const preview=await response.json();assert(!Object.hasOwn(preview.preset,'output_gain_db'));assert.equal(preview.peak_db,0);
  await page.locator('#output').fill('0');doc=await exported();assert.equal(doc.output_gain_db,0);
  await page.locator('#output').fill('-12');doc=await exported();assert.equal(doc.output_gain_db,-12);
  await page.locator('#output').fill('');doc=await exported();assert(!Object.hasOwn(doc,'output_gain_db'));
  await page.locator('#undo').click();await valid();assert.equal(await page.locator('#output').inputValue(),'-12');
  await page.locator('#redo').click();await valid();assert.equal(await page.locator('#output').inputValue(),'');
  const imported={version:1,device:model,name:'省略增益导入',filters:[]};
  await page.locator('#file').setInputFiles({name:'optional.json',mimeType:'application/json',buffer:Buffer.from(JSON.stringify(imported))});
  await page.waitForFunction(()=>document.querySelector('#name').value==='省略增益导入');await valid();assert.deepEqual(await exported(),imported);
 }
 assert.deepEqual(errors,[]);assert.deepEqual(deviceRequests,[]);
 console.log('PASS: classified zero-gain library; A/B optional gain import/export, default unity, explicit zero/value, clearing, undo/redo; no USB operations.');
}finally{await browser.close()}})().catch(e=>{console.error(e);process.exitCode=1});
