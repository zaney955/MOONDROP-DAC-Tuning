# 仓库操作指南

这份指南适用于整个仓库的资料管理、EQ 预设制作、写入、验证和恢复流程，不限定耳机型号。耳机的声音研究按型号存放，耳放的通信能力由设备程序决定。

**当前可执行的硬件写入仅支持 macOS 上的 MOONDROP ECHO-B，USB `35d8:149b`。** 可以为接在它上的不同耳机保存不同预设，但不能将本工具用于其他 DAC、ECHO-BP 或其他 USB 设备，也不能仅修改配置中的设备名称来增加支持。

## 1. 目录与职责

| 路径 | 内容 | 操作约定 |
| --- | --- | --- |
| `presets/*.json` | 可编辑的音色配置原件 | 平时创建、选择和修改这些文件 |
| `profiles/compiled/<预设名>/` | 编译后的参数、系数和写入计划 | Git 忽略；`build` 可重建并覆盖同名产物，不能当作版本备份 |
| `runs/<UTC时间>-<预设名>/` | 每次写入的配置快照、前后读取、ACK 和验收 | 独立保存历史；不要拿后来编辑的预设冒充当时写入版本 |
| `backups/` | 原始备份与单独的只读采集 | 保留初始文件，区分标签、当前系数和完整闪存的范围 |
| `headphones/<品牌>/<型号>/` | 各耳机的原始测量、研究、分析及试听 | 结构见[耳机资料库](../headphones/README.md) |
| `tools/` | Python 管理程序、原生设备程序与离线分析 | 日常使用统一入口 `tools/preset.py` |
| `bin/` | 本机编译得到的可执行文件 | 可重新生成，已被 Git 忽略 |
| `evidence/` | 协议逆向和厂商软件分析证据 | 不当作日常预设使用 |
| `docs/` | 仓库操作指南和设备技术记录 | 耳机专属音色指南放在 `headphones/` |

数据流：`presets/*.json` → 编译与检查 → 写入计划 → 设备保存 → 读回验证 → `runs/` 留档。原始频响是调音参考资料，不能直接当成设备 EQ 配置发送。

## 2. 环境与首次准备

所有命令都在**仓库根目录**运行；先进入本机的项目目录。本机当前路径示例：

```sh
cd /Users/zane/Projects/reverse/ECHO-B-DAC-Amp-Tuning
```

离线生成预设使用 Python 3.9 或更高版本及标准库，无需 pip 依赖。设备程序使用 macOS 的 IOKit、CoreFoundation，以及 `make`、`clang`；机器需有 Xcode Command Line Tools 或相应开发工具。

```sh
python3 --version
make build
python3 tools/preset.py list
```

`make build` 只编译，不访问 USB、不改 EQ。写入时连接一台 ECHO-B；程序要求恰好匹配一个设备。关闭其他正在控制同一耳放的调音工具，避免同时发命令。正式写入前降低播放音量，尤其是从大幅衰减的测试 EQ 切回普通音色时。

## 3. 日常切换：列出、检查、写入

以仓库现有的全局 −2 dB 配置为示例，它不依赖某个耳机的频响特征：

```sh
# 1. 列出预设名称
python3 tools/preset.py list

# 2. 离线生成和检查，不连接耳放
python3 tools/preset.py build global-minus-2db

# 3. 真正写入耳放、执行保存，并读回验证
python3 tools/preset.py apply global-minus-2db
```

将 `global-minus-2db` 换成目标文件名（不含 `.json`）即可。也可传完整 JSON 路径：

```sh
python3 tools/preset.py build presets/global-minus-2db.json
```

**每个预设都是完整替换配置，不是在耳放当前 EQ 上继续叠加。** `apply` 自己也会重新编译配置，因此前一次 `build` 后若修改了 JSON，应再次检查。`list` 目前只枚举 `presets/` 第一层 JSON，日常配置不要随意放进子目录。

| 命令 | 访问设备 | 改变 EQ | 主要输出 |
| --- | --- | --- | --- |
| `list` | 否 | 否 | 预设列表，不是设备当前状态 |
| `build` | 否 | 否 | `profiles/compiled/<名称>/` |
| `apply` | 是 | 是，包含保存操作 | 新的 `runs/<时间>-<名称>/` |
| `verify` | 是 | 否，仅对照历史计划读回 | 指定运行目录内新的 `checks/<时间>/` |

不要用底层 `bin/echo_apply_plan` 代替常规 `apply`：直接调用底层程序会跳过 Python 管理层的写前采集和写后验收。`apply` 与 `verify` 通过 `.echo-b.lock` 协作锁排斥并行设备操作；不要在运行期间删除锁文件。它不会阻止外部 App 或手工调用底层程序。

