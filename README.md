# MOONDROP DAC Tuning

水月雨 USB 耳放的本地调音工作台：读取设备、编辑 EQ、预览量化后的频响、导入导出配置，并在写入后读回核对。支持 **macOS 上的 ECHO-A 与 ECHO-B**，各型号使用独立协议。这是非官方工具。

## 开始使用

需要 Python 3.9+ 和 Xcode Command Line Tools（`make`、`clang`），无需安装第三方 Python 依赖。

```sh
python3 tools/editor.py --open
```

1. 选择设备型号，或点击“识别已连接设备”。
2. 点击“读取当前设备”，或从对应型号的预设开始编辑。
3. 导出需要保留的 JSON；确认后再点击“写入耳放”。

编辑与预览不访问 HID。**写入会整体替换 EQ 和数字增益**，操作前降低播放音量、关闭其他控制程序，并等待读回结果。新建配置默认省略 `output_gain_db`，省略按 0 dB 处理，由用户自行设置；这不表示保持设备当前增益。

## 文档

| 需要做什么 | 入口 |
| --- | --- |
| 网页编辑、图表、快捷键与导入导出 | [编辑器指南](docs/visual-editor.md) |
| 命令行、写入状态、复核与回退 | [操作指南](docs/operations.md) |
| 配置分类、JSON 字段与增益规则 | [预设格式](presets/README.md) |
| 型号能力、协议与实机证据 | [设备参考](docs/devices/README.md) |
| 原道十周年、Kadenz 的测量与调音依据 | [耳机资料库](headphones/README.md) |
| 架构、测试和扩展设备 | [开发指南](docs/development.md) |

统一命令行入口为 `python3 tools/dac.py`；`list`、`build` 离线运行，`devices` 只查系统注册表，`read`、`verify` 只读设备。具体命令见[操作指南](docs/operations.md)。

`presets/` 保存可编辑配置，`headphones/` 保存耳机资料，`docs/devices/` 保存耳放参考。`runs/`、`evidence/`、`backups/` 保留历史记录与原始证据；`bin/`、`profiles/compiled/` 是可重建产物。网页曲线是数字 EQ 模型，不是耳机实测频响。
