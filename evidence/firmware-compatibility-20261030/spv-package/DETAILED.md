# SPV 候选升级包、Marigold 字段与格式适配核对

日期：2026-10-30。此子调查完全离线；只读取已有 APK 和已下载包，不执行 APK/固件，不调用 USB 或设备工具，不修改仓库。方法为现有 androguard 的 DEX 反汇编、Python 标准库字节解析和父调查取得的官方网页解析器；此处不宣称获得新的 REA Evidence。

## 结论

1. 官方目录标为 ECHO-B 的 `official-ECHO-B-ota-1.0.0.bin` 是结构完整的 **SPV 原始升级包**，其布局同时被官方 Android SPV 升级路径和官方网页 SPV 解析器明确识别。这比只从 `Marigold` 字串猜型号更有力。
2. 两个 `Marigold` 是语法成立的 USB UTF-16 字符串描述符记录，位于会被 SPV 升级路径原样发送的 CPU 段，**不是段间零填充或文件尾的无效残留**。但是未独立追通此固件运行时的描述符选择/初始化/覆盖代码，因此不能确认插入电脑后一定显示 Marigold，也不能排除共享固件默认字符串、配置覆盖或未使用数据。
3. 没找到可靠的 `35d8:149b` VID/PID 字段或匹配的标准 USB 设备描述符。孤立两字节数值命中不是身份字段证据。
4. ECHO-B 与 BIANCA 目录候选包完全相同。Marigold-reference.fot 外层格式不同，没有原样嵌入 SPV@ magic 或上述字符串；本调查未解码 FOT 外层，不能断言其解码后内容与 raw 包相同或不同。
5. 结合父调查的官方产品配置 `ECHO-B: synopsys / 9 bands` 与 `Marigold: spv / 8 bands`，当前候选包 **不能作为已确认适配本机的固件**。能够证明的是 SPV 包格式和目录/适配疑点，不能证明整个官方目录为何产生该关联，也不能证明实物硬件代际。

## 来源身份

- APK SHA-256：`04756b49acfea523758d86101c96c1824b7b209ae3a8836c07837088e795d2d5`。
- APK classes.dex SHA-256：`532514c94af7aaf8579ff455843b8820a37d7f9a27b1615bc1bbcfa4ee3d94e9`。
- ECHO-B / BIANCA raw 包：442216 bytes，SHA-256 `b68e0cd4a561cb664605f32ebf5d3c3e51f6138482b3bfc97ef9666a42b5acc1`。
- Marigold-reference.fot：683008 bytes，SHA-256 `cc80e106eb9f4c0e0c6928fa158217274281f179409abe5239c49382ebbe4018`。
- FreeDSP-1.1-reference.hid：114720 bytes，SHA-256 `ca0a21cdd1b6ed63255252759595e34a58b472b8d402c37a736527475d8b7859`。

上述已下载包均不是用户实机导出的备份。

## 两条官方解析依据

Android：`UsbDeviceHandler.handleStartSpvUpgrade$lambda$0` 调 `Lns4;->y(String)`，后者读取 FileInputStream 原始内容，再调 `Law0;->c([B)I`。

- `Law0.c` code_off=0x31607c：长度至少4096，offset4必须为0x40565053（`SPV@`）；offset12按0xffffff00掩码比较0x4f414d00。本包进入AMA标签分支，offset20/24是日期/时间指针、offset28是段数，offset32起每段16字节。
- 每段数据由 `Arrays.copyOfRange(file, address & 0xffffff, start+size)` 得到；`spv-parser.asm` 的 bytecode offset0x0154–0x016c。
- `Lns4.y` code_off=0x510360：从该数组逐段读取，address、length作为控制参数，再以256字节块发送。`spv-start.asm` bytecode offsets0x0128–0x024a。所选解析和发送准备代码未覆写包内描述符字节。未运行此方法；其中握手、写入和重启均只作静态阅读。

官方网页：父调查保存的 `official-spv-parser.js.txt`，class `cj` 同样检查SPV@ magic，按AMA标签解析16字节记录，并以 `address & 0xffffff` 取段数据。它还明确将offset20/24解释为buildDateAddress/buildTimeAddress。该来源提供了第二条独立的同厂解析证据；URL及下载清单由父调查保留。

## 头部与实际段

| 文件偏移 | 意义 | 值 |
| --- | --- | --- |
| 0x04 | SPV APP magic | 0x40565053 / SPV@ |
| 0x08 | 官方JS命名 encryptAddress | 0x48001000 |
| 0x0c | userFlag | 0x4f414d41 / AMAO字节；掩码后匹配AMA标签分支 |
| 0x10 | 官方JS命名 encryptSize | 0xa000 |
| 0x14 | buildDateAddress | 0x4800b724 → `Aug 23 2024` |
| 0x18 | buildTimeAddress | 0x4800b730 → `14:11:15` |
| 0x1c | numberOfBinFiles | 4 |

