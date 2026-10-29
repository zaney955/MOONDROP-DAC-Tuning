# ECHO-B 电脑调音调查

2026-10-29，实机：MOONDROP ECHO-B，USB `35d8:149b`，Kadenz 终章附送耳放。

已在这台 Mac 上验证：能够读取 EQ 参数和原始 DSP 系数，能够临时修改系数，并精确恢复测试前的运行状态。没有执行闪存保存、模式切换、恢复出厂或固件升级。

## 备份与验收

- `backups/ECHO-B-original-current-state.json`：整合的初始模式、9 段参数、9 段原始系数与原始回包。
- `backups/initial-read.jsonl`：首次参数读取。
- `backups/coefficients-read.jsonl`：首次原始系数读取。
- `backups/runtime-roundtrip.jsonl`：修改、读回、恢复、读回的记录。
- `backups/after-test-metadata.jsonl` 和 `backups/after-test-coefficients.jsonl`：最终全量复核。
- `backups/SHA256SUMS`：备份文件校验值。

初始模式为 0；9 段参数频率依次为 500、1000、1500、2000、2500、3000、3500、4000、4500 Hz，Q 均为 1，类型代码均为 1，显示增益均为 0 dB。当前9段原始系数均为 Gain=3，B0=4194304，其他四项为0，符合这套 Q22 格式的直通滤波器。没有实测模拟输出频响。

测试仅更改第9段当前系数 B0：4194304 → 3738177（数学上约 -1 dB），读回确认变化，然后恢复4194304。最终**所有模式、参数和9段系数的原始62字节回包**均与初始备份相同。

## 恢复范围

这是一份**本次连接下当前 EQ 运行状态**的备份，不是整机固件或完整闪存镜像。没有更改采样率、切换全部预设或断电测试，不能据此声明已备份所有采样率的持久化配置。用户所称默认状态在本次调查前未由出厂镜像独立验证。

当前运行状态的写入、读回和恢复已经实机验证；永久调音、拔插后的保持和恢复尚未验证。下一步如需把调音带到 iPhone，仍需单独核对存储路径和断电恢复，再执行持久化操作。

## 工具

`make build` 编译只读程序 `bin/echo_probe`。只读采集：

```sh
python3 tools/backup_metadata.py
bin/echo_probe --coefficients
```

`backup_metadata.py` 每次建立新的时间戳目录，不覆盖初始备份；它只备份参数标签。系数读取输出完整原始回包。macOS 沙箱内可能报 `0xe00002e2`；本次以允许访问已连接设备的命令执行权限解决，没有更改系统隐私设置。

`tools/echo_runtime_test.c` 是此次狭窄验证程序，**会临时修改设备**。只接受原始第9段为本次直通系数的情况；先独占创建原始回包文件并 fsync，再写入约 -1 dB，随后立即恢复和验证。不要把它当通用调音程序；运行中拔线或进程被强制终止会打断自动恢复。

## 协议证据与分析边界

1. 设备身份和报告描述符：`evidence/usb-identity.json`，来自本机 IORegistry。
2. [FreeDSP-Studio](https://github.com/EffectiveEquivalent/FreeDSP-Studio/tree/1b42f63db24f7dc8e94f6897575c1c403f4d4882) 的 `dsp.rs`、`hid_hidapi.rs` 提供参数读取路径；副本保存在 `evidence/upstream-*`。该项目不提供Gen1原始系数备份，因此没有直接采用其写入/恢复结论。
3. [官方 App 下载入口](https://moondroplab.com/cn/moondrop-link) 对应 APK 已保存，未安装或执行。SHA-256 与成员 CRC 库存见 `evidence/apk-inventory.json`。
4. 官方 APK 的 `classes.dex` 静态反汇编：`evidence/official-dex-protocol.asm`。`FreemanCnxtUsbDevice.getF3EQCoefficientList` 使用 CTRL/`0x01BE`，参数 `[0, band]`；`setFreeman3EQ` 使用 CTRL/`0x00BE`，参数 `[0,band,Gain,B0,B1,B2,A0,A1]`。当前设备支持已由实机响应验证。
5. `getEQParamsFromFlash` 方法实际仅组合模式和参数读取，不能因名称就当作完整闪存备份。
6. 报告ID=1，总长62；CTRL模块ID=`0xB32D2300`；GET位=`0x0100`，回复位=`0x8000`；偏移2的int16为返回dword数，负值表示错误。使用 macOS IOKit 的控制管道 SET_REPORT(Output)/GET_REPORT(Input)。
7. 实际系数从offset22起，每项占4字节，按24位有符号数解释；offset18是Gain字段。本次恢复直接复制原始字节，没有从参数重新计算系数。

REA 6.5.0 的 Codex 注册存在，但本次没有暴露MCP工具；CLI尝试Hopper静态反编译未能启动，错误保存在 `evidence/rea-memory-read.json`。已改用本机 LLVM 反汇编和临时环境 Androguard 进行静态检查；上述文件不是REA Evidence ID。APK及Android库没有被运行。

官方网页当前列出 Echo-BP，并未列出本机 ECHO-B；此次使用本机原生控制管道验证，不依赖网页兼容性。
