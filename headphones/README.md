# 耳机资料库

EQ 创建、设备写入与恢复的通用流程见[仓库操作指南](../docs/operations.md)。本目录专门存放耳机声音资料。

按 `headphones/<品牌>/<型号>/` 管理每副耳机的测量与声音研究。目录名采用小写英文，多个词用连字符；文档标题和正文可用中文。

| 品牌 | 型号 | 资料入口 | 调音指南 |
| --- | --- | --- | --- |
| MOONDROP 水月雨 | Kadenz 终章 | [型号首页](moondrop/kadenz/README.md) | [声音特性与 EQ 指南](moondrop/kadenz/tuning-guide.md) |

新型号沿用以下结构，只建立实际需要的目录：

```text
headphones/<brand>/<model>/
├── README.md                 # 型号索引、已有资料与适用范围
├── tuning-guide.md           # 声音特性与调音依据
├── measurements/
│   ├── README.md             # 来源、测量条件、处理方式与局限
│   ├── raw/                 # 下载/采集原件，保留原始字节
│   ├── processed/           # 从原件转换的 CSV、JSON 等
│   ├── provenance/          # 来源条目、页面记录、哈希校验
│   └── frequency-response.svg
├── analysis/                # 派生统计、归一化数据、离线检查
├── research/                # 外部资料与证据说明
└── listening/               # 实际试听记录，有记录后再创建
```

`raw/` 保留上游文件名以便追溯；其他文件用简短的小写英文名。不同测量系统、导管、耳套或样机应明确标识，不能互相覆盖或混合。

共用程序仍放在项目根目录的 `tools/`；当前型号专用脚本用型号名称区分。可以复算的产物放回该型号的 `processed/` 或 `analysis/`。耳放写入预设继续存放在 [`presets/`](../presets/README.md)，耳放备份和写入记录继续使用 `backups/`、`runs/`，与耳机测量资料分别管理。
