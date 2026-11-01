# 十周年耳机：电脑端写入路径调查

核对日期：2026-11-01。本轮只下载官方发布物、查询公开配置并静态检查代码，未连接浏览器 HID、未写入任何设备。用户实物是 **3.5 mm 直插 Mac**。

## 结论

| 问题 | 状态 | 证据与边界 |
| --- | --- | --- |
| 当前 3.5 mm 版能否写耳机 DSP？ | 已回答：不支持 | 官方 [07 号图](../measurements/raw/07_5da945f6-a44e-42d0-b966-53d07ed656b5.jpg)明确写 DSP 功能仅 Type-C，3.5 mm 版不可用；不是仅由没有 USB 枚举推断。 |
| 十周年 Type-C 能否从电脑控制？ | 已取得实现证据 | 官方在线调音入口、Web 平台设备目录、WebHID 和 EQ 写入代码均已取得；没有对应实物做本机验收。 |
| 是否有设备端保存命令？ | 已取得静态证据 | EQ 写入调用包含 `SET_EQ_TO_FLASH`；名称与流程表明 Flash 保存意图，尚未证明固件实际执行或拔插保持。 |
| “另存为”是否代表耳机已保存？ | 已回答：不能据此判断 | 该预设保存路径写浏览器 IndexedDB，与发送 Flash 命令是两个机制。 |
| 能否把现有 ECHO-A 适配器直接用于十周年？ | 不可直接套用 | 标识、设计率、参数边界和回复验收须独立适配。 |

这修正了早期仅依据商品图所得的“Android 调音”范围：旧图仍是当时的声明，但目前厂商已提供 PC 网页端。此变化没有给 3.5 mm 版增加内置 DSP。

## 官方电脑入口与设备配置

