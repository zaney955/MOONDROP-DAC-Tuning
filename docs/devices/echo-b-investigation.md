# ECHO-B 协议与验证边界

对象：MOONDROP ECHO-B，USB `35d8:149b`。本文记录通信事实与证据，不维护预设参数或设备当前状态。日常使用见[操作指南](../operations.md)，异常恢复见[读回恢复记录](echo-b-readback-recovery.md)，开发方向见[功能探索](echo-b-possibilities.md)。

## 通信实现

| 项目 | 已确认内容 |
| --- | --- |
| 传输 | macOS IOKit 控制管道 SET_REPORT(Output) / GET_REPORT(Input) |
| 报告 | ID 1，总长 62 字节；CTRL 模块 ID 为 `0xB32D2300` |
| 标志 | GET 位 `0x0100`，回复位 `0x8000` |
| 返回计数 | offset 2 的 int16，负值表示错误 |
| 当前系数读取 | CTRL/`0x01BE`，参数 `[0, band]` |
| 当前系数写入 | CTRL/`0x00BE`，参数 `[0, band, Gain, B0, B1, B2, A0, A1]` |
| 系数格式 | offset 22 起，每项占 4 字节，按 24 位有符号 Q22 解释；offset 18 为 Gain |
| 保存流程 | 自定义模式、9 段标签、五采样率系数、保存命令，共 56 帧 |

官方 `getEQParamsFromFlash` 实际组合模式和参数读取，不能因名称就当作完整闪存备份。Android 参数标签也不能代替原始系数。

## 已有实机证据

- [设备身份](../../evidence/usb-identity.json)：本机 IORegistry 采集。
- [初始状态备份](../../backups/ECHO-B-original-current-state.json)：模式、9 段标签和当前系数；校验值见 [SHA256SUMS](../../backups/SHA256SUMS)。
- [临时修改与恢复](../../backups/runtime-roundtrip.jsonl)：狭窄的单段系数变更，恢复后原始回包逐字节一致，未发送闪存保存。
- [早期保存验收](../../profiles/muffled-persistence-test/verification.json)：完整保存序列与当前运行系数读回。
- [整体输出增益范围](echo-b-output-gain-range.md)：Q22 正系数端点临时写入、读回及完整恢复；未测量模拟输出。
- [滤波器增益范围](echo-b-filter-gain-range.md)：105 组系数临时写入、逐字节读回及恢复；±12 dB 不是统一硬件极限，未测量模拟频响。
- 后续各次操作见 `runs/` 中的快照、ACK 和检查结果；历史目录名不代表设备实时状态。

这些记录验证了参数/系数读取、临时修改与恢复、保存及当前系数核对，不能证明完整闪存恢复、全部模式或物理拔插保持。`tools/echo_runtime_test.c` 只适用于特定初始状态，不是通用预览工具；运行中拔线或强制终止会打断恢复。

## 静态分析来源

- [官方 APK 库存](../../evidence/apk-inventory.json)与[反汇编](../../evidence/official-dex-protocol.asm)：包含来源哈希及系数读写路径；APK 未启动。后续已在 ARM64 模拟器中执行其系数计算库，与本工具比较 1355 个样本，见[官方系数对比](echo-b-android-eq-comparison.md)。模拟器使用主机数学函数桥接 libm，不是 Android UI 或模拟回录验证。
- [FreeDSP Studio 固定版本](https://github.com/EffectiveEquivalent/FreeDSP-Studio/tree/1b42f63db24f7dc8e94f6897575c1c403f4d4882)：本地保留 [DSP](../../evidence/upstream-dsp.rs) 与 [HID](../../evidence/upstream-hid_hidapi.rs) 副本。第三方实现不能代替本机验收。
- [REA 诊断记录](../../evidence/rea-memory-read.json)：当次工具未能启动，实际静态检查使用 LLVM 和 Androguard；本地分析文件不是 REA Evidence ID。
- [ECHO-B 官方产品页](https://moondroplab.com/cn-products/echo-b)：2026-10-30 定位，说明与 FreeDSP 共享调音及 USB 音频兼容性；不据此推断所有控制功能。
