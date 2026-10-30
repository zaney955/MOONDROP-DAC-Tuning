# ECHO-B 候选升级包的型号与格式核对

日期：2026-10-30；接续[第一轮固件调查](echo-b-firmware-backup-investigation.md)。本轮仅检查电脑上的文件、官方网页源代码及公开 HTTP GET 响应；没有枚举或访问 USB，没有执行 App、目标库或固件，也没有发送升级准备、重置或其他设备命令。

后续[协议与备份边界调查](echo-b-cape-protocol-and-backup-boundaries.md)用既有实机帧及 Synaptics 编写的 CAPE 原始实现强化了协议分类，并进一步核对 `.hid` 内型号配置和历史 App 线索；仍未取得本机恢复镜像。

## 结论

**官方目录标为 ECHO-B 的文件不能确认为本机 `35d8:149b` 的固件，并且已有实质性的协议/格式冲突证据。真正匹配该 USB ID 的固件仍未找到。**

`Marigold` 不是下载时混入的文字：它位于候选文件 CPU 段的实际传输载荷中，符合 USB 字符串描述符结构。官方 SPV 解析器能够解释该文件；本机 ECHO-B 在官方 Android App 中却明确走 Freeman3/Synaptics 路径。服务器还把完全相同的文件挂在另一款蓝牙产品 BIANCA 下。

这些事实支持“目录关联错误、遗留配置或共用参考数据”的推断；**无法仅凭公开文件确定后台具体发生了哪一种情况**。也不能只凭字符串就断言这份包是当前量产 Marigold 的正确固件。

| 核对项 | 证据与结果 |
| --- | --- |
| 候选包内为什么有 Marigold | 两个 UTF-16 USB 描述符位于会被 SPV 更新器发送的 CPU 载荷中；不是文件尾部填充区，也不是 CDN 文件名 |
| 是否只是全目录里同名条目误认 | 排除：按 ECHO-B 产品 UUID 查询仍精确返回此包；有无 `appVersion=web-app` 结果相同 |
| 候选包是否独属于 ECHO-B | 否：BIANCA 的另一个官方 URL 返回逐字节相同的文件 |
| 是否符合本机已知升级路径 | 未建立兼容，且格式冲突：候选为 SPV@；本机归入 Freeman3/Synaptics，已分析同代升级文件为带目标头的 `.hid` |
| 是否找到真正匹配固件 | 尚未；公开目录全部 6 个 `.hid` 的目标头均非 `35d8:149b` |

## 1. 官方型号分派区分了两代设备

来源是已保存的官方 APK，SHA-256 `04756b49acfea523758d86101c96c1824b7b209ae3a8836c07837088e795d2d5`，不是根据第三方芯片名称推断：

- `res/qc.xml`（资源 `R.xml.devicelist = 0x7f140001`）的 `Freeman3` 组明确列出 vendor `13784`、product `5275`，即 `35d8:149b`。
- `FlutterNative.mDevicePlugListener$lambda$0`，DEX `code_off=0x5f624c`，对 vendor `0x35d8`、product `[0x1495,0x149d)` 进入 Synaptics/SvcModClient 路径，包含本机 ID。
- 官方当前网页源代码中 Marigold 注册为 `35d8:011c`、report ID `75/0x4b`、8 段 EQ，使用 SPV 设备族；其 API 产品条目也为 `chipType:spv`。ECHO-B API 条目是 `synopsys`、9 段 EQ。

因此，同属水月雨、名称相近或都支持 DSP，并不足以共用固件。不同的 Echo-BP 是另一款 `jieliusb`、32 段产品，也没有混作本机。

精确原生芯片类仍未锁定：官方 native 工厂还会读 USB 字符串索引 `0x29`，再选择 `CAPE → CxAudioHidDev20805` 等分支。既有身份记录没有该值，本轮也没有读取设备。这个未知不影响上述 App 协议族分派证据，但仍限制对物理芯片的结论。