日期/时间是固件自身构建标记，不等于服务端上传或发布日。`encryptAddress/encryptSize` 是官方解析器字段名，未据此声称已经验证加密算法或加密覆盖范围。

| 记录偏移 | 名称 | address | 文件范围（右端不含） | size | checksum |
| --- | --- | --- | --- | --- | --- |
| 0x20 | CPU | 0x48000000 | [0,0x17b30) | 97072 | 0x00849d4d |
| 0x30 | MOD | 0x48040000 | [0x40000,0x6bf68) | 180072 | 0x015500c2 |
| 0x40 | PBK | 0x4806c000 | size=0，不发送 | 0 | 0 |
| 0x50 | EXT | 0x4806c000 | size=0，不发送 | 0 | 0 |

CPU至MOD之间 `[0x17b30,0x40000)` 为165072字节全零。MOD尾端恰好等于总文件大小0x6bf68。

观察到两项简单加法校验完全匹配：

- CPU段所有字节之和为0x849ebb，减去自身checksum字段0x2c..0x2f四字节之和0x16e，得到0x849d4d。
- MOD段所有字节之和直接等于0x15500c2。

这是对原包的可复算结构一致性观察，不是密码学签名验证，也不是适配/可刷回证明。官方所选SPV Java解析器读取后没有使用checksum字段作比较；网页解析器记录checksum并另算全文件CRC32供显示，不能据此推定设备端如何校验。

## Marigold 字段是否有效

| 描述符起点 | 文字起点 | 原始长度/type | 文字 | 所在传输段 |
| --- | --- | --- | --- | --- |
| 0x11110 | 0x11112 | 12 03 | Marigold | CPU |
| 0x11154 | 0x11156 | 1e 03 | 00000000000822 | CPU |
| 0x11198 | 0x1119a | 12 03 | Marigold | CPU |
| 0x111dc | 0x111de | 12 03 | MOONDROP | CPU |

`12 03`表示长度18、类型3，恰好容纳Marigold/MOONDROP的8个UTF-16LE字符。排列形式、序列号式文本与语言描述符附近数据进一步支持这是USB字符串配置记录。它们确实包含在校验成立的CPU段中，且主机SPV升级准备代码原样拷贝/发送；但本调查没有足够的固件端引用关系来证明运行时一定选择这些记录，不能将“位于传输段”写成“设备一定使用该名称”。

未识别到符合严格标准USB设备描述符候选筛选（length18,type1,有效bcdUSB/maxpacket/configcount）的记录。因此不能可靠提取本包实际VID/PID。目标VID的LE字节d835有一个孤立命中，目标PID的LE字节9b14有两个孤立命中，位于MOD内容而非已确认的身份结构；相邻d8359b14无命中。此负面检索也不排除身份由代码、ROM、压缩区或外部参数构造。

## 参考包比较边界

- ECHO-B候选与BIANCA候选SHA相同，字节完全一致。这可能是共享默认包、目录关联错误或其他原因；只凭二者相同不能选定原因。
- Marigold-reference.fot：开头`POT\0`（504f5400），word@4为683000，恰好为文件长度减8，offset0x10见`QUEN`。未见原样SPV@、Marigold UTF16或MOONDROP UTF16。没有执行或解码该外层，因此不能认定内部一定不是SPV，也不能比较其内部USB配置或硬件ID。
- FreeDSP HID参考包：开头以32位字段保存0x35d8/0x1496，offset0xc有`EFSC`。它与raw SPV包的结构明显不同，**但该包的PID为1496，不是本机149b**，同代协议参考不能当作本机固件替代品。

## 可复跑

标准库字节解析（不安装依赖）：

```sh
python3 inspect_spv_candidate.py /absolute/path/official-ECHO-B-ota-1.0.0.bin /absolute/path/BIANCA-catalog-candidate.bin /absolute/path/Marigold-reference.fot /absolute/path/FreeDSP-1.1-reference.hid --output package-analysis.json
```

用现有androguard提取官方APK指定方法；脚本只解码DEX，不执行其中代码：

```sh
PYTHONPATH=/private/tmp/echo-official-eq-python /Users/zane/.local/share/uv/python/cpython-3.12.12-macos-aarch64-none/bin/python3.12 extract_apk_spv.py /absolute/path/moondrop-android-release.apk /absolute/output/directory
```

产物：`package-analysis.json`、`spv-parser.asm`、`spv-start.asm`、`spv-handler.asm`、`apk-identity.json`和官方JS摘录身份文件。
