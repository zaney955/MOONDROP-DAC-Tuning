# ECHO-A 网页实机验收（2026-11-01）

用户重新插入设备后，通过统一多设备网页选择ECHO-A并读取；写前确认110Hz低架+1dB/S=1、1600Hz峰值−1dB/Q=1、前级−20dB，然后原样写回一次。

`before.jsonl` 保存写前完整快照。C程序写前再次匹配该快照，随后提交，并在程序内读回。`after.jsonl` 为重新打开HID后的独立读回，全部8段元数据、160字节Q30系数、槽位及−20dB前级匹配；`verification.json` 与 `status.json` 均通过。

`checks/20261101T051430.437412Z/` 是网页“只读复核上次写入”按钮生成的独立复核，通过且未发送设置。随后 `runs/20261101T051431.997696Z-device-read/` 的网页读取再次获得相同两段状态。

协议没有独立保存ACK，记录保持 `save_command_acknowledged: false`，另记录 `commit_sequence_sent: true` 与 `readback_verified: true`。未做受控断电保持、模拟频响/电平或主观听感验收。

最初测试脚本读取任务对象的时序异常发生在写入成功之后；经只读审计确认后，没有重发写入。完整结果见[验证记录](../../docs/validation-20261101.md)。
