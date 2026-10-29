# 耳机 EQ 配置与设备调音仓库

管理不同耳机的声音资料、可切换 EQ 预设，以及耳放写入和验证记录。**当前硬件后端仅支持 macOS 上的 MOONDROP ECHO-B（USB `35d8:149b`）**；耳机资料与预设可按型号扩展，其他耳放需要单独适配。

## 从这里开始

- [仓库操作指南](docs/operations.md)：环境准备、新建配置、检查、写入、只读复核、恢复、拔插测试和排障。
- [预设库](presets/README.md)：现有配置及字段说明。
- [耳机资料库](headphones/README.md)：按品牌/型号组织的测量、研究与调音指南。
- [ECHO-B 协议调查与操作历史](docs/devices/echo-b-investigation.md)：设备证据、原始备份范围和历史验收。

## 常用命令

在仓库根目录运行：

```sh
# 列出现有预设
python3 tools/preset.py list

# 离线检查与生成，不修改耳放
python3 tools/preset.py build global-minus-2db

# 将选定配置完整写入、保存并读回验证（会修改设备）
python3 tools/preset.py apply global-minus-2db

# 恢复本仓库首次备份对应的直通 EQ（不是整机恢复出厂）
python3 tools/preset.py apply original-default

# 已保存但验证失败时：只读复核指定运行记录，不重复写入
python3 tools/preset.py verify "runs/这里替换为实际运行目录"
```

将示例名称换成所需预设。每次 `apply` 都先采集当前参数与系数，再写入，并在 `runs/` 新建独立记录。保存 ACK、当前系数读回、物理拔插保持是不同验证阶段；失败时先查看记录，不盲目重复写入。工具会记录明确的阶段和结果，并对“设备尚未就绪”做有限的读取重试；若状态为 `saved_unverified`，使用 `verify` 完成复核。具体步骤见[操作指南](docs/operations.md)。

## 文件布局

| 目录 | 用途 |
| --- | --- |
| `presets/` | 可编辑的配置原件 |
| `profiles/compiled/` | 可以重新生成的写入计划 |
| `runs/` | 每次写入的快照、前后采集、ACK 与验收 |
| `backups/` | 初始备份及独立只读采集 |
| `headphones/<品牌>/<型号>/` | 耳机测量、研究、分析及试听资料 |
| `tools/` | 配置管理、设备程序及分析脚本 |
| `evidence/` | 协议研究证据 |
| `docs/` | 仓库操作与设备技术文档 |

仓库中的历史记录不代表设备此刻的状态；需要确认时按操作指南进行只读复核。
