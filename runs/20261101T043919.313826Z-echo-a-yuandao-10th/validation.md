# 验证记录

- 新增 ECHO-A Python 测试 5 项通过（响应、协议布局、错误设备/滤波器拒绝、范围检查、系数逐字节验收）。
- 新增 ECHO-A C 帧白名单检查通过；clang -Wall -Wextra -Werror 编译通过。
- 现有 3 个 C 测试程序分别通过。
- 全部 Python 测试运行 67 项，66 项通过，1 项失败：`test_migrated_historical_presets_keep_exact_device_frames` 未找到包含旧字段 `preamp_db` 的历史 `runs/*/plan.json`（checked=0）。此次未修改该测试、旧预设或旧运行记录；本次 ECHO-A 使用独立二进制计划，不生成 ECHO-B plan.json。
- 首次沙箱内运行的编辑器 HTTP 测试因 loopback 端口权限失败；允许 loopback 的复跑中这些测试通过。
- git diff --check 通过。
- 实机 apply 后读回与独立重新打开后的只读复核通过。没有物理拔插或模拟输出测量。
- 原始回退计划离线对比 before.jsonl 通过；未执行回退。
