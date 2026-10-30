# 多套 EQ 与 iPhone 切换：离线证据

结论和覆盖边界见[调查报告](../../docs/devices/echo-b-multiple-eq-iphone.md)。本目录不含设备操作；没有写入、保存、切换、重置或 USB 查询。

- `identity-and-selection.json`：APK SHA-256、选中方法和代码项偏移。
- `selected-methods.asm`：Freeman 模式读取/切换/保存、共享模式列表及 PersistEQParams 的 Androguard 静态指令。
- `mode-references.asm`：筛选的 Conexant 与官方 USB handler 调用方；排除其他蓝牙设备等无关匹配，不代表所有 App 调用关系已完整恢复。
- `inspect_modes.py`：复现上述指令选择的脚本，需要已有 Androguard；不执行 APK。
- `rea-doctor.json`：REA 6.5.0 CLI 只读诊断的相关字段。Codex 注册存在，JADX provider 缺少调用方提供的 JAR；当前会话没有 REA MCP 工具，未修改配置或安装引擎。
- `SHA256SUMS`：本目录文件校验和。

方法指令属于普通离线分析证据。报告引用的历史 REA Evidence 只确认同一 APK 的库存，不能拿来证明本次新增的方法结论或设备行为。
