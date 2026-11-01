# 架构与开发

网页 `editor.py` 和统一 CLI `dac.py` 通过设备注册表分派。Python 标准库提供本机 HTTP 服务，C 后端通过 macOS IOKit 通信；用户操作见[首页](../README.md)。

## 模块与设备扩展

| 模块 | 职责 |
| --- | --- |
| `tools/devices.py` | 设备能力、编译、读写和复核适配器 |
| `tools/dac.py` | 统一 CLI |
| `tools/editor.py`、`web/` | 离线预览、HTTP 操作队列、草稿和图表 |
| `tools/echo_a.py`、`echo_a_hid.c` | WalkPlay Q30、快照匹配、一次性提交及读回 |
| `tools/echo_b.py` | 从 ECHO-B 系数精确恢复可编辑参数 |
| `tools/preset.py`、原 ECHO-B C 程序 | Q22 编译、ACK 审计、历史计划及读取恢复 |

新增设备实现 `capability/compile/build_targets/prepare/read/apply/verify_run`，注册后按 VID/PID 与报告布局严格匹配。各适配器拥有独立的系数、传输与保存规则，不能只改 USB ID。新增滤波器也须完成编译、精确读取恢复、边界测试和实机验收，才能加入能力表。

输入约定集中在[预设格式](../presets/README.md)，型号范围集中在[设备参考](devices/README.md)。缺省整体增益按 0 dB 编译但不补入源文档；读取设备保留实际值。前后端分别验证，不能依赖浏览器限制。

## 构建与测试

```sh
make build
make test
git diff --check
```

构建不运行设备工具；测试使用模拟 I/O，不能替代实机、模拟输出或断电验收。历史 ECHO-B 迁移样本在 `tools/fixtures/echo-b-legacy-output/`，不依赖可变的用户运行目录。

浏览器回归需要已安装的 Playwright 和 Chrome。先启动编辑器，再设置 `EDITOR_URL` 指向该服务；可用 `NODE_PATH` 指向已有依赖目录，运行 `node tools/<脚本>`：

| 脚本 | 覆盖范围 |
| --- | --- |
| `test_editor_devices.cjs` | 型号切换、能力、预设筛选、Q8.8 读取导出 |
| `test_editor_optional_gain.cjs` | 省略增益、显式值、清空、导入导出、撤销重做 |
| `test_editor_browser.cjs` | 输入、图表、导入导出、触屏与键盘 |
| `test_editor_creation.cjs` | 新增、排序、选择与段数上限 |
| `test_editor_handles.cjs` | 控制点、单段响应、自动范围与读数布局 |
| `test_editor_probe.cjs` | 曲线吸附读数、滚动、鼠标和触屏 |
| `test_editor_history.cjs` | 历史合并、重置、快捷键与无效输入 |
| `test_editor_recovery.cjs` | 模拟重连与结果显示 |
| `test_editor_read.cjs` | 显式读取、失败保留与断线查询 |
| `test_editor_reload.cjs` | 临时副本中的服务重载和草稿恢复 |

这些脚本不执行真实设备写入，重载脚本自行启动临时服务。已完成的检查与硬件边界见[2026-11-01 验证记录](validation-20261101.md)。

## 自动重载

默认监听 `tools/` 的 Python／C 文件、`web/`、预设 JSON 和 `Makefile`；稳定约 0.6 秒后检查语法与启动，再重启服务和页面。活动设备操作结束前不重载，检查失败保留旧服务；`--no-reload` 可关闭。

服务固定资源快照并校验页面版本、Host、Origin 和会话令牌，仅监听 `127.0.0.1`。页面暂存草稿、原始输入、选中项、历史、设计率和滚动位置；持续编辑期间延后刷新。会话及上次操作结果随重载保留，网络错误只重新查询状态。

## 计划、互斥与证据

日常入口共用 `.echo-b.lock`，内部名称为兼容旧 CLI 保留，外部 App 不受它控制。写入不自动重试；ECHO-B 的读取恢复见[协议说明](devices/echo-b-readback-recovery.md)。

计划保存 `preset.json`、`plan.json`、`plan.bin`、`manifest.json`。ECHO-A 离线编译为 EQA0；写前采集槽位与快照后生成 EQA1，C 程序再次匹配快照。ECHO-B 继续使用 56×62 字节序列。`verify` 检查完整性并比较保存的字节，不重新计算历史 EQ。

`response_check` 是量化系数的抽样检查；编译成功不证明内部无削波或模拟精度。`runs/`、`backups/` 和 `evidence/` 保留原始内容及旧路径；缓存按 [`.gitignore`](../.gitignore) 管理。改名后用新真实目录打开工作区，符号链接可供路径兼容，但不能作为 Codex 的可写工作区根。

## 资料复算与诊断

新增耳机沿用[资料库结构](../headphones/README.md)，只建立需要的目录，原始测量保留来源和字节。共用分析脚本放在 `tools/`；Kadenz 的复算命令见[型号入口](../headphones/moondrop/kadenz/README.md)。

官方 Android 算法对比使用[独立分析依赖](../tools/requirements-android-eq.txt)，正常运行和测试不需要。在与证据哈希匹配的 APK／库及尚不存在的输出目录上执行 `python3 tools/compare_android_eq.py /tmp/echo-android-eq-comparison`；此工具不访问 USB，环境须允许 Unicorn 缓存初始化。

原生临时修改探测器有严格起始条件与恢复要求，见[诊断工具](devices/echo-b-parameters.md#诊断工具)，不能充当通用试听或回退入口。
