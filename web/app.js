'use strict';

const $ = (selector) => document.querySelector(selector);
const colors = ['#66824d', '#b6853a', '#65898b', '#9b7587', '#897f46', '#6c78a4', '#ad795d', '#7f8c6a'];
let token, doc, baseline, previewData, revision = 0, validatedRevision = -1, timer;
let busy = false, canVerify = false, activeJob = null, activePreset = null;
let lastError = '', showErrors = false;
let chartGeometry, chartDrag = null, dragPreviewTimer, dragPreviewInFlight = false;
let qWheelInput = null;
const formatDb = (v) => `${v > 0 ? '+' : ''}${v.toFixed(2)} dB`;
const clone = (value) => JSON.parse(JSON.stringify(value));
const dirty = () => doc && JSON.stringify(doc) !== baseline;
const clientVersion = document.querySelector('meta[name="editor-version"]')?.content || '';
const reloadDraftKey = 'echo-b-editor-reload-draft-v1';
let autoReloading = false, pendingVersion = null, reloadWaiting = false, initialized = false;
let lastEditAt = 0, lastReloadError = '';

function notify(message = '', error = false) {
  $('#notice').textContent = message;
  $('#notice').classList.toggle('error', error);
}

async function api(path, value) {
  if (reloadWaiting && ['/api/apply', '/api/verify'].includes(path)) throw new Error('代码正在更新，请等待页面恢复后再操作');
  const options = value === undefined ? {} : {method: 'POST', headers: {
    'Content-Type': 'application/json', 'X-Editor-Token': token, 'X-Editor-Version': clientVersion,
  }, body: JSON.stringify(value)};
  const response = await fetch(path, options);
  const result = await response.json();
  const serverVersion = response.headers.get('X-Editor-Version');
  if (clientVersion && serverVersion && serverVersion !== clientVersion) {
    pendingVersion = serverVersion;
    tryAutoReload();
    if (value !== undefined) throw new Error('服务代码已更新，正在恢复草稿并重载页面');
  }
  if (!response.ok) throw new Error(result.error || `请求失败 (${response.status})`);
  return result;
}

function tryAutoReload() {
  if (!pendingVersion || !initialized || autoReloading || busy || chartDrag || performance.now() - lastEditAt < 600) return;
  try {
    const rawValues = Object.fromEntries([...$('#settings').querySelectorAll('input,textarea,select')]
      .filter((control) => control.id).map((control) => [control.id, control.value]));
    sessionStorage.setItem(reloadDraftKey, JSON.stringify({schema: 1, doc, baseline, activePreset, rawValues,
      rate: $('#rate').value, scrollY, focusId: document.activeElement?.id,
      focusedBand: document.activeElement?.dataset?.band}));
  } catch {
    notify('代码已更新，但浏览器无法暂存草稿。请先导出配置，再手动刷新页面。', true);
    return;
  }
  autoReloading = true;
  window.location.reload();
}

async function watchServerVersion() {
  try {
    const response = await fetch('/api/version', {cache: 'no-store'});
    if (!response.ok) throw new Error('版本检查暂不可用');
    const state = await response.json();
    reloadWaiting = state.reloading;
    if (state.error && state.error !== lastReloadError) {
      notify(`代码更新暂未加载，继续使用原版本：${state.error}`, true);
    }
    lastReloadError = state.error || '';
    if (state.version !== clientVersion) pendingVersion = state.version;
    $('#apply').disabled = busy || reloadWaiting;
    $('#verify').disabled = busy || !canVerify || reloadWaiting;
    tryAutoReload();
  } catch {
    // The listening socket may briefly disappear during exec. Never resend a
    // device mutation: only retry this read-only version check.
  } finally {
    if (!autoReloading) setTimeout(watchServerVersion, 700);
  }
}

function recoverReloadDraft() {
  let saved;
  try { saved = JSON.parse(sessionStorage.getItem(reloadDraftKey)); } catch { return false; }
  if (saved?.schema !== 1 || saved.doc?.device !== 'MOONDROP ECHO-B'
    || !Array.isArray(saved.doc.filters) || saved.doc.filters.length > 8) return false;
  setDocument(saved.doc, saved.activePreset);
  baseline = typeof saved.baseline === 'string' ? saved.baseline : JSON.stringify(doc);
  Object.entries(saved.rawValues || {}).forEach(([id, value]) => {
    const control = document.getElementById(id);
    if (control && $('#settings').contains(control)) control.value = value;
  });
  if ([...$('#rate').options].some((option) => option.value === saved.rate)) $('#rate').value = saved.rate;
  changed();
  sessionStorage.removeItem(reloadDraftKey);
  notify('代码已更新，已恢复当前草稿；尚未写入耳放。');
  requestAnimationFrame(() => {
    const focus = document.getElementById(saved.focusId) || (saved.focusedBand != null
      ? $('#chart-handles').querySelector(`[data-band="${saved.focusedBand}"]`) : null);
    focus?.focus({preventScroll: true});
    window.scrollTo(0, saved.scrollY || 0);
  });
  return true;
}

