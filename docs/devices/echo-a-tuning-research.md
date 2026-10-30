# ECHO-A 调音支持调研

调研日期：2026-10-30。仅查阅公开资料和源码；本次未连接、读取或写入 ECHO-A。

## 结论

**支持设备端参数均衡器（PEQ）调音，有第三方作者的实机写入、读回和模拟输出测量证据。** 对应被测硬件为 USB `3302:12C5`、产品名 `ECHO-A`、固件 `0.1`，并非仅由 ECHO-B 或同品牌产品推测。[Contour 协议记录](https://github.com/Chronosauros/contour/blob/main/research/protocol/PROTOCOL.md#moondrop-echo-a-330212c5-supported-in-contour-160)

水月雨官方产品页说明了 USB-C、3.5 mm 单端及麦克风等功能，但未明确宣传 PEQ；页面附带 APP 下载卡也不能单独证明官方软件支持该型号。[官方产品页](https://moondroplab.com/en/products/echo-a)

## 已有调音能力与软件

| 项目 | 当前公开证据 |
| --- | --- |
| 频段 | 8 段 |
| 单段增益 | Contour 使用 −10 至 +10 dB |
| 原生滤波器 | 峰值 PK、低架 LS、低通 LP、高通 HP |
| 高架 HS | Contour 用反向低架加前级增益模拟，增益取整 dB，可能需要进一步降低前级 |
| 前级 | Contour 提供 −30 至 0 dB，整 dB 步进 |

滤波器、增益和实测结论见 [Contour 1.6.0 发布说明](https://github.com/Chronosauros/contour/releases/tag/v1.6.0)；前级范围见 [使用指南](https://contoureq.app/guide/)。这些是软件采用的范围，不能据此断言已经测出了硬件所有极限。

**现成路线优先考虑 Android 的 Contour 1.6.0 或以上。** 1.6.0 在 2026-10-25 加入 ECHO-A；本次查阅的最新 GitHub 发布为 1.6.4。发送后软件会读回核对。项目说明 EQ 存入 DAC，换到电脑或其他播放设备后仍使用设备内设置；但 ECHO-A JSON 记录的独立 `persistence` 证据栏仍为空，不能将项目总说明表述成本次已完成 ECHO-A 拔插验证。[发布列表](https://github.com/Chronosauros/contour/releases)、[项目说明](https://github.com/Chronosauros/contour#why-it-exists)、[ECHO-A 设备记录](https://github.com/Chronosauros/contour/blob/main/devices/moondrop-echo-a.json)

电脑网页路线可研究 DevicePEQ，但必须核对实际 VID/PID、USB 名称和所选协议。其源码的 WalkPlay SchemeNo11 分组包含 PID `0x12C5`；另一个名为 `Echo A` 的别名却选择不同 handler 和限制，不能将名称条目直接当作同一硬件的实测证明。网页兼容与写入尚未在本地验证。[DevicePEQ 配置](https://github.com/jeromeof/devicePEQ/blob/master/devicePEQ/usbDeviceConfig.js)、[浏览器要求](https://github.com/jeromeof/devicePEQ/blob/master/devicePEQ/index.md#browser-requirements)

## 与本仓库 ECHO-B 的关系

ECHO-A 被测版本采用 WalkPlay SchemeNo11、HID 接口 3、Report ID `0x4B`；作者测得 DSP 系数运行于 93,750 Hz，不能直接采用普通 96 kHz 系数假设。其设备记录仍标记 `records-only`，README 明确解释这是字段尚未补齐：EQ 写入自 10 月 25 日已通过复用 Protocol Micro 的代码发布，不代表 EQ 写入仍被禁用。[协议记录](https://github.com/Chronosauros/contour/blob/main/research/protocol/PROTOCOL.md#moondrop-echo-a-330212c5-supported-in-contour-160)、[设备记录说明](https://github.com/Chronosauros/contour/blob/main/devices/README.md)

本仓库后端针对 USB `35d8:149b` 的 ECHO-B，使用 Report ID 1、62 字节报告、CTRL 模块和 Q22 系数。因此 **ECHO-B 的设备写入程序和编译结果不能直接用于 ECHO-A**；若要纳入本仓库，需要单独的设备识别、WalkPlay 编码及验证路径。[本仓库设备协议](echo-b-investigation.md)、[项目说明](../../README.md)

目前证据足以回答“ECHO-A 能否调音”：能。具体用户设备是否与上述被测 USB/固件一致、官方 APP 能否控制、网页工具实际兼容性及跨固件行为，仍应以设备枚举和只读备份为起点验证。
