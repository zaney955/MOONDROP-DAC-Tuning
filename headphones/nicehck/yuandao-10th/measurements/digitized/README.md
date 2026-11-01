# 官方频响图的 CSV 数字化估算

[下载／打开 CSV](official-unfoamed-5128-image-estimate.csv)：825 行，约 20.12–19806.14 Hz，UTF-8、逗号分隔。

**这些值从官方发布的 JPG 曲线提取，不是厂商原始测量数据。** 对应原图条件为原道十周年、3.5 mm 无麦、无海绵、B&K 5128 HATS；不能作为全包海绵或个人耳内的实测响应。

| 列名 | 含义 |
| --- | --- |
| `frequency_hz` | 由图像横坐标和对数频率轴估算的频率，Hz |
| `graph_level_estimate_db` | 从原图纵轴读出的曲线数值，dB；原图未注明测试电平，不能当作实际听音声压 |
| `relative_to_1khz_estimate_db` | 减去 1 kHz 图示估算值后的相对频响，dB；仅平移基准，不是目标曲线补偿 |

原图 960×889 像素。按可见刻度拟合对数频率轴与线性纵轴，以每个像素列中紫色曲线的中位 y 值作为中心。没有平滑、目标拟合或补画边缘；所以不强行补出 20 Hz 与 20 kHz 端点。1 kHz 基准在相邻提取点之间按对数频率插值，约为图示 96.79 dB。

保留两位小数只为计算便利，不代表 0.01 dB 精度。一个纵向像素约 0.12 dB，线条厚度、JPEG 色彩与人工选取刻度还会引入误差；未建立统计误差界限，声学测量误差也未知。不要将该文件用于精细逐点反向校正。

- [原图](../raw/06_15b37029-c621-4a3d-bb60-f66028fc9bbb.jpg)
- [来源、坐标标定、算法与 SHA-256](../provenance/official-curve-digitization-20261101.json)
- [提取脚本](digitize_official_curve.py)：Python 标准库＋macOS `sips`；离线运行，不访问设备。
- [调研报告](../../research/frequency-response-20261101.md)

复现命令（仓库根目录；重建本目录 CSV 和对应数字化记录）：

```sh
python3 headphones/nicehck/yuandao-10th/measurements/digitized/digitize_official_curve.py
```

## 叠加检查

[官方原图与 CSV 叠加对比](overlay/README.md)：825 个点均位于原图线条范围内，形状吻合；附 PNG 与像素误差记录。