function discardAllowed() {
  return !dirty() || window.confirm('当前配置有未导出的修改，是否放弃这些修改？');
}

function setDocument(value, presetId = null) {
  finishChartDrag(true);
  qWheelInput = null;
  doc = clone(value);
  baseline = JSON.stringify(doc);
  activePreset = presetId;
  $('#name').value = doc.name;
  $('#description').value = doc.description || '';
  $('#output').value = doc.output_gain_db;
  $('#output-slider').value = doc.output_gain_db;
  renderBands();
  showErrors = false;
  changed();
}

function changed() {
  lastEditAt = performance.now();
  revision++;
  validatedRevision = -1;
  lastError = '';
  $('#draft-state').textContent = dirty() ? '未导出的修改' : '编辑草稿';
  $('#curve-state').textContent = '正在更新预览…';
  $('#validation').className = '';
  $('#validation').textContent = '正在校验五种采样率…';
  $('#add').disabled = doc.filters.length >= 8 || busy;
  $('#band-count').textContent = `${doc.filters.length} / 8`;
  document.querySelectorAll('.preset').forEach((button) => {
    button.setAttribute('aria-pressed', String(button.dataset.id === activePreset));
  });
  clearTimeout(timer);
  if (chartDrag) scheduleDragPreview();
  else timer = setTimeout(() => validateCurrent(), 120);
}

function validationError(error) {
  lastError = error.message;
  $('#validation').className = showErrors ? 'error' : '';
  $('#validation').textContent = showErrors ? `校验未通过：${lastError}` : '参数尚未通过校验，完成输入后查看提示。';
  $('#curve-state').textContent = '当前参数无有效曲线 · 图中保留上次有效预览';
}

async function validateCurrent() {
  const currentRevision = revision;
  try {
    if (!$('#settings').checkValidity()) throw new Error('请检查名称和数值范围：频率 20–20000 整数 Hz，单段增益按 0.1 dB 步进，Q 为 0.1–10。');
    const result = await api('/api/preview', clone(doc));
    if (currentRevision !== revision) return false;
    previewData = result;
    validatedRevision = currentRevision;
    lastError = '';
    const clipping = result.peak_db > 0;
    $('#validation').className = clipping ? 'warning' : '';
    $('#validation').textContent = clipping
      ? `五种采样率校验通过。组合峰值 ${formatDb(result.peak_db)}，满幅输入可能削波，请降低音源电平或调整 EQ。`
      : `✓ 五种采样率校验通过 · 组合峰值 ${formatDb(result.peak_db)}。数字模型不保证滤波级内部余量。`;
    result.quantized_q.forEach((q, i) => {
      const note = $(`#q-note-${i}`);
      if (note && doc.filters[i].type === 'peak') note.textContent = `实际 Q ${q}`;
    });
    drawChart();
    return true;
  } catch (error) {
    if (currentRevision === revision) validationError(error);
    return false;
  }
}

async function requireValid() {
  showErrors = true;
  if (!$('#settings').reportValidity()) return false;
  clearTimeout(timer);
  if (validatedRevision !== revision && !await validateCurrent()) return false;
  return validatedRevision === revision;
}

function makeInput(id, name, attributes = {}) {
  const input = document.createElement('input');
  input.id = id;
  input.name = name;
  Object.entries(attributes).forEach(([key, value]) => input.setAttribute(key, value));
  return input;
}

function numberField(index, property, title, attributes, unit) {
  const wrapper = document.createElement('div');
  wrapper.className = `${property === 'gain_db' ? 'gain' : property === 'q' ? 'q' : 'frequency'}-field`;
  const id = `band-${index}-${property}`;
  const label = document.createElement('label');
  label.htmlFor = id;
  label.textContent = title;
  const input = makeInput(id, id, {type: 'number', required: '', ...attributes});
  input.value = doc.filters[index][property];
  const container = document.createElement('div');
  container.className = 'unit-input';
  container.append(input);
  if (unit) {
    const suffix = document.createElement('span');
    suffix.textContent = unit;
    container.append(suffix);
  }
  wrapper.append(label, container);
  input.addEventListener('input', () => {
    qWheelInput = null;
    const value = input.value === '' ? NaN : input.valueAsNumber;
    doc.filters[index][property] = value;
    changed();
  });
  return {wrapper, input};
}

