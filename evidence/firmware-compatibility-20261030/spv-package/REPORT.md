# SPV候选包离线核对结论

2026-10-30。只读已有文件，未执行APK/固件或访问USB；未修改仓库。

- ECHO-B目录候选与BIANCA候选完全相同：442216 bytes，SHA256 `b68e0cd4a561cb664605f32ebf5d3c3e51f6138482b3bfc97ef9666a42b5acc1`。
- 官方APK `Law0.c`（code_off=0x31607c，由SPV升级方法`Lns4.y`调用）与官方网页class `cj`均明确识别该包：offset4=SPV@，AMA标签分支，16字节段记录，payload位置=address &0xffffff。这是SPV格式的直接依据。
- 构建标记：offset0x14指针0x4800b724→`Aug 23 2024`；offset0x18指针0x4800b730→`14:11:15`。这不是服务端发布日。
- CPU段：addr0x48000000，文件[0,0x17b30)，97072B；MOD段：addr0x48040000，文件[0x40000,0x6bf68)，180072B；PBK/EXT size0。CPU后至MOD前165072B全零。
- CPU声明checksum0x849d4d=段byte_sum减去自身checksum四字节之和；MOD声明checksum0x15500c2=段byte_sum。两项相符，仅证明简单结构校验一致，非签名或适配保证。
- USB风格UTF16描述符：Marigold位于descriptor起点0x11110和0x11198；MOONDROP位于0x111dc；serial式字符串`00000000000822`位于0x11154。它们都在会被发送的CPU段，不在填充区。主机SPV parser/updater所选代码原样拷贝并发送，无包内字符串覆写。
- **未追通固件运行时描述符选择或外部配置覆盖**，所以不能声称设备必定显示Marigold，也不能排除默认/未用字段。**未找到可靠35d8:149b VID/PID字段或匹配的标准USB设备描述符**；孤立两字节命中不足以定位身份。
- Marigold-reference.fot外层以POT\0开头，未见原样SPV@/Marigold/MOONDROP；未解码外层，不能声称其内部格式或身份与候选同/不同。
- FreeDSP参考HID以32位0x35d8/0x1496字段及EFSC头开头，结构与raw SPV不同，但PID1496不能代替本机149b固件。
- 结合父调查官方配置ECHO-B=synopsys/9band、Marigold=spv/8band，候选不能确认为本机适配固件；**后台关联究竟为错挂、共享默认包或硬件版本原因仍未知**。

可复跑脚本：`inspect_spv_candidate.py`（纯标准库，输出package-analysis.json）；`extract_apk_spv.py`（使用现有androguard，提取指定DEX方法，不执行APK）。完整偏移与边界在`DETAILED.md`，源方法在`spv-parser.asm`、`spv-start.asm`、`spv-handler.asm`，第二主源摘录在`official-spv-parser.js.txt`。
