# 同代 CAPE .hid 升级包与完整备份边界

2026-10-30。全程仅离线读取已有包、官方库汇编及父调查下载的固定版本源码；没有调用任何native库、USB接口、升级方法或设备工具，没有修改包、VID/PID或仓库文件。

## 可成立的结论

这些 .hid 是 **CAPE 正常升级使用的固件打包文件，含程序内容、型号USB配置和调音数据**；它们不是用户实机所有存储的逐字节副本。当前证据不能把它们称为整片Flash、ROM、OTP或单机校准信息的完整备份，也不能仅依据文件长度认定Flash容量。

真实新边界有三项：

1. `.hid` 主机路径把32B头中的前20B交给设备作升级开始参数，然后将余下114688B顺序发送给设备处理。主机并未按物理地址逐块复制整个Flash。因此**最终覆盖哪些存储区域、是否保留序列号/校准，要看设备端更新处理器**，不能从host代码保证。
2. 包内有明确的型号身份配置，不能只拿相近芯片代码替代。例如FreeDSP的[0x120,0x14000)与MAY及旧DUSK-SP完全相同，但包后段USB型号/VID/PID和调音数据不同。换包或改外层VID/PID既不能保留原型号配置，也不能证明适配。
3. CAPE工具源码支持成对的分区镜像；下载到的每个114720B文件却是一个完整 `.hid`，不是通用fwupd期望的“两份等长HID拼接输入”。不能直接拿这些单文件喂给那个通用更新入口。

## 原始来源校正

固定commit：`fwupd/fwupd@2796458862b73aa541ee1786bf73c9cb7d147103`，`plugins/synaptics-cape/`。相关firmware parser版权归Synaptics，文件由父调查通过GitHub连接器取得。精确路径、原始URL和SHA-256保存在`source-identity.json`。

- `fu-synaptics-cape.rs` 第65行起定义32B HID头：VID(u32)、PID(u32)、update_type(u32)、signature(u32)=0x43534645/EFSC、crc(u32)、ver_w/x/y/z(各u16)、reserved(u32)。
- `fu-synaptics-cape-hid-firmware.c` 第55行起按 **z.y.x.w** 显示版本；第62–80行将前20B作为header、去除整个32B头后的内容作为body。
- 该HID parser**没有验证crc字段**，write方法第101行甚至将其写为0xFFFF。此处只记录原字段，不能声称CRC已验通过。
- `fu-synaptics-cape-sngl-firmware.c` 第64行起验证的是另一种SNGL容器的标准CRC32（从offset8开始），不可借套到这些EFSC HID文件。

## 已下载六份HID的解析结果

每份总长114720B（0x1c020），body均为114688B（0x1c000，28个4KiB）。update_type均为2；**数值2的具体语义未由当前公开类型定义证实，不能把它直接解释为“全固件”或“分区2”**。

| 目录标签 | header目标 | 头内实际版本 z.y.x.w |
| --- | --- | --- |
| FreeDSP 1.1 | 35d8:1496 | 9.7.12.6 |
| MAY 1.1 | 35d8:1497 | 9.7.12.1 |
| DUSK-SP | 35d8:1499 | 9.7.12.1 |
| DUSK 9.7.13.1 | 35d8:1499 | 9.7.13.1 |
| Starlight 1.0.0 | 35d8:1499 | 9.7.13.1 |
| moca temp | 06cb:1594 | 9.7.12.0 |

没有一份header目标为35d8:149b。标签和内含版本也不是同一套命名，不能只用目录显示版本选择恢复包。

body开头也有EFSC。在这些包中，body+8的word=0x100、body+12的word=0x1bf00，二者相加恰好等于body大小。**这只记录结构关系，不擅自将未知内部字段命名为物理分区/容量**。后续EFSC字符串还出现在程序常量区，不能将每个magic命中误当作嵌套镜像头。

## 身份模板、默认数据和型号覆盖

以FreeDSP包为例：

- 完整标准USB设备描述符位于0x114f0及0x1151c，VID/PID为默认06cb:1594；其附近文字为Synaptics、Hi Res USB-C AUDIO、序列号模板000000000000。
- 0x14160的完整18B设备描述符为 `12010002ef020140d8359614060001020301`，明确包含型号目标35d8:1496。它紧跟module0xB32D2300、cmd0x003b的配置记录。附近有MOONDROP和FreeDSP字符串记录。
- MAY的对应目标描述符在0x14158，VID/PID为35d8:1497；DUSK-SP在0x14160为35d8:1499。