## 4. 新建与维护配置

复制已有配置，另取一个版本名，例如 `brand-model-purpose-v1.json`。设备字段描述的是**耳放**，不是耳机；耳机型号、导管、耳套、用途和设计取舍写进 `description` 或配套文档。

下面是格式示例，不代表适合所有耳机的调音推荐：

```json
{
  "version": 1,
  "device": "MOONDROP ECHO-B",
  "name": "示例：轻收中低频 V1",
  "description": "填写耳机型号、佩戴条件、目标和本版变化；听感待验证。",
  "preamp_db": -2,
  "filters": [
    {"type": "peak", "frequency_hz": 180, "q": 0.9, "gain_db": -1}
  ]
}
```

当前配置约束以[编译器源码](../tools/preset.py)为准：

| 字段 | 当前支持 |
| --- | --- |
| `version` | `1`，表示格式版本；音色迭代版本写在文件名中 |
| `device` | 必须是 `MOONDROP ECHO-B` |
| `name` | 非空名称，可用中文 |
| `description` | 用途、条件与说明 |
| `preamp_db` | −60 至 0 dB，可用小数 |
| `filters` | 最多 8 段，空数组表示直通音色 |
| `type` | `peak`、`low_shelf`、`high_shelf` |
| `frequency_hz` | 20–20000 的整数 Hz |
| `gain_db` | −12 至 +12 的整数 dB |
| `q` | 峰值为 0.1–10，量化至 1/256；架式目前要求 `1`，对应固定斜率 S=1 |

不要自行添加 JSON 字段，当前实现拒绝未知字段。滤波器按数组顺序发送；第 9 段保留给全局衰减。换耳机不等于换耳放，不应把 `device` 改为耳机型号。

小幅调整、为有意义的变化另存 `v2`，保留 `v1` 方便对照。已经在设备上验证的预设修改后，不会自动更新设备；需要再次 `apply`。把选择此参数的理由和实际试听结果分别记录，不把设计目标写成实测效果。

## 5. 编译检查通过意味着什么

`build` 生成：

- `preset.json`：配置快照。
- `plan.json`：9 段标签、五采样率系数与响应检查。
- `plan.bin`：56 条固定结构的保存序列。
- `manifest.json`：源文件路径及写入计划 SHA-256。

编译器检查参数、24 位系数范围与量化后稳定性，为 44.1 / 48 / 96 / 192 / 384 kHz 各生成系数，并在 20 Hz–20 kHz 的 601 个频点计算组合增益。控制台输出的峰值**包含全局衰减**。

当前程序不会因为组合响应出现正增益就自动拒绝写入，也不会自动替你计算最合适的全局衰减。需要查看 `plan.json` 中各采样率的 `response_check`，确认增益及量化效果符合预期。低频滤波在高采样率下可能有更大的量化误差；复杂预设宜增加离线检查。

全局衰减目前位于第 9 段，所以最终组合幅度留有余量，不等于已证明前面各级内部不会溢出。编译通过也不等于耳内频响正确、模拟输出无失真、听感更好或拔插后已经保持。

## 6. 写入过程和验收证据

`apply` 的顺序是：

1. 编译预设和本机 USB 工具，建立独立运行目录。
2. 读取 `before-metadata.jsonl` 与 `before-coefficients.jsonl`。采集或校验失败时，在 EQ 写入前停止。
3. 切换自定义模式、写入 9 段标签与五采样率系数，发送保存命令；记录 `write-log.jsonl`。
4. 读取 `after-metadata.jsonl` 与 `after-coefficients.jsonl`，校验模式、标签和当前运行系数。
5. 写出 `verification.json`；校验不一致则报错。

每阶段都在终端打印阶段名，在 `status.json` 原子更新状态，并在 `events.jsonl` 追加过程记录。读取每次尝试保留 `*-attemptN.jsonl` 与 `*-attemptN.stderr.txt`；只有读取和格式校验成功才生成对应的标准 `before-*` / `after-*` 文件。写入程序的诊断另存 `write-stderr.txt`。

“已写入并读回验证”应同时有：

- `write-log.jsonl` 包含编号 0–55 的 56 条成功 ACK，最后一条对应保存操作。
- `verification.json` 中 `metadata_matches`、`mode_matches` 为 `true`。
- `current_coefficients_match_rates` 非空，表示当前读到的系数与计划中的某套匹配。平直 EQ 在多个采样率上系数相同，因此该列表不能总是唯一确定实际采样率。

