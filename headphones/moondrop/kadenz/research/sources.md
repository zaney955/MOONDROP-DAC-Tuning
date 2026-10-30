# Kadenz 调音研究：外部一手证据

本文件为频响分析和 EQ 指南提供产品事实与方法依据，不评价用户这副耳机的实测表现。下列“项目推论”是把来源应用到本项目后的判断，不能当作来源对 Kadenz 的直接结论。

## 1. 产品结构及导管：能确认什么

官方列明 Kadenz 使用 10 mm ULT-Gen2 单动圈、TAC 镀层复合振膜、可更换导管；附件包括普通耳套和清泉套，均有三种尺寸。标称灵敏度为 122 dB/Vrms（1 kHz），阻抗为 35 Ω ±15%（1 kHz），THD 指标仅给出 1 kHz、94 dB 条件。这些是厂家规格，不是本项目独立测量。[MOONDROP 英文产品页](https://moondroplab.com/en/products/kadenz)

同一官方中文页的特点段写“双规格导管”，附件段写“可换导管（ABC）”；英文页也同时出现 Two Nozzles 与 ABC。**资料本身存在措辞不一致，不能据此建立 A/B/C 的长度、默认型号或音色排序。** 说明书正文没有可核验的本地副本，不能用它消除这一不确定性。[MOONDROP 中文产品页](https://moondroplab.com/cn-products/kadenz)

官方说明书链接如下；正文不作为已核验依据：

- [中文说明书](https://cdn.prod.website-files.com/627128d862c9a44234848dda/674542ab43c879414ec56375_%E7%BB%88%E7%AB%A0%E8%AF%B4%E6%98%8E%E4%B9%A6%EF%BC%88%E4%B8%AD%E6%96%87%E7%AB%96%E7%89%88%EF%BC%89.pdf)
- [英文说明书](https://cdn.prod.website-files.com/627128d862c9a44234848dda/6745429cf29e218d179a9620_%E7%BB%88%E7%AB%A0%E8%AF%B4%E6%98%8E%E4%B9%A6%EF%BC%88%E8%8B%B1%E6%96%87%E7%AB%96%E7%89%88%EF%BC%89.pdf)

项目推论：实际使用的导管与耳套应记录为每份听感记录的条件。不能用“钻石镀层”“单动圈”推导高频必定锐利、低频必定快，或用单点 THD 宣称全频段任意 EQ 都无失真。

## 2. 为什么 5128 与 4128 不能直接相减做 EQ

B&K 解释，4128 的圆柱形耳道不适合真实地安装某些入耳设备，传统 IEC 711 耦合器也不是为全可听频段设计；5128 使用接近人体的耳廓、耳道与鼓膜模拟器，目标是模拟平均人耳在全频段的声学负载。这支持把两系统看成不同的测量条件，而非只有一个固定电平差。[B&K：High-frequency HATS, why?](https://www.bksv.com/de/knowledge/blog/sound/high-frequency-hats)

项目推论：对两套 Kadenz 曲线做 500 Hz 对齐有助于比较轮廓，但不是校准两个测量系统。二者的差值混合了测量架、装配、样机及其他条件；不能称为“应补偿的耳机误差”。5128 更接近平均耳，也不等于用户本人的耳道。

## 3. 佩戴、密封及高频峰谷

GRAS 的原始白皮书明确指出，入耳耳机的插入深度和密封可使重复安装的高、低频响应发生变化；耳道有效长度改变会使高频共振移动。这是测量设备厂商对其测试装置和安装问题的解释，不是 Kadenz 专属测试。[GRAS 白皮书，In-Ear Testing，PDF 第 8 页](https://www.grasacoustics.com/fileadmin-gras/Industries/Audiology/Ear_simulators___couplers/43BB_Whitepaper.pdf)

更新的 GRAS 研究说明还讨论了耳道容积、泄漏及位置对耳内声压场的影响。平均耳几何不可能消除个人差异。[GRAS：The Impact of Ear Canal Geometry on In-Ear Headphone Testing](https://www.grasacoustics.com/fileadmin-gras/Industries/Consumer_Audio___Electronics/GRAS_Ear_Canal_WP-2024-10__1_.pdf)

项目推论：低频忽多忽少时先检查密封；高频刺点随重新佩戴而移动时，先检查位置。对于未注明安装条件的曲线，不宜用高 Q、大增益去补每个窄谷。也不能宣布“8 kHz 的峰一定是假峰”或“10 kHz 以上完全无效”；应把具体峰谷的位置和个人适用性标为较低置信度。

## 4. 目标曲线与个人口味

Sean Olive 的研究综述将受控听音中的偏好与频响联系起来，也报告了不同低频偏好人群。研究支持以目标曲线作为起点，同时保留个人调节，不能把群体偏好等同于每个人必须遵守的标准。综述并非 Kadenz 研究；其中部分分群结果来自头戴耳机，不能直接当作本款 IEM 用户的概率。[作者对研究的介绍及论文入口](https://seanolive.blogspot.com/2022/03/the-perception-and-measurement-of.html?m=1)

AutoEq 作者文档解释了测量减去目标得到误差曲线的基本方法；同时强调个体耳形、单元差异、位置和密封造成不确定性，所以算法对高频加大平滑、避免过于尖锐的修正。作者也建议个性化调整低频及高频整体量感，而不是逐点追踪最高频。[AutoEq 作者：How Does AutoEq Work?](https://github.com/jaakkopasanen/AutoEq/wiki/How-Does-AutoEq-Work%3F/4a1e9ad7f858e4601e3482bad7324bf1ad9b3624)

项目推论：在引入目标文件前，必须记录目标的测量系统、版本、归一化方法；不要把 711 或头戴目标直接覆盖 5128 的入耳数据。原始耳模拟器曲线也不应强拉成水平直线。没有同系统目标时，可先围绕用户明确反馈进行少量宽带调整。

## 5. 对照试听应控制音量和条件

Headphones.com 的测量者在第一人称工作流介绍中说明了用于比较耳机的独立音量匹配，以及用于源设备的同步切换和匹配。这是其方法记录，并非对本项目的验证，也不规定一套通用的精确响度匹配算法。[测量者自己的设备与评测流程](https://headphones.com/blogs/features/our-headphone-review-gear-review-process)

项目建议：比较预设时使用同一首歌同一片段、同一导管耳套与佩戴，并先尽量匹配主观整体响度。比较应尽量缩短切换间隔，重复顺序，避免把“更响”误认为“更清楚”。这属于依据控制变量原则设计的实用流程，不声称是完成了正式双盲实验。耳放的逐次永久写入耗时，不适合把几十次闪存写入当成快速 AB 工具。

## 6. 尚未建立的证据

缺少足以独立核实安装条件的 Kadenz 第三方原始测量，因此不把二手评分、聚合网站的“暖/亮/解析”等标签纳入结论。官方产品页不能证明所给 5128/4128 文件对应哪个导管、耳套或 ECHO-B 模式。用户这副耳机的左右差异、个人耳道内响应、实际失真和插拔后 EQ 持久化也不由上述来源证明。