function renderBands(focusIndex = null) {
  finishChartDrag(true);
  qWheelInput = null;
  const root = $('#bands');
  root.replaceChildren();
  if (doc.filters.length === 0) {
    const empty = document.createElement('div');
    empty.className = 'empty';
    const title = document.createElement('b');
    title.textContent = '一条平直的起点';
    empty.append(title, '添加一段滤波器，在 20–20000 Hz 之间自由调节。');
    root.append(empty);
  }
  doc.filters.forEach((filter, index) => {
    const row = document.createElement('div');
    row.className = 'band-row';
    row.setAttribute('role', 'group');
    row.setAttribute('aria-label', `第 ${index + 1} 段滤波器`);
    const badge = document.createElement('span');
    badge.className = 'band-number';
    badge.style.background = colors[index];
    badge.textContent = index + 1;
    const typeGroup = document.createElement('div');
    const typeLabel = document.createElement('label');
    typeLabel.htmlFor = `type-${index}`;
    typeLabel.textContent = '滤波器类型';
    const select = document.createElement('select');
    select.id = select.name = `type-${index}`;
    [['peak', '峰值 Peak'], ['low_shelf', '低架 Low shelf'], ['high_shelf', '高架 High shelf']].forEach(([value, text]) => select.add(new Option(text, value)));
    select.value = filter.type;
    select.addEventListener('change', () => {
      filter.type = select.value;
      if (filter.type !== 'peak') filter.q = 1;
      renderBands();
      $(`#type-${index}`).focus();
      changed();
    });
    typeGroup.append(typeLabel, select);
    const freq = numberField(index, 'frequency_hz', '频率 · 20–20000 Hz', {min: 20, max: 20000, step: 1}, 'Hz');
    const freqSlider = makeInput(`frequency-slider-${index}`, `frequency-slider-${index}`, {type: 'range', min: 0, max: 1, step: 'any', 'aria-label': `第 ${index + 1} 段频率滑块（20–20000 Hz）`});
    freqSlider.value = Math.log(filter.frequency_hz / 20) / Math.log(1000);
    freqSlider.setAttribute('aria-valuetext', `${filter.frequency_hz} Hz`);
    freqSlider.addEventListener('input', () => {
      filter.frequency_hz = Math.round(20 * 1000 ** Number(freqSlider.value));
      freq.input.value = filter.frequency_hz;
      freqSlider.setAttribute('aria-valuetext', `${filter.frequency_hz} Hz`);
      changed();
    });
    // Arrow keys adjust exact integer Hz, rather than the logarithmic slider's
    // default percentage step. The number field also accepts every integer Hz.
    freqSlider.addEventListener('keydown', (event) => {
      const direction = {ArrowLeft: -1, ArrowDown: -1, ArrowRight: 1, ArrowUp: 1}[event.key];
      if (!direction) return;
      event.preventDefault();
      filter.frequency_hz = Math.max(20, Math.min(20000, filter.frequency_hz + direction * (event.shiftKey ? 100 : 1)));
      freq.input.value = filter.frequency_hz;
      freqSlider.value = Math.log(filter.frequency_hz / 20) / Math.log(1000);
      freqSlider.setAttribute('aria-valuetext', `${filter.frequency_hz} Hz`);
      changed();
    });
    freq.input.addEventListener('input', () => {
      if (freq.input.validity.valid) {
        freqSlider.value = Math.log(filter.frequency_hz / 20) / Math.log(1000);
        freqSlider.setAttribute('aria-valuetext', `${filter.frequency_hz} Hz`);
      }
    });
    freq.wrapper.append(freqSlider);
    const gain = numberField(index, 'gain_db', '增益', {step: .1}, 'dB');
    const gainSlider = makeInput(`gain-slider-${index}`, `gain-slider-${index}`, {type: 'range', step: .1, 'aria-label': `第 ${index + 1} 段增益滑块（dB）`});
    function syncGain() {
      gainSlider.min = Math.min(-24, filter.gain_db || 0);
      gainSlider.max = Math.max(24, filter.gain_db || 0);
      gainSlider.value = filter.gain_db;
    }
    syncGain();
    gainSlider.addEventListener('input', () => {
      filter.gain_db = Number(gainSlider.value);
      gain.input.value = filter.gain_db;
      changed();
    });
    gain.input.addEventListener('input', () => {
      if (gain.input.validity.valid) syncGain();
    });
    gain.wrapper.append(gainSlider);
    const q = numberField(index, 'q', filter.type === 'peak' ? 'Q 值' : '架式斜率 S', {min: .1, max: 10, step: 'any'}, '');
    q.input.disabled = filter.type !== 'peak';
    const note = document.createElement('p');
    note.id = `q-note-${index}`;
    note.className = 'q-note';
    note.textContent = filter.type === 'peak' ? '按 1/256 量化' : '固定 S=1';
    q.input.setAttribute('aria-describedby', note.id);
    q.wrapper.append(note);
    const remove = document.createElement('button');
    remove.className = 'remove';
    remove.type = 'button';
    remove.textContent = '×';
    remove.setAttribute('aria-label', `删除第 ${index + 1} 段滤波器`);
    remove.addEventListener('click', () => {
      doc.filters.splice(index, 1);
      renderBands(Math.min(index, doc.filters.length - 1));
      if (!doc.filters.length) $('#add').focus();
      changed();
    });
    row.append(badge, typeGroup, freq.wrapper, gain.wrapper, q.wrapper, remove);
    root.append(row);
  });
  if (focusIndex !== null && focusIndex >= 0) $(`#type-${focusIndex}`).focus();
  setBusy(busy);
}

