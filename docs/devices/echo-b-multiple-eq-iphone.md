# ECHO-B 多套 EQ 与 iPhone 切换调查

日期：2026-10-30。对象：本项目 ECHO-B（USB `35d8:149b`）。本次只读分析官方 Android APK、既有 USB 描述符和协议代码，没有连接或修改耳放，没有运行 App、固件或设备探测程序。

## 结论

目前不能提供“先向 ECHO-B 写入几套自己的 EQ，再插在 iPhone 上任意切换”的实现。存在两个独立缺口：

1. **已分析的官方控制路径只暴露一组 Custom 的写入流程**，另有内置模式选择。没有发现多个可分别写入的自定义槽位选择参数。这支持“一组可编辑 Custom + 内置模式”的接口模型，不证明芯片物理上只能存一套，也不证明所有内置模式在本机均可用。
2. **切换模式仍需厂商 USB 控制命令**。减少为一条模式命令并不会使它成为 iPhone App 可直接访问的标准音频功能。目前没有建立 iPhone 到本机厂商控制接口的可用路径。

## 官方 APK 的静态观察

来源是仓库已有 `evidence/moondrop-android-release.apk`，SHA-256：`04756b49acfea523758d86101c96c1824b7b209ae3a8836c07837088e795d2d5`。此前 REA 包库存 Evidence：`ev_d7b1fd776521b7149756d73e12bae48f6f8dd61947d94b2ff83d5072b65ddd0a`；该 Evidence 只建立 APK 库存及身份，不证明以下代码行为或设备行为。本次方法分析使用既有 Androguard 4.1.4，不冒称 REA 反编译。

本机由官方 App 分派到 Freeman3/Synaptics 的依据见[型号路由调查](echo-b-firmware-package-compatibility.md)。跨型号共享 SDK 的内容仍须和本机实测区分。

| 位置（均为 `classes.dex` 代码项偏移） | 观察 | 支持的结论 |
| --- | --- | --- |
| `ApplicationData$CommonEQParams.getPresetList`，`0x59d4dc` | 顺序添加 Custom、Default、Dance、Rock、Jazz、Rap | 共享 SDK 存在六项模式名称；不是六个可写用户槽，也不是本机逐项实测 |
| `FreemanCnxtUsbDevice.saveEQParamsToFlash`，`0x59b8cc` | 读取 `eqModeIndex`，只有值为 0 才进入参数及系数保存分支；非零跳到共同的最终保存命令 | 已分析的入口不能给非零模式写入用户系数 |
| 同上，指令偏移 `0x0094` 起、`0x01b4` 起 | 参数包首项为 0，后随 band/frequency/Q/type/gain；系数包按采样率索引 4–8 和 band 构造；没有独立用户槽字段 | 现有命令序列没有多套自定义槽的寻址依据 |
| `getEQParamsFromFlash`，`0x59b344` | 读模式，再读同一组 9 段参数 | 读回入口也没有用户槽编号 |
| `switchEQMode(int)`，`0x59bf34` | CTRL `0x005A`，参数 `[0x5A, index]`，经 USB 连接发送 | 模式选择需要厂商控制通道 |
| `UsbDeviceHandler.handleSySelectEqPreset`，`0x61df80` | 从 Flutter 调用取 `index`，转发 `IEqualizer.switchEQMode` | 官方“选择预设”入口确实走上述控制路径 |
| `handleSySaveEqParamsToFlash`，`0x61dc4c` | `selectedMode` 写入 `eqModeIndex`；只在模式 0 构造自定义参数 | App 上层同样区分 Custom 和内置模式 |

原始指令和可复现脚本在[本次证据目录](../../evidence/multi-eq-20261030/README.md)。五种采样率系数用于让同一 EQ 在不同采样率下工作，不应称为五个用户预设槽。按采样率写入不同音色并依赖播放器切换，只是另一个待验证设想：未验证 iPhone 可稳定选择输出采样率、其他 App/系统声音行为或设备实际效果，不作为可用方案。

## iPhone 的切换通道

已有[USB 身份和 HID 描述符](../../evidence/usb-identity.json)声明报告 1 为厂商数据、报告 2 含音量和播放等输入用法，没有建立“手机音量键发送 EQ 切换命令”的路径。描述符也不能证明某种隐藏行为绝不存在。

[USBDriverKit 官方文档](https://developer.apple.com/documentation/usbdriverkit)支持 macOS 和 M 系列 iPad，没有提供这里所需的 iPhone 驱动路径。[External Accessory](https://developer.apple.com/library/archive/featuredarticles/ExternalAccessoryPT/Introduction/Introduction.html)需要附件支持与 App 通信的相应协议，不能视为任意 USB HID 的通用访问接口。[产品页](https://moondroplab.com/en/products/echo-b)声明 iOS 免驱播放和 DSP 功能，没有建立 iPhone 端控制这组厂商命令的支持。

因此，即使以后确认有多组可写槽，也仍需另行解决 iPhone 控制路径。当前没有确认可用的物理按键切换、标准 USB Audio 控制切换、BLE 或 iAP2 入口。本次没有做 iPhone 实机测试或完整 USB Audio 描述符分析。

## 可继续研究的方向与边界

- **安卓手机管理多个文件并按需重写 Custom**：不要求设备存在多个用户槽；但这属于每次重新应用，ECHO-B 需接安卓，不能称为插在 iPhone 上切换。
- **改写内置模式表或固件**：需要本机匹配的存储布局、可恢复备份、模式表地址及切换验证。已有[固件调查](echo-b-firmware-backup-investigation.md)尚未建立完整恢复方案，现有资料不足以实现或承诺此路线。
- **外接控制桥**：工程上可以研究手机经 BLE/Wi-Fi 控制另一个 USB 主机；边用 iPhone 播放边控制还涉及音频转发或协议代理，普通 USB Hub 不能让两个 USB 主机同时控制同一个 ECHO-B。尚无本项目实现或实机验证。

| 原始问题 | 状态 |
| --- | --- |
| 是否存在模式选择命令 | 已回答：静态代码确认；本次未切换实机 |
| 是否能保存多组自己的 EQ | 部分回答：已分析官方路径只写 Custom；隐藏槽与底层存储未解决 |
| 能否插在 iPhone 上切换 | 未建立可行控制通道；多槽假设本身不能解决此问题 |
| 能否修改固件增加该功能 | 未解决：布局、适配镜像、备份与恢复链均不足 |

搜索边界为此 APK 的全部 DEX 中相关方法和引用、Freeman 控制路径、既有本机描述符/协议证据及上述公开文档；未分析 iOS App 二进制或完整设备固件。有限负面搜索不证明硬件不可能实现。
