# Kadenz 终章：官方原始频响数据

基于本目录数据的解读见 [Kadenz 声音特性与 EQ 指南](../tuning-guide.md)；计算结果与方法单独保存在 `../analysis/` 和 项目根目录的 `tools/analyze_kadenz.py`，本目录原始 TXT 保持不变。

来源：[水月雨官方 Sound-Tuning Tool](https://hub.moondroplab.tech/) → 原始频响 → 品牌 → 水月雨。

本资料保存官方页面提供的两套 Kadenz 原始频响文件，未进行 EQ 调整或向耳放写入配置。这里的“原始”指网页中的耳机原始响应，而非未经任何处理的仪器采样；官方文件已经过 **1/24 倍频程平滑**，按 **1/96 倍频程步长**导出。

## 数据总览

| 官方条目 | 点数 | 频率范围 | 列 | 源文件中的软件版本 | 源文件中的测量日期 |
|---|---:|---|---|---|---|
| kadenz 终章 5128 | 957 | 20–19896.974609 Hz | 频率、SPL、相位 | REW V5.31.1 | 2024-8-28 14:07:52 |
| kadenz 终章 4128 | 957 | 20–19896.974609 Hz | 频率、SPL、相位 | REW V5.20.9 | 2023-7-4 14:04:33 |

日期按文件头原样记录，未经独立核实。特别是 4128 的日期为 2023 年，本资料不替官方修正，也不据此推断产品发布时间或测量样机身份。

## 文件使用

- `raw/kadenz5128.txt`、`raw/kadenz4128.txt`：从官方 CDN 下载的原文件，字节内容保持不变，包含完整文件头和相位。
- `processed/kadenz-5128.csv`、`processed/kadenz-4128.csv`：适合 Excel、Python 等工具，保留全部 957 行与原数字文本精度。
- `processed/kadenz-5128.json`、`processed/kadenz-4128.json`：完整数据点、原文件头、来源、校验哈希与限制说明。
- `processed/kadenz-5128-4128-comparison.csv`：相同频率网格上的两组 SPL 和相位，957 行，不插值、不混合、不平均。
- `processed/*-utf8.txt`：仅转换编码与换行，方便直接阅读。5128 原文件包含中文“八月”，用 GB18030 解码；4128 为 ASCII。
- `frequency-response.svg`：用于观察曲线形状的预览图。**只有此图**在 500 Hz 对齐到 60 dB；500 Hz 值按 log10(频率) 插值，整条曲线加常量。CSV、JSON、原始 TXT 均保留官方原始 SPL，不受此图归一化影响。
- `provenance/`：官方目录中的两条记录、网页实际加载的资源地址、页面截图和校验报告。
- `tools/prepare_kadenz_measurements.py`（在项目根目录运行）：离线重建整理文件和预览图的脚本；不访问耳放、不改写原始 TXT。

## 字段与解读边界

`frequency_hz`：频率（Hz）。`spl_db`：源文件标记的 SPL（dB）。`phase_degrees`：源文件标记的相位（度）。JSON 数值使用数字类型，可能不保留末尾零；CSV 保留源数字字符串。

两套曲线来自页面标注的不同测量系统，分别保存。源文件 SPL 基准不同，不能直接把两者的纵向差值解释为听感差异、灵敏度差异或应施加的 EQ。

5128 文件头标记 `L+R 八月 28`，测量格式为 256k Log Swept Sine，且注明没有 timing reference；4128 文件头标记 Vector average。因此不声称取得独立左、右声道数据，也不把其相位当作已验证的绝对延时或时域响应。

官方条目未说明测量使用的 A/B/C 导管、耳套、插入深度、样机身份或完整校准条件。不能将这两份数据说成某个确定导管/耳套组合的曲线，也不能宣称适用于每副实物耳机。文件止于 19896.974609 Hz；没有补造 20 kHz 点或更低/更高频数据。

## 官方来源

- 页面：https://hub.moondroplab.tech/
- 官方公开目录：https://cdn-service.moondroplab.tech/api/v1/refresponse/all?pageSize=999&type=OFFICIAL
- 5128 原文件：https://cdn.moondroplab.tech/peq-config-file/UDFyUvjf1JV01ZnhvQSQ1kadenz5128.txt
- 4128 原文件：https://cdn.moondroplab.tech/peq-config-file/PT-Zgr2njD1VuGt3GMy8Hkadenz4128.txt

两个 CDN 路径虽包含 `peq-config-file`，内容实际为三列 REW 频响数据，并非八段 EQ 参数。来源由页面条目、加载资源地址与官方公开目录三者对应确认。

本资料完整保留上述两个已公开文件的所有数据点；不等于取得厂家的全部实验室原始测量、所有导管测量或产品设计资料。
