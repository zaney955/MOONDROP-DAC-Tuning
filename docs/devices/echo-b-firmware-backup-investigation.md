# ECHO-B 固件备份、升级包与恢复入口只读调查

调查日期：2026-10-30。目标设备身份以既有 [USB 证据](../../evidence/usb-identity.json)中的 MOONDROP ECHO-B、`35d8:149b` 为准。

后续[候选包适配核对](echo-b-firmware-package-compatibility.md)确认：该 SPV 包与 BIANCA 目录文件逐字节相同，Marigold 描述符位于实际 CPU 载荷；官方 App 将本机分派到 Freeman3/Synaptics，公开 6 个同类 `.hid` 目标头也都不匹配 `149b`。因此仍没有可用的本机恢复镜像。

本次未枚举、打开或向耳放发送任何 USB 请求；未运行设备探测、读取、保存、重置、升级或刷机程序。所有操作限于本地文件静态分析和公开网站/API 的 HTTP GET。下载升级文件到电脑不代表读取了耳放固件。

## 结论与完成范围

| 问题 | 本次结果 | 尚未证明 |
| --- | --- | --- |
| 能否完整备份当前设备固件 | 部分回答：官方 SDK 存在实际的内存、SPI 读取和 EEPROM 文件导出代码 | 本机选择的芯片路径、存储容量、读保护、全部持久区域及无状态变化的读取方法；本次没有导出设备固件 |
| 有没有官方升级包 | 部分回答：官方 App 服务存在精确名为 ECHO-B 的 OTA 配置，文件已下载并留存 | 文件是否匹配本机；包内存在 Marigold 字符串，与目录标签有疑点，不能认作已验证可刷包 |
| 有没有救砖入口 | 未解决：已找到正常运行态的官方 USB 更新调用链 | ECHO-B 专属 ROM/bootloader 入口、异常枚举 VID/PID、引导程序损坏时的硬件恢复及刷回验证 |

**现阶段没有可承诺的“完整备份＋刷回救砖”方案。** 这不是证明硬件不支持，而是现有证据不足以建立可恢复性。

## 证据身份和分析工具

- 官方 App 来源：`https://download.moondroplab.com/moondroplink/android-release.apk`；复用仓库已有文件，SHA-256 `04756b49acfea523758d86101c96c1824b7b209ae3a8836c07837088e795d2d5`。
- `libCxAudioHidLib.so` SHA-256 `e3b58275c7421029be587218c35d8b997a9616a98c8e9795fc4c7db88d6e22cd`。
- 本次 REA 6.5.0 CLI `inspect-artifact` 成功，Evidence ID `ev_d7b1fd776521b7149756d73e12bae48f6f8dd61947d94b2ff83d5072b65ddd0a`；[完整库存](../../evidence/firmware-readonly-20261030/rea-apk-inventory.json)。库存只能证明包内容，不能证明设备行为。
- 当前会话没有暴露 REA MCP 工具；只读 doctor 显示 Codex 注册存在，但 JADX provider 缺少调用方提供的 JAR。未修改 MCP 注册、技能或安装分析引擎；继续使用缓存 CLI、既有 Androguard 4.1.4、pyelftools 和 macOS objdump。DEX/原生反汇编为普通离线工具证据，不冒称 REA 反编译结果。
- 旧 `evidence/rea-memory-read.json` 是历史 provider-unavailable 错误，不是成功的内存读取或设备证据。

全部新增材料在 [证据目录](../../evidence/firmware-readonly-20261030/README.md)，并保存了 [结构化结论](../../evidence/firmware-readonly-20261030/findings.json)及文件校验和。

## 官方包：找到目录条目，但适配存在疑点

从 App ARM64 `libapp.so` 的静态字符串找到以下公开地址，本次以无认证 HTTP GET 取得成功响应：