程序输出 `[complete] 已写入并保存，读回验证通过`，且 `status.json` 的 `status` 为 `saved_verified`，才表示整条流程完成。

| 状态 | 退出码 | 含义与下一步 |
| --- | ---: | --- |
| `saved_verified` | 0 | 保存 ACK 完整且读回匹配 |
| `not_written` | 2 | 写前读取失败，尚未发送 EQ 写入；先修复连接/权限 |
| `write_uncertain` | 3 | 已启动写入，可能部分生效或保存结果未知；检查日志后决定下一步，不自动重写 |
| `saved_unverified` | 4 | 56 条操作及保存已确认，但写后读取/比对未通过；运行 `verify`，不要直接重跑 `apply` |
| `readback_verified` | 0 | 独立 `verify` 的只读复核通过；本次没有保存操作 |
| `readback_failed` | 5 | 独立 `verify` 失败；查看检查目录，设备未被本命令改写 |

参数、编译、历史计划校验、锁冲突等准备阶段错误可能没有完整运行状态记录；用法错误也可能返回 2，所以不能脱离操作类型和状态文件只看数字。进程被强制终止时可能留下 `status: running`，这也不是成功；以最后阶段及日志进一步确认。

**不再用通用退出码推断“没有开始写入”。** `echo_probe` 同时用于写前和写后读取；相同的读取错误必须结合 `stage`、`write_attempted`、`save_command_acknowledged` 和 ACK 日志判断。旧运行目录没有 `status.json` 时，同样要检查写入日志和 `before-*` / `after-*`。

只读重试是有限的：原生探测对 `kIOReturnNotReady` 最多做 20 次 GET_REPORT，间隔 50 ms；耗尽后返回探测器专用退出码 4，管理层才会为该数据类别最多启动 3 次只读采集（退避 0.25 / 0.5 秒，每进程超时 20 秒）。权限不足、断连、坏回包、比对失败不会按暂未就绪重试。原生写入器仅对同一条操作的 ACK 最多轮询 100 次、间隔 10 ms，**不重发写入命令**；管理层也不自动重跑整个写入器，写入进程超时为 120 秒。探测器退出码 4 与顶层 `apply` 退出码 4 含义不同，顶层以状态表为准。

本目录中的 `before-*` 是当前运行状态采集，不是完整闪存备份；不能假定它含有所有内部预设及各采样率原始状态，也不能将其直接传给 `apply`。

## 7. 保存后只读复核与拔插测试

无需修改设备就能在终端查看当前标签或系数：

```sh
make build
bin/echo_probe
bin/echo_probe --coefficients
```

它们输出原始 JSONL，不会自动与某个预设比较。单独保存一次参数标签可用：

```sh
python3 tools/backup_metadata.py
```

该脚本在 `backups/` 新建时间戳目录，**只备份标签，不包含原始滤波系数**。

若保存 ACK 已成功但写后读取失败，或想在手动拔插之后复核，应仅重新读取，不重复 `apply`。现在直接使用 `verify`，不需要手写 Python：

```sh
EQ_RUN="runs/这里替换为实际的时间戳和预设名"
python3 tools/preset.py verify "$EQ_RUN"
```

参数必须是**历史运行目录**，不是预设名或 JSON 文件。程序自动编译工具，校验该目录 `plan.bin` 的 manifest 哈希，并确认 `plan.json` 与二进制一致，然后按原有系数比较，不使用可能已经编辑过的源预设重新计算。

每次复核建立新的 `checks/<UTC时间>/`，其中有独立 `status.json`、事件、读取尝试与 `verification.json`；不会覆盖原始失败记录，也不会将旧运行的失败状态改成“当时成功”。`readback_verified` 只确认本次读到的运行状态与计划一致，不等于本次执行了保存，也不能证明完整闪存内容。

验证插拔持久化时，先成功写入并记下运行目录，手动拔下耳放、等几秒、接回，再执行上面的只读复核。将实际拔插过程、时间及复核目录记入该运行目录的 `persistence-note.md`。校验函数不知道用户是否拔过线，生成的 `physical_unplug_tested` 默认仍为 `false`；不要将单次读回当成自动完成了断电测试。接到另一设备时还需试听或再测相应链路，不能把 Mac 当前采样率验证外推到所有条件。

## 8. 恢复与回退

恢复本仓库最初备份的直通 EQ：

```sh
python3 tools/preset.py apply original-default
```

`original-default` 依据本次 ECHO-B 的初始记录，不是每台设备的通用出厂镜像，不恢复固件或其他设备设置。使用另一台耳放时先建立它自己的初始记录，不能默认本文件就是它的原样。

