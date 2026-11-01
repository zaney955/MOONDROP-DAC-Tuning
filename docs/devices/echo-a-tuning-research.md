# ECHO-A 协议与兼容性

本仓库已在 USB `3302:12c5`、产品名 `ECHO-A`、固件 `0.1` 上完成写入、独立读回与网页只读复核。当前编辑范围见[能力表](README.md#编辑能力)，日常入口使用[网页](../visual-editor.md)或[统一 CLI](../operations.md)。

## 传输与系数

| 项目 | ECHO-A 路径 |
| --- | --- |
| HID | 接口 3，报告 ID `0x4B`，64 字节含 ID |
| 协议 | WalkPlay SchemeNo11 |
| 系数 | 5 个有符号 int32、Q30：`b0, b1, b2, -a1, -a2` |
| 设计率 | 固定 93,750 Hz，不按 USB 音频流采样率选择五套系数 |
| 写入 | 固定写全 8 段、前级及提交序列；未用段填中性峰值 |
| 验收 | 写前完整快照匹配；写后核对系数、元数据、槽位、前级，并重开 HID 读取 |

设计率与架式斜率依据 Contour 的[协议及模拟输出测量报告](https://github.com/Chronosauros/contour/blob/main/research/protocol/PROTOCOL.md#moondrop-echo-a-330212c5-supported-in-contour-160)。本地源文件快照及初次实机结果见[证据索引](../../evidence/echo-a-local-20261101/README.md)。本仓库自身的验收是数字读回，不是模拟输出测量。

底层 `echo_a_hid.c` 精确匹配 USB ID、产品名、唯一 HID 设备及报告；`echo_a.py` 编译和验证 Q30。ECHO-B 的 CTRL 报告、Q22 和二进制计划不能用于 ECHO-A。统一入口的计划格式与互斥见[开发指南](../development.md#计划互斥与证据)。

## 第三方软件证据

| 来源 | 已有依据与范围 |
| --- | --- |
| [Contour](https://github.com/Chronosauros/contour/blob/main/research/protocol/PROTOCOL.md#moondrop-echo-a-330212c5-supported-in-contour-160) | 查阅的 1.6.0 资料报告峰值、低架、低通、高通、整数前级；高架通过反向低架和前级组合模拟。这不代表本编辑器已实现全部类型 |
| [DevicePEQ](https://github.com/jeromeof/devicePEQ/blob/master/devicePEQ/usbDeviceConfig.js) | SchemeNo11 含 PID `0x12C5`，但名称别名可能分派其他 handler；此第三方网页未在本仓库本地验收 |
| [厂商产品页](https://moondroplab.com/en/products/echo-a) | 说明 USB-C、3.5 mm 和麦克风；下载卡本身不能证明 PEQ 协议兼容 |

上游[设备定义](https://github.com/Chronosauros/contour/blob/main/devices/moondrop-echo-a.json)含不同日期的早期未知项与后续验收，需结合具体证据时间判断。其他固件、受控断电保持及本仓库的模拟输出结果尚未验证；USB 提交成功不等于独立闪存保存 ACK。

## 本地记录

- [初次 CLI 写入与读回](../../runs/20261101T043919.313826Z-echo-a-yuandao-10th/README.md)
- [统一网页验收](../validation-20261101.md#echo-a-网页实机验收)
- [原道十周年资料、试听依据与现行预设](../../headphones/nicehck/yuandao-10th/README.md#温和试听起点与历史验收)

这些记录保留当次电平，不代表当前连接设备或现行预设的增益。

## 原始备份恢复

首次记录保留 `before.jsonl` 和未执行的 `restore-original.bin`。设备状态改变后应先通过底层只读 `bin/echo_a_hid read` 保存新的 `CURRENT`，再用 `python3 tools/echo_a.py restore-plan ORIGINAL CURRENT OUTPUT` 生成一次性回退计划。旧前置快照不匹配时，C 程序拒绝写入。

回退仍是设备写入，可能恢复不同的前级电平；降低播放音量、关闭其他控制程序并串行操作。原始帧恢复属于协议层操作，底层工具不代替统一入口的互斥和状态记录，也不是固件恢复。
