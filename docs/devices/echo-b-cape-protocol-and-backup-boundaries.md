# ECHO-B：CAPE 协议、升级包覆盖与历史固件线索

日期：2026-10-30。本轮接续[候选包适配核对](echo-b-firmware-package-compatibility.md)，继续仅做离线分析和公开资料 GET。没有枚举/打开耳放、发送 USB 请求、运行升级器或执行目标 APK/库。

## 新增结论

| 问题 | 本轮进展 | 结论边界 |
| --- | --- | --- |
| ECHO-B 属于哪条协议路线 | 20 条既有实机回包与 Android SDK 的 CAPE 格式逐字段吻合；又找到 Synaptics 编写的 fwupd CAPE 实现 | 可以高置信确定 CAPE 控制协议，仍不能从类名确定物理芯片型号 |
| 同代 `.hid` 能否充当完整备份 | 明确是 32 字节升级头与 114,688 字节载荷；包含程序和型号配置，多个型号共享部分代码 | 尚未证明是完整 flash，更未证明包括 ROM、OTP 或单机校准 |
| 是否有可直接使用的公开工具 | fwupd 有独立 `synaptics-cape` 插件，区别于先前参考的 `synaptics-cxaudio` | 没有 ECHO-B 的设备条目或备份接口，不能直接视为兼容工具/救砖方案 |
| 旧官方 App 能否补出固件链接 | 找到四个确切历史捕获索引 | 旧包下载返回 HTTP 429；原厂旧 URL 的一次 GET 返回 500，尚未取得可分析旧包 |
| 有没有真正匹配 `35d8:149b` 的镜像 | 本轮未发现 | 之前的 SPV 候选及其他型号 `.hid` 均不能当本机恢复镜像 |

## 1. 从既有设备证据限定 CAPE 协议

本次复用 `backups/initial-read.jsonl` 和 `backups/coefficients-read.jsonl`，没有重新读取设备。20 条回包全部满足：

- 总长 62 字节，前两字节 `01 00`。
- offset 2 为有符号 16 位计数，offset 4 为命令/GET/回复标志，offset 6 为模块 `0xb32d2300`。
- 回复位 `0x8000`、GET 位 `0x0100`、命令低字节与保存的请求一致；每个 60 字节命令体最多 13 个 32 位数据。

Android SDK `CxAudioHidDev20805::Write@0x245a4` / `Read@0x247e4` / `SendCommand@0x249b4` 正好实现这一布局。`DeviceInfo` 中 CAPE 对应 62 字节，而其他旧族使用较小的报告和不同传输路线。因此结论已经比“库里有这个类名”或“总长度一样”更强。

但 SDK 自身的型号函数也说明不能直接把类名当芯片鉴定：

- `DeviceGetChipCode@0x2539c` **先写默认值 20805**，只有 GET 成功后才用回包覆盖。
- `DeviceGetChipCodeString@0x25480` 使用固定显示字串 `CX208xx`，没有把实测数值格式化成准确型号。
- native 工厂仍根据 USB 字符串索引 `0x29` 选择具体类，既有捕获没有该值。

因此准确说法是“已有回包高置信匹配 CAPE 协议，强推断该 SDK 会使用其 20805 类实现”；不能据此声称实物就是 CX20805。后述公开 CAPE 插件还覆盖 CX31993/CX31988 名称，说明协议名、旧 SDK 类名和实物料号需要分开。

完整反汇编、常量和可复跑的历史帧比较脚本见[协议证据](../../evidence/firmware-cape-followup-20261030/chip-inference/REPORT.md)。

## 2. 新找到 Synaptics 编写的 CAPE 原始实现