function svgElement(name, attributes = {}, content) {
  const element = document.createElementNS('http://www.w3.org/2000/svg', name);
  Object.entries(attributes).forEach(([key, value]) => element.setAttribute(key, value));
  if (content !== undefined) element.textContent = content;
  return element;
}

function syncChartFilter(index, frequency, gain) {
  const filter = doc.filters[index];
  frequency = Math.max(20, Math.min(20000, Math.round(frequency)));
  gain = Math.round(gain * 10) / 10;
  if (frequency === filter.frequency_hz && gain === filter.gain_db) return false;
  filter.frequency_hz = frequency;
  filter.gain_db = gain;
  $(`#band-${index}-frequency_hz`).value = frequency;
  $(`#band-${index}-gain_db`).value = gain;
  const frequencySlider = $(`#frequency-slider-${index}`);
  frequencySlider.value = Math.log(frequency / 20) / Math.log(1000);
  frequencySlider.setAttribute('aria-valuetext', `${frequency} Hz`);
  const gainSlider = $(`#gain-slider-${index}`);
  gainSlider.min = Math.min(-24, gain);
  gainSlider.max = Math.max(24, gain);
  gainSlider.value = gain;
  changed();
  return true;
}

function scheduleDragPreview() {
  // Throttle rather than debounce: keep updating the curve during a long drag,
  // with at most one compiler request in flight and one queued latest state.
  if (dragPreviewTimer || dragPreviewInFlight) return;
  dragPreviewTimer = setTimeout(async () => {
    dragPreviewTimer = null;
    const gesture = chartDrag;
    if (!gesture) return;
    const requestedRevision = revision;
    dragPreviewInFlight = true;
    try {
      const result = await api('/api/preview', clone(doc));
      if (chartDrag !== gesture) return;
      previewData = result;
      drawChart();
    } catch (error) {
      if (chartDrag === gesture && requestedRevision === revision) validationError(error);
    } finally {
      dragPreviewInFlight = false;
      if (chartDrag && revision !== requestedRevision) scheduleDragPreview();
    }
  }, 50);
}

function chartPosition(event, geometry) {
  const svg = $('#chart');
  const rect = svg.getBoundingClientRect();
  return {x: (event.clientX - rect.left) * geometry.width / rect.width,
    y: (event.clientY - rect.top) * 310 / rect.height};
}

function finishChartDrag(cancelled = false) {
  if (!chartDrag) return;
  const gesture = chartDrag;
  chartDrag = null;
  clearTimeout(dragPreviewTimer);
  dragPreviewTimer = null;
  const surface = $('#chart-wrap');
  if (surface.hasPointerCapture(gesture.pointerId)) surface.releasePointerCapture(gesture.pointerId);
  if (cancelled && doc.filters[gesture.index]) syncChartFilter(gesture.index, gesture.frequency, gesture.gain);
  showErrors = true;
  clearTimeout(timer);
  drawChart();
  void validateCurrent();
}

