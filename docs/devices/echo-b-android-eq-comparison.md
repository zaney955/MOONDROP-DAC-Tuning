# ECHO-B 官方 Android App 算法兼容性

本工具采用标准 RBJ 峰值 Q / 架式 S=1 语义。相同的类型、频率、Q 和增益，不保证与官方 App 得到相同系数或频响。

## 参数与编码差异

| 项目 | 本工具 | 官方计算库 |
| --- | --- | --- |
| 峰值 Q | 直接使用 `sin(w)/(2Q)` | Q 转为 octave bandwidth，再使用包含 `w/sin(w)` 的带宽公式 |
| 架式 | 固定 S=1 | Q 型架式；Q=1 不等于 S=1 |
| Q 量化 | 四舍五入至 1/256 | 向零截断至 1/256 |
| 系数精度 | Python double 后量化 | float32 后量化 |
| 系数缩放 | 固定 Gain=3 / Q22 | 动态 Gain；24 位模式的还原尺度为 `2^(25−Gain)` |

Q=0.8 分别量化为 205/256 和 204/256。即使有效 Q 相同，峰值带宽公式的差异也会在高频放大。原始整数系数不同不一定表示频响不同，比较前必须考虑 Gain 缩放。

当前读回解析器只接受 Gain=3。官方写入 Gain=4 等系数时，解析器会拒绝读取；这不是设备不支持该编码的证明。

## 定量参考

以下为 48 kHz 下同参数的计算频响差异，最大值取自 20 Hz–20 kHz。数值不是模拟回录测量。

| 输入参数 | 最大曲线差 / dB |
| --- | ---: |
| 峰值，1 kHz，Q=1，+3 dB | 0.00457 |
| 峰值，10 kHz，Q=1，+6 dB | 0.96037 |
| 峰值，20 kHz，Q=1，+6 dB | 5.04423 |
| 低架，1 kHz，Q=1，−6 dB | 1.13645 |
| 高架，1 kHz，Q=1，−6 dB | 1.13647 |

峰值中心都接近标称增益，也可能具有不同宽度；架式的转折形状也可能不同。高架 1 kHz、Q=1、+3 dB 可由官方动态 Gain=4 编码，而本工具的固定 Q22 系数会溢出。

## 适用范围与依据

官方库对应 APK `2.25.0c-260813ai`（versionCode 102034），SHA-256 为 `04756b49acfea523758d86101c96c1824b7b209ae3a8836c07837088e795d2d5`，来源为[官方 Android 下载](https://download.moondroplab.com/moondroplink/android-release.apk)。其他版本需要按实际二进制核对。

参考结果包含五种采样率的 1355 个样本，1300 个两边均有效。比较采用官方 ARM64 函数的模拟执行，外部 libm 调用桥接主机数学函数；不能保证物理 Android 上 Bionic libm 的每个末位相同，也不等同于 Android UI 抓包或模拟输出测量。

- [逐例系数、计算频响与来源哈希](../../evidence/android-eq-comparison-20261030/comparison.json)
- [CSV](../../evidence/android-eq-comparison-20261030/comparison.csv)与[校验结果](../../evidence/android-eq-comparison-20261030/verification.json)
- [Java / JNI 结构与公式路径](../../evidence/android-eq-path-notes.md)及[原生反汇编](../../evidence/android-eq-comparison-20261030/native-converter.asm)

## 复算工具

正常预设编译和 `make test` 不依赖模拟器。独立 Python 环境的依赖见[分析依赖](../../tools/requirements-android-eq.txt)，程序见[模拟执行器](../../tools/android_eq_oracle.py)与[对比程序](../../tools/compare_android_eq.py)。使用匹配哈希的 APK 和库，在仓库根目录指定一个尚不存在的目录：

```sh
python3 tools/compare_android_eq.py /tmp/echo-android-eq-comparison
```

运行环境须允许 Unicorn 缓存初始化。分析工具不访问 USB。
