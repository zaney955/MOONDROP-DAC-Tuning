# 固件只读调查证据（2026-10-30）

结论、适用范围、来源 URL 与待确认事项见[技术参考](../../docs/devices/echo-b-firmware.md)。本目录里的升级文件是官方目录候选包，不是设备完整备份；适配 `35d8:149b` 尚未验证。

| 文件/目录 | 内容 |
| --- | --- |
| `findings.json` | 三个调查问题、产品/OTA 条目、包内字符串及设备未访问记录 |
| `rea-apk-inventory.json` | REA 6.5.0 CLI APK 库存的完整 Evidence |
| `apk-static-method-index.json` / `classes.dex.firmware.asm` | Androguard 4.1.4 静态方法选择和 DEX 指令 |
| `ota-routing.asm` | 官方 App 固件活动、分派和更新调用相关 DEX 指令 |
| `firmware-jni.asm` | macOS objdump 对官方 ARM64 JNI 库的静态反汇编 |
| `apk-firmware-members.json` | APK 中按固件名/常见扩展名筛选的候选文件；不证明无隐藏镜像 |
| `products-all.json` / `ota-configs-all.json` | 官方 App 公开目录 GET 原始成功响应 |
| `official-ECHO-B-ota-1.0.0.bin` | 官方 OTA 目录标注 ECHO-B 的文件；包内 Marigold 字符串导致兼容性疑点 |
| `official-package-source.json` | 下载 URL、时间、HTTP 元数据、大小、SHA-256 与传输 MD5 核验 |
| `official-web/` | 官网、产品 API、fwupd 原始代码快照和子调查范围说明 |
| `sdk-read-path/` | SPI/EEPROM/单 DWORD 路径的普通 objdump、ELF 常量证据及分析 |
| `SHA256SUMS` | 本目录证据的内容校验和，不代表厂商签名 |

没有执行 APK、JNI 库或候选升级文件；没有访问耳放 USB。静态 SDK 符号和容量表不等于本机芯片/布局鉴定。REA 库存以外的反汇编与 API 获取为普通工具证据，不附会 REA Evidence ID。
