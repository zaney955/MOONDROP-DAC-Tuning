# MOONDROP Kadenz 终章

本档案集中保存官方频响、来源、声音研究与定制调音。官方测量不是个人耳内响应；导管、耳套和偏好差异见[调音指南](tuning-guide.md)。

## 测量与来源

| 内容 | 入口 |
| --- | --- |
| 测量系统、条件与原始数据 | [测量说明](measurements/README.md) |
| 官方频响对照 | [图表](measurements/frequency-response.svg) |
| 频点与频段统计 | [摘要](analysis/summary.md) / [完整结果](analysis/statistics.json) |
| 外部一手资料与限制 | [来源](research/sources.md) |

## 预设与分析报告

现行预设按设备分类，增益由用户自行设置，规则见[预设格式](../../../presets/README.md#整体增益约定)。下列设计文档和分析文件保留当时的整体电平条件，不能视为当前预设或设备状态；EQ 形状与整体电平应分别比较。

| 方案 | 设计与现行配置 | 历史分析 |
| --- | --- | --- |
| Riff 清晰与适度冲击 V5（2026-11-01） | [设计](research/riff-impact-v5.md) / [JSON](../../../presets/echo-b/moondrop/kadenz/kadenz-riff-impact-v5.json) | [离线报告](analysis/riff-impact-v5.json) / [官方数据叠加模型](analysis/riff-impact-v5-official-models.csv) |
| Riff 线条与适度冲击 V4 | [设计](research/riff-impact-v4.md) / [JSON](../../../presets/echo-b/moondrop/kadenz/kadenz-riff-impact-v4.json) | [报告](analysis/riff-impact-v4.json) / [曲线](analysis/riff-impact-v4.csv) |
| Riff 清晰与低频冲击 V3 | [JSON](../../../presets/echo-b/moondrop/kadenz/kadenz-riff-impact-v3.json) | — |
| Riff 清晰与低频冲击 V2 | [设计](research/riff-impact-v2.md) / [JSON](../../../presets/echo-b/moondrop/kadenz/kadenz-riff-impact-v2.json) | [报告](analysis/riff-impact-v2.json) / [曲线](analysis/riff-impact-v2.csv) |
| 死亡金属结构清晰 V1 | [设计](research/death-metal-structure-v1.md) / [JSON](../../../presets/echo-b/moondrop/kadenz/kadenz-death-metal-structure-v1.json) | [报告](analysis/death-metal-structure-v1.json) / [曲线](analysis/death-metal-structure-v1.csv) |

## 离线复算

```sh
python3 tools/prepare_kadenz_measurements.py
python3 tools/analyze_kadenz.py
```

在仓库根目录执行；第一条从保留的 TXT 重建转换数据和图表，第二条更新统计及默认示例分析。均不访问耳放或修改原始测量；复算结果对应执行时的预设，不能当作历史报告的逐字节重现。

返回[耳机资料库](../../README.md)。
