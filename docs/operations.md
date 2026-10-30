# 操作指南

适用于 macOS 上的 MOONDROP ECHO-B（USB `35d8:149b`）。环境要求和网页入口见[首页](../README.md)。以下命令在仓库根目录执行。

## 选择与检查

```sh
python3 tools/preset.py list
python3 tools/preset.py build presets/original-minus-16db.json
```

`list` 列出 `presets/` 第一层 JSON；`build` 离线校验并生成 `profiles/compiled/<文件名>/`，不访问设备。可将示例路径替换为自己的 JSON。字段规则见 [JSON 格式](../presets/README.md)。

## 写入配置

先降低播放音量，连接恰好一台 ECHO-B，并关闭其他控制程序：

```sh
python3 tools/preset.py apply presets/original-minus-16db.json
```

`apply` 重新编译配置，采集写前状态，整体替换 EQ 和输出数字增益，保存后读回核对。每次操作新建 `runs/<UTC时间>-<文件名>/`；终端会输出实际路径。JSON 文件本身不会自动应用到设备。

日常使用 `preset.py` 或网页入口。它们使用 `.echo-b.lock` 避免本工具并行操作，但不能阻止其他 App 改写设备。

## 判断结果

以运行目录的 `status.json`、`write-log.jsonl` 和 `verification.json` 为准。不能仅凭退出码或 App 参数标签判断设备是否已保存。

| 状态 | 退出码 | 含义与下一步 |
| --- | ---: | --- |
| `saved_verified` | 0 | 保存 ACK 完整，读回匹配 |
| `not_written` | 2 | 写前失败；检查连接或权限 |
| `write_uncertain` | 3 | 可能部分生效；保留日志，先检查阶段与 ACK，避免盲目重写 |
| `saved_unverified` | 4 | 保存已确认；执行只读 `verify`，不要重复 `apply` |
| `readback_verified` | 0 | 独立只读复核通过 |
| `readback_failed` | 5 | 查看检查目录；这次复核没有写入 |

准备阶段错误可能没有状态记录，强制终止可能留下 `running`。底层程序的退出码含义与此表不同。

## 只读复核与回退

将占位路径替换为终端输出的实际运行目录：

```sh
python3 tools/preset.py verify runs/实际运行目录
```

`verify` 校验保存计划的完整性，再按其中的系数核对设备；不重新编译、不写入、不覆盖原记录。结果保存在该目录的 `checks/<UTC时间>/`。读取重试规则见[读取恢复参考](devices/echo-b-readback-recovery.md)。

回退时，选定要恢复的完整 JSON，先 `build` 再 `apply`。空白 EQ、0 dB 输出与空白 EQ、−16 dB 输出是不同设置。回退配置不等于恢复出厂固件；写前采集也不是完整闪存备份，不能直接作为预设重放。

如需验证断电保持，写入并读回成功后手动拔下再接回，对原运行目录执行 `verify`，并在该目录的 `persistence-note.md` 记录拔插过程和结果。自动记录中的 `physical_unplug_tested: false` 不会自动变成物理验证证明；当前采样率读回也不能代替所有采样率验收。

## 排障

| 现象 | 处理 |
| --- | --- |
| 参数或系数错误 | 对照 JSON 格式，先离线 `build`；任一采样率不通过都会拒绝写入 |
| 找不到设备 | 核对型号、数据线与连接数量 |
| `Open: 0xe00002e2` | 检查运行环境是否允许 USB 访问 |
| `GetReport` 失败 | 看保存 ACK 和操作阶段；已保存时使用 `verify` |
| 读回不匹配 | 保留日志，排除其他程序改写或设备状态变化 |
| 官方 App 标签与预期不同 | 标签不完整表达实际系数；重新保存可能覆盖本工具配置 |

工具只有限重试读取，不自动重发写入或回滚。保存状态不明时先检查日志。报告问题时附上命令、设备 USB ID、状态与相关诊断；原始操作目录用于复核，分享前检查个人路径等信息。

编译计划、设备协议及开发检查见[开发指南](development.md)和[技术参考](devices/echo-b.md)。
