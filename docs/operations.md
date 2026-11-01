# 操作指南

在仓库根目录运行以下命令。统一入口 `tools/dac.py` 根据 JSON 的 `device` 字段选择 ECHO-A 或 ECHO-B；型号和参数范围见[设备参考](devices/README.md)，配置规则见[预设格式](../presets/README.md)。

## 列出、编译与读取

```sh
python3 tools/dac.py list
python3 tools/dac.py list --device echo-a
python3 tools/dac.py build presets/echo-b/general/original-default.json
python3 tools/dac.py devices
python3 tools/dac.py read --device echo-a
```

`list` 递归列出分类预设，`build` 离线生成 `profiles/compiled/<UTC时间>-<型号>-build/`。`devices` 只枚举 macOS USB 注册表；`read` 对目标型号读取两轮一致的状态，保存原始数据并尝试精确恢复 JSON。读取 ECHO-B 时将参数改为 `--device echo-b`。不支持的模式或系数会保留诊断并报错，不用近似参数替代。

## 写入

先降低播放音量，连接恰好一台目标型号，关闭其他控制程序：

```sh
python3 tools/dac.py apply presets/echo-b/general/original-default.json
```

写入会整体替换 EQ 和数字增益，省略 `output_gain_db` 时按 0 dB 编译。每次操作创建新的 `runs/<UTC时间>-<型号>-apply/`；网页操作使用 `*-visual-editor/`。记录包含配置、计划、原始读回、状态和验证结果。

以 `status.json`、写入日志和 `verification.json` 联合判断结果：

| 状态 | 含义与下一步 |
| --- | --- |
| `saved_verified` | ECHO-B：保存 ACK 完整且读回匹配；ECHO-A：提交序列已发送且读回匹配，无独立保存 ACK |
| `not_written` | 写前失败，尚未发送 EQ；检查连接和权限 |
| `write_uncertain` | 可能部分生效；保留日志，先做只读复核 |
| `saved_unverified` | ECHO-B 保存已确认，但读回未通过；不要重复写入 |
| `readback_verified` / `readback_failed` | 独立只读复核通过／未通过，本次没有写入 |
| `read_complete` / `read_failed` | 当前设置读取成功／失败，本次没有写入 |

准备阶段错误可能没有记录，强制终止可能留下 `running`。不要把旧 ECHO-B CLI 或底层 C 的退出码直接套用到统一入口。ECHO-B 的有限读取重连规则见[读取恢复](devices/echo-b-readback-recovery.md)；两型号均不自动重发写入或回滚。

## 只读复核与回退

```sh
python3 tools/dac.py verify runs/实际运行目录
```

`verify` 校验历史计划的完整性，直接比较保存的系数，不重新编译或应用当前草稿。结果写入原目录的 `checks/<UTC时间>/`，不覆盖旧记录。

回退是一次新的写入：选择要恢复的完整配置，先 `build` 再 `apply`。EQ 备份不是完整固件镜像；不要仅修改 JSON 来宣称设备已经回退。ECHO-A 原始帧的专用恢复方式见[型号参考](devices/echo-a-tuning-research.md#原始备份恢复)。

断电保持须另验：成功写入后手动拔下并接回，再对同一历史计划运行 `verify`，在该目录的 `persistence-note.md` 记录过程。仅重开 HID 连接或一次读回不能替代受控断电测试。

## 排障与兼容入口

| 现象 | 处理 |
| --- | --- |
| 参数或系数无效 | 先离线 `build`，核对[配置规则](../presets/README.md) |
| 无设备或多个匹配设备 | 核对型号、数据线与连接数量 |
| `0xe00002e2` | 检查运行环境是否允许 USB 访问 |
| 写后读取失败、状态未知或不匹配 | 查看阶段与提交／ACK 证据，只读 `verify`，不要盲目重写 |
| 官方 App 标签不同 | 以实际系数为准；App 重新保存可能覆盖当前调音 |

统一 CLI 和网页使用 `.echo-b.lock` 串行化设备操作；名称为兼容旧入口保留，不代表只锁 ECHO-B，也不能阻止外部 App。旧 `tools/preset.py` 仅供 ECHO-B 使用。关闭网页不取消已启动的写入；退出服务前先等待操作完成。
