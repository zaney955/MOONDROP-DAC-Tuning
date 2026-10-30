# CAPE 协议与备份边界继续调查

日期：2026-10-30。结论见[固件参考](../../docs/devices/echo-b-firmware.md)。没有设备 I/O，没有执行 APK、native 库、固件或 fwupd。

- `fwupd-cape/`：通过 GitHub 连接器读取的固定 commit 原始源码，含来源 URL/Blob ID；不是先前的 `synaptics-cxaudio` 插件。
- `fwupd-driver-review.json`：报告格式、注册钩子、分区输入假设与不适用边界。
- `hid-header-review.json`：按原始格式定义读出的六包 VID/PID、真实头部版本、大小；未假称 CRC 通过。
- `chip-inference/`：既有 20 条设备回包的离线结构核对、SDK 默认芯片数值/显示字串及 SPI/ROM 名称边界。
- `hid-layout/`：升级载荷结构、型号配置与共享代码比较，脚本仅处理保存的字节。
- `reference-sdk/`：KA10000 平台 SDK 的事务读取逻辑类比；不同协议编号，不能当作 ECHO-B 设备端实现。
- `historical/`：官方旧 APK/网站捕获索引及原作者仓库历史，未得到旧 APK 内容。
- `legacy-download/`：一次存档 GET 的 HTTP 429、一次原厂旧 URL GET 的 HTTP 500 记录；没有 APK 被安装或执行。
- `SHA256SUMS`：本目录资料的内容校验和，不是厂商签名。

既有固件包仍留在前两轮证据目录，没有改写或重新打包。本轮没有生成刷机/救砖工具，也没有用设备握手试验兼容性。
