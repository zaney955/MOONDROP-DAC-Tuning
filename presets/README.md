# 耳放预设库

完整操作流程见[仓库操作指南](../docs/operations.md)，包含新建、写入、验证、恢复和故障处理。本页主要维护预设目录与格式说明。

新建音色预设前，请参考 [Kadenz 声音特性与 EQ 指南](../headphones/moondrop/kadenz/tuning-guide.md)，尤其是佩戴条件、听感问题与滤波的对应关系，以及高采样率下低频系数量化误差。指南中的试验起点并非已验证适合本人的成品预设。

每个音色用一个 JSON 文件，文件名用简短英文，`name` 用中文。以后复制一份，修改名称和参数即可；不要编辑生成的二进制文件。

当前预设：

- `original-default.json` —— 原始默认（未调音），依据首次连接备份，9 段直通，全局增益 0 dB。
- `global-minus-2db.json` —— 平直频响，全频段统一降低 2 dB。
- `kadenz-death-metal-structure-v1.json` —— 死亡金属结构清晰 V1，兼顾葬礼厄运氛围；已写入并读回验证，听感待确认。[设计与试听说明](../headphones/moondrop/kadenz/research/death-metal-structure-v1.md)

每份都是完整的替换配置，写入后会替换之前的 EQ。原始默认预设恢复的是本次调音前备份的 EQ 状态，不是整机恢复出厂。

## 使用

在项目目录运行：

```sh
# 查看预设
python3 tools/preset.py list

# 生成、检查配置，不连接或修改耳放
python3 tools/preset.py build global-minus-2db

# 将指定预设写入耳放并保存，然后读回验证
python3 tools/preset.py apply global-minus-2db

# 恢复原始未调音 EQ，并保存到耳放
python3 tools/preset.py apply original-default
```

也可以传入 JSON 文件路径。`apply` 自动编译本机 USB 工具、先记录当前参数和当前运行系数，再写入五种采样率的数据及保存命令，最后读回当前运行状态。写入失败会停止并报错；不会宣称成功或自动恢复。沙箱中若无法打开 USB 设备，需由执行环境允许设备访问，普通 macOS 终端可直接运行。不要同时运行两个写入命令。

## 文件组织

| 目录 | 用途 |
| --- | --- |
| `presets/*.json` | 手动编辑、长期保存的预设原件 |
| `profiles/compiled/<预设名>/` | `build` 生成的计划、二进制和响应检查；可重新生成 |
| `runs/<UTC时间>-<预设名>/` | 每次 `apply` 的独立快照、写入前后读取、ACK 和验收；不覆盖历史 |
| `backups/` | 原始备份，保留原状 |
| `profiles/muffled-persistence-test/` | 早期闷声测试及原始直通恢复计划 |

## 参数

- `version`: 固定为 `1`。
- `device`: 固定为 `MOONDROP ECHO-B`。
- `name` / `description`: 显示名称与说明。
- `preamp_db`: 全频段增益，支持 −60 至 0 dB，可用小数。−2 dB 对应振幅约为原来的 79.43%，不表示主观响度下降 2 个等级。
- `filters`: 最多 8 段；空数组表示不改变频响形状。

每段格式：

```json
{"type": "peak", "frequency_hz": 1000, "q": 1, "gain_db": -2}
```

支持 `peak`（峰值）、`low_shelf`（低架）、`high_shelf`（高架）；架式目前只支持 `q: 1`，对应斜率 S=1。频率为 20–20000 的整数 Hz，单段增益为 −12 至 +12 的整数 dB，峰值 Q 为 0.1–10，编译时量化至 1/256。参数限制与系数的表示范围不同，个别组合可能因系数溢出或量化后不稳定而被拒绝。正增益预设可用负 `preamp_db` 预留余量；生成报告列出采样频点的最大增益。

第 9 段专门通过 DSP 系数实现全局衰减，其他未用段直通。Android App 的参数标签不能表达这个全局衰减，第 9 段仍显示 0 dB；以此处的预设和系数读回为准。用 Android App 重新编辑/保存可能重算系数并覆盖全局衰减。

支持 44.1、48、96、192、384 kHz 的保存数据。写入后验证的是当前采样率的运行系数，不能代替各采样率实机验证或拔插测试。每次写入前的记录也不是完整闪存镜像。

本次仅生成 `global-minus-2db` 文件，未执行 `apply`。这份全局 −2 dB 配置尚未实机验收。
