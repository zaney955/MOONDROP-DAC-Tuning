# 官方 Android Eq2Coeff 入参、缩放与公式路径

静态分析日期：2026-10-30。本文没有执行 Android App，也没有设备操作；原生计算库的实际执行与输出比较由独立调查记录负责。

## 来源身份

- APK：`evidence/moondrop-android-release.apk`，来源 `https://download.moondroplab.com/moondroplink/android-release.apk`；SHA-256 `04756b49acfea523758d86101c96c1824b7b209ae3a8836c07837088e795d2d5`。
- 原始二进制 `AndroidManifest.xml`：包名 `com.moondroplab.moondrop.moondrop_app`，versionName `2.25.0c-260813ai`，versionCode `102034`，minSdk 28、targetSdk 37。版本值直接解析自该 APK 的 AXML 属性，不依赖网页版本列表。
- 原生库：`evidence/android-arm64/libcxaudiodsplib_embca_jni.so`；SHA-256 `702b5facf4f741b34cc4acee4e9ab5f5b7d803fcd13a0ed6717949b4d9a5f277`。
- DEX 字段、方法和编码常量可查 [库存](dex-command-constants.json)，写入调用可查 [原始反汇编](official-dex-protocol.asm)。本报告仅对应该 APK 哈希，不声称是所有 App 版本的统一行为。

## Java → JNI 入口

`classes.dex` 的 `Eq2Coeff.<clinit>` code item 位于 `0x59a92c`：加载 `cxaudiodsplib_embca_jni`，再调用 static `native_init()`。

`Eq2Coeff.CxAudioConvertEqParams2Coeffs` code item 位于 `0x59a8bc`：创建输出 `CX2070xBandEQCoeffs`，调用 static native `native_cxaudio_convert_eqparams_2_coeffs(fs, input, output, bitDepth)`，签名 `(ILjava/lang/Object;Ljava/lang/Object;I)I`。返回码 0 时返回输出对象，非零时返回 null。

实时 Freeman3 路径见 `official-dex-protocol.asm:243–277`；保存路径见同文件 `1053–1092`：

| 参数 | 官方 Java 处理 |
| --- | --- |
| filterType | 直接赋给 `EQBandParam.flags` |
| frequency | 整数 Hz 直接赋给 `Freq_Hz` |
| gain | `int(gain × 256.0)` 赋给 `Gain_dB` |
| Q | `int(qFactor × 256.0)` 赋给 `Qfactor` |
| bitDepth | 24 |

DEX 是 `double-to-int`，因此向零截断，不是四舍五入。当前工具采用 `round(Q × 256) / 256`，例如界面 Q=0.8 时，官方输入为 204/256，本工具输入为 205/256。

`FREQ_SAMPLE_RATE` 的初始化绑定在 `CnxtUsbConstants.<clinit>` code item `0x5a71e0` 的 code-unit 126；4…8 下标为 44100、48000、96000、192000、384000。实时路径可优先使用当前设备采样率下标，保存路径循环 4…8。

滤波类型编码由 `EQBandParam` 的 DEX static encoded values 确认：峰值 0、低架 1、高架 2、低通 3、高通 4、未知 15。

## 原生输入与输出布局

`convertEQParamFromJni` 位于库虚拟地址 `0x2194`；通过 JNI 字段名确认紧凑输入布局为 8 字节：

| offset | 字段 | 解释 |
| ---: | --- | --- |
| 0 | flags | uint16；低 4 位为滤波类型 |
| 2 | Freq_Hz | uint16 Hz |
| 4 | Qfactor | uint16，Q × 256 |
| 6 | Gain_dB | 16 位有符号数，dB × 256 |

原生计算函数 `_Z29CxAudioConvertEqParams2CoeffsjP17EQ_BAND_PARAM_TAGP23_CX207xx_BAND_EQ_COEFFSi` 位于 `0x2abc`，调用参数依次为采样率、输入结构指针、输出结构指针、位宽。

`init_coeffs_res` 位于 `0x2064`、`convertCoeffsToJni` 位于 `0x255c`，通过字段名字符串确认输出结构：`B0@0`、`B1@4`、`B2@8`、`A0@12`、`A1@16` 均为 int32，`Gain@20` 为 byte；应分配至少 24 字节。A0/A1 对应存储的反馈系数，不能仅凭字段名按普通六系数 a0/a1 解释。

## Gain 不是固定 Q22

`CxAudioConvertEqParams2Coeffs` 的 `0x2bc8` 将 `EqDesignFx.gain + 2` 写入输出 Gain。`EqFxToFloat@0x3800` 和 `BandFxToFloat@0x37a8` 用 `2^(bitDepth−1−Fx.gain)` 还原系数。

因此在 24 位模式中，归一化的五个存储系数为：

```text
signedCoefficient / 2^(25 − output.Gain)
```

Gain=3 对应 Q22；Gain=4 对应 Q21；Gain=5 对应 Q20。官方 `EqDesignFx@0x3510` 根据系数幅度动态选择缩放，不应将所有官方输出都固定除以 2^22，也不能只比较整数原值便认定频响不同。

## 原生滤波公式的关键差异

以下为 AArch64 指令和常量的静态推导，需结合实际计算输出验证：

- 核心设计函数位于 `0x31b0`。增益因子 `A = pow(10^(1/40), gainDb)`，库常量 `0x15c0 = 1.0592537251772889`。
- 峰值分支 `0x3330–0x3378` 将 Q 先换为 octave bandwidth：`BW = float32((2/ln(2)) × asinh(1/(2Q)))`，再用 `alpha = sin(w) × sinh((ln(2)/2) × BW × w/sin(w))`。常量 `0x1580 = 2/ln(2)`、`0x1578 = ln(2)/2`。这不是本工具直接使用的 `sin(w)/(2Q)`；高频时差别会放大。
- 非峰值路径 `0x3238–0x3240` 使用 `alpha = sin(w)/(2Q)`；架式分支以 `2×sqrt(A)×alpha` 构造转折。当前工具固定 S=1，转折项为 `sqrt(2A)×sin(w)`。因此工具的架式 Q=1 标签不能与官方 Q=1 直接视为同一种斜率；该形式更接近官方 Q=1/sqrt(2)，但官方还有 1/256 的输入量化。
- 原生核心先生成 float32 系数，再由 `EqDesignFx` 量化为动态缩放的固定点。当前工具主要以 Python double 计算，再固定 Q22 舍入，低位差别也可能来自这条精度路径。

本报告不证明相同 App 界面数值必然由哪个 Flutter UI 控件产生；它确认的是保存/实时 Java 入口传入 native 的行为和对应库的实现路径。
