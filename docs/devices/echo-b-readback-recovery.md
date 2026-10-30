# ECHO-B 读取重试与恢复

设备是否已写入，须结合操作阶段、保存 ACK 和读回结果判断。写后读取失败不等于配置未生效。

## 错误与处理

| 错误 | 含义 | 处理 |
| --- | --- | --- |
| `0xe00002e2` | IOKit `kIOReturnNotPermitted` | 检查设备访问权限，不自动重试 |
| `0xe00002d8` | IOKit `kIOReturnNotReady` | 有限重试读取，不重新发送写入 |
| 其他 I/O 错误或非法查询回包 | 不能归为暂未就绪 | 停止，检查状态和原始诊断 |

保存 ACK 完整而读回失败时，使用 `python3 tools/preset.py verify RUN_DIR` 只读复核。不要为恢复读取而重复执行 `apply`。

## 重试规则

- 原生探测器仅重试 GET_REPORT：最多 20 次，间隔 50 ms；不重新发送查询请求。
- Python 管理层仅在探测器退出码 4 时重新启动只读采集：最多 3 次，退避 0.25 / 0.5 秒，每进程超时 20 秒。
- 写入器对同一操作的 ACK 最多轮询 100 次，间隔 10 ms；标识不匹配的回包在该窗口内过滤。匹配但返回错误的 ACK 会立即失败；不重发可能已生效的写入命令，写入进程超时 120 秒。
- 权限错误和其他 I/O 错误立即停止；非法查询回包不重试，ACK 等待不扩大既定窗口。

## 状态与证据

`status.json`、`events.jsonl` 和终端阶段提示区分 `not_written`、`write_uncertain`、`saved_unverified`、`saved_verified`。成功需要完整保存 ACK 与匹配的读回。

每次读取尝试和诊断单独保存，成功后生成标准采集文件。`verify` 校验保存计划的完整性，按系数直接比对，并在 `checks/` 创建独立结果；不重新计算 EQ、不写入、不覆盖源记录。

`apply` 与 `verify` 使用协作锁。外部 App、底层程序、断开设备和强制终止不受该锁完全保护，也不能保证自动回滚。

状态码和完整操作步骤见[操作指南](../operations.md)。实现与模拟故障覆盖见[探测器](../../tools/echo_probe.c)、[写入器](../../tools/echo_apply_plan.c)、[流程测试](../../tools/test_workflow.py)和[原生测试](../../tools/test_echo_probe.c)。原始设备操作证据保存在 [`runs/`](../../runs/)。
