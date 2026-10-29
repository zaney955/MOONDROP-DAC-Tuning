# ECHO-B 协议调查与操作历史

本文件保留设备协议、历史操作与证据。日常使用请先看[仓库操作指南](../operations.md)。文中的“当前”仅指对应操作时刻，不能替代实时读取。所有代码块命令均以仓库根目录为工作目录。

## Kadenz 声音研究与调音依据

耳机资料统一按品牌与型号放入 [`headphones/`](../../headphones/README.md)。[Kadenz 型号首页](../../headphones/moondrop/kadenz/README.md)集中索引测量、研究与分析产物；以后新增耳机沿用同一结构。

后续制作音色预设先参考 [Kadenz 声音特性与 EQ 指南](../../headphones/moondrop/kadenz/tuning-guide.md)。它结合官方 5128/4128 数据、一手测量资料和当前 DSP 实现，区分测量事实与听感假设，提供按问题选择滤波的起点、试听记录方法及高频/量化边界。当次研究不包含设备写入。

原始资料位于 [Kadenz 原始频响数据](../../headphones/moondrop/kadenz/measurements/README.md)，可复算的统计与示例检查位于 `headphones/moondrop/kadenz/analysis/`。

## 可切换的配置文件

预设原件统一放在 [`presets/`](../../presets/README.md)，使用方法与字段说明见该目录 README。首份配置是 [`global-minus-2db.json`](../../presets/global-minus-2db.json)：保持平直频响，全频段降低 2 dB。已生成五种采样率的写入计划并做离线校验，**尚未将这份配置写入耳放**。

```sh
python3 tools/preset.py list
python3 tools/preset.py build global-minus-2db
# 需要切换并永久保存到耳放时才执行：
python3 tools/preset.py apply global-minus-2db
```

每次 `apply` 都在 `runs/` 新建独立目录，保存预设快照、写入前后读取、ACK 和验证结果。初始备份继续保留在 `backups/`。

## 最近已验证的写入记录：死亡金属结构清晰 V1（2026-10-29）

2026-10-29，按用户的死亡金属及葬礼厄运听音偏好，已应用 [`kadenz-death-metal-structure-v1`](../../presets/kadenz-death-metal-structure-v1.json)：全局 −2 dB，180 Hz −2 dB、900 Hz +1 dB、3 kHz −1 dB、5.2 kHz +1 dB。五套采样率计划全部得到保存操作 ACK；模式、全部参数和当前 48 kHz 运行系数读回匹配。首次写后读取暂未就绪，重读通过，没有重复写入。拔插后保持与实际听感尚待验证。

[设计和试听说明](../../headphones/moondrop/kadenz/research/death-metal-structure-v1.md)；[本次写入验收](../../runs/20261029T155405.399289Z-kadenz-death-metal-structure-v1/verification.json)。写入前的闷声状态已记录在同一运行目录。

## 历史阶段：闷声持久化测试 EQ（已被上述配置替换）

后续用户授权插拔持久化测试，已写入 `profiles/muffled-persistence-test/test.json`：500 Hz、1200 Hz、3000 Hz 三段高架滤波各 −12 dB，Q/斜率参数1，其余6段直通。高频累计衰减接近36 dB，没有正增益。5种采样率（44.1/48/96/192/384 kHz）均已生成并发送系数；最后发送官方 `CTRL/0x00DC [255]` 保存命令。

56条操作均收到成功回复，9段参数和当前9段运行系数读回与计划匹配。日志与验收在 `profiles/muffled-persistence-test/`。**当时未验证物理拔插后是否保持，不能将保存ACK当作持久化验收。** 本段与下文保留历史记录，以实际设备读回及运行日志为准。

写入前再次采集到的状态保存在 `backups/before-persistent-test/`，与最初备份一致。恢复原先直通音色的写入计划是 `profiles/muffled-persistence-test/restore-original-flat.bin`；它依据初始9段原始直通系数复制到5个采样率并保留原参数标签，并非原始闪存镜像。现可用 `python3 tools/preset.py apply original-default` 恢复这份直通 EQ。

`tools/make_muffled_test.py` 生成测试与恢复计划，并校验24位系数范围、量化后极点稳定性和601个频点的无正增益响应。`tools/echo_apply_plan.c` 只接受56帧固定结构的自定义EQ保存序列，在任何错误回复时停止，完整记录ACK。

## 早期阶段：只读采集与临时修改恢复

2026-10-29，实机：MOONDROP ECHO-B，USB `35d8:149b`，Kadenz 终章附送耳放。

早期只读与临时修改阶段已验证：能够读取 EQ 参数和原始 DSP 系数，能够临时修改系数，并精确恢复测试前的运行状态。该阶段未执行闪存保存、模式切换、恢复出厂或固件升级；后续保存操作另见顶部记录。