- [产品目录](https://cdn-service.moondroplab.tech/api/v1/products/all)：108 条产品记录。
- [OTA 配置目录](https://cdn-service.moondroplab.tech/api/v1/ota-configs/all)：197 条 CONFIG 记录。
- [ECHO-B 产品详情](https://cdn-service.moondroplab.tech/api/v1/products/f92054d7-b36e-492f-8d3b-db2b935c3279)。

ECHO-B 产品 UUID 为 `f92054d7-b36e-492f-8d3b-db2b935c3279`，目录给出 `eqBands:9`、`chipType:"synopsys"`、资源路径 `/synopsys`、`hasotaconfig:true`、`isDongleUpgradable:false`。这些是服务端标签；`synopsys` 不是实物芯片鉴定，最后一个字段也不能独立证明没有任何升级能力。关系 UUID 接口返回空列表，接口语义尚未确认，不能据此推定 OTA 绑定或未绑定。

OTA 条目为：

| 字段 | 值 |
| --- | --- |
| name | `ECHO-B` |
| uuid | `a87f4c45-91f7-45c1-a79a-7da2bee72449` |
| type / status | `CONFIG` / `1` |
| version | `1.0.0`，仅为目录字段，不等同于设备实际版本 |
| file | `ota-config-file/zZje7CUxdVaqgDf5QpXgEusb_headphone_denoise_dual_MOONDROP_0x119_8_27.bin` |

已从[官方 CDN](https://cdn.moondroplab.tech/ota-config-file/zZje7CUxdVaqgDf5QpXgEusb_headphone_denoise_dual_MOONDROP_0x119_8_27.bin)取得 HTTP 200，并保存为 [候选升级文件](../../evidence/firmware-readonly-20261030/official-ECHO-B-ota-1.0.0.bin)：

- 大小：442,216 字节，约 432 KiB。
- SHA-256：`b68e0cd4a561cb664605f32ebf5d3c3e51f6138482b3bfc97ef9666a42b5acc1`。
- CDN `Last-Modified`：2024-09-20 05:59:44 GMT；该 HTTP 字段不等于固件发布日期。
- 传输内容与 HTTP `Content-Md5` 一致；这验证下载一致性，不是厂商签名或适配性验证。

离线内容出现以下疑点：

1. 偏移 `0x4` 为 `SPV@`，另有 `AMAO`、`CPU`、`MOD`、`PBK`、`EXT` 字段；后续已用官方 parser 核对结构，但签名及完整存储覆盖仍未确认。
2. `0x11110` 和 `0x11198` 为 `12 03` 开头、内容为 `Marigold` 的 USB 字符串描述符候选；`0x111dc` 同结构为 `MOONDROP`。内容不像一份可以直接凭目录名认定适配本机的镜像。也不能只凭字符串就断言它一定属于另一硬件。
3. 未在这份文件找到能匹配 `35d8:149b` 的完整 USB 设备描述符，也未找到 `SFSE`/`ESFS` 标记。有限字节搜索不能证明不存在其他编码形式。
4. 同一目录中 `BIANCA:STIGMATA` 条目使用另一个 CDN 前缀、相同后半文件名；该文件未下载，不能声称内容相同。目录元数据需要独立核对。

因此，只能表述为“官方目录标注 ECHO-B 的候选升级包已留存”。它不是从当前耳放读取的备份，不证明包含设备专属校准、序列号、ROM/OTP 或 bootloader，也没有证明可供本机恢复。

APK 扩展名/文件名库存搜索仅发现 `AssetManifest.bin`、`DebugProbesKt.bin` 两个通用 `.bin` 条目，没有辨认出随 APK 捆绑的 ECHO-B 镜像；这个结果不排除无明显扩展名、压缩或运行时下载的固件。

## 固件读取路径：确有实现，但不能直接执行

以下是对主机 SDK 的静态观察；地址为 ARM64 ELF 虚拟地址，并非设备闪存地址。

### SPI 原始读取

`CxAudioHidDev20805::SpimemRead@0x26c8c → SpimemOperation@0x269c4` 存在实际读取分支：

- CTRL 模块 `0xb32d2300`；`0x010e` 设置读取地址/长度，`0x010d` 取数据。
- 未打开 SPI 事务时，自动调用 `SpimemOpen@0x266bc`，发送非 GET 的 CTRL `0x000c`；关闭事务也发送该命令。
- 容量查询 `SpimemSize@0x270d4` 同样可能先打开事务，然后 GET `0x010b`，把特定标识映射为 512 KiB–8 MiB。该范围是 SDK 支持列表，不能当作 ECHO-B 实测容量。
- `SpimemInfo@0x27414` 尝试读取地址 0、`0x1000` 的 SFS 头；不能据此认定本机使用该布局。

选定的读取分支未见直接擦写调用，但不能证明设备端命令处理没有状态变化；因此本次没有尝试执行，包括容量查询。

### SDK 的 EEPROM 文件导出

`CxAudioHidDevice::EepromContentsOperation@0x17bc0` 的操作 1 为保存：查容量、分配内存、`EepromRead(0,size)`、`fwrite` 输出文件。这是比单纯接口名更具体的导出证据。

**该高级函数会先调用虚函数 `EepromPrepareForPatch`。在 20805 分支，`EepromPrepareForPatch@0x27a54` 发送模块 `0xb72d3300`、命令 `0x0001`，成功日志明确为 `Reset streamer app`。** 它超出本次“不要改动设备”的范围，未运行。即使能导出整个 EEPROM，也仍需确认它是否覆盖所有恢复所需区域。

### 单 DWORD 内存读取

`CxAudioHidDev20805::MemoryReadDword@0x24470` 构造 GET `0x0106`，参数为内存类型和地址，只取回一个 32 位值。主机侧仅限制内存类型不大于 1，没有完整持久存储布局、有效区域和固件端行为证明。它不能直接视为完整固件读取器。

共享库同时包含 2077x、20805 等多代设备。相似 CTRL 协议和 App 产品分类只提供线索；本次没有确定本机最终选择的原生类，不能把这些地址或容量直接套用到耳放。

详见 [SDK 读取证据](../../evidence/firmware-readonly-20261030/sdk-read-path/findings.md)与[EEPROM/升级包补充分析](../../evidence/firmware-readonly-20261030/sdk-read-path/ota-and-eeprom-addendum.md)。

## 正常升级入口与救砖入口的区别

DEX 可观察到正常 USB 更新调用链：

`FirmwareUpdateActivity → UsbControllerBase.updateFirmware → CnxtUsbDeviceBase.updateFirmware → com.syna.FirmwareUpdate.downloadFirmware → native_download`。

`FirmwareUpdate` 加载 `CxAudioHidLib_EMBCB_jni`，涉及 HID claim/release；`CnxtUsbDeviceBase.updateFirmware` 在返回后调用 `deviceReset` 并重新连接。`getActivePartition()` 在本 APK 中直接返回字符串 `"2"`，不能当作设备实际双分区读回或安全回滚证明。

JNI 中 `EepromOperation@0x20f0` 存在 `.hid`/`.sfs` 文件处理并调用 patch 接口；它与上述 EEPROM 保存函数不同。已分析路径与下载的 `SPV@` `.bin` 之间没有完成格式和设备路由闭环，因此没有运行官方更新器、文件检测函数或 native 接口。

这些属于设备还能被应用识别时的正常更新代码，不证明主固件失效后仍可进入，也没有揭示经验证的 ECHO-B ROM/bootloader 入口。未找到 ECHO-B 异常模式 VID/PID、引脚/按键进入条件、硬件烧录接口、读保护处理或恢复验收记录。

## 官网和第三方原始代码的搜索边界

已检查官方中英文产品页、下载页和手册库存，以及 ECHO-B、固件、升级、救砖、bootloader、`35d8:149b` 等针对性公开搜索：

- [官方下载页](https://moondroplab.com/cn/download)未列 ECHO-B；音频固件项为 MOONRIVER2:TI / DAWN PRO，不能混用。
- 官网 ECHO-B 说明书链接为隐藏/占位；中英文手册 HTML 库存分别为 65、53 条，未见 ECHO-B。公开 App 服务的产品手册字段也为空。
- 上述公开来源范围内未找到 ECHO-B 专属救砖说明。官网没有下载链接，不等于 App 服务没有候选包。
- [fwupd Synaptics CxAudio 原始代码](https://github.com/fwupd/fwupd/tree/main/plugins/synaptics-cxaudio)有 EEPROM 读写线索，但 report ID 与本机已验证协议不同，quirk 只列特定 Lenovo/Google CX2098X/CX2198X，没有 `35d8:149b`；不能视为本机适用工具，也没有执行。

原网页、API 响应、fwupd 快照及获取清单在 [官方来源证据](../../evidence/firmware-readonly-20261030/official-web/REPORT.md)。快照按本次 hash 固定，远端 `main` 内容和服务目录未来可能变化。排除了 FiiO ECHO、ECHO-A、蓝牙耳机 OTA 及不同 DSP 代际的推断混用。

## 后续能安全推进的工作

1. 先离线核对候选包的官方型号绑定、格式和 `Marigold` 字符串来源，取得明确匹配 `35d8:149b` 的镜像/说明；无需触碰耳放。
2. 继续静态追踪 App 的芯片分派和读取前置条件，明确所需持久区域及每条请求的设备端效果。仅主机侧代码无法保证设备端不变。
3. 完整备份方案需要证明容量、区域覆盖、重复读取一致性及校准/身份数据保留；救砖方案还需独立确认失去主固件后的入口和匹配恢复工具。现有 EQ 读回及本次候选包均未满足这些条件。

本次未制作一键刷机/救砖脚本，也没有把未知命令作为只读探测发送到设备。
