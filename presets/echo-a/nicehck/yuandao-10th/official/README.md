# 原道十周年官方参数 → ECHO-A

2026-11-01 重新查询[官方 Web 配置接口](https://nicehck.cn/api/app/v1/device/config-sync/49664?platform=web&buildType=official&appBuild=1)，得到配置 revision 1 的 7 套预设，与[已归档原始配置](../../../../../evidence/nicehck-web-20261101/device-49664.json)字节相同。校验值、完整源参数与离线编译结果见[转换记录](../../../../../headphones/nicehck/yuandao-10th/analysis/echo-a-official-presets-conversion.json)。

这些文件是本仓库对 **十周年 Type-C 官方参数**的移植，目标为 ECHO-A＋3.5 mm 耳机；不是厂商发布的 ECHO-A 配置，也不代表两版耳机的声学效果相同。

| 名称 | ECHO-A 配置 | 原厂整体 offset（仅供追溯，未迁移） |
| --- | --- | --- |
| 默认 | [yuandao-10th-official-default.json](yuandao-10th-official-default.json) | 0 dB |
| 悔恨之泪 | [yuandao-10th-official-tears.json](yuandao-10th-official-tears.json) | -2 dB |
| 摇滚现场 | [yuandao-10th-official-rock-live.json](yuandao-10th-official-rock-live.json) | -2 dB |
| 流行人声 | [yuandao-10th-official-pop-vocal.json](yuandao-10th-official-pop-vocal.json) | -2 dB |
| ACG | [yuandao-10th-official-acg.json](yuandao-10th-official-acg.json) | -2 dB |
| 均衡杂食 | [yuandao-10th-official-balanced-z.json](yuandao-10th-official-balanced-z.json) | 3 dB |
| DSP仙人特调 | [yuandao-10th-official-immortal-special.json](yuandao-10th-official-immortal-special.json) | 2 dB |

保留官方 8 段的顺序、频率、单段增益和 RBJ 峰值 Q；不复制 Type-C 的 96 kHz 系数，由 ECHO-A 编译器按 93,750 Hz 重新计算 Q30。编译器先将 Q 和单段增益量化到 1/256，源 JSON 保留原始参数精度。全部配置已通过参数、定点范围和量化后稳定性检查。

**所有文件均省略 `output_gain_db`**，原厂 offset 不写入配置、不折算到滤波器。按仓库约定，离线预览和编译的整体增益为 0 dB，由用户自行调整。这些文件不会复现原厂预设的整体音量；部分曲线高于 0 dB，编译通过也不代表播放时不会削波。

本次仅保存配置并离线校验，没有执行 `apply`、HID 查询或设备写入。网页会递归发现本目录；导入后先预览，实际写入由用户决定。[通用配置规则](../../../../README.md)
