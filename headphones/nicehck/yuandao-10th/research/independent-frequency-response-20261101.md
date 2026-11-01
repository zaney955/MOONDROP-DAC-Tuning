# 原道十周年：独立频响来源核查

核查日期：2026-11-01。对象限定为 NICEHCK / YUANDAO 十周年纪念版，优先寻找 3.5 mm＋全包海绵条件下的声学频率响应。原道一／二／三代、原道 Small、潜25十周年，以及 Type-C 的 EQ 曲线均不自动视为同一对象。

本轮没有取得可核对的独立全包海绵频响图片或原始数值数据。这是本轮检索与访问结果，不表示网上不存在。现有官方无海绵曲线继续保存在[耳机档案](../README.md)及 `measurements/raw/`；本文件不把主观听感、预设响应、厂商图片的转载或估算曲线计为新增测量。

## 已确认的独立测试线索

### 油兔几：原道 十周年 详细测试

- [作者视频页面](https://www.bilibili.com/video/BV1d7XCB5EHP/)／[可读取的作者列表页面](https://www.bilibili.com/list/91885?bvid=BV1d7XCB5EHP&oid=116324172829893)。页面显示作者油兔几，发布时间 2026-04-01 18:00:00，主题包含频响曲线和平头横评。
- 本轮确实读取到标题、作者、日期与简介；直接视频页面抓取返回 HTTP 412，公开元数据接口 `https://api.bilibili.com/x/web-interface/view?bvid=BV1d7XCB5EHP` 的直接请求也返回 HTTP 412。
- 没有取得视频内测量画面、曲线时间码或数值文件，因而不能确认其中的插头版本、海绵、夹具、左右声道、摆位次数与平滑设置。页面标题只能证明测试内容的线索，不能用来编造具体曲线或结论。访问失败不证明作者未提供这些内容。[来源](https://www.bilibili.com/list/91885?bvid=BV1d7XCB5EHP&oid=116324172829893)

### Squiglink 检索

本轮使用 `site:squig.link "Yuandao"`、`site:squig.link "NiceHCK" "10th"`、`site:squig.link "Anniversary" "NiceHCK"` 等精确检索，没有定位到可确认型号的十周年测量条目。搜索出现的 [TheAudioStore 数据库](https://theaudiostore.squig.link/)摘录列有 NiceHCK DB2 和其他品牌的 10th Anniversary，不能把这两个字段拼接成原道十周年。搜索索引覆盖有限；本轮没有遍历所有 Squiglink 站点，不能表述为“Squiglink 没有这款耳机”。

## 已核对并排除为独立实测的材料

| 来源 | 本轮实际读到的内容 | 证据用途与限制 |
| --- | --- | --- |
| [はむはむ的十周年评测](https://hamuchan777.hatenablog.com/entry/nicehck-10th-anniversary-edition-yuandao-review) | 音质段明确称图为厂商提供的频率特性，图注为 3.5 mm 无麦、无海绵 | 属于官方图再发布，不增加一份独立测量；作者对曲线的读图不是新的数值数据 |
| [HiFijuegos 的 Type-C DSP 试听](https://www.reddit.com/r/FlatheadEarbuds/comments/1t4g6bx/nicehck_10th_anniversary_dsp_without_peq_there_is/) | 作者说明评测 Type-C DSP，比较其与 3.5 mm，并介绍个人 PEQ；文末披露厂商赠样 | 个人试听与 EQ 使用经验，不能据此量化两版本差异，也不能把 App PEQ 显示当声学实测 |
| [没昵称好用啊的 Bilibili 评测](https://www.bilibili.com/opus/1177444805812158502) | 作者明确为红色 3.5 mm 无麦版本，主要是开箱、规格与听感 | 可确认样机版本；本轮页面未提供可核对的独立频响数值、仪器与测量条件 |
| [TheTuningChoice 产品页](https://www.thetuningchoice.in/product/nicehck-yuandao-10th-anniversary-flat-head-3-5mm-flat-head-blue-3-5mm) | 搜索缓存明确标为依据驱动类型及调音家族的估算、非实验室测量；直接页面抓取 cache miss | 不能保存为测量数据或借其导出 EQ 声称测量校正；记录此项是防止误用搜索命中的“曲线” |
| [TOPPING 预设云](https://home.toppingaudio.com/peqs) | 搜索缓存显示 DRYX 于 2026-07-06 发布“原道十周年提升方案”，说明“参考油兔几”；直接页面停留在预设加载状态 | 社区 EQ 线索，不是作者原始曲线；本轮未取得参数，也未确认其对油兔几视频的准确转录 |

[近期平头比较帖](https://www.reddit.com/r/FlatheadEarbuds/comments/1xgkfeg/trying_budget_flathead_earbuds_part_1/)虽然提到 NiceHCK 十周年和海绵，却是作者的主观比较；文内 Squiglink 链接指向 Tanchjim Kasier 插入深度对比，不是十周年曲线，因此没有把它当作全包海绵测量。

## 后续可接续的具体工作

最有价值的待补项是油兔几视频中的原始测量画面及其测量条件，随后才是原始 TXT/CSV。取得图片时应同时记录视频时间码、曲线图例、海绵状态、插头版本与测试夹具；仅从曲线截图提取像素点时要标为“图像数字化估计”，不能称为作者原始测量数据。

在这组证据补齐以前，官方无海绵图只支持其明确标注条件下的定性读图，不支持为用户的全包海绵佩戴计算精确补偿。本轮未改动调音预设、未访问或写入设备。