原始资源、DEX 指令和 native 分派/字段证据见[APK 分析](../../evidence/firmware-compatibility-20261030/apk-routing/REPORT.md)。

## 2. SPV 包结构与 Marigold 所在位置

候选文件仍为第一轮留存的 442,216 字节文件，SHA-256：

`b68e0cd4a561cb664605f32ebf5d3c3e51f6138482b3bfc97ef9666a42b5acc1`

本轮用两份独立的官方实现交叉解释其格式：

- Android APK 的 `aw0.c(byte[])`，经 `ns4.y(String)` / `startSpvUpgrade` 调用。
- 当前[官方网页主 JS](https://hub.moondroplab.tech/assets/index-BiX0aPAV.js)中的 `class cj`：offset `4` 检查 `SPV@`；offset `12` 检查 userFlag 高字节，选择 16 或 32 字节分段表；地址低 24 位映射文件偏移。

候选包采用 16 字节表；offset `12` 的字段为 `AMAO`，不是第一轮文档从邻接字节误读的 `HAMO`。解析得到：

| 段 | 目标地址字段 | 文件偏移 | 字节数 | 核对 |
| --- | --- | --- | ---: | --- |
| CPU | `0x48000000` | `0x0` | 97,072 | 简单字节加和校验为 `0x849d4d`，与字段相符 |
| MOD | `0x48040000` | `0x40000` | 180,072 | 简单字节加和校验为 `0x15500c2`，与字段相符 |
| PBK / EXT | `0x4806c000` | `0x6c000` | 各 0 | 空段，没有实际载荷 |

CPU 加和计算扣除其中自身的四字节 checksum 字段。加和相符只说明这一层数据一致，不是签名验证或型号兼容性证明。构建字符串为 `Aug 23 2024`、`14:11:15`；这些内嵌字符串也不等于发布记录。

两处 `Marigold` 正文在 `0x11112`、`0x1119a`，前面均为 `12 03`（USB 字符串描述符长度/类型）；`MOONDROP` 在 `0x111de`，结构相同。它们都位于非空 CPU 段。已检查的 SPV parser/start 路径不在传输前按产品改写这些字节，故不能解释成“运行时会自动换成 ECHO-B”。

**限制：没有从固件指令建立运行时选择哪个描述符的完整引用链**，也没有确认可靠的本机 VID/PID 字段。因此不把“载荷内存在描述符”扩大成实机一定枚举成 Marigold 的结论。

当前官方 Marigold 条目另指向 `1006.fot`，外层 magic 为 `POT\0`，683,008 字节，没有找到原样内嵌的 SPV@ 或上述 UTF-16 字符串。外层可能另有编码，本轮未确定其内部格式，不能声称这个 `.fot` 与旧 SPV 候选内容相同。

离线复核脚本及结果：[`analyze_offline.py`](../../evidence/firmware-compatibility-20261030/analyze_offline.py)、[`candidate-analysis.json`](../../evidence/firmware-compatibility-20261030/candidate-analysis.json)。脚本只读保存的字节，不联网或访问设备。

## 3. 关联问题确实来自官方服务响应

从官方网页源码提取的实际请求为：

```text
GET /api/v1/ota-configs/all?productUuid=PRODUCT_UUID&appVersion=web-app
```

ECHO-B 的产品 UUID `f92054d7-b36e-492f-8d3b-db2b935c3279` 返回单个条目：OTA UUID `a87f4c45-91f7-45c1-a79a-7da2bee72449`、name `ECHO-B`、version `1.0.0`、第一轮的 `.bin` URL。[精确产品查询](https://cdn-service.moondroplab.tech/api/v1/ota-configs/all?productUuid=f92054d7-b36e-492f-8d3b-db2b935c3279&appVersion=web-app)。

去掉 `appVersion` 参数再次查询，响应字节完全相同，SHA-256 为 `ec61f0e375b6bdfd1fe5d4fb4314b79578e7d622a88bd5cf2bb75e12e81e4607`。这不是无筛选总目录里凭名称猜测，也不是该参数引起的关联差异。

同时下载总目录中 `BIANCA:STIGMATA` 的另一个 `.bin` URL，其大小、SHA-256 以及逐字节比较都与 ECHO-B 候选完全一致。BIANCA 产品服务记录属于 `BT/bluetrum`；两个不同产品共享这份文件，进一步削弱仅凭目录名认定适配的依据。

当前 Web 升级页的查询函数 `cA` 将结果经过：

```javascript
function uA(e) { return e.filter(t => t.version !== "1.0.0") }
```

因而这条 ECHO-B 条目不会出现在该 Web 页的在线升级列表中。同形查询返回的 FreeDSP 和 Marigold `1.0.0` 条目也被这一规则隐藏。**这个规则仅证明当前网页的显示行为**，不能泛化成 Android 的行为，不能独立证明后台条目一定是占位，也不能推定它是已发布且可用的 ECHO-B 更新。

官方原 JS、字符偏移摘录、查询响应及获取清单见[官方服务调查](../../evidence/firmware-compatibility-20261030/official-source/REPORT.md)。本地从 App 提取的 `/related-product-ota/search` 裸 GET 仅返回 400，未取得参数契约；该失败不用于推断不存在固件。

## 4. 全部公开 `.hid` 候选的目标头筛查

官方 native `CxAudioHidDev20805::EepromPatch` 对 `.hid` 读取 32 字节头，原日志明确标出 offset `0/4/8` 为 `VID/PID/fw_update_type`，offset `12/16` 为 signature/CRC；不是靠碰巧出现的 ID 字节猜测。

已下载并静态检查当时公开总目录的全部 6 个 `.hid`：

| 目录条目 | 包头声明的目标 VID:PID | 匹配本机 |
| --- | --- | --- |
| FreeDSP 1.1 | `35d8:1496` | 否 |
| MAY 1.1 | `35d8:1497` | 否 |
| DUSK 9.7.13.1 | `35d8:1499` | 否 |
| DUSK-SP | `35d8:1499` | 否 |
| Starlight 1.0.0 | `35d8:1499` | 否 |
| moca temp | `06cb:1594` | 否；原目录描述还标有 `Don't update` |

这些都是对比证据，没有作为 ECHO-B 的恢复镜像。即使将来找到头部匹配的文件，仍需进一步验证硬件版本、布局及签名/内容；改写包头、重命名或相同 EQ 协议不能建立适配性。

已分析 `.hid` 主机更新分支会将头部参数发送给设备 CTRL `0x00c8`，等待“ready for firmware upgrade”回复；这属于进入更新准备流程，不能作为本轮离线兼容检查使用。没有调用它。

## 剩余未知与可恢复性

在已保存的官方产品/OTA 目录、按产品精确筛选的响应、同代全部 `.hid` 候选、当前官方网页两份 JS，以及针对精确型号/USB ID/文件名的公开搜索范围内，仍没有确认 `35d8:149b` 的可用固件镜像。不存在公开命中不等于厂商没有工厂镜像或内部工具。

要建立可靠的恢复方案，仍需取得明确针对 `35d8:149b` 及相应硬件版本的厂商镜像/说明，或者在确认读取流程和区域覆盖后获得本机备份。当前候选包及其他型号的 `.hid` 均不能填补这个缺口。本轮也没有建立可用的 ECHO-B bootloader/救砖入口。

REA CLI 的 Dart AOT 检查因 APK 中没有其要求的动态 snapshot 符号而返回 `unsupported_target`，错误记录已保留，没有重复或修改目标；改用官方 Web parser 和现成 DEX/ELF 离线分析交叉验证。没有新增分析引擎或修改工具配置。
