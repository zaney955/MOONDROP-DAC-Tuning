# 仓库操作指南

本工具支持 macOS 上的 MOONDROP ECHO-B（USB `35d8:149b`）。需要 Python 3.9+、Xcode Command Line Tools 中的 `make` 和 `clang`，无需 Python 第三方依赖。以下命令在仓库根目录运行。

## 选择、检查和写入

```sh
python3 tools/preset.py list
```

从列表中选定文件。下列变量中的中文是占位符，执行前替换为实际路径：

```sh
EQ_FILE="presets/所选文件.json"
python3 tools/preset.py build "$EQ_FILE"
python3 tools/preset.py apply "$EQ_FILE"
```

| 命令 | 设备操作 | 输出 |
| --- | --- | --- |
| `list` | 无 | `presets/` 第一层 JSON 的摘要 |
| `build` | 无 | `profiles/compiled/<文件名>/`，可重建的缓存 |
| `apply` | 读取、写入、保存、读回核对 | 新建 `runs/<UTC时间>-<文件名>/` |
| `verify` | 只读核对保存的计划 | 对应运行目录中的 `checks/<UTC时间>/` |

`apply` 会重新编译所选 JSON，整体替换音色和输出数字增益。编辑文件本身不会改变设备。写入前降低播放音量，连接恰好一台 ECHO-B，关闭其他控制它的程序。

日常使用 `preset.py`，不要直接调用底层写入器。`apply` 与 `verify` 使用 `.echo-b.lock` 防止本工具并行操作；它不能阻止外部 App。

## 编辑与编译

复制一份 JSON，修改名称、用途和参数后执行 `build`。字段规则集中在 [JSON 格式](../presets/README.md)，耳机研究在[资料库](../headphones/README.md)。文档不列举具体文件或参数；改名、调参只修改 JSON。

编译目录包含源文件快照 `preset.json`、参数与系数 `plan.json`、写入序列 `plan.bin` 和哈希记录 `manifest.json`。整体输出数字增益记录在 `plan.json` 的 `preset.output_gain_db`，`response_check` 记录量化后的频响检查。

编译器为 44.1 / 48 / 96 / 192 / 384 kHz 生成系数，检查参数、数值可计算性、24 位范围、稳定性和采样频点响应。单段 `gain_db` 接受有限整数 dB，不设固定上下限，采用标准 RBJ 峰值 Q / 架式 S=1 公式。任何一种采样率校验失败都会拒绝整份预设。整体输出支持正数字增益，范围及验证边界见 [JSON 格式](../presets/README.md)。组合频响超过 0 dB 会提示满幅输入可能削波，不会自动降低增益；最终幅度留有余量也不能证明内部各级不会溢出。编译结果不代替实机、听感或拔插验证。

## 判断结果与恢复读取

`apply` 先采集写前状态，再发送 56 条操作（含保存），最后核对模式、参数和当前运行系数。结果以运行目录中的 `status.json`、`write-log.jsonl`、`verification.json` 为准，不能仅凭退出码判断是否写入。

| 状态 | 退出码 | 下一步 |
| --- | ---: | --- |
| `saved_verified` | 0 | 保存 ACK 完整且读回匹配 |
| `not_written` | 2 | 写前失败，检查连接或权限 |
| `write_uncertain` | 3 | 可能部分生效；先检查日志，不盲目重写 |
| `saved_unverified` | 4 | 已确认保存，执行 `verify`，不要重复 `apply` |
| `readback_verified` | 0 | 独立只读复核通过 |
| `readback_failed` | 5 | 查看检查目录；这次复核没有写入 |

准备阶段错误可能没有状态记录；被强制终止后可能留下 `running`。原生探测器与顶层命令的退出码含义也不同，需结合阶段和 ACK 判断。

```sh
EQ_RUN="runs/实际运行目录"
python3 tools/preset.py verify "$EQ_RUN"
```

`verify` 接受运行目录，不接受预设名。它先校验保存计划的完整性，再直接按保存的系数核对，不重新计算，也不覆盖输入运行记录。保存状态为 `saved_unverified` 时，可由独立检查的 `readback_verified` 结果确认当前设备与保存计划匹配。

工具只对暂未就绪进行有限读取重试，不自动重发写入或回滚。具体重试边界及处理规则见[读取重试与恢复](devices/echo-b-readback-recovery.md)。

## 回退与拔插验证

回退时使用符合[当前格式](../presets/README.md)的目标 JSON，先 `build` 再 `apply`。从运行记录整理恢复配置时，应核对编译系数与保存计划是否一致；不要改写原始记录。`verify` 直接核对保存的系数，无需重新编译源文件。

重新编译不保证跨编译器版本字节一致。写前采集只代表采集时的运行状态，不是完整闪存备份，也不是可直接重放的预设。恢复 EQ 不等于恢复出厂固件。

验证断电保持：写入并读回成功后，手动拔下再接回，针对原运行目录执行 `verify`。将实际拔插过程与结果记入该目录的 `persistence-note.md`；程序默认的 `physical_unplug_tested: false` 不会自动变成物理测试证明。当前采样率读回也不能替代所有采样率的实机验证。

## 排障与维护

| 现象 | 处理 |
| --- | --- |
| 字段、范围或系数错误 | 对照 JSON 格式，先离线 `build` |
| 找不到设备 | 检查型号、连接和数据线，确保只连接一台 |
| `Open: 0xe00002e2` | 检查执行环境是否允许 USB 访问 |
| `GetReport` 失败 | 先看保存 ACK 与阶段；已保存时仅重新 `verify` |
| 读回不匹配 | 保留日志，排除其他程序改写或设备状态变化 |
| App 显示与预期不同 | 参数标签不代表全部系数，以实际读回为准 |

只读诊断可运行 `make build` 后调用 `bin/echo_probe` 或 `bin/echo_probe --coefficients`。`tools/backup_metadata.py` 只备份参数标签，不含完整系数。

代码变更后运行 `make test`、`make build` 和 `git diff --check`；自动测试使用模拟设备 I/O，不能当作实机验收。增加耳机时沿用资料库结构；增加耳放需单独适配协议，不能只改设备名称。

保留原始测量、备份、协议证据和 `runs/`；编译缓存、可执行文件及 Python 缓存按 [`.gitignore`](../.gitignore) 管理。参数只维护在 JSON，操作状态只记录在运行目录；文档描述当前用法、规则和验证边界，原始操作证据保存在对应数据目录。