切回某个曾经使用的预设，可以直接 `apply` 该名称。若预设原件后来被编辑了，要精确重放历史版本，应使用运行目录里保存的 `preset.json`：

```sh
EQ_RUN="runs/这里替换为要恢复的历史运行目录"
python3 tools/preset.py apply "$EQ_RUN/preset.json"
```

这会重新编译并创建一次新运行记录；新目录名称可能以 `preset` 结尾，实际内容看快照和 manifest。若编译器后来改变了算法，要先比较新生成系数与旧 `plan.json`；同一份参数在不同编译器版本下不一定生成字节相同的计划。原始 `before-*.jsonl` 不是可直接重放的预设。

## 9. 常见故障

| 现象 | 检查与下一步 |
| --- | --- |
| Python 参数/字段错误 | 检查整数滤波增益、频率、Q、设备名和未知字段；先 `build`，无需访问耳放 |
| `clang` / `make` 不可用 | 检查 macOS 开发工具，先解决编译；不需要为本仓库安装 Python 第三方包 |
| `Expected one ECHO-B` | 检查连接、数据线与实际型号；确保恰好连接一台支持设备，不能靠改 PID 跳过适配 |
| `Open: 0xe00002e2` 或沙箱拒绝 | 本项目曾因沙箱设备访问限制出现；在允许访问 USB 的终端/执行环境运行，不能直接断定设备不兼容 |
| `GetReport ... 0xe00002d8` | 设备尚未就绪；工具已做有限读取重试。耗尽后看状态：`saved_unverified` 用 `verify`，`not_written` 才是写前失败 |
| `No valid acknowledgement` / `SetReport` 失败 | 可能已部分写入，程序会停止；保留日志、确认设备状态，再决定重新应用已知配置，不能称已自动回滚 |
| `Readback differs from preset` | 查看保存 ACK 和读回文件，排除其他程序改写、状态变化或读取异常；不能忽略错误宣称成功 |
| App 显示的增益与全局衰减不一致 | App 标签不表达第 9 段的全局系数，核对原始系数；App 再保存可能覆盖本工具写入的全局衰减 |
| 拔插后听感不符 | 确认使用设备、播放链路、其他音效和采样率；读回核对计划，不只凭印象判断是否保存 |

工具不会在失败后自动恢复写前状态，也不会自动重试整条写入流程。排障应先区分读取失败、部分写入、保存成功但校验未完成，避免无依据地反复重写。

## 10. 增加耳机、耳放与维护代码

**增加耳机：**在 `headphones/<brand>/<model>/` 新建资料，记录测量系统、样机、导管、耳套、来源与未知条件；未经匹配的测量目标不能跨系统直接相减。然后在 `presets/` 新建带型号的文件，并补充预设索引与试听记录。仍使用 ECHO-B 时，无需改 USB 程序。

**增加耳放：**这是设备适配任务，需要单独确认身份、读取协议、参数/系数格式、保存路径、恢复范围及验证方式；当前 CLI 没有通用设备插件系统。先完成相应实现和验证，再扩展 `device` 字段支持，不能把本机已验证结果当作另一型号兼容证明。

维护代码后可运行离线回归检查：

```sh
make test
make build
git diff --check
```

`make test` 运行 Python 流程回归与原生 C 的故障注入，设备 I/O 均被替换，不访问真实 USB。覆盖暂未就绪恢复/耗尽、权限错误、部分写入、保存后验证失败、只读复核、坏回包和并行操作。测试中出现的模拟错误输出是预期情况。这些测试不证明真实 USB 写入已经通过；基准测试依赖仓库已有配置与早期计划，保留相应文件。涉及 DSP 算法的改动还应比较旧预设生成结果、各采样率误差和峰值，真实设备验证另记到运行记录。

清理或提交时保留 `presets/`、原始测量、来源证据、初始备份和有意义的 `runs/` 记录。`bin/`、`profiles/compiled/`、Python 缓存、下载 APK、本地锁和原子写入的 `*.json.tmp` 由 [`.gitignore`](../.gitignore) 忽略；编译缓存用 `build` 重建，永久设计验证应引用 `runs/` 中的快照。写入记录包含实际参数和本机路径，分享前检查内容。诊断日志和原始二进制没有被统一按扩展名忽略；不要为了清理生成文件删除无法重建的原始采集。

设备协议及历史调查见 [ECHO-B 技术记录](devices/echo-b-investigation.md)，各预设索引见[预设库](../presets/README.md)。
