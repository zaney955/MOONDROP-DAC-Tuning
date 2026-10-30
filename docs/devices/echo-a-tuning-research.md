# ECHO-A 调音能力与兼容性

ECHO-A 支持设备端参数均衡器（PEQ）。公开实机证据对应 USB `3302:12C5`、产品名 `ECHO-A`、固件 `0.1`；证据来自 Contour 作者的写入、读回和模拟输出测量，本仓库没有 ECHO-A 本地实机验收。[协议依据](https://github.com/Chronosauros/contour/blob/main/research/protocol/PROTOCOL.md#moondrop-echo-a-330212c5-supported-in-contour-160)

## 软件与参数

| 项目 | Contour 支持范围 |
| --- | --- |
| 频段 | 8 段 |
| 单段增益 | −10 至 +10 dB |
| 原生滤波器 | 峰值、低架、低通、高通 |
| 高架 | 由反向低架与前级增益组合，增益为整 dB，可能需要降低前级 |
| 前级 | −30 至 0 dB，整 dB 步进 |

Android 可使用 Contour 1.6.0 或以上，发送后会读回核对。上述范围是软件支持范围，不代表硬件的全部极限。[使用指南](https://contoureq.app/guide/)、[设备定义](https://github.com/Chronosauros/contour/blob/main/devices/moondrop-echo-a.json)

Contour 说明调音存于 DAC，可供其他播放设备使用；ECHO-A 独立断电保持证据栏不完整，本仓库不提供本地拔插验证结论。[项目说明](https://github.com/Chronosauros/contour#why-it-exists)

DevicePEQ 提供电脑网页控制路线，须按实际 VID/PID、USB 名称与协议匹配。其 WalkPlay SchemeNo11 包含 PID `0x12C5`，但 `Echo A` 名称别名可选择其他 handler，不能仅凭名称认定兼容。网页写入没有本地实机验收。[配置](https://github.com/jeromeof/devicePEQ/blob/master/devicePEQ/usbDeviceConfig.js)、[浏览器要求](https://github.com/jeromeof/devicePEQ/blob/master/devicePEQ/index.md#browser-requirements)

厂商产品页说明 USB-C、3.5 mm 单端及麦克风功能，但没有明确的 PEQ 支持承诺；附带 App 下载卡不构成型号兼容证明。[官方产品页](https://moondroplab.com/en/products/echo-a)

## 协议与本仓库支持范围

ECHO-A 的已验证版本采用 WalkPlay SchemeNo11、HID 接口 3、Report ID `0x4B`，系数设计率为 93,750 Hz。[协议依据](https://github.com/Chronosauros/contour/blob/main/research/protocol/PROTOCOL.md#moondrop-echo-a-330212c5-supported-in-contour-160)

本仓库硬件后端针对 ECHO-B `35d8:149b`，使用 Report ID 1、62 字节报告和 CTRL 模块。ECHO-B 写入程序及编译结果不能直接用于 ECHO-A；设备识别、WalkPlay 编码和验收路径需要独立适配。[ECHO-B 协议](echo-b-investigation.md)