$('#chart-wrap').addEventListener('pointerdown', (event) => {
  const handle = event.target.closest('.chart-handle');
  if (!handle || busy || chartDrag || event.button !== 0 || !event.isPrimary || !chartGeometry) return;
  const index = Number(handle.dataset.band);
  const filter = doc.filters[index];
  if (!Number.isFinite(filter.frequency_hz) || !Number.isFinite(filter.gain_db)) return;
  event.preventDefault();
  clearTimeout(timer);
  handle.focus({preventScroll: true});
  chartDrag = {index, pointerId: event.pointerId, geometry: {...chartGeometry},
    origin: chartPosition(event, chartGeometry), frequency: filter.frequency_hz,
    gain: filter.gain_db, pointY: Number(handle.dataset.y),
    factor: filter.type === 'peak' ? 1 : .5};
  $('#chart-wrap').setPointerCapture(event.pointerId);
  drawChart();
});
$('#chart-wrap').addEventListener('pointermove', (event) => {
  if (!chartDrag || event.pointerId !== chartDrag.pointerId) return;
  event.preventDefault();
  const {index, geometry, origin, frequency, gain, pointY, factor} = chartDrag;
  const position = chartPosition(event, geometry);
  const startX = 52 + Math.log10(frequency / 20) / 3 * geometry.span;
  const nextX = Math.max(52, Math.min(geometry.right, startX + position.x - origin.x));
  const nextY = Math.max(18, Math.min(266, pointY + position.y - origin.y));
  if (syncChartFilter(index, 20 * 1000 ** ((nextX - 52) / geometry.span),
    gain + (pointY - nextY) * (geometry.max - geometry.min) / 248 / factor)) drawChart();
});
$('#chart-wrap').addEventListener('pointerup', (event) => {
  if (chartDrag?.pointerId === event.pointerId) finishChartDrag();
});
$('#chart-wrap').addEventListener('pointercancel', (event) => {
  if (chartDrag?.pointerId === event.pointerId) finishChartDrag(true);
});
$('#chart-wrap').addEventListener('lostpointercapture', (event) => {
  if (chartDrag?.pointerId === event.pointerId) finishChartDrag(true);
});
$('#chart-wrap').addEventListener('keydown', (event) => {
  const handle = event.target.closest('.chart-handle');
  if (!handle || busy) return;
  if (event.key === 'Escape' && chartDrag) {
    event.preventDefault();
    finishChartDrag(true);
    return;
  }
  if (chartDrag || !['ArrowLeft', 'ArrowRight', 'ArrowUp', 'ArrowDown'].includes(event.key)) return;
  event.preventDefault();
  const index = Number(handle.dataset.band);
  const filter = doc.filters[index];
  const frequencyStep = event.shiftKey ? 100 : 1;
  const gainStep = event.shiftKey ? 1 : .1;
  showErrors = true;
  syncChartFilter(index, filter.frequency_hz + (event.key === 'ArrowRight' ? frequencyStep : event.key === 'ArrowLeft' ? -frequencyStep : 0),
    filter.gain_db + (event.key === 'ArrowUp' ? gainStep : event.key === 'ArrowDown' ? -gainStep : 0));
  drawChart();
});

$('#chart-handles').addEventListener('wheel', (event) => {
  const handle = event.target.closest('.chart-handle');
  // Keep browser zoom/pinch, horizontal scrolling and non-peak filters native.
  if (!handle || busy || chartDrag || event.ctrlKey) return;
  const index = Number(handle.dataset.band);
  const filter = doc.filters[index];
  if (filter.type !== 'peak' || !Number.isFinite(filter.q)) return;
  const unit = event.deltaMode === WheelEvent.DOM_DELTA_LINE ? 16
    : event.deltaMode === WheelEvent.DOM_DELTA_PAGE ? $('#chart').clientHeight : 1;
  const pixels = event.deltaY * unit;
  if (!Number.isFinite(pixels) || !pixels || Math.abs(event.deltaX) > Math.abs(event.deltaY)) return;
  event.preventDefault();
  const now = performance.now();
  if (!qWheelInput || qWheelInput.index !== index || qWheelInput.precise !== event.shiftKey
    || now - qWheelInput.at > 250 || Math.sign(qWheelInput.delta) !== Math.sign(pixels)) {
    qWheelInput = {index, precise: event.shiftKey, delta: 0};
  }
  qWheelInput.at = now;
  // Accumulate small trackpad deltas instead of treating every pixel as a notch.
  qWheelInput.delta += pixels;
  const steps = Math.trunc(qWheelInput.delta / 40);
  qWheelInput.delta -= steps * 40;
  if (!steps) return;
  const q = Math.max(.1, Math.min(10, Number((filter.q - steps * (event.shiftKey ? .01 : .1)).toFixed(8))));
  if (q === filter.q) return;
  filter.q = q;
  $(`#band-${index}-q`).value = q;
  $(`#q-note-${index}`).textContent = '正在计算实际 Q…';
  showErrors = true;
  changed();
  drawChart();
  $('#curve-state').textContent = `第 ${index + 1} 段 · Q ${q} · ${steps < 0 ? '更窄' : '更宽'}`;
}, {passive: false});