## 备份与验收

- `backups/ECHO-B-original-current-state.json`：整合的初始模式、9 段参数、9 段原始系数与原始回包。
- `backups/initial-read.jsonl`：首次参数读取。
- `backups/coefficients-read.jsonl`：首次原始系数读取。
- `backups/runtime-roundtrip.jsonl`：修改、读回、恢复、读回的记录。
- `backups/after-test-metadata.jsonl` 和 `backups/after-test-coefficients.jsonl`：最终全量复核。
- `backups/SHA256SUMS`：备份文件校验值。

初始模式为 0；9 段参数频率依次为 500、1000、1500、2000、2500、3000、3500、4000、4500 Hz，Q 均为 1，类型代码均为 1，显示增益均为 0 dB。首次备份中的9段原始系数均为 Gain=3，B0=4194304，其他四项为0，符合这套 Q22 格式的直通滤波器。没有实测模拟输出频响。

测试仅更改第9段当前系数 B0：4194304 → 3738177（数学上约 -1 dB），读回确认变化，然后恢复4194304。最终**所有模式、参数和9段系数的原始62字节回包**均与初始备份相同。

## 恢复范围

这是一份**本次连接下当前 EQ 运行状态**的备份，不是整机固件或完整闪存镜像。没有更改采样率、切换全部预设或断电测试，不能据此声明已备份所有采样率的持久化配置。用户所称默认状态在本次调查前未由出厂镜像独立验证。

早期阶段已验证临时写入、读回和恢复；后续保存命令与写后读回记录见本文顶部。物理拔插保持仍未由本仓库记录证明。

## 工具

`make build` 编译只读程序 `bin/echo_probe` 和写入程序 `bin/echo_apply_plan`。以下命令在仓库根目录运行。只读采集：

```sh
python3 tools/backup_metadata.py
bin/echo_probe --coefficients
```

`backup_metadata.py` 每次建立新的时间戳目录，不覆盖初始备份；它只备份参数标签。系数读取输出完整原始回包。macOS 沙箱内可能报 `0xe00002e2`；本次以允许访问已连接设备的命令执行权限解决，没有更改系统隐私设置。

`tools/echo_runtime_test.c` 是此次狭窄验证程序，**会临时修改设备**。只接受原始第9段为本次直通系数的情况；先独占创建原始回包文件并 fsync，再写入约 -1 dB，随后立即恢复和验证。不要把它当通用调音程序；运行中拔线或进程被强制终止会打断自动恢复。

## 协议证据与分析边界

1. 设备身份和报告描述符：`evidence/usb-identity.json`，来自本机 IORegistry。
2. [FreeDSP-Studio](https://github.com/EffectiveEquivalent/FreeDSP-Studio/tree/1b42f63db24f7dc8e94f6897575c1c403f4d4882) 的 `dsp.rs`、`hid_hidapi.rs` 提供参数读取路径；副本保存在 `evidence/upstream-*`。该项目不提供Gen1原始系数备份，因此没有直接采用其写入/恢复结论。
3. [官方 App 下载入口](https://moondroplab.com/cn/moondrop-link) 对应 APK 已保存，未安装或执行。SHA-256 与成员 CRC 库存见 `evidence/apk-inventory.json`。
4. 官方 APK 的 `classes.dex` 静态反汇编：`evidence/official-dex-protocol.asm`。`FreemanCnxtUsbDevice.getF3EQCoefficientList` 使用 CTRL/`0x01BE`，参数 `[0, band]`；`setFreeman3EQ` 使用 CTRL/`0x00BE`，参数 `[0,band,Gain,B0,B1,B2,A0,A1]`。当前设备支持已由实机响应验证。
5. `getEQParamsFromFlash` 方法实际仅组合模式和参数读取，不能因名称就当作完整闪存备份。
6. 报告ID=1，总长62；CTRL模块ID=`0xB32D2300`；GET位=`0x0100`，回复位=`0x8000`；偏移2的int16为返回dword数，负值表示错误。使用 macOS IOKit 的控制管道 SET_REPORT(Output)/GET_REPORT(Input)。
7. 实际系数从offset22起，每项占4字节，按24位有符号数解释；offset18是Gain字段。早期运行状态恢复直接复制原始字节，没有从参数重新计算系数。

REA 6.5.0 的 Codex 注册存在，但本次没有暴露MCP工具；CLI尝试Hopper静态反编译未能启动，错误保存在 `evidence/rea-memory-read.json`。已改用本机 LLVM 反汇编和临时环境 Androguard 进行静态检查；上述文件不是REA Evidence ID。APK及Android库没有被运行。

官方网页当前列出 Echo-BP，并未列出本机 ECHO-B；此次使用本机原生控制管道验证，不依赖网页兼容性。
