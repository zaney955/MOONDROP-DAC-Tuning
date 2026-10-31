# MOONDROP Kadenz 终章

这是一份型号资料档案：官方频响、来源记录、声音研究与调音依据集中在此。官方测量不是个人耳内实测；导管、耳套与个人偏好的适用范围见各文档。

| 内容 | 入口 |
| --- | --- |
| 声音特性与 EQ 指南 | [tuning-guide.md](tuning-guide.md) |
| 官方频响数据与测量条件 | [measurements/README.md](measurements/README.md) |
| 频响对照图 | [frequency-response.svg](measurements/frequency-response.svg) |
| 频点及频段统计 | [analysis/summary.md](analysis/summary.md) |
| 完整计算结果 | [analysis/statistics.json](analysis/statistics.json) |
| 外部一手资料与限制 | [research/sources.md](research/sources.md) |
| Riff 清晰与低频冲击 V2（2026-10-31 定制） | [设计、参数与试听方法](research/riff-impact-v2.md) / [预设 JSON](../../../presets/kadenz-riff-impact-v2.json) |
| V2 五采样率响应 | [离线报告](analysis/riff-impact-v2.json) / [曲线数据](analysis/riff-impact-v2.csv) |
| 密集金属调音示例 | [设计依据与试听方法](research/death-metal-structure-v1.md) |
| 密集金属预设的五采样率响应 | [离线报告](analysis/death-metal-structure-v1.json) / [曲线数据](analysis/death-metal-structure-v1.csv) |

在项目根目录离线复算：

```sh
# 从保留的 TXT 重建转换数据、对照图与校验记录
python3 tools/prepare_kadenz_measurements.py

# 从测量数据重建统计与示例滤波检查
python3 tools/analyze_kadenz.py
```

两条命令均不访问耳放，不修改 `measurements/raw/` 原件。实际写入配置见[预设库](../../../presets/README.md)。

返回[耳机资料库](../../README.md)。