固定来源：[fwupd `synaptics-cape`](https://github.com/fwupd/fwupd/tree/2796458862b73aa541ee1786bf73c9cb7d147103/plugins/synaptics-cape)，commit `2796458862b73aa541ee1786bf73c9cb7d147103`。设备和 HID parser 源文件标明 Synaptics Incorporated 作者/版权。

其结构定义同样是：u16 report ID 1，加上计数、命令、模块和 13 个 u32 数据，模块为 `0xb32d2300`。升级命令 `0xc8/0xc9/0xca` 也与 Android SDK 的 `.hid` 分支对应。这是另一份可独立核对的原始实现，不是从第三方 EQ 工具的型号表推定。

这个插件仍有明确限制：

- [README](https://github.com/fwupd/fwupd/blob/2796458862b73aa541ee1786bf73c9cb7d147103/plugins/synaptics-cape/README.md)说明在设备正常运行时部署固件，写完后重置；它没有提供 ECHO-B 主固件失效后的 ROM/bootloader 进入方式。
- 设备类注册了 `setup`、`prepare_firmware`、`write_firmware` 等，没有 `read_firmware` 备份钩子；这不否定底层 SDK 可读 SPI，只是不能把此插件当完整备份工具。
- quirk 表列出 Framework/EPOS 的具体 USB ID，以及 CAPE CX31993/CX31988 名称，没有 MOONDROP 或 `35d8:149b`。
- 此驱动的 `prepare_firmware` 假定输入含两份等长分区镜像，再按活动分区选择另一半。我们下载的是单个完整 `.hid` 文件，不能不经适配就交给这一层准备函数。
- 该插件能查询活动分区，不证明 ECHO-B 也支持相同分区能力；官方 Android App 里硬编码返回 `"2"` 的方法仍不是实机读回。

本轮只读取这些源码，没有安装或运行 fwupd，也没有调用其查询、准备或更新流程。源码与结构化复核在[原始资料](../../evidence/firmware-cape-followup-20261030/fwupd-cape/source-manifest.json)及[驱动核对](../../evidence/firmware-cape-followup-20261030/fwupd-driver-review.json)。

## 3. `.hid` 的版本和格式能读出，但仍不是全机镜像

官方 CAPE 格式定义明确了 32 字节头：VID、PID、update type、`EFSC` magic、CRC 字段、四个 u16 版本分量和保留字。版本输出顺序是 `z.y.x.w`。

| 官方目录标签 | 包头目标 | 包头版本 | 载荷大小 |
| --- | --- | --- | ---: |
| FreeDSP 1.1 | `35d8:1496` | `9.7.12.6` | 114,688 |
| MAY 1.1 | `35d8:1497` | `9.7.12.1` | 114,688 |
| DUSK-SP | `35d8:1499` | `9.7.12.1` | 114,688 |
| DUSK 9.7.13.1 | `35d8:1499` | `9.7.13.1` | 114,688 |
| Starlight 1.0.0 | `35d8:1499` | `9.7.13.1` | 114,688 |
| moca temp | `06cb:1594` | `9.7.12.0` | 114,688 |

这进一步说明目录展示版本和包内版本并非同一字段。没有一个目标头是 `35d8:149b`。

注意：头部源码名为 `signature` 的字段实际固定为 `EFSC` 格式标记，**不是密码学签名**。该 fwupd HID parser 没有验证载荷 CRC；本次也没有把 CRC 字段的存在当作验证成功。SNGL 是另一种带文件校验和/子镜像描述的封装，不能将它的校验算法直接套给这些 `.hid`。

Android SDK 的 `.hid` 分支先把前五个 u32 头字段发到 `0xc8`，再把剩余载荷分块送 `0xc9`，最后 `0xca` 结束。它没有在主机侧把载荷展开成完整 flash 地图。普通 SDK 的 SFS parser 识别 `SFSE`，不能把这些 `EFSC` 载荷直接套成同一布局，更不能把载荷长度当成本机 flash 容量。

### 程序共用不等于型号配置可共用

FreeDSP、MAY、旧 DUSK-SP 的文件区间 `[0x120,0x14000)` 字节相同，差异集中在头部和后面的配置区域。载荷里既有通用默认的 Synaptics/Hi Res USB-C AUDIO 字符串，也有 MOONDROP/具体型号配置。

例如 FreeDSP 在文件 offset `0x14160` 有符合标准结构的 USB 设备描述符候选，声明 `35d8:1496`；MAY 的对应配置声明 `35d8:1497`。它们位于与 CAPE 模块配置相关的数据区。这证明升级包包含型号相关数据，不能仅因大段代码相同就跨型号使用；这些结构的运行时选择逻辑没有完整恢复。

这也补充了对 Marigold 字符串的解释边界：字符串位于实际载荷是事实，但只有把默认描述符、型号覆盖和运行时选择一起核对，才能确定设备最终身份。前轮没有把单个字符串当作最终实机枚举结果，其格式/协议冲突结论仍保持。

字节比较、描述符偏移和限制见[载荷分析](../../evidence/firmware-cape-followup-20261030/hid-layout/REPORT.md)及[头部复核](../../evidence/firmware-cape-followup-20261030/hid-header-review.json)。

## 4. 完整备份还缺哪些证据

CAPE SDK 的 `EepromRead` 实际转向 `SpimemRead`，不代表另有一块独立 EEPROM；`EepromGetSize` 读取的是初始化时缓存值。`GetRomVersionString` 复用固件版本数据格式化，也不代表可以导出 ROM。

当前不能证明完整备份所需的物理存储区域、总容量、全部分区、身份/校准数据位置及读保护状态。升级载荷中存在型号配置，更说明“只保存通用代码”不足以建立可恢复性；但不能据此编造单机校准一定存在哪个区域。

另发现 Edge Impulse 集成的 Synaptics KA10000 SDK 中有可读的 `SpimemOpen` / 读取实现。它帮助解释缓冲事务的设计，但使用不同模块/命令编号，不能替代 ECHO-B 的设备端处理器证据。详见[参考 SDK 的限定对照](../../evidence/firmware-cape-followup-20261030/reference-sdk/REPORT.md)。没有编译或运行它。

因此本轮仍未证明可在零状态变化条件下导出完整固件，也没有获得可刷回的本机恢复镜像。

## 5. 历史 App 路线有索引，内容尚未取得

对旧官方 URL `https://download.moondroplab.com/moondroplink/app-release.apk` 找到四个不同内容的 Wayback CDX 捕获：2024-01-09、2024-09-25、2025-01-18、2025-11-22。索引中的 digest/记录长度只用于定位捕获，不能据此推断 APK 版本或固件内容。

最接近上市期的 2024-09-25 捕获下载一次返回 **HTTP 429**，已停止存档请求，没有重试或更换入口规避限流。已发布的原厂旧 URL 另作一次 GET，返回 **HTTP 500**。所以尚未得到旧包，也不能声称旧固件映射不存在。

当前本地 APK manifest 已核对为 `2.25.0c-260813ai` / versionCode `102034`。没有因官方地址仍在线就推定是历史版本。

历史官网及 API 索引、原作者工具仓库历史没有提供新的匹配镜像。此结果只覆盖已查公开来源，不排除厂商内部工厂镜像。详见[历史线索](../../evidence/firmware-cape-followup-20261030/historical/REPORT.md)及[下载诊断](../../evidence/firmware-cape-followup-20261030/legacy-download/fetch-manifest.json)。

本轮保存了可复核的新协议/格式证据；真正匹配 `35d8:149b` 的镜像、完整存储覆盖及主固件损坏后的恢复入口仍未解决。