中国官网[资源页](https://www.nicehck.cn/app/download)“在线调音”直接链接 **[app.nicehck.cn](https://app.nicehck.cn/)**；[2026-09-17 更新公告](https://www.nicehck.cn/article/appupdate)明确宣传 PC 网页调音。

本轮从实际发布的 `index-BBjPRS6v.js` 找到公开配置接口，以其正常 Web 查询参数取得目录和配置；没有使用账号令牌或变更服务器数据。[原始发布物与来源](../../../../evidence/nicehck-web-20261101/provenance.json)、[设备目录](../../../../evidence/nicehck-web-20261101/device-catalog.json)、[十周年完整配置](../../../../evidence/nicehck-web-20261101/device-49664.json)

| 官方 Web 配置项 | 十周年 Type-C 的值 |
| --- | --- |
| 名称 / 设备 ID | `10th Anniversary Edition` / 49664 |
| USB VID:PID | `3302:c200`（十进制 13058:49664） |
| transport / protocolVariant | `usb` / `ttgk_v1` |
| EQ | 8 段，20–20000 Hz，−12 至 +12 dB，Q 0.2–12 |
| 整体 offset 边界 | −12 至 +8 dB；为厂商源数据，本轮未设置 |
| 系数设计率 | 96000 Hz；不是当前 USB 音频流采样率的实测 |
| 厂商预设 | 默认、悔恨之泪、摇滚现场、流行人声、ACG、均衡杂食、DSP仙人特调 |

现已获得上述预设的原始频率、增益、Q 与 offset，保存在完整配置中。它们的原始适用对象是 **Type-C 设备**。后续按用户要求完成[7 套 ECHO-A 参数移植配置](../../../../presets/echo-a/nicehck/yuandao-10th/official/README.md)：保留滤波器参数、重新设计目标系数、默认省略整体增益，仅离线校验，未写入设备。原始配置中的 offset 保留供追溯，没有覆盖用户增益或作为声学等效证明。

## 静态写入链路

可复核的[原始 JS](../../../../evidence/nicehck-web-20261101/index-BBjPRS6v.js)与[精确摘录及偏移](../../../../evidence/nicehck-web-20261101/source-excerpts.json)保留在仓库。以下均为静态观察，不是 USB 抓包：

1. `N5e.requestDevice` 把设备配置映射为 VID/PID 筛选项，调用 `navigator.hid.requestDevice`。
2. `X5e` 的设置与编辑函数都调用 `C2.setEqualizerCommand`，再交给 `Zi.sendData`。
3. 发送队列使用 `HIDDevice.sendReport(75, payload)`，报告 ID 为 **0x4B**，相邻发送之间通常间隔 20 ms。
4. `setEqualizerCommand` 为每段构建 `A5e` 包，随后依次发送 `T5e`、`E5e`、`h5e`、`k$`。

| 操作 | report payload 内容 |
| --- | --- |
| 单段 EQ | 36 字节；`01 09 21 00` 开头；段号在偏移 4 |
| 系数 | 偏移 7–26：五个有符号 Q30 值，小端；归一化 `b0,b1,b2,−a1,−a2` |
| 元数据 | 偏移 27–28：整数 Hz；29–30：Q×256；31–32：增益×256；34：整体 offset；35：预设索引 |
| EQ 完成 | `01 0A 04 00 00 FF FF` |
| Flash 保存意图 | `01 01`，源码符号 `SET_EQ_TO_FLASH` |
| 设置整体 offset | `01 03 02 LL HH`，有符号值×256、小端 |
| 电平完成 | `01 04` |
| 读取版本 / 单段 / 整体 offset | `80 0C` / `80 09 00 00 <段号>` / `80 03` |

厂商 `kre` 使用 RBJ 峰值滤波器，`A5e` 当前始终按峰值生成；不能据此声称网页支持低架或高架。`ttgk_v1`、0x4B 报告及 Q30 包形与现有 ECHO-A 路径相近，但这不是芯片型号、同一固件或协议完全兼容的证明。ECHO-A 当前适配器为 `3302:12c5`、固定 93750 Hz，且有自己的固件与读回校验，不能只改 VID/PID 就发送。

## 保存、显示与实际验收的区别

- `Mi.savePreset` / `saveAs` 调用 `qf.setItem`，写入浏览器 `NICEHCK_APP` 数据库的 `eq_presets` 表，不能证明耳机端保存。
- 设置/编辑 EQ 的设备发送序列确实包含 Flash 命令；当前实现中，编辑也走保存序列，应按真实设备写入看待，不能当成离线预览。
- 发送 Promise 在 `sendReport` 完成后结束，所检查路径未等待独立的 Flash 保存确认；因此界面成功或发送完成不足以证明持久化。
- 读回处理 `O5e` 在更新整体 offset 时跳过 0 值。当前源码存在这一显示边界，验收 0 dB 时应比对原始回复，不能只依赖界面。

## 适用于本次实物的方案

**保留当前 3.5 mm 版：** 可把 EQ 写入外接 ECHO-A/B，耳机插到该耳放使用；配置载体是外接 DSP。Mac 直插时使用[电脑软件 EQ](mac-analog-tuning.md)。这些路线不会写入模拟耳机自身。

**如果另有十周年 Type-C 版：** 使用 Chrome 或 Edge 打开官方网页，授权选择 `3302:c200` 设备后读取版本与全部 8 段参数，保留原始回复，再考虑写入。网页文案明确要求 WebHID 浏览器；本轮未实机验证任何浏览器兼容性。写入后还需独立读回，并拔插或换主机重新读取，才能回答掉电保持问题。该流程是后续实机验收要求，目前没有执行，也没有把当前 3.5 mm 版当成目标。

## REA 记录与剩余未知

- 官方 App 下载页的脚本使用公开 `/api/app/os-version/latest`，本轮取得 2.3.8、versionCode 33 的 APK，SHA-256 为 `68a4a39c824fd8416c3f9a802da7f9edf1f256bf80d640c9bda25e1a211809ff`。[来源](../../../../evidence/nicehck-app-20261101/provenance.json)
- REA APK 安全清单成功：`ev_abaf5b5255df7192e6fce822ff0a193670d88ab49315728e6fb1cce0cd8b973e`。[完整 Evidence](../../../../evidence/nicehck-app-20261101/rea-apk-inspection.json)；清单不代表 Android 代码已反编译。
- REA 网页语义分析未启动：缓存的 REA 6.5.0 缺少 macOS 所有权辅助程序的两份 Swift 源文件，编译阶段失败。[错误及部分清单](../../../../evidence/nicehck-web-20261101/rea-web-analysis-error.json)。没有把部分清单描述成成功语义图；上述 JS 结论来自保留原件的人工静态检查及公开配置交叉核对。未改动 REA 安装或客户端配置。
- 未解决：Type-C 固件版本差异、实际报告描述符、写入确认语义、掉电保存、预设槽真实容量、Flash 写入寿命与声学表现。未进行 APK 代码分析、固件读取或升级。

返回[型号资料](../README.md)。
