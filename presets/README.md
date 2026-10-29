# 耳放预设库

完整操作流程见[仓库操作指南](../docs/operations.md)，包含新建、写入、验证、恢复和故障处理。本页主要维护预设目录与格式说明。

新建音色预设前，请参考 [Kadenz 声音特性与 EQ 指南](../headphones/moondrop/kadenz/tuning-guide.md)，尤其是佩戴条件、听感问题与滤波的对应关系，以及高采样率下低频系数量化误差。指南中的试验起点并非已验证适合本人的成品预设。

每套听音配置用一个 JSON 文件，音色和输出衰减都存在其中，文件名用简短英文，`name` 用中文。以后复制一份，修改名称和参数即可；不要编辑生成的二进制文件。

当前预设：

- `original-default.json` —— 真正原始默认，`filters: []`、`preamp_db: 0`、`output_trim_db: 0`，总增益 0 dB。
- `original-minus-16db.json` —— 原始直通音色，`preamp_db: 0`、`output_trim_db: -16`，总增益 −16 dB。
- `kadenz-death-metal-structure-v1.json` —— 死亡金属结构清晰 V1，兼顾葬礼厄运氛围；`preamp_db: -2`、`output_trim_db: -18`，总增益 −20 dB；原音色曾读回验证，当前衰减版本尚未实机验收。[设计与试听说明](../headphones/moondrop/kadenz/research/death-metal-structure-v1.md)

每份都是完整的替换配置，写入后会替换之前的 EQ。原始默认预设恢复的是初始备份的频响形状，并采用文件内的输出衰减，不是整机恢复出厂。

直接编辑所选 JSON 的 `output_trim_db`，然后 `apply` 即可。原始默认为 0 dB，原始音色衰减版为 −16 dB，死亡金属预设为 −18 dB；每份独立管理，切换预设也会切换输出衰减。没有独立 `settings/`，不再使用 `output-level` 命令或 `--output-trim-db` 覆盖参数。

总增益 = `preamp_db` + `output_trim_db`。前者为 EQ 设计预留余量，后者控制这套配置的额外输出衰减；都通过第 9 段合并实现。
## 使用

在项目目录运行：

```sh
# 查看预设
python3 tools/preset.py list

# 生成、检查配置，不连接或修改耳放
python3 tools/preset.py build original-minus-16db

# 将指定预设写入耳放并保存，然后读回验证
python3 tools/preset.py apply original-minus-16db

# 恢复原始直通音色及 0 dB 输出（请先降低播放音量）
python3 tools/preset.py apply original-default

# 保存后验证失败时，只重新读取指定历史运行记录
python3 tools/preset.py verify "runs/这里替换为实际运行目录"
```

也可以传入 JSON 文件路径。`apply` 自动编译本机 USB 工具、先记录当前参数和当前运行系数，再写入五种采样率的数据及保存命令，最后读回当前运行状态。失败时根据 `status.json` 区分写前失败、写入结果未知、已保存但未通过验证。工具对暂未就绪做有限的只读重试，不自动重发写入或自动恢复；`saved_unverified` 使用 `verify` 复核。沙箱中若无法打开 USB 设备，需由执行环境允许设备访问，普通 macOS 终端可直接运行。不要同时运行两个写入命令。

## 文件组织

| 目录 | 用途 |
| --- | --- |
| `presets/*.json` | 手动编辑、长期保存的预设原件 |
| `profiles/compiled/<预设名>/` | `build` 生成的本地缓存；Git 忽略，可重新生成 |
| `runs/<UTC时间>-<预设名>/` | 每次 `apply` 的独立快照、写入前后读取、ACK 和验收；不覆盖历史 |
| `backups/` | 原始备份，保留原状 |
| `profiles/muffled-persistence-test/` | 早期闷声测试及原始直通恢复计划 |

## 参数

- `version`: 固定为 `1`。
- `device`: 固定为 `MOONDROP ECHO-B`。
- `name` / `description`: 显示名称与说明。
- `preamp_db`: EQ 设计所需的全频段增益，支持 −60 至 0 dB，可用小数。
- `output_trim_db`: 必填，额外输出衰减，支持 −40 至 0 dB，可用小数；与 `preamp_db` 相加不得低于 −60 dB。填 `0` 表示不额外衰减。缺失或非法会停止，不会默认恢复更响的输出。
- `filters`: 最多 8 段；空数组表示不改变频响形状。

每段格式：

```json
{"type": "peak", "frequency_hz": 1000, "q": 1, "gain_db": -2}
```

支持 `peak`（峰值）、`low_shelf`（低架）、`high_shelf`（高架）；架式目前只支持 `q: 1`，对应斜率 S=1。频率为 20–20000 的整数 Hz，单段增益为 −12 至 +12 的整数 dB，峰值 Q 为 0.1–10，编译时量化至 1/256。参数限制与系数的表示范围不同，个别组合可能因系数溢出或量化后不稳定而被拒绝。正增益预设可用负 `preamp_db` 预留余量；生成报告列出采样频点的最大增益。

第 9 段专门通过 DSP 系数实现全局衰减，其他未用段直通。Android App 的参数标签不能表达这个全局衰减，第 9 段仍显示 0 dB；以此处的预设和系数读回为准。用 Android App 重新编辑/保存可能重算系数并覆盖全局衰减。

支持 44.1、48、96、192、384 kHz 的保存数据。写入后验证的是当前采样率的运行系数，不能代替各采样率实机验证或拔插测试。每次写入前的记录也不是完整闪存镜像。

固定衰减不会改变手机音量键的映射，不保证每档步进更细，也不是动态压限或校准的耳内声压上限。

旧运行记录缺少 `output_trim_db` 时仍可 `verify`。重新写入前需复制到 `presets/` 并明确补充该字段，详见操作指南；不要修改历史证据。
