# ECHO-B 固件适配离线复核（2026-10-30）

结果见[适配调查报告](../../docs/devices/echo-b-firmware-package-compatibility.md)。本目录不包含已验证的 ECHO-B 恢复固件；所有下载文件仅用于离线比较。

- `analyze_offline.py`：标准库脚本，只检查已保存的文件字节；不联网、不加载目标库、不访问 USB。
- `candidate-analysis.json`：SPV 段、简单校验、Marigold 描述符载荷范围、ECHO-B/BIANCA 字节相等及 6 个 `.hid` 目标头筛选。
- `fetch-manifest.json` / `hid-reference-fetch-manifest.json`：官方对比文件 URL、获取时间、HTTP 状态、大小和 SHA-256。
- `BIANCA-catalog-candidate.bin` / `Marigold-reference.fot` / `*.hid`：原样下载的其他目录条目，均不是本机可刷推荐；ECHO-B 原候选仍在第一轮证据目录中。
- `official-source/`：官方网页原 JS、parser/查询/型号注册摘录、产品筛选的实际 GET 响应、来源报告。
- `apk-routing/`：官方 APK 型号资源、Synaptics 分派、原生型号工厂及 `.hid` 头部语义；普通离线工具证据。
- `spv-package/`：Android SPV parser/start 路径、独立结构脚本和结论；普通离线工具证据。
- `rea-dart-aot.json`：REA 6.5.0 CLI 返回的 `unsupported_target` 错误记录，不是成功反编译。
- `SHA256SUMS`：保存证据的内容校验和，不代表厂商签名。

未执行文件或设备操作。格式可解析、简单校验相符、目录名相同、USB ID 相同分别只能支持对应层面的判断，不能单独证明硬件兼容或救砖可行。