因此同一个包能同时存在芯片通用默认身份和产品身份配置。字节解析证实这些记录存在，不宣称已动态验证固件具体选择哪条或是否再从设备持久区覆盖。

所有公开包使用通用序列号模板，不能包含每一台设备的独有出厂资料。**当前不知道本机是否有独立校准区，也不知道EFSC设备端升级会保留、重建还是覆盖该区。** 主机`.hid`分支没有先采集本机唯一资料再恢复的代码，不能据此承诺保留。SDK其他S37/EEPROM补丁分支有专门的序列号保护逻辑，但那是另一条路径，不能移植成当前EFSC行为的结论。

## 为什么不是已知的“整片SFS/Flash恢复镜像”

已有库`HandleImageFile@0x1f270`和`GenerateCombinedSfsInfo@0x1f140`处理的是SFSE（0x45534653）头、4KiB块、header、boot/image/chunk/protected-file等类型，能区分full/complete/partial及不同分区升级计划。它们**不是`.hid`专用分支的解析流程**。

`.hid`专用分支在`CxAudioHidDev20805::EepromPatch@0x27b68`中：

- @0x27bec–0x27c24读取32B头；
- @0x27db4–0x27df0用前五个u32构造CTRL/0x00c8；
- @0x27e50–0x27ec8按最多52B读取并发送CTRL/0x00c9；
- @0x27f54–0x27f88发送CTRL/0x00ca结束。

这与Synaptics原始CAPE源码的FwUpdateStart/Write/End相符。host把body当设备端格式处理的字节流，没有暴露EFSC内部完整物理地址映射。普通SFS parser看到“full”或者支持ROM bootloader块，不能反过来证明这六个EFSC包包含整片Flash或ROM。

## 成对分区输入的具体不兼容

`fu-synaptics-cape-device.c` 第413–435行明确把输入对半，选非活动分区的半份，再将这半份按HID格式解析。SNGL文件类型定义也分别列出HID0和HID1。

这些下载的单HID若直接进入该函数，会被切成57360B：活动分区1时从offset0xe010开始，那里不是完整HID头；活动分区2时虽然第一半保留有效头，但body只剩57328B，原body为114688B。代码并不等同于原生SDK对完整单HID顺序发送的路径。**此处只是离线演算，不运行fwupd，也不建议自行拼接/复制或绕过检查。** 它证明通用插件的输入契约不同，不证明ECHO-B本机的分区数量、活动分区或救援能力已实测。

## 对完整备份/恢复的要求

当前仍缺ECHO-B本机的持久存储布局，不能给出可信的“读取0到某地址就是全备份”。可靠恢复至少需要先明确：

- 兼容该机器硬件和ROM版本的正确代码/配置镜像；
- 可写持久存储的完整范围，以及若有A/B分区时两份镜像和启动/有效性元数据；
- 型号USB身份、EQ/用户设置、序列号等区域，以及若存在的单机校准区分别在哪里、能否读取和刷回；
- ROM/OTP是否单独影响启动/解密/签名，以及原始设备是否仍能进入可用更新处理器。

这些是覆盖范围的未知项，不意味着ECHO-B一定拥有上述全部区域。恢复固件通常依赖仍完好的芯片ROM；公开升级包并不等于ROM/OTP备份。此轮未得到实机完整固件备份，也未建立保证救砖的路径。

## 可复跑产物

`inspect_hid_layout.py`使用纯Python标准库，不联网、不调用native：

```sh
python3 inspect_hid_layout.py /absolute/path/to/firmware-compatibility-20261030 --output hid-layout-analysis.json
```

输出包含每个文件SHA256、外层头字段/版本、未验证CRC、USB描述符候选、模板字符串、4KiB差异统计、与FreeDSP共同字节范围、尾部填充和通用fwupd对半输入演算。`hid-byte-comparison.json`保留另一份详细差异区间。

新增汇编`handle-image-file.asm`、`generate-combined-sfs-info.asm`、`generate-upgrade-info.asm`只由系统objdump静态产生。官方源码没有在本任务编译或执行。
