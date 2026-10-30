# 耳机测量与耳放控制

保存耳机声音资料，通过 JSON 管理 EQ，并记录设备写入与读回证据。硬件后端支持 macOS 上的 MOONDROP ECHO-B（USB `35d8:149b`）。

- [操作指南](docs/operations.md)：检查、写入、复核、恢复和排障。
- [JSON 格式](presets/README.md)：字段及编译限制。
- [耳机资料库](headphones/README.md)：测量、声音研究与试听方法。
- [设备协议与证据](docs/devices/echo-b-investigation.md)：通信实现及验证范围。
- [功能探索](docs/devices/echo-b-possibilities.md)：可扩展方向与未验证能力。

在仓库根目录运行 `python3 tools/preset.py list` 查看可用文件。名称、参数和用途以 JSON 为准，文档不维护预设清单或设备当前状态；改名或调参无需同步修改文档。

| 目录 | 用途 |
| --- | --- |
| `presets/` | 可编辑的完整 JSON，音色与整体输出数字增益 `output_gain_db` 在同一文件 |
| `profiles/compiled/` | 可重建的编译缓存 |
| `runs/` | 每次操作的快照、ACK、读回及验收 |
| `backups/` | 初始备份和独立采集 |
| `headphones/` | 按品牌、型号组织的测量与研究 |
| `tools/` | 编译、设备通信和分析程序 |
| `evidence/` | 协议分析证据 |

JSON 描述要写入的内容，运行记录描述某次操作；两者都不能代替设备实时读回。