function drawChart() {
  if (!previewData) return;
  const svg = $('#chart');
  const width = Math.max(260, svg.clientWidth);
  const right = width - 20;
  const span = right - 52;
  svg.setAttribute('viewBox', `0 0 ${width} 310`);
  const rate = $('#rate').value;
  const curves = previewData.curves[rate];
  const all = [0, ...curves.total, ...curves.bands.flat()];
  const min = chartDrag?.geometry.min ?? Math.floor(Math.min(-6, ...all) / 6) * 6 - 3;
  const max = chartDrag?.geometry.max ?? Math.ceil(Math.max(6, ...all) / 6) * 6 + 3;
  chartGeometry = {width, right, span, min, max};
  const x = (f) => 52 + Math.log10(f / 20) / 3 * span;
  const y = (db) => 18 + (max - db) / (max - min) * 248;
  // Keep native HTML button hit targets attached through curve redraws.
  // HTML handles give touch-action a CSS layout box on every browser.
  let artwork = svg.querySelector('.chart-artwork');
  const handles = $('#chart-handles');
  if (!artwork) {
    artwork = svgElement('g', {class: 'chart-artwork', 'aria-hidden': 'true'});
    svg.append(artwork);
  }
  $('#chart-description').textContent = `${Number(rate) / 1000} kHz 下的数字频响，含整体输出增益。组合响应从 ${formatDb(Math.min(...curves.total))} 到 ${formatDb(Math.max(...curves.total))}。`;
  artwork.replaceChildren();
  const grid = svgElement('g');
  for (let i = 0; i <= 6; i++) {
    const db = max - (max - min) * i / 6;
    grid.append(svgElement('line', {x1: 52, x2: right, y1: y(db), y2: y(db), class: 'grid'}), svgElement('text', {x: 41, y: y(db) + 4, 'text-anchor': 'end'}, `${Math.round(db)}`));
  }
  const ticks = width < 350 ? [20, 100, 1000, 20000] : width < 500 ? [20, 100, 1000, 10000, 20000] : [20, 50, 100, 200, 500, 1000, 2000, 5000, 10000, 20000];
  ticks.forEach((frequency) => {
    grid.append(svgElement('line', {x1: x(frequency), x2: x(frequency), y1: 18, y2: 266, class: 'grid'}), svgElement('text', {x: x(frequency), y: 290, 'text-anchor': 'middle'}, frequency >= 1000 ? `${frequency / 1000}k` : frequency));
  });
  grid.append(svgElement('text', {x: 16, y: 12}, 'dB'), svgElement('line', {x1: 52, x2: right, y1: y(0), y2: y(0), class: 'zero'}));
  artwork.append(grid);
  const pathFor = (values) => values.map((value, i) => `${i ? 'L' : 'M'}${x(previewData.frequencies[i]).toFixed(2)},${y(value).toFixed(2)}`).join(' ');
  const path = pathFor(curves.total);
  const area = `${path} L${right},266 L52,266 Z`;
  artwork.append(svgElement('path', {d: area, fill: '#dce7d0', opacity: '.5'}));
  curves.bands.forEach((values, index) => artwork.append(svgElement('path', {d: pathFor(values), class: 'band-curve', stroke: colors[index]})));
  artwork.append(svgElement('path', {d: path, class: 'total-curve'}));
  const sample = (values, frequency) => {
    const point = Math.max(0, Math.min(600, Math.log10(frequency / 20) / 3 * 600));
    const low = Math.floor(point), high = Math.min(600, low + 1);
    return values[low] + (values[high] - values[low]) * (point - low);
  };
  handles.querySelectorAll('.chart-handle').forEach((handle) => {
    const filter = doc.filters[Number(handle.dataset.band)];
    if (!filter || !Number.isFinite(filter.frequency_hz) || !Number.isFinite(filter.gain_db)) handle.remove();
  });
  doc.filters.forEach((filter, index) => {
    if (!Number.isFinite(filter.frequency_hz) || !Number.isFinite(filter.gain_db)) return;
    const reference = previewData.preset.filters[index];
    const matches = reference && reference.type === filter.type && reference.frequency_hz === filter.frequency_hz && reference.gain_db === filter.gain_db;
    const total = sample(curves.total, filter.frequency_hz);
    // While a request is in flight, move the handle immediately using the
    // selected filter's center gain. The curve remains compiler-backed.
    const response = matches ? total : total - (curves.bands[index] ? sample(curves.bands[index], filter.frequency_hz) : 0) + filter.gain_db * (filter.type === 'peak' ? 1 : .5);
    const cx = x(filter.frequency_hz), cy = Math.max(18, Math.min(266, y(response)));
    const qLabel = filter.type === 'peak' ? `Q ${filter.q}；滚轮调 Q，Shift 精调` : '架式固定 S=1';
    const label = `第 ${index + 1} 段：${filter.frequency_hz} Hz，${filter.gain_db} dB，${qLabel}；左右方向键调频率，上下方向键调增益`;
    let group = handles.querySelector(`[data-band="${index}"]`);
    if (!group) {
      group = document.createElement('button');
      group.type = 'button';
      group.dataset.band = index;
      group.setAttribute('aria-describedby', 'chart-help');
      const dot = document.createElement('span');
      dot.className = 'dot';
      dot.style.background = colors[index];
      dot.textContent = index + 1;
      group.append(dot);
      handles.append(group);
    }
    Object.entries({class: `chart-handle${chartDrag?.index === index ? ' dragging' : ''}`, 'data-y': cy,
      tabindex: busy ? -1 : 0, 'aria-label': label, 'aria-disabled': String(busy)}).forEach(([key, value]) => group.setAttribute(key, value));
    group.title = label;
    group.style.left = `${cx * svg.clientWidth / width}px`;
    group.style.top = `${cy * svg.getBoundingClientRect().height / 310}px`;
  });
  const summary = `${Number(rate) / 1000} kHz · 峰值 ${formatDb(Math.max(...curves.total))}`;
  $('#curve-state').textContent = chartDrag ? `第 ${chartDrag.index + 1} 段 · ${doc.filters[chartDrag.index].frequency_hz} Hz · ${doc.filters[chartDrag.index].gain_db} dB` : validatedRevision === revision ? summary : '图中保留上次有效预览';
  svg.onpointermove = (event) => {
    if (chartDrag || validatedRevision !== revision) return;
    const rect = svg.getBoundingClientRect();
    const position = (event.clientX - rect.left) / rect.width * width;
    const index = Math.max(0, Math.min(600, Math.round((position - 52) / span * 600)));
    $('#curve-state').textContent = `${Math.round(previewData.frequencies[index])} Hz · ${formatDb(curves.total[index])}`;
  };
  svg.onpointerleave = () => {
    if (validatedRevision === revision) $('#curve-state').textContent = summary;
  };
}

