# 原道十周年：Mac 3.5 mm 直插调音

核对日期：2026-11-01。适用连接为用户确认的 **3.5 mm 版直插 Mac，戴全包海绵套**；此前 ECHO-A 调音属于另一条连接路线。

## 结论与证据

3.5 mm 版通过 Mac 音频输出做软件 EQ，设置保存在电脑端。官方把内置 DAC / DSP 限定为 **Type-C 版**，并为其提供 8 段 PEQ；不能把该 App 功能视为 3.5 mm 版的耳机内置能力。[官方 DAC 版本说明](https://cdn.shopify.com/s/files/1/0865/0850/3331/files/07_5da945f6-a44e-42d0-b966-53d07ed656b5.jpg?v=1773218492)、[官方 PEQ 说明](https://cdn.shopify.com/s/files/1/0865/0850/3331/files/08_12470106-190e-429e-9eb9-590c17266da4.jpg?v=1773218480)

本轮先按 reverse-engineer-anything 工作流识别目标。确认模拟连接后，没有需要复现的耳机 USB 控制接口；因此未反编译与其无关的 MOONDROP App，也未将 Type-C 版本协议推断套用到此连接。后续已取得官方 PC 网页、十周年 Type-C 配置及设备写入链路，见[硬件写入调查](hardware-write-investigation.md)；实际设备写入与断电保存仍待该版本实物验证。

本机只读音频清单见[观察记录](mac-audio-observation-20261101.json)：

| 输出 | 观察结果 |
| --- | --- |
| ECHO-B | USB，48 kHz，常规默认输出 |
| 外置耳机 | Apple 内建输出，48 kHz，默认系统提示音输出 |

这意味着使用系统默认输出的播放器当时仍会播放到 ECHO-B；应用单独指定的设备可能不同。上述记录是时间点快照，不能代表以后状态。在标准应用目录未发现 eqMac 或 SoundSource；未安装软件、改变输出、写入耳放或测量实际声音。

## 可用路线

| 路线 | 适用情况与限制 |
| --- | --- |
| [eqMac](https://eqmac.app/) | 支持 Mac 内置输出。免费版提供三段和固定 10 段 EQ；任意频率、Q、滤波器类型的 Expert Equalizer 为 Pro。适合图形化手动调音。 |
| [SoundSource](https://rogueamoeba.com/soundsource/) | 支持系统级或逐应用效果。Headphone EQ 可导入含 PK / LS / HS 等类型的[自定义文本配置](https://rogueamoeba.com/support/knowledgebase/?showArticle=SoundSource-Custom-HPEQ)。付费；[试用处理 20 分钟后叠加噪声](https://rogueamoeba.com/support/knowledgebase/?product=SoundSource&showArticle=Misc-AboutAppTrials)。 |
| [Music 自带均衡器](https://support.apple.com/en-il/guide/music/museb684a3de/mac) | “窗口 → 均衡器”即可使用，作用于 Music 播放的歌曲。是固定频段，无法精确重建下面两段 PEQ，也不处理其他应用。 |
| 3.5 mm 改接 ECHO-A / B | 可使用本仓库已有网页控制耳放 DSP；需要实际把耳机插到该耳放，EQ 才进入相应声音路径。设备差异见[设备参考](../../../../docs/devices/README.md)。 |

上表软件能力已核对官方资料，软件路由、实际效果和兼容性尚未在本机验收。当前仓库网页是外部 DAC 控制工具，没有接管 CoreAudio 系统音频；其曲线预览本身不会改变 Mac 耳机口的声音。

## 直插 Mac 的设置顺序

1. 在 macOS“系统设置 → 声音 → 输出”选择“外置耳机”；核对播放器没有另外指定 ECHO-B 或其他输出。
2. 全系统精确 PEQ 可选 eqMac Pro 或 SoundSource；若仅需 Music 内粗调，可先用其内置均衡器。效果链最终输出应指向“外置耳机”，虚拟驱动的上游路由依所选软件指引设置。
3. 从下面两段开始，其他增强效果先关闭，比较时匹配听感音量。软件前级和整体增益由用户自行决定，本次未写入任何增益设置。

| 类型 | 频率 | 增益 | 参数 |
| --- | --- | --- | --- |
| Low Shelf | 110 Hz | +1 dB | S=1；采用 RBJ Q 定义的软件对应 Q≈0.7071 |
| Peak / Bell | 1600 Hz | −1 dB | Q=1 |

参数沿用[温和试听起点](../README.md#温和试听起点与历史验收)，不是官方 App 预设，也不是全包海绵测量拟合。低架 `S` 和 `Q` 不同：按 [RBJ / W3C 公式](https://www.w3.org/TR/audio-eq-cookbook/)，S=1 时 Q=1/√2。仓库 ECHO-A JSON 的低架 `q: 1` 表示 S=1，不能直接照抄到以 Q 控制低架的软件。其他软件若采用不同滤波器定义，需要另行核对曲线，不能声称已经完全等效。

SoundSource 的文本格式要求首行 `Preamp`，因此现有 DAC JSON 不能直接导入；本轮只提供参数表，未另造含自动前级的配置。切回耳放或其他播放软件时，重新检查是否叠加了第二层 EQ。

返回[型号资料](../README.md)。
