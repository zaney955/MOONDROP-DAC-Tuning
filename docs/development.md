# 开发指南

用户操作见[首页](../README.md)。本项目使用 Python 标准库提供本地 HTTP 服务，C 后端通过 macOS IOKit 通信，网页资源位于 `web/`。

## 检查代码

在仓库根目录运行：

```sh
make test
make build
git diff --check
```

`make test` 包含 Python 回归和 C 故障注入，使用模拟设备 I/O，不访问 USB。`make build` 编译设备工具，不运行它们。自动测试不能替代实机读回、模拟输出测量或拔插验证。

可选浏览器回归需要能解析 `playwright` 的 Node 环境和本机 Chrome。先启动编辑器，再运行所需脚本；默认地址为 `http://127.0.0.1:8765`，可用 `EDITOR_URL` 指定端口，或用 `NODE_PATH` 指向已有依赖目录。

| 脚本（位于 `tools/`） | 覆盖范围 |
| --- | --- |
| `test_editor_browser.cjs` | 输入、导入导出、拖动、触屏、滚轮与键盘 |
| `test_editor_creation.cjs` | 新增、排序、焦点、导出顺序与段数上限 |
| `test_editor_handles.cjs` | 控制点、单段曲线、总频响与显示范围 |
| `test_editor_probe.cjs` | 曲线点数值、鼠标／键盘／真实触屏跟随、吸附与页面滚动 |
| `test_editor_history.cjs` | 撤销重做、历史合并、无效输入与快捷键 |
| `test_editor_recovery.cjs` | 模拟重连状态与结果显示 |
| `test_editor_read.cjs` | 显式读取、取消、草稿载入、导出、失败保留与断线后查询（模拟设备） |
| `test_editor_reload.cjs` | 临时项目副本中的服务重载、草稿和历史恢复、语法错误回退 |

例如 `node tools/test_editor_browser.cjs`。这些脚本不启动真实设备写入；重载脚本自行启动临时副本服务。

## 自动重载

编辑器默认监听 `tools/` 的 Python／C 文件、`web/`、`presets/` JSON 和 `Makefile`。保存稳定约 0.6 秒后检查代码，再重启服务和页面；`runs/`、备份和编译产物不在监听范围内。使用 `python3 tools/editor.py --no-reload` 可关闭。

每次服务启动固定代码及资源快照，旧页面的写入请求会在访问设备前被拒绝。重载等待设备操作结束，不中断或重发操作。Python 语法或导入错误会保留旧服务，安装了 Node 时还会检查 `web/app.js` 语法。

页面使用本标签页的 `sessionStorage` 暂存草稿、无效输入、选中项、撤销历史、采样率与滚动位置。持续输入或拖动期间延迟刷新；存储不可用时保留页面并提示导出。服务重载保留会话令牌和上次操作状态；完全退出后，历史计划通过命令行复核。旧版不支持重载的页面需要先导出草稿，再手动刷新。

本地服务检查 Host、Origin、会话令牌和代码版本，不向局域网开放。状态轮询读取服务端记录，不查询 USB。

## 计划与证据

编译目录包含源配置 `preset.json`、系数计划 `plan.json`、写入序列 `plan.bin` 和哈希 `manifest.json`。`response_check` 是量化系数的抽样响应检查。重新编译不保证跨编译器版本字节一致，因此 `verify` 直接核对历史计划。

`runs/` 由设备操作生成，包含快照、ACK、状态和独立复核。`backups/`、`evidence/` 和测试用 `profiles/` 保存历史采集与分析依据，不代表新用户的设备状态。维护时保留原始证据；`bin/`、`profiles/compiled/`、Python 缓存按 [`.gitignore`](../.gitignore) 管理。

只读诊断可在 `make build` 后运行 `bin/echo_probe` 或 `bin/echo_probe --coefficients`。`tools/backup_metadata.py` 只采集参数标签，不含完整系数。临时修改探测器有严格起始条件与恢复流程，不能作为通用试听或回退工具，见[参数参考](devices/echo-b-parameters.md#诊断工具)。

## 扩展与复算

新增耳机沿用[资料库结构](../headphones/README.md)，原始测量保留字节和来源；共用分析程序放在 `tools/`。Kadenz 的复算命令见[型号入口](../headphones/moondrop/kadenz/README.md)。

新增耳放需要独立实现设备识别、传输、编码和验收，不能仅更换名称或 USB ID。扩展滤波器也需核对各采样率的系数范围、稳定性和响应，再分别做设备与实际效果验收。

官方 Android 算法对比使用独立分析依赖，正常运行及 `make test` 不需要它们。依赖见 [`requirements-android-eq.txt`](../tools/requirements-android-eq.txt)。使用与证据哈希匹配的 APK 和库，在尚不存在的输出目录运行：

```sh
python3 tools/compare_android_eq.py /tmp/echo-android-eq-comparison
```

该工具不访问 USB；运行环境须允许 Unicorn 缓存初始化。
