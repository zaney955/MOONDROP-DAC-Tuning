# ECHO-B 整体输出数字增益

`output_gain_db` 由第 9 段 `[B0, 0, 0, 0, 0]` 实现，Gain=3，系数格式为有符号 24 位 Q22。线性增益为 `B0 / 2^22`。

## 范围与精度

正向非零系数为 `1…8388607`，对应：

```text
最小：20 × log10(1 / 4194304)       = −132.45319809215172 dB
最大：20 × log10(8388607 / 4194304) =   +6.020598877840829 dB
```

输入支持小数，实际系数按 Q22 舍入。接近下限时步进很粗，任意小数不一定能精确实现。零系数表示静音，不用有限 dB 值表达。

此范围属于固定 Gain=3 的单系数实现。其他缩放字段、多段级联或模拟增益不受这组边界概括。官方动态缩放规则见[算法兼容性](echo-b-android-eq-comparison.md)。

正数字增益不提高耳放的最大输出功率。组合频响超过 0 dB 时，满幅输入可能削波；输出电平有余量也不保证前面的滤波级没有溢出。

## 验证边界

两个非零端点、零系数和中间值具有 ECHO-B 临时写入及精确读回证据。该证据不包含模拟输出幅度、噪声、失真、正增益断电保持或五种采样率的逐项实机验证。

- [系数端点与恢复校验](../../runs/20261030T063431.514060Z-output-gain-range/gain-range-status.json)
- [原始协议回包](../../runs/20261030T063431.514060Z-output-gain-range/gain-probe.jsonl)

## 诊断工具

[临时增益探测器](../../tools/echo_gain_probe.c)要求模式 0、第 8 段直通、第 9 段为非正纯增益，并由 `preset.device_lock()` 持锁调用。工具先独占保存并刷盘原始回包，再将第 8 段静音，测试第 9 段；恢复时先核对第 9 段，再恢复第 8 段。它不发送模式、闪存、固件或重置命令。

`SIGINT` / `SIGTERM` 会请求恢复。第 9 段恢复无法核实时，第 8 段保持静音；断开设备、掉电或强制杀进程不能保证自动恢复。

从对应设备的原始备份恢复，在仓库根目录运行：

```python
import sys
import subprocess
sys.path.insert(0, 'tools')
import preset

backup = 'runs/实际运行目录/original-bands-8-9.bin'
with preset.device_lock():
    subprocess.run(['bin/echo_gain_probe', 'restore', backup], check=True)
```

日常设置使用 `preset.py`，诊断探测器不能代替预设写入流程。