function setBusy(value) {
  if (value) finishChartDrag(true);
  busy = value;
  $('#chart-wrap').classList.toggle('device-busy', value);
  $('#chart-wrap').querySelectorAll('.chart-handle').forEach((handle) => {
    handle.setAttribute('tabindex', value ? '-1' : '0');
    handle.setAttribute('aria-disabled', String(value));
  });
  $('#settings').querySelectorAll('input,textarea,select,button').forEach((control) => {
    control.disabled = value || (control.id.endsWith('-q') && doc && doc.filters[Number(control.id.split('-')[1])]?.type !== 'peak');
  });
  $('#add').disabled = value || !doc || doc.filters.length >= 8;
  $('#import').disabled = value;
  $('#new').disabled = value;
  document.querySelectorAll('.preset').forEach((button) => { button.disabled = value; });
  $('#apply').disabled = value || reloadWaiting;
  $('#verify').disabled = value || !canVerify || reloadWaiting;
  $('#apply').textContent = value ? '设备操作进行中…' : '写入耳放 ↗';
  $('#apply-title').textContent = value ? '请保持设备连接' : '准备好再应用';
}

async function pollJob() {
  try {
    const result = await api('/api/job');
    canVerify = result.can_verify;
    const job = result.job;
    if (!job) { setBusy(false); return; }
    activeJob = job.id;
    $('#operation').hidden = false;
    const status = job.device_status;
    $('#job-summary').textContent = status?.message || job.message;
    $('#job-detail').textContent = [
      job.action === 'apply' ? '操作：写入并保存，自动读回' : '操作：只读复核上次写入计划',
      status && `状态：${status.status} / ${status.stage}`,
      status && `写入已启动：${status.write_attempted ? '是' : '否'} · 保存 ACK：${status.save_command_acknowledged ? '已确认' : '未确认'} · 读回：${status.readback_verified ? '通过' : '尚未通过'}`,
      job.run && `运行记录：${job.run}`,
      (job.error || status?.error) && `详情：${job.error || status.error}`,
      '物理拔插保持未验证。',
    ].filter(Boolean).join('\n');
    setBusy(!job.done);
    if (!job.done) setTimeout(pollJob, 700);
  } catch (error) {
    // A lost HTTP connection is not evidence that the device operation stopped.
    notify(`无法获取设备状态：${error.message}。请保持连接，正在重新获取状态。`, true);
    if (activeJob) setTimeout(pollJob, 2000);
  }
}

