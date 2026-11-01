# ECHO-A / 原道十周年 / 全包海绵 / 温和均衡 V1

2026-11-01，用户授权为已插入的 ECHO-A 调音；随后明确耳机为原道十周年纪念版、全包海绵，选择温和均衡起点。

- `before.jsonl`：设置前完整只读备份；固件 0.1，槽位 0，8 段平直，前级 0 dB。
- `preset.json`：两段微调，低架 110 Hz +1 dB S=1；峰值 1600 Hz −1 dB Q=1；前级 −20 dB。
- `plan.bin`：`EQA1` + 11×63 字节前置快照 + 9×63 字节目标帧。写前必须逐字节匹配快照。ECHO-B 后端不兼容。
- `apply.jsonl` / `apply.stderr`：一次写入及提交，写前、写后各完整读取一次。没有写入自动重试。
- `after-independent.jsonl`：重新打开 HID 后的独立只读复核。
- `verification.json` / `status.json`：全部 8 段元数据、160 字节系数及 −20 dB 前级匹配。
- `restore-original.bin`：基于本次独立读回生成的原始配置回退计划，**未执行**。回退包括前级恢复为 0 dB。

依据与限制见 [`evidence/echo-a-local-20261101/README.md`](../../evidence/echo-a-local-20261101/README.md)。未做个人实测或全包海绵 AutoEQ，未验物理拔插保持和模拟输出。
