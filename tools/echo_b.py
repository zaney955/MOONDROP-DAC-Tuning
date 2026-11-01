"""ECHO-B device state recovery; its protocol/compiler live in preset.py."""
import math
import preset


def device_document(metadata, coefficients):
    """Recover editable RBJ parameters only when they reproduce every read row.

    The device exposes the active rate's coefficients and integer gain labels,
    not the original JSON or fractional gain. Never trust labels as DSP values.
    """
    if metadata['mode'] != 0:
        raise ValueError('当前设备不是自定义 EQ 模式；已保存原始读数，未切换设备模式')
    output = coefficients[8]
    if output[0] <= 0 or output[1:] != [0, 0, 0, 0]:
        raise ValueError('第 9 段不是编辑器支持的整体输出增益；已保存原始读数')
    filters, matching_rates = [], set(preset.RATES.values())
    names = {value: key for key, value in preset.TYPES.items()}
    for band, row in zip(metadata['bands'][:8], coefficients[:8]):
        kind = names.get(band['type_code'])
        if kind is None:
            raise ValueError(f'第 {band["band"]} 段滤波器类型不受支持；已保存原始读数')
        label = band['gain_label_db']
        candidates = {}
        # Truncation toward zero leaves at most 19 possible tenths of a dB.
        for tenth in range(label * 10 - 9, label * 10 + 10):
            gain = tenth / 10
            if int(gain) != label:
                continue
            filt = dict(type=kind, frequency_hz=band['frequency_hz'], q=band['q'], gain_db=gain)
            rates = {rate for rate in matching_rates if preset.biquad(filt, rate) == row}
            if rates:
                candidates[tenth] = (filt, rates)
        if len(candidates) != 1:
            raise ValueError(f'第 {band["band"]} 段实际系数无法精确还原为当前编辑器参数；'
                             '已保存原始读数，未用整数标签近似替代')
        filt, matching_rates = next(iter(candidates.values()))
        filters.append(filt)
    # Remove only the compiler's unused trailing slots, retaining custom flat EQ.
    while filters:
        index = len(filters) - 1
        if filters[index] != dict(type='low_shelf', frequency_hz=500*(index+1), q=1, gain_db=0):
            break
        filters.pop()
    doc = dict(version=1, device='MOONDROP ECHO-B', name='当前设备调音',
               description='从设备只读载入；增益已与实际 Q22 系数核对。设备不保存原配置名称和备注。',
               output_gain_db=20 * math.log10(output[0] / preset.SCALE), filters=filters)
    plan, _ = preset.compile_preset(doc)
    rates = [rate for rate in matching_rates if plan['coefficients_q22'][str(rate)] == coefficients]
    if not rates:
        raise ValueError('读回配置无法精确复现实际系数；已保存原始读数')
    return doc, sorted(rates)


def read_device(directory):
    status = preset.RunStatus(directory, 'read')
    try:
        status.update('read', '正在只读读取设备参数与实际系数')
        preset.capture(directory, 'current', on_retry=status.read_retry)
        status.update('confirm_read', '正在再次读取，确认配置在采集期间保持一致')
        preset.capture(directory, 'confirmed', on_retry=status.read_retry)
        metadata = preset.decode(directory / 'current-metadata.jsonl')
        confirmed = preset.decode(directory / 'confirmed-metadata.jsonl')
        mode, coefficients = preset.read_coefficients(directory / 'current-coefficients.jsonl')
        if ((metadata['mode'], metadata['bands']) != (confirmed['mode'], confirmed['bands'])
                or (mode, coefficients) != preset.read_coefficients(directory / 'confirmed-coefficients.jsonl')):
            raise ValueError('读取期间设备配置发生变化，请关闭其他控制程序后重试')
        doc, rates = device_document(metadata, coefficients)
        preset.save_json(directory / 'preset.json', doc)
        status.update('complete', '已读取当前设备配置；未写入设备', status='read_complete',
                      matching_sample_rates=rates)
        return doc, rates
    except Exception as error:
        status.update('failed', '读取未完成，当前草稿已保留；未写入设备', status='read_failed', error=str(error))
        raise