$('#settings').addEventListener('submit', async (event) => {
  event.preventDefault();
  if (busy || !await requireValid() || busy) return;
  setBusy(true);
  try {
    const result = await api('/api/apply', clone(doc));
    activeJob = result.job.id;
    await pollJob();
  } catch (error) {
    notify(`写入请求未能确认：${error.message}。正在查询设备操作状态，请勿重复写入。`, true);
    activeJob = 'pending';
    await pollJob();
  }
});
$('#settings').addEventListener('keydown', (event) => {
  if (event.key === 'Enter' && !event.isComposing && event.target.tagName === 'INPUT') event.preventDefault();
});
$('#settings').addEventListener('change', () => { showErrors = true; if (lastError) validationError(new Error(lastError)); });
$('#settings').addEventListener('focusout', () => { showErrors = true; if (lastError) validationError(new Error(lastError)); });
$('#name').addEventListener('input', () => { doc.name = $('#name').value; changed(); });
$('#description').addEventListener('input', () => { doc.description = $('#description').value; changed(); });
$('#output').addEventListener('input', () => {
  doc.output_gain_db = $('#output').value === '' ? NaN : $('#output').valueAsNumber;
  if ($('#output').validity.valid) $('#output-slider').value = doc.output_gain_db;
  changed();
});
$('#output-slider').addEventListener('input', () => {
  doc.output_gain_db = Math.round(Number($('#output-slider').value) * 100) / 100;
  // Preserve exact valid endpoints instead of rounding them beyond the limits.
  doc.output_gain_db = Math.max(Number($('#output').min), Math.min(Number($('#output').max), doc.output_gain_db));
  $('#output').value = doc.output_gain_db;
  changed();
});
$('#rate').addEventListener('change', () => { finishChartDrag(true); drawChart(); });
$('#add').addEventListener('click', () => {
  if (doc.filters.length >= 8) return;
  doc.filters.push({type: 'peak', frequency_hz: 1000, gain_db: 0, q: 1});
  renderBands(doc.filters.length - 1);
  changed();
});
$('#new').addEventListener('click', () => {
  if (!discardAllowed()) return;
  setDocument({version: 1, device: 'MOONDROP ECHO-B', name: '我的声音配置', description: '', output_gain_db: -16, filters: []});
  notify('已新建空白配置，初始输出为 −16 dB。每段支持 20–20000 Hz 任意整数频率。');
});
$('#import').addEventListener('click', () => $('#file').click());
$('#file').addEventListener('change', async () => {
  const file = $('#file').files[0];
  $('#file').value = '';
  if (!file) return;
  try {
    if (file.size > 65536) throw new Error('配置文件不能超过 64 KiB');
    const value = JSON.parse((await file.text()).replace(/^\uFEFF/, ''));
    // Validate the entire imported file before replacing the current draft.
    await api('/api/preview', value);
    if (!discardAllowed()) return;
    setDocument(value);
    notify(`已导入 ${file.name}，尚未写入耳放。`);
  } catch (error) { notify(`导入失败：${error.message}。当前配置已保留。`, true); }
});
$('#export').addEventListener('click', async () => {
  if (!await requireValid()) return;
  const blob = new Blob([JSON.stringify(doc, null, 2) + '\n'], {type: 'application/json'});
  const url = URL.createObjectURL(blob);
  const link = document.createElement('a');
  link.href = url;
  link.download = `${doc.name.replace(/[\\/:*?"<>|\x00-\x1f]/g, '-').slice(0, 100) || 'echo-b-preset'}.json`;
  document.body.append(link);
  link.click();
  link.remove();
  setTimeout(() => URL.revokeObjectURL(url), 1000);
  baseline = JSON.stringify(doc);
  $('#draft-state').textContent = '已导出配置';
  notify('已导出完整 JSON，包含音色 EQ 与整体输出增益。');
});
$('#verify').addEventListener('click', async () => {
  if (busy) return;
  setBusy(true);
  try {
    const result = await api('/api/verify', {});
    activeJob = result.job.id;
    await pollJob();
  } catch (error) {
    notify(`复核请求未能确认：${error.message}。正在查询操作状态。`, true);
    activeJob = 'pending';
    await pollJob();
  }
});
window.addEventListener('beforeunload', (event) => {
  if (!autoReloading && (dirty() || busy)) { event.preventDefault(); event.returnValue = ''; }
});
new ResizeObserver(() => {
  if (chartDrag && Math.abs($('#chart').clientWidth - chartDrag.geometry.width) > 1) finishChartDrag(true);
  drawChart();
}).observe($('#chart'));

async function start() {
  try {
    const initial = await api('/api/bootstrap');
    token = initial.token;
    $('#output').min = initial.output_min;
    $('#output').max = initial.output_max;
    $('#output-slider').min = initial.output_min;
    $('#output-slider').max = initial.output_max;
    initial.presets.forEach((item) => {
      const button = document.createElement('button');
      button.className = 'preset';
      button.type = 'button';
      button.dataset.id = item.id;
      const name = document.createElement('span');
      name.textContent = item.preset.name;
      const detail = document.createElement('small');
      detail.textContent = `${item.preset.filters.length} 段 EQ · ${item.preset.output_gain_db} dB`;
      button.append(name, detail);
      button.addEventListener('click', () => {
        if (!discardAllowed()) return;
        setDocument(item.preset, item.id);
        notify('已载入预设，尚未写入耳放。');
      });
      $('#presets').append(button);
    });
    const selected = initial.presets.find((item) => item.id === 'original-minus-16db') || initial.presets[0];
    if (!selected) throw new Error('预设库为空，请检查 presets 目录');
    setDocument(selected.preset, selected.id);
    recoverReloadDraft();
    await pollJob();
    initialized = true;
    if (initial.auto_reload) setTimeout(watchServerVersion, 700);
  } catch (error) { notify(`编辑器载入失败：${error.message}，请确认本地服务正在运行并刷新页面。`, true); }
}
start();
