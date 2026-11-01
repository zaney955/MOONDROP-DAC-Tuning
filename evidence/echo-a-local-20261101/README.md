# ECHO-A 本地调音依据与边界（2026-11-01）

## 公开协议源

本目录保留当日下载的公开源文件，SHA-256 见 `sha256.json`：

- `WalkPlay.kt`：[Contour 实现](https://github.com/Chronosauros/contour/blob/main/android/core/src/main/kotlin/io/github/chronosauros/contour/core/WalkPlay.kt)。用于核对 0x18 带帧、Q30、整数前级与提交序列。
- `walkplay.py`：[早期协议研究](https://github.com/Chronosauros/contour/blob/main/research/protocol/walkplay.py)。其默认 96 kHz 与频率/Q 补偿已不适用于此处；不得原样用于 ECHO-A 调音。
- `device.json`：[ECHO-A 记录](https://github.com/Chronosauros/contour/blob/main/devices/moondrop-echo-a.json)。文件包含早期 `unknown` 和未验证标记，也包含更新后的 44.1/48 kHz 模拟测量记录，需按证据时间区分。
- [协议说明](https://github.com/Chronosauros/contour/blob/main/research/protocol/PROTOCOL.md#moondrop-echo-a-330212c5-supported-in-contour-160)：ECHO-A 固定按 93,750 Hz 播放系数，低架使用斜率形式。这里的本地实现只开放峰值、S=1 低架和非正整数前级。

上游代码的注释说明 WalkPlay 算法来源为 Jerome O'Flaherty 的 devicePEQ（0BSD）；留存文件是证据快照，不是安装依赖。

## 耳机依据

[NICEHCK 官方产品页](https://www.nicehck.com/products/yuandao-10th)区分 3.5mm 有麦/无麦、Type-C 版本。本次用户明确用 ECHO-A 配原道十周年、全包海绵，选择温和均衡起点。

`yuandao-official-graph.jpg` 是制造商频响宣传图，经[该评测转载](https://hamuchan777.hatenablog.com/entry/nicehck-10th-anniversary-edition-yuandao-review)取得，原图 URL：<https://cdn-ak.f.st-hatena.com/images/fotolife/h/hamuchan777/20260318/20260318092158.jpg>。已实际查看坐标与注记：**3.5mm No Mic Version / Foam Covers Not Included / B&K 5128 HATS**，明显低频滚降和约 1.6 kHz 宽峰。这里只进行定性读图，没有从图片臆造原始 CSV、左右声道、失真数据或测试重复性。

也定位到[油兔几实测视频](https://www.bilibili.com/video/BV1d7XCB5EHP/)，但未取得视频内测量帧或原始数据，因此没有把标题当作测量结果，也没有声称复现其 EQ。

缺少全包海绵测量和个人耳内数据，故 +1 dB / −1 dB 的两段调整是试听假设，并非数据拟合。全包海绵低频表现不能从无海绵曲线直接推算。1.6 kHz 的调整只轻收宽峰，不能把原始耳机曲线拉成水平直线。对深低频与高频凹陷不作大幅补偿。

## 本地设备验收

记录目录：[`runs/20261101T043919.313826Z-echo-a-yuandao-10th`](../../runs/20261101T043919.313826Z-echo-a-yuandao-10th)。系统枚举名 ECHO-A、USB `3302:12c5`、序列号 `330212C5240911`、bcdDevice 1；HID 实际回复固件 `0.1`。

初始 8 段 0 dB 峰值：31/62/125/250/500/1000/2000/4000 Hz，Q 0.75，槽位 0，前级 0 dB。备份包含全部原始系数。新设置为低架 110 Hz +1 dB S=1、峰值 1600 Hz −1 dB Q=1、其余中性、前级 −20 dB。

`apply.jsonl` 前 11 行为写前核对，后 11 行为写后读回；`after-independent.jsonl` 为关闭并重新打开连接后的独立只读复核。160 字节系数、8 段频率/Q/增益/类型/槽位、前级均严格匹配。`restore-original.bin` 仅生成，未执行。

发送提交序列及其后的正确读回已验证；独立保存 ACK、物理拔插保持、模拟输出频响与电平均未验证。
