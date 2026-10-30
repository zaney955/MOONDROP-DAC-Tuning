# ECHO-B EQ 调节工具

在本地网页中编辑 EQ、预览频响、导入导出 JSON，并向 MOONDROP ECHO-B 写入配置和读回核对。也可使用命令行管理预设。耳机测量与调音示例收录在独立的[耳机资料库](headphones/README.md)。

设备后端支持 **macOS 上的 ECHO-B（USB `35d8:149b`）**。这是非官方工具；ECHO-A 及其他型号需要独立适配，不能直接使用此后端。

## 快速开始

需要 Python 3.9+；设备通信还需要 Xcode Command Line Tools 中的 `make` 和 `clang`。没有 Python 第三方依赖或前端依赖需要安装。以下命令在仓库根目录运行。

```sh
python3 tools/editor.py --open
```

浏览器打开本地编辑器。选择预设或新建配置，调节曲线后导出 JSON；需要应用到设备时，先降低播放音量，连接恰好一台 ECHO-B，关闭其他控制程序，再点击“写入耳放”。编辑和预览本身不访问 USB。

**写入会整体替换 EQ 和输出数字增益。** 等待页面显示保存及读回结果；如果提示“已保存但未验证”，使用只读复核，避免重复写入。网页曲线是数字模型，不是耳机实测或设备实时状态。

## 使用文档

| 需要做什么 | 文档 |
| --- | --- |
| 调节曲线、快捷键、导入导出 | [编辑器指南](docs/visual-editor.md) |
| 命令行写入、复核、回退和排障 | [操作指南](docs/operations.md) |
| 编写或转换预设 | [JSON 格式](presets/README.md) |
| 查看耳机测量与调音示例 | [耳机资料库](headphones/README.md) |
| 了解设备协议、兼容性与固件限制 | [ECHO-B 技术参考](docs/devices/echo-b.md) |
| 修改代码、运行测试、复算分析 | [开发指南](docs/development.md) |

查看仓库内可用配置：

```sh
python3 tools/preset.py list
```

预设是调音起点，适合程度取决于耳机、佩戴、录音和个人偏好。预设名称或历史操作记录都不代表已连接设备的当前状态。

## 仓库内容

| 目录 | 用途 |
| --- | --- |
| `web/`、`tools/` | 网页编辑器、编译器与设备通信程序 |
| `presets/` | 可编辑的完整听音配置 |
| `headphones/` | 耳机测量、来源与调音示例 |
| `docs/` | 使用指南与技术参考 |
| `evidence/`、`backups/` | 协议分析材料与历史采集；不是通用恢复镜像 |
| `runs/` | 操作时生成的计划、ACK、读回和验收记录 |
| `profiles/compiled/`、`bin/` | 可重建的编译缓存与程序 |
