# ECHO-B 协议与验证边界

对象：MOONDROP ECHO-B，USB `35d8:149b`。日常操作见[操作指南](../operations.md)，读取异常处理见[读取重试与恢复](echo-b-readback-recovery.md)。

## 通信实现

| 项目 | 内容 |
| --- | --- |
| 传输 | macOS IOKit 控制管道 SET_REPORT(Output) / GET_REPORT(Input) |
| 报告 | ID 1，总长 62 字节；CTRL 模块 ID 为 `0xB32D2300` |
| 标志 | GET 位 `0x0100`，回复位 `0x8000` |
| 返回计数 | offset 2 的 int16，负值表示错误 |
| 当前系数读取 | CTRL/`0x01BE`，参数 `[0, band]` |
| 当前系数写入 | CTRL/`0x00BE`，参数 `[0, band, Gain, B0, B1, B2, A0, A1]` |
| 系数 | offset 22 起，每项占 4 字节，低 24 位为有符号值；offset 18 为 Gain |
| 工具编码 | 固定 Gain=3，对应 Q22；读回解析器只接受 Gain=3 |
| 保存流程 | 自定义模式、9 段标签、五采样率系数、保存命令，共 56 帧 |

官方计算库可动态选择 Gain，24 位模式的归一化尺度为 `2^(25−Gain)`，详见[算法兼容性](echo-b-android-eq-comparison.md)。

官方 `getEQParamsFromFlash` 组合模式和参数读取，不代表完整闪存备份。Android 参数标签不等于实际滤波系数。

## 能力与验证边界

参数和当前系数读取、临时系数修改及恢复、完整保存序列和当前系数核对均有设备证据。它们不证明完整闪存恢复、全部模式、所有采样率的模拟表现或物理拔插保持。

- [整体输出增益](echo-b-output-gain-range.md)：单系数增益范围、精度和验证依据。
- [滤波器系数范围](echo-b-filter-gain-range.md)：参数相关的编码边界和单采样率读回证据。
- [官方算法兼容性](echo-b-android-eq-comparison.md)：Q、架式、精度及缩放定义。
- [功能边界](echo-b-possibilities.md)：扩展所需接口与尚未证实的能力。

`tools/echo_runtime_test.c` 只适用于其声明的起始状态，不是通用预览工具。运行中断开设备或强制终止会打断恢复。

## 来源索引

- [设备身份](../../evidence/usb-identity.json)：IORegistry 身份数据。
- [状态备份](../../backups/ECHO-B-original-current-state.json)及[校验和](../../backups/SHA256SUMS)：模式、9 段标签和当前系数。
- [设备操作证据](../../runs/)与[临时系数往返数据](../../backups/runtime-roundtrip.jsonl)：ACK、回包和验证状态；不代表设备实时状态。
- [官方 APK 库存](../../evidence/apk-inventory.json)、[协议反汇编](../../evidence/official-dex-protocol.asm)与[原生计算路径](../../evidence/android-eq-path-notes.md)：来源身份及 Java / JNI / ARM64 实现。
- [FreeDSP Studio 固定版本](https://github.com/EffectiveEquivalent/FreeDSP-Studio/tree/1b42f63db24f7dc8e94f6897575c1c403f4d4882)及本地 [DSP](../../evidence/upstream-dsp.rs)、[HID](../../evidence/upstream-hid_hidapi.rs)快照：协议参考；第三方实现不代替本机验收。
- [厂商产品页](https://moondroplab.com/cn-products/echo-b)：产品功能及与 FreeDSP 共享调音的说明。
