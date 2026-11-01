# 预设分类与 JSON 格式

每个 JSON 表示一份完整调音，写入时整体替换 EQ 和数字增益。网页与 `python3 tools/dac.py list` 递归加载本目录，并按 `device` 分派协议；操作见[操作指南](../docs/operations.md)。

## 分类

按 `设备 / 品牌 / 耳机型号` 存放，通用基准使用 `设备 / general`：

```text
presets/
├── echo-a/nicehck/yuandao-10th/
│   ├── yuandao-10th-foam-balanced-v1.json
│   └── official/              # 官方 Type-C 的 7 套参数移植，目标 ECHO-A
└── echo-b/
    ├── general/original-default.json
    └── moondrop/kadenz/
        ├── kadenz-death-metal-structure-v1.json
        ├── kadenz-riff-impact-v2.json
        ├── kadenz-riff-impact-v3.json
        └── kadenz-riff-impact-v4.json
```

原道十周年的[官方参数移植目录](echo-a/nicehck/yuandao-10th/official/README.md)保存 7 套 ECHO-A 配置，来源、整体 offset 的处理和离线校验记录见该目录说明。

CLI 接受分类路径或唯一文件名，重名时须提供分类路径。两份旧平直基准归零后音频参数相同，现保留 `echo-b/general/original-default.json`。旧 `preset.py list` 递归列出 ECHO-B；跨型号使用 `dac.py`。

## 整体增益约定

**新建或编写配置默认省略 `output_gain_db`，由用户自行设置。** 省略时按 0 dB 预览和编译，不修改源文档，也不自动补入导出 JSON。手动填写 0 则保留显式 0；清空网页输入框会删除该字段。读取设备时仍保留实际电平。

2026-11-01 已将当时预设库的整体增益统一为 0；这不是限制后续手动修改的规则。历史计划、备份和分析报告保留原值，不能视为现行文件或设备实时状态。**省略字段不表示保留设备增益**：若执行写入，将使用 0 dB。

## 文档结构

```json
{
  "version": 1,
  "device": "MOONDROP ECHO-B",
  "name": "我的声音配置",
  "filters": [
    {"type": "peak", "frequency_hz": 1000, "gain_db": -1, "q": 1}
  ]
}
```

| 字段 | 规则 |
| --- | --- |
| `version` | 必填，`1` |
| `device` | 必填，`MOONDROP ECHO-A` 或 `MOONDROP ECHO-B`；不自动替换型号 |
| `name` | 必填，非空文字 |
| `description` | 可选，文字备注 |
| `output_gain_db` | 可选，缺省 0 dB；含义和合法范围随型号变化 |
| `filters` | 必填，最多 8 段；空数组保留平直 EQ |

每段须包含且仅包含 `type`、`frequency_hz`、`gain_db`、`q`。频率为 20–20000 的整数 Hz；峰值使用 RBJ Q，范围 0.1–10，按 1/256 量化；架式的 `q=1` 表示固定斜率 S=1，并非官方 App 的架式 Q=1。`gain_db` 控制单段增益，与顶层整体电平不同。

型号的滤波器、增益范围和设计率见[能力表](../docs/devices/README.md#编辑能力)。ECHO-A 增益按 1/256 dB 量化后计算 Q30 系数；ECHO-B 接受 0.1 dB 步进并生成五套 Q22 系数。早期 ECHO-A 的 `preamp_db` 在导入时规范为 `output_gain_db`，两字段同时出现会拒绝；ECHO-B 不接受该旧字段。

## 编译与兼容性

编译器拒绝未知字段、非法数值、不支持的类型、定点溢出和量化后不稳定的滤波器。ECHO-B 必须同时通过五种采样率；ECHO-A 按固定 93,750 Hz 设计。预览“输出峰值”包含整体增益，超过 0 dB 时提示可能削波，不自动改变配置。

系数可编码不等于模拟输出准确或内部无削波。同参数也不保证与官方 App 得到相同曲线；具体实现、Q22 电平边界及整数标签规则见[ECHO-B 参数与算法](../docs/devices/echo-b-parameters.md)。公式依据为 [Audio EQ Cookbook](https://www.w3.org/TR/audio-eq-cookbook/)。
