# ECHO-B 技术参考

本仓库支持 MOONDROP ECHO-B（USB `35d8:149b`）的 EQ 编译、保存与当前状态读回。使用步骤见[操作指南](../operations.md)。本页区分工具支持、已有设备证据和仍待验证的能力。

| 主题 | 参考 |
| --- | --- |
| 参数范围、定点精度、官方 App 差异 | [参数与算法](echo-b-parameters.md) |
| 读取错误、重连与写入结果判断 | [读取恢复](echo-b-readback-recovery.md) |
| 升级包、备份覆盖与恢复限制 | [固件与恢复](echo-b-firmware.md) |
| ECHO-A 的独立协议 | [ECHO-A 兼容性](echo-a-tuning-research.md) |

## 通信与验证范围

| 项目 | 实现 |
| --- | --- |
| 传输 | macOS IOKit 控制管道 SET_REPORT(Output) / GET_REPORT(Input) |
| 协议 | CAPE；报告 ID 1，总长 62 字节，CTRL 模块 `0xB32D2300` |
| 布局 | offset 2 为 int16 计数，负值为错误；GET 位 `0x0100`，回复位 `0x8000` |
| 当前系数读取 | CTRL `0x01BE`，参数 `[0, band]` |
| 系数写入 | CTRL `0x00BE`，参数 `[0, band, Gain, B0, B1, B2, A0, A1]` |
| 编码 | offset 18 为 Gain；offset 22 起每项占 4 字节，低 24 位为有符号值 |
| 工具缩放 | 固定 Gain=3 / Q22；当前读回解析器只接受 Gain=3 |
| 保存序列 | 自定义模式、9 段标签、五采样率系数及保存命令，共 56 帧 |

参数及当前系数读取、临时修改与恢复、完整保存序列和当前系数核对有设备采集依据。它们不证明全部模式、各采样率的模拟表现、完整闪存恢复或物理拔插保持。官方 `getEQParamsFromFlash` 组合读取模式和标签，也不是完整闪存备份。

CAPE 布局由既有回包、Android SDK 和 Synaptics 编写的 fwupd 实现交叉核对。协议族和 SDK 类名不能独立鉴定物理芯片；`CxAudioHidDev20805` 类与默认显示值不等于已确认实物料号。详见[协议比对材料](../../evidence/firmware-cape-followup-20261030/chip-inference/REPORT.md)。

## 平台与模式兼容性

网页编辑器依赖本地 Python／IOKit 后端。支持 USB 音频播放，不等于该平台能访问厂商控制接口；本仓库没有 Windows、Linux、Android 或 iPhone 设备控制后端。

官方 Android APK `2.25.0c-260813ai` 的共享 SDK 列出 Custom、Default、Dance、Rock、Jazz、Rap；已分析保存入口只在模式 0 构造自定义标签和系数，没有独立用户槽字段。模式选择使用 CTRL `0x005A`、参数 `[0x5A, index]`。这些是静态代码观察，不能当作所有内置模式的本机实测，也不能证明硬件只能存一套。

因此，本工具以电脑上的多个 JSON 管理配置，每次应用都会替换当前自定义设置。五套采样率系数服务于同一 EQ，不是五个用户预设槽。多套自定义 EQ 的设备内存储与 iPhone 直接切换均未建立可用实现。

已保存的 USB 描述符没有建立手机音量键切换 EQ 的路径。通用 USB 音频播放、USBDriverKit 或 External Accessory 也不构成本机 iPhone 厂商控制通道的证明；未完成 iPhone 实机控制验证。代码偏移、描述符及平台资料见[模式与手机控制证据](../../evidence/multi-eq-20261030/README.md)。

## 扩展能力的边界

当前已实现图形编辑、小数 dB 调节、JSON 导入导出和独立只读复核。以下仍需另行开发和验收：

| 方向 | 缺少的验证或实现 |
| --- | --- |
| 临时试听与 A/B | 通用备份恢复、采样率变化及切换瞬态处理；现有单段测试不能直接充当此功能 |
| 外部 EQ 格式、目标拟合 | 类型、Q 定义、段数和目标测量系统转换 |
| 第 9 段改作音色、高通／低通／陷波 | 编译器扩展、量化响应与实机验收 |
| 左右独立 EQ、模拟增益档 | 本机路由和存储证据 |
| Crossfeed、空间化、动态 EQ、压限器 | 声道混合或动态处理接口证据 |
| 固件改写与完整恢复 | 匹配镜像、存储覆盖和恢复入口，见[固件参考](echo-b-firmware.md) |

固定数字衰减不改变手机音量键步进，也不增加耳放最大输出功率。SDK 通用字段或同代产品实现不能代替 ECHO-B 验证。

## 来源

- [USB 身份](../../evidence/usb-identity.json)、[初始状态采集](../../backups/ECHO-B-original-current-state.json)及[校验和](../../backups/SHA256SUMS)：历史设备证据，不代表当前连接设备。
- [临时系数往返采集](../../backups/runtime-roundtrip.jsonl)：单段测试；对应程序 `tools/echo_runtime_test.c` 有特定起始条件。
- [官方 APK 库存](../../evidence/apk-inventory.json)、[协议反汇编](../../evidence/official-dex-protocol.asm)和[原生计算路径](../../evidence/android-eq-path-notes.md)。
- [FreeDSP Studio 固定版本](https://github.com/EffectiveEquivalent/FreeDSP-Studio/tree/1b42f63db24f7dc8e94f6897575c1c403f4d4882)、本地 [DSP](../../evidence/upstream-dsp.rs) 与 [HID](../../evidence/upstream-hid_hidapi.rs) 快照：协议参考。
- [扩展功能离线算例](../../evidence/echo-b-extension-feasibility.json)：仅适用于所列样例，不是通用精度或能力保证。
