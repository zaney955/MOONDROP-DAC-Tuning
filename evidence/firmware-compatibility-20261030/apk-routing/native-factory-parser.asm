
evidence/android-arm64/libCxAudioHidLib.so:	file format elf64-littleaarch64

Disassembly of section .text:

00000000000196c8 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS>:
   196c8: d10683ff     	sub	sp, sp, #0x1a0
   196cc: f900bbfc     	str	x28, [sp, #0x170]
   196d0: a9184ff4     	stp	x20, x19, [sp, #0x180]
   196d4: a9197bfd     	stp	x29, x30, [sp, #0x190]
   196d8: 910643fd     	add	x29, sp, #0x190
   196dc: d53bd054     	mrs	x20, TPIDR_EL0
   196e0: f9401688     	ldr	x8, [x20, #0x28]
   196e4: 2a0103f3     	mov	w19, w1
   196e8: 910023e0     	add	x0, sp, #0x8
   196ec: 321b07e2     	orr	w2, wzr, #0x60
   196f0: 2a1f03e1     	mov	w1, wzr
   196f4: f81d83a8     	stur	x8, [x29, #-0x28]
   196f8: 97ffea96     	bl	0x14150 <memset@plt>
   196fc: 12800008     	mov	w8, #-0x1               // =-1
   19700: 910023e0     	add	x0, sp, #0x8
   19704: 2a1303e1     	mov	w1, w19
   19708: b9000be8     	str	w8, [sp, #0x8]
   1970c: 97ffe9e5     	bl	0x13ea0 <_Z35CxAudioHidLibUSBConnetDevForAndroidP13_HID_DEV_INFOi@plt>
   19710: 36000700     	tbz	w0, #0x0, 0x197f0 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x128>
   19714: 52800520     	mov	w0, #0x29               // =41
   19718: 9101a3e1     	add	x1, sp, #0x68
   1971c: 321f1be2     	orr	w2, wzr, #0xfe
   19720: 97ffe8fc     	bl	0x13b10 <_Z30CxAudioHidLibUSBGetIndexStringiPci@plt>
   19724: 37f806e0     	tbnz	w0, #0x1f, 0x19800 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x138>
   19728: d0000173     	adrp	x19, 0x47000 <_ZTV18CxAudioHidDev2089x+0x198>
   1972c: f947de73     	ldr	x19, [x19, #0xfb8]
   19730: 9101a3e0     	add	x0, sp, #0x68
   19734: f9401261     	ldr	x1, [x19, #0x20]
   19738: b9402a62     	ldr	w2, [x19, #0x28]
   1973c: 97ffe8ad     	bl	0x139f0 <strncmp@plt>
   19740: 340006e0     	cbz	w0, 0x1981c <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x154>
   19744: f9402a61     	ldr	x1, [x19, #0x50]
   19748: b9405a62     	ldr	w2, [x19, #0x58]
   1974c: 9101a3e0     	add	x0, sp, #0x68
   19750: 97ffe8a8     	bl	0x139f0 <strncmp@plt>
   19754: 340006a0     	cbz	w0, 0x19828 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x160>
   19758: f9404261     	ldr	x1, [x19, #0x80]
   1975c: b9408a62     	ldr	w2, [x19, #0x88]
   19760: 9101a3e0     	add	x0, sp, #0x68
   19764: 97ffe8a3     	bl	0x139f0 <strncmp@plt>
   19768: 34000660     	cbz	w0, 0x19834 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x16c>
   1976c: f9405a61     	ldr	x1, [x19, #0xb0]
   19770: b940ba62     	ldr	w2, [x19, #0xb8]
   19774: 9101a3e0     	add	x0, sp, #0x68
   19778: 97ffe89e     	bl	0x139f0 <strncmp@plt>
   1977c: 34000620     	cbz	w0, 0x19840 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x178>
   19780: f9407261     	ldr	x1, [x19, #0xe0]
   19784: b940ea62     	ldr	w2, [x19, #0xe8]
   19788: 9101a3e0     	add	x0, sp, #0x68
   1978c: 97ffe899     	bl	0x139f0 <strncmp@plt>
   19790: 340005e0     	cbz	w0, 0x1984c <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x184>
   19794: f9408a61     	ldr	x1, [x19, #0x110]
   19798: b9411a62     	ldr	w2, [x19, #0x118]
   1979c: 9101a3e0     	add	x0, sp, #0x68
   197a0: 97ffe894     	bl	0x139f0 <strncmp@plt>
   197a4: 340005a0     	cbz	w0, 0x19858 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x190>
   197a8: f940a261     	ldr	x1, [x19, #0x140]
   197ac: b9414a62     	ldr	w2, [x19, #0x148]
   197b0: 9101a3e0     	add	x0, sp, #0x68
   197b4: 97ffe88f     	bl	0x139f0 <strncmp@plt>
   197b8: 34000560     	cbz	w0, 0x19864 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x19c>
   197bc: f940ba61     	ldr	x1, [x19, #0x170]
   197c0: b9417a62     	ldr	w2, [x19, #0x178]
   197c4: 9101a3e0     	add	x0, sp, #0x68
   197c8: 97ffe88a     	bl	0x139f0 <strncmp@plt>
   197cc: 34000520     	cbz	w0, 0x19870 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x1a8>
   197d0: f940d261     	ldr	x1, [x19, #0x1a0]
   197d4: b941aa62     	ldr	w2, [x19, #0x1a8]
   197d8: 9101a3e0     	add	x0, sp, #0x68
   197dc: 97ffe885     	bl	0x139f0 <strncmp@plt>
   197e0: 35000180     	cbnz	w0, 0x19810 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x148>
   197e4: 321d03e8     	orr	w8, wzr, #0x8
   197e8: 321d03e9     	orr	w9, wzr, #0x8
   197ec: 14000023     	b	0x19878 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x1b0>
   197f0: d0000081     	adrp	x1, 0x2b000
   197f4: 913a7421     	add	x1, x1, #0xe9d
   197f8: 321903e0     	orr	w0, wzr, #0x80
   197fc: 14000004     	b	0x1980c <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x144>
   19800: d0000081     	adrp	x1, 0x2b000
   19804: 913a2021     	add	x1, x1, #0xe88
   19808: 320003e0     	orr	w0, wzr, #0x1
   1980c: 97ffe959     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   19810: 97ffe96c     	bl	0x13dc0 <_Z32CxAudioHidLibUSBDisconnectDevicev@plt>
   19814: aa1f03f3     	mov	x19, xzr
   19818: 14000078     	b	0x199f8 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x330>
   1981c: 2a1f03e8     	mov	w8, wzr
   19820: aa1f03e9     	mov	x9, xzr
   19824: 14000015     	b	0x19878 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x1b0>
   19828: 320003e8     	orr	w8, wzr, #0x1
   1982c: 320003e9     	orr	w9, wzr, #0x1
   19830: 14000012     	b	0x19878 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x1b0>
   19834: 321f03e8     	orr	w8, wzr, #0x2
   19838: 321f03e9     	orr	w9, wzr, #0x2
   1983c: 1400000f     	b	0x19878 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x1b0>
   19840: 320007e8     	orr	w8, wzr, #0x3
   19844: 320007e9     	orr	w9, wzr, #0x3
   19848: 1400000c     	b	0x19878 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x1b0>
   1984c: 321e03e8     	orr	w8, wzr, #0x4
   19850: 321e03e9     	orr	w9, wzr, #0x4
   19854: 14000009     	b	0x19878 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x1b0>
   19858: 528000a8     	mov	w8, #0x5                // =5
   1985c: 528000a9     	mov	w9, #0x5                // =5
   19860: 14000006     	b	0x19878 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x1b0>
   19864: 321f07e8     	orr	w8, wzr, #0x6
   19868: 321f07e9     	orr	w9, wzr, #0x6
   1986c: 14000003     	b	0x19878 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x1b0>
   19870: 32000be8     	orr	w8, wzr, #0x7
   19874: 32000be9     	orr	w9, wzr, #0x7
   19878: 321c07eb     	orr	w11, wzr, #0x30
   1987c: 9b0b4d29     	madd	x9, x9, x11, x19
   19880: 79402d2b     	ldrh	w11, [x9, #0x16]
   19884: 7940292c     	ldrh	w12, [x9, #0x14]
   19888: 7940352d     	ldrh	w13, [x9, #0x1a]
   1988c: 7940392e     	ldrh	w14, [x9, #0x1c]
   19890: 79403129     	ldrh	w9, [x9, #0x18]
   19894: 12000d0a     	and	w10, w8, #0xf
   19898: 7100215f     	cmp	w10, #0x8
   1989c: 790043eb     	strh	w11, [sp, #0x20]
   198a0: 79003fec     	strh	w12, [sp, #0x1e]
   198a4: 79004bed     	strh	w13, [sp, #0x24]
   198a8: 79004fee     	strh	w14, [sp, #0x26]
   198ac: 790047e9     	strh	w9, [sp, #0x22]
   198b0: b9000be8     	str	w8, [sp, #0x8]
   198b4: 54fffae8     	b.hi	0x19810 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x148>
   198b8: d0000088     	adrp	x8, 0x2b000
   198bc: 91390108     	add	x8, x8, #0xe40
   198c0: b8aa7909     	ldrsw	x9, [x8, x10, lsl #2]
   198c4: 8b080128     	add	x8, x9, x8
   198c8: d61f0100     	br	x8
   198cc: 52808b00     	mov	w0, #0x458              // =1112
   198d0: 97ffe910     	bl	0x13d10 <_Znwm@plt>
   198d4: 910023e3     	add	x3, sp, #0x8
   198d8: 2a1f03e1     	mov	w1, wzr
   198dc: 2a1f03e2     	mov	w2, wzr
   198e0: aa0003f3     	mov	x19, x0
   198e4: 97ffe927     	bl	0x13d80 <_ZN18CxAudioHidDev20562C1E20_CXHID_AUDIO_DEVTYPEjP13_HID_DEV_INFO@plt>
   198e8: 14000040     	b	0x199e8 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x320>
   198ec: 52808d00     	mov	w0, #0x468              // =1128
   198f0: 97ffe908     	bl	0x13d10 <_Znwm@plt>
   198f4: 320003e1     	orr	w1, wzr, #0x1
   198f8: 910023e3     	add	x3, sp, #0x8
   198fc: 2a1f03e2     	mov	w2, wzr
   19900: aa0003f3     	mov	x19, x0
   19904: 97ffe86b     	bl	0x13ab0 <_ZN18CxAudioHidDev2070xC1E20_CXHID_AUDIO_DEVTYPEjP13_HID_DEV_INFO@plt>
   19908: 14000038     	b	0x199e8 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x320>
   1990c: 52808e00     	mov	w0, #0x470              // =1136
   19910: 97ffe900     	bl	0x13d10 <_Znwm@plt>
   19914: 321f03e1     	orr	w1, wzr, #0x2
   19918: 910023e3     	add	x3, sp, #0x8
   1991c: 2a1f03e2     	mov	w2, wzr
   19920: aa0003f3     	mov	x19, x0
   19924: 97ffe9e3     	bl	0x140b0 <_ZN18CxAudioHidDev2077xC1E20_CXHID_AUDIO_DEVTYPEjP13_HID_DEV_INFO@plt>
   19928: 14000030     	b	0x199e8 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x320>
   1992c: 52808b00     	mov	w0, #0x458              // =1112
   19930: 97ffe8f8     	bl	0x13d10 <_Znwm@plt>
   19934: 320007e1     	orr	w1, wzr, #0x3
   19938: 910023e3     	add	x3, sp, #0x8
   1993c: 2a1f03e2     	mov	w2, wzr
   19940: aa0003f3     	mov	x19, x0
   19944: 97ffe983     	bl	0x13f50 <_ZN18CxAudioHidDev2076xC1E20_CXHID_AUDIO_DEVTYPEjP13_HID_DEV_INFO@plt>
   19948: 14000028     	b	0x199e8 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x320>
   1994c: 52808e00     	mov	w0, #0x470              // =1136
   19950: 97ffe8f0     	bl	0x13d10 <_Znwm@plt>
   19954: 321e03e1     	orr	w1, wzr, #0x4
   19958: 910023e3     	add	x3, sp, #0x8
   1995c: 2a1f03e2     	mov	w2, wzr
   19960: aa0003f3     	mov	x19, x0
   19964: 97ffe90b     	bl	0x13d90 <_ZN18CxAudioHidDev2085xC1E20_CXHID_AUDIO_DEVTYPEjP13_HID_DEV_INFO@plt>
   19968: 14000020     	b	0x199e8 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x320>
   1996c: 52808e00     	mov	w0, #0x470              // =1136
   19970: 97ffe8e8     	bl	0x13d10 <_Znwm@plt>
   19974: 528000a1     	mov	w1, #0x5                // =5
   19978: 910023e3     	add	x3, sp, #0x8
   1997c: 2a1f03e2     	mov	w2, wzr
   19980: aa0003f3     	mov	x19, x0
   19984: 97ffe87b     	bl	0x13b70 <_ZN18CxAudioHidDev2089xC1E20_CXHID_AUDIO_DEVTYPEjP13_HID_DEV_INFO@plt>
   19988: 14000018     	b	0x199e8 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x320>
   1998c: 5280a700     	mov	w0, #0x538              // =1336
   19990: 97ffe8e0     	bl	0x13d10 <_Znwm@plt>
   19994: 321f07e1     	orr	w1, wzr, #0x6
   19998: 910023e3     	add	x3, sp, #0x8
   1999c: 2a1f03e2     	mov	w2, wzr
   199a0: aa0003f3     	mov	x19, x0
   199a4: 97ffe977     	bl	0x13f80 <_ZN18CxAudioHidDev2198xC1E20_CXHID_AUDIO_DEVTYPEjP13_HID_DEV_INFO@plt>
   199a8: 14000010     	b	0x199e8 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x320>
   199ac: 52808e00     	mov	w0, #0x470              // =1136
   199b0: 97ffe8d8     	bl	0x13d10 <_Znwm@plt>
   199b4: 32000be1     	orr	w1, wzr, #0x7
   199b8: 910023e3     	add	x3, sp, #0x8
   199bc: 2a1f03e2     	mov	w2, wzr
   199c0: aa0003f3     	mov	x19, x0
   199c4: 97ffe97b     	bl	0x13fb0 <_ZN18CxAudioHidDev2098xC1E20_CXHID_AUDIO_DEVTYPEjP13_HID_DEV_INFO@plt>
   199c8: 14000008     	b	0x199e8 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x320>
   199cc: 5280a400     	mov	w0, #0x520              // =1312
   199d0: 97ffe8d0     	bl	0x13d10 <_Znwm@plt>
   199d4: 321d03e1     	orr	w1, wzr, #0x8
   199d8: 910023e3     	add	x3, sp, #0x8
   199dc: 2a1f03e2     	mov	w2, wzr
   199e0: aa0003f3     	mov	x19, x0
   199e4: 97ffe963     	bl	0x13f70 <_ZN18CxAudioHidDev20805C1E20_CXHID_AUDIO_DEVTYPEjP13_HID_DEV_INFO@plt>
   199e8: f9400268     	ldr	x8, [x19]
   199ec: aa1303e0     	mov	x0, x19
   199f0: f9400508     	ldr	x8, [x8, #0x8]
   199f4: d63f0100     	blr	x8
   199f8: f9401688     	ldr	x8, [x20, #0x28]
   199fc: f85d83a9     	ldur	x9, [x29, #-0x28]
   19a00: eb09011f     	cmp	x8, x9
   19a04: 540000e1     	b.ne	0x19a20 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS+0x358>
   19a08: aa1303e0     	mov	x0, x19
   19a0c: a9597bfd     	ldp	x29, x30, [sp, #0x190]
   19a10: a9584ff4     	ldp	x20, x19, [sp, #0x180]
   19a14: f940bbfc     	ldr	x28, [sp, #0x170]
   19a18: 910683ff     	add	sp, sp, #0x1a0
   19a1c: d65f03c0     	ret
   19a20: 97ffe8b4     	bl	0x13cf0 <__stack_chk_fail@plt>

0000000000019a54 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS>:
   19a54: d10783ff     	sub	sp, sp, #0x1e0
   19a58: a9186ffc     	stp	x28, x27, [sp, #0x180]
   19a5c: a91967fa     	stp	x26, x25, [sp, #0x190]
   19a60: a91a5ff8     	stp	x24, x23, [sp, #0x1a0]
   19a64: a91b57f6     	stp	x22, x21, [sp, #0x1b0]
   19a68: a91c4ff4     	stp	x20, x19, [sp, #0x1c0]
   19a6c: a91d7bfd     	stp	x29, x30, [sp, #0x1d0]
   19a70: 910743fd     	add	x29, sp, #0x1d0
   19a74: d53bd05a     	mrs	x26, TPIDR_EL0
   19a78: f9401748     	ldr	x8, [x26, #0x28]
   19a7c: 2a0203f5     	mov	w21, w2
   19a80: 2a0103f6     	mov	w22, w1
   19a84: 910063e0     	add	x0, sp, #0x18
   19a88: 321b07e2     	orr	w2, wzr, #0x60
   19a8c: 2a1f03e1     	mov	w1, wzr
   19a90: aa0403f8     	mov	x24, x4
   19a94: 2a0303f4     	mov	w20, w3
   19a98: f81a83a8     	stur	x8, [x29, #-0x58]
   19a9c: 97ffe9ad     	bl	0x14150 <memset@plt>
   19aa0: 321f03e8     	orr	w8, wzr, #0x2
   19aa4: 310006df     	cmn	w22, #0x1
   19aa8: b9001be8     	str	w8, [sp, #0x18]
   19aac: 54000120     	b.eq	0x19ad0 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x7c>
   19ab0: d0000169     	adrp	x9, 0x47000 <_ZTV18CxAudioHidDev2089x+0x198>
   19ab4: f947dd29     	ldr	x9, [x9, #0xfb8]
   19ab8: 710022df     	cmp	w22, #0x8
   19abc: 321d03e8     	orr	w8, wzr, #0x8
   19ac0: 1a8832db     	csel	w27, w22, w8, lo
   19ac4: 321c07e8     	orr	w8, wzr, #0x30
   19ac8: 9ba82760     	umaddl	x0, w27, w8, x9
   19acc: 14000007     	b	0x19ae8 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x94>
   19ad0: 12003ea8     	and	w8, w21, #0xffff
   19ad4: 34000f28     	cbz	w8, 0x19cb8 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x264>
   19ad8: 12003e88     	and	w8, w20, #0xffff
   19adc: 34000ee8     	cbz	w8, 0x19cb8 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x264>
   19ae0: aa1f03e0     	mov	x0, xzr
   19ae4: 321f03fb     	orr	w27, wzr, #0x2
   19ae8: 910063e1     	add	x1, sp, #0x18
   19aec: 2a1503e2     	mov	w2, w21
   19af0: 2a1403e3     	mov	w3, w20
   19af4: 97ffe7cb     	bl	0x13a20 <_Z33CxAudioHidLibUSBFindConnectDevicePK20_CXHID_AUDIO_DEVINFOP13_HID_DEV_INFOtt@plt>
   19af8: 36001fe0     	tbz	w0, #0x0, 0x19ef4 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x4a0>
   19afc: 52800520     	mov	w0, #0x29               // =41
   19b00: 9101e3e1     	add	x1, sp, #0x78
   19b04: 321f1be2     	orr	w2, wzr, #0xfe
   19b08: 97ffe802     	bl	0x13b10 <_Z30CxAudioHidLibUSBGetIndexStringiPci@plt>
   19b0c: 2a0003f7     	mov	w23, w0
   19b10: 36f800b7     	tbz	w23, #0x1f, 0x19b24 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0xd0>
   19b14: d0000081     	adrp	x1, 0x2b000
   19b18: 913b2821     	add	x1, x1, #0xeca
   19b1c: 321e03e0     	orr	w0, wzr, #0x4
   19b20: 97ffe894     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   19b24: d0000168     	adrp	x8, 0x47000 <_ZTV18CxAudioHidDev2089x+0x198>
   19b28: f947dd08     	ldr	x8, [x8, #0xfb8]
   19b2c: aa1f03fc     	mov	x28, xzr
   19b30: 2a1603e9     	mov	w9, w22
   19b34: f9000be9     	str	x9, [sp, #0x10]
   19b38: 91005913     	add	x19, x8, #0x16
   19b3c: 79400268     	ldrh	w8, [x19]
   19b40: 794063e9     	ldrh	w9, [sp, #0x30]
   19b44: 6b09011f     	cmp	w8, w9
   19b48: 540003c1     	b.ne	0x19bc0 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x16c>
   19b4c: 785fe268     	ldurh	w8, [x19, #-0x2]
   19b50: 79405fe9     	ldrh	w9, [sp, #0x2e]
   19b54: 6b09011f     	cmp	w8, w9
   19b58: 54000341     	b.ne	0x19bc0 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x16c>
   19b5c: 79400668     	ldrh	w8, [x19, #0x2]
   19b60: 794067e9     	ldrh	w9, [sp, #0x32]
   19b64: 6b09011f     	cmp	w8, w9
   19b68: 540002c1     	b.ne	0x19bc0 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x16c>
   19b6c: 79400a68     	ldrh	w8, [x19, #0x4]
   19b70: 79406be9     	ldrh	w9, [sp, #0x34]
   19b74: 6b09011f     	cmp	w8, w9
   19b78: 54000241     	b.ne	0x19bc0 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x16c>
   19b7c: 79400e68     	ldrh	w8, [x19, #0x6]
   19b80: 79406fe9     	ldrh	w9, [sp, #0x36]
   19b84: 6b09011f     	cmp	w8, w9
   19b88: 540001c1     	b.ne	0x19bc0 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x16c>
   19b8c: 34000297     	cbz	w23, 0x19bdc <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x188>
   19b90: f840a261     	ldur	x1, [x19, #0xa]
   19b94: b8412262     	ldur	w2, [x19, #0x12]
   19b98: 9101e3e0     	add	x0, sp, #0x78
   19b9c: 97ffe795     	bl	0x139f0 <strncmp@plt>
   19ba0: 2a0003f9     	mov	w25, w0
   19ba4: 7100033f     	cmp	w25, #0x0
   19ba8: d0000081     	adrp	x1, 0x2b000
   19bac: 1a9f17e2     	cset	w2, eq
   19bb0: 321e03e0     	orr	w0, wzr, #0x4
   19bb4: 913b8821     	add	x1, x1, #0xee2
   19bb8: 97ffe83e     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   19bbc: 340002f9     	cbz	w25, 0x19c18 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x1c4>
   19bc0: 2a1f03e8     	mov	w8, wzr
   19bc4: 35000568     	cbnz	w8, 0x19c70 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x21c>
   19bc8: f100239f     	cmp	x28, #0x8
   19bcc: 9100079c     	add	x28, x28, #0x1
   19bd0: 9100c273     	add	x19, x19, #0x30
   19bd4: 54fffb4b     	b.lt	0x19b3c <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0xe8>
   19bd8: 14000026     	b	0x19c70 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x21c>
   19bdc: b8416268     	ldur	w8, [x19, #0x16]
   19be0: 34000128     	cbz	w8, 0x19c04 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x1b0>
   19be4: d0000081     	adrp	x1, 0x2b000
   19be8: 321e03e0     	orr	w0, wzr, #0x4
   19bec: 913b8821     	add	x1, x1, #0xee2
   19bf0: 2a1f03e2     	mov	w2, wzr
   19bf4: 97ffe82f     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   19bf8: 2a1f03e8     	mov	w8, wzr
   19bfc: 34fffe68     	cbz	w8, 0x19bc8 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x174>
   19c00: 1400001c     	b	0x19c70 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x21c>
   19c04: d0000081     	adrp	x1, 0x2b000
   19c08: 321e03e0     	orr	w0, wzr, #0x4
   19c0c: 320003e2     	orr	w2, wzr, #0x1
   19c10: 913b8821     	add	x1, x1, #0xee2
   19c14: 97ffe827     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   19c18: 794053e8     	ldrh	w8, [sp, #0x28]
   19c1c: 72003e9f     	tst	w20, #0xffff
   19c20: 1a9f17ea     	cset	w10, eq
   19c24: 72003ebf     	tst	w21, #0xffff
   19c28: 1a9f17eb     	cset	w11, eq
   19c2c: 310006df     	cmn	w22, #0x1
   19c30: 1a9f17ec     	cset	w12, eq
   19c34: 6b35211f     	cmp	w8, w21, uxth
   19c38: 794057e9     	ldrh	w9, [sp, #0x2a]
   19c3c: 1a9f17e8     	cset	w8, eq
   19c40: 2a080168     	orr	w8, w11, w8
   19c44: f9400beb     	ldr	x11, [sp, #0x10]
   19c48: 6b34213f     	cmp	w9, w20, uxth
   19c4c: 1a9f17e9     	cset	w9, eq
   19c50: 2a090149     	orr	w9, w10, w9
   19c54: eb1c017f     	cmp	x11, x28
   19c58: 1a9f17ea     	cset	w10, eq
   19c5c: 2a0a018a     	orr	w10, w12, w10
   19c60: 0a090108     	and	w8, w8, w9
   19c64: 0a080148     	and	w8, w10, w8
   19c68: 2a1c03fb     	mov	w27, w28
   19c6c: 34fffae8     	cbz	w8, 0x19bc8 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x174>
   19c70: 34001428     	cbz	w8, 0x19ef4 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x4a0>
   19c74: 7100237f     	cmp	w27, #0x8
   19c78: b9001bfb     	str	w27, [sp, #0x18]
   19c7c: 540013c8     	b.hi	0x19ef4 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x4a0>
   19c80: d0000089     	adrp	x9, 0x2b000
   19c84: 2a1b03e8     	mov	w8, w27
   19c88: 91399129     	add	x9, x9, #0xe64
   19c8c: b8a87928     	ldrsw	x8, [x9, x8, lsl #2]
   19c90: 8b090108     	add	x8, x8, x9
   19c94: d61f0100     	br	x8
   19c98: 52808e00     	mov	w0, #0x470              // =1136
   19c9c: 97ffe81d     	bl	0x13d10 <_Znwm@plt>
   19ca0: 321e03e1     	orr	w1, wzr, #0x4
   19ca4: 910063e3     	add	x3, sp, #0x18
   19ca8: 2a1f03e2     	mov	w2, wzr
   19cac: aa0003f4     	mov	x20, x0
   19cb0: 97ffe838     	bl	0x13d90 <_ZN18CxAudioHidDev2085xC1E20_CXHID_AUDIO_DEVTYPEjP13_HID_DEV_INFO@plt>
   19cb4: 1400008a     	b	0x19edc <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x488>
   19cb8: d0000174     	adrp	x20, 0x47000 <_ZTV18CxAudioHidDev2089x+0x198>
   19cbc: f947de94     	ldr	x20, [x20, #0xfb8]
   19cc0: 910063e1     	add	x1, sp, #0x18
   19cc4: 2a1f03e2     	mov	w2, wzr
   19cc8: 2a1f03e3     	mov	w3, wzr
   19ccc: aa1403e0     	mov	x0, x20
   19cd0: 97ffe754     	bl	0x13a20 <_Z33CxAudioHidLibUSBFindConnectDevicePK20_CXHID_AUDIO_DEVINFOP13_HID_DEV_INFOtt@plt>
   19cd4: 36000140     	tbz	w0, #0x0, 0x19cfc <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x2a8>
   19cd8: b9001bff     	str	wzr, [sp, #0x18]
   19cdc: 52808b00     	mov	w0, #0x458              // =1112
   19ce0: 97ffe80c     	bl	0x13d10 <_Znwm@plt>
   19ce4: 910063e3     	add	x3, sp, #0x18
   19ce8: 2a1f03e1     	mov	w1, wzr
   19cec: 2a1f03e2     	mov	w2, wzr
   19cf0: aa0003f4     	mov	x20, x0
   19cf4: 97ffe823     	bl	0x13d80 <_ZN18CxAudioHidDev20562C1E20_CXHID_AUDIO_DEVTYPEjP13_HID_DEV_INFO@plt>
   19cf8: 14000079     	b	0x19edc <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x488>
   19cfc: 9100c280     	add	x0, x20, #0x30
   19d00: 910063e1     	add	x1, sp, #0x18
   19d04: 2a1f03e2     	mov	w2, wzr
   19d08: 2a1f03e3     	mov	w3, wzr
   19d0c: 97ffe745     	bl	0x13a20 <_Z33CxAudioHidLibUSBFindConnectDevicePK20_CXHID_AUDIO_DEVINFOP13_HID_DEV_INFOtt@plt>
   19d10: 36000160     	tbz	w0, #0x0, 0x19d3c <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x2e8>
   19d14: 320003e8     	orr	w8, wzr, #0x1
   19d18: b9001be8     	str	w8, [sp, #0x18]
   19d1c: 52808d00     	mov	w0, #0x468              // =1128
   19d20: 97ffe7fc     	bl	0x13d10 <_Znwm@plt>
   19d24: 320003e1     	orr	w1, wzr, #0x1
   19d28: 910063e3     	add	x3, sp, #0x18
   19d2c: 2a1f03e2     	mov	w2, wzr
   19d30: aa0003f4     	mov	x20, x0
   19d34: 97ffe75f     	bl	0x13ab0 <_ZN18CxAudioHidDev2070xC1E20_CXHID_AUDIO_DEVTYPEjP13_HID_DEV_INFO@plt>
   19d38: 14000069     	b	0x19edc <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x488>
   19d3c: 91018280     	add	x0, x20, #0x60
   19d40: 910063e1     	add	x1, sp, #0x18
   19d44: 2a1f03e2     	mov	w2, wzr
   19d48: 2a1f03e3     	mov	w3, wzr
   19d4c: 97ffe735     	bl	0x13a20 <_Z33CxAudioHidLibUSBFindConnectDevicePK20_CXHID_AUDIO_DEVINFOP13_HID_DEV_INFOtt@plt>
   19d50: 36000160     	tbz	w0, #0x0, 0x19d7c <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x328>
   19d54: 321f03e8     	orr	w8, wzr, #0x2
   19d58: b9001be8     	str	w8, [sp, #0x18]
   19d5c: 52808e00     	mov	w0, #0x470              // =1136
   19d60: 97ffe7ec     	bl	0x13d10 <_Znwm@plt>
   19d64: 321f03e1     	orr	w1, wzr, #0x2
   19d68: 910063e3     	add	x3, sp, #0x18
   19d6c: 2a1f03e2     	mov	w2, wzr
   19d70: aa0003f4     	mov	x20, x0
   19d74: 97ffe8cf     	bl	0x140b0 <_ZN18CxAudioHidDev2077xC1E20_CXHID_AUDIO_DEVTYPEjP13_HID_DEV_INFO@plt>
   19d78: 14000059     	b	0x19edc <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x488>
   19d7c: 91024280     	add	x0, x20, #0x90
   19d80: 910063e1     	add	x1, sp, #0x18
   19d84: 2a1f03e2     	mov	w2, wzr
   19d88: 2a1f03e3     	mov	w3, wzr
   19d8c: 97ffe725     	bl	0x13a20 <_Z33CxAudioHidLibUSBFindConnectDevicePK20_CXHID_AUDIO_DEVINFOP13_HID_DEV_INFOtt@plt>
   19d90: 36000160     	tbz	w0, #0x0, 0x19dbc <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x368>
   19d94: 320007e8     	orr	w8, wzr, #0x3
   19d98: b9001be8     	str	w8, [sp, #0x18]
   19d9c: 52808b00     	mov	w0, #0x458              // =1112
   19da0: 97ffe7dc     	bl	0x13d10 <_Znwm@plt>
   19da4: 320007e1     	orr	w1, wzr, #0x3
   19da8: 910063e3     	add	x3, sp, #0x18
   19dac: 2a1f03e2     	mov	w2, wzr
   19db0: aa0003f4     	mov	x20, x0
   19db4: 97ffe867     	bl	0x13f50 <_ZN18CxAudioHidDev2076xC1E20_CXHID_AUDIO_DEVTYPEjP13_HID_DEV_INFO@plt>
   19db8: 14000049     	b	0x19edc <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x488>
   19dbc: 91030280     	add	x0, x20, #0xc0
   19dc0: 910063e1     	add	x1, sp, #0x18
   19dc4: 2a1f03e2     	mov	w2, wzr
   19dc8: 2a1f03e3     	mov	w3, wzr
   19dcc: 97ffe715     	bl	0x13a20 <_Z33CxAudioHidLibUSBFindConnectDevicePK20_CXHID_AUDIO_DEVINFOP13_HID_DEV_INFOtt@plt>
   19dd0: 36000080     	tbz	w0, #0x0, 0x19de0 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x38c>
   19dd4: 321e03e8     	orr	w8, wzr, #0x4
   19dd8: b9001be8     	str	w8, [sp, #0x18]
   19ddc: 17ffffaf     	b	0x19c98 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x244>
   19de0: 9103c280     	add	x0, x20, #0xf0
   19de4: 910063e1     	add	x1, sp, #0x18
   19de8: 2a1f03e2     	mov	w2, wzr
   19dec: 2a1f03e3     	mov	w3, wzr
   19df0: 97ffe70c     	bl	0x13a20 <_Z33CxAudioHidLibUSBFindConnectDevicePK20_CXHID_AUDIO_DEVINFOP13_HID_DEV_INFOtt@plt>
   19df4: 36000160     	tbz	w0, #0x0, 0x19e20 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x3cc>
   19df8: 528000a8     	mov	w8, #0x5                // =5
   19dfc: b9001be8     	str	w8, [sp, #0x18]
   19e00: 52808e00     	mov	w0, #0x470              // =1136
   19e04: 97ffe7c3     	bl	0x13d10 <_Znwm@plt>
   19e08: 528000a1     	mov	w1, #0x5                // =5
   19e0c: 910063e3     	add	x3, sp, #0x18
   19e10: 2a1f03e2     	mov	w2, wzr
   19e14: aa0003f4     	mov	x20, x0
   19e18: 97ffe756     	bl	0x13b70 <_ZN18CxAudioHidDev2089xC1E20_CXHID_AUDIO_DEVTYPEjP13_HID_DEV_INFO@plt>
   19e1c: 14000030     	b	0x19edc <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x488>
   19e20: 91048280     	add	x0, x20, #0x120
   19e24: 910063e1     	add	x1, sp, #0x18
   19e28: 2a1f03e2     	mov	w2, wzr
   19e2c: 2a1f03e3     	mov	w3, wzr
   19e30: 97ffe6fc     	bl	0x13a20 <_Z33CxAudioHidLibUSBFindConnectDevicePK20_CXHID_AUDIO_DEVINFOP13_HID_DEV_INFOtt@plt>
   19e34: 36000160     	tbz	w0, #0x0, 0x19e60 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x40c>
   19e38: 321f07e8     	orr	w8, wzr, #0x6
   19e3c: b9001be8     	str	w8, [sp, #0x18]
   19e40: 5280a700     	mov	w0, #0x538              // =1336
   19e44: 97ffe7b3     	bl	0x13d10 <_Znwm@plt>
   19e48: 321f07e1     	orr	w1, wzr, #0x6
   19e4c: 910063e3     	add	x3, sp, #0x18
   19e50: 2a1f03e2     	mov	w2, wzr
   19e54: aa0003f4     	mov	x20, x0
   19e58: 97ffe84a     	bl	0x13f80 <_ZN18CxAudioHidDev2198xC1E20_CXHID_AUDIO_DEVTYPEjP13_HID_DEV_INFO@plt>
   19e5c: 14000020     	b	0x19edc <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x488>
   19e60: 91054280     	add	x0, x20, #0x150
   19e64: 910063e1     	add	x1, sp, #0x18
   19e68: 2a1f03e2     	mov	w2, wzr
   19e6c: 2a1f03e3     	mov	w3, wzr
   19e70: 97ffe6ec     	bl	0x13a20 <_Z33CxAudioHidLibUSBFindConnectDevicePK20_CXHID_AUDIO_DEVINFOP13_HID_DEV_INFOtt@plt>
   19e74: 36000160     	tbz	w0, #0x0, 0x19ea0 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x44c>
   19e78: 32000be8     	orr	w8, wzr, #0x7
   19e7c: b9001be8     	str	w8, [sp, #0x18]
   19e80: 52808e00     	mov	w0, #0x470              // =1136
   19e84: 97ffe7a3     	bl	0x13d10 <_Znwm@plt>
   19e88: 32000be1     	orr	w1, wzr, #0x7
   19e8c: 910063e3     	add	x3, sp, #0x18
   19e90: 2a1f03e2     	mov	w2, wzr
   19e94: aa0003f4     	mov	x20, x0
   19e98: 97ffe846     	bl	0x13fb0 <_ZN18CxAudioHidDev2098xC1E20_CXHID_AUDIO_DEVTYPEjP13_HID_DEV_INFO@plt>
   19e9c: 14000010     	b	0x19edc <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x488>
   19ea0: 91060280     	add	x0, x20, #0x180
   19ea4: 910063e1     	add	x1, sp, #0x18
   19ea8: 2a1f03e2     	mov	w2, wzr
   19eac: 2a1f03e3     	mov	w3, wzr
   19eb0: 97ffe6dc     	bl	0x13a20 <_Z33CxAudioHidLibUSBFindConnectDevicePK20_CXHID_AUDIO_DEVINFOP13_HID_DEV_INFOtt@plt>
   19eb4: 36000200     	tbz	w0, #0x0, 0x19ef4 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x4a0>
   19eb8: 321d03e8     	orr	w8, wzr, #0x8
   19ebc: b9001be8     	str	w8, [sp, #0x18]
   19ec0: 5280a400     	mov	w0, #0x520              // =1312
   19ec4: 97ffe793     	bl	0x13d10 <_Znwm@plt>
   19ec8: 321d03e1     	orr	w1, wzr, #0x8
   19ecc: 910063e3     	add	x3, sp, #0x18
   19ed0: 2a1f03e2     	mov	w2, wzr
   19ed4: aa0003f4     	mov	x20, x0
   19ed8: 97ffe826     	bl	0x13f70 <_ZN18CxAudioHidDev20805C1E20_CXHID_AUDIO_DEVTYPEjP13_HID_DEV_INFO@plt>
   19edc: f9400288     	ldr	x8, [x20]
   19ee0: aa1403e0     	mov	x0, x20
   19ee4: f9400508     	ldr	x8, [x8, #0x8]
   19ee8: d63f0100     	blr	x8
   19eec: 2a1f03e8     	mov	w8, wzr
   19ef0: 14000003     	b	0x19efc <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x4a8>
   19ef4: aa1f03f4     	mov	x20, xzr
   19ef8: 321f03e8     	orr	w8, wzr, #0x2
   19efc: b9000308     	str	w8, [x24]
   19f00: f9401748     	ldr	x8, [x26, #0x28]
   19f04: f85a83a9     	ldur	x9, [x29, #-0x58]
   19f08: eb09011f     	cmp	x8, x9
   19f0c: 54000141     	b.ne	0x19f34 <_ZN20CxAudioHidDevFactory7ConnectE20_CXHID_AUDIO_DEVTYPEttP13_CXDEV_STATUS+0x4e0>
   19f10: aa1403e0     	mov	x0, x20
   19f14: a95d7bfd     	ldp	x29, x30, [sp, #0x1d0]
   19f18: a95c4ff4     	ldp	x20, x19, [sp, #0x1c0]
   19f1c: a95b57f6     	ldp	x22, x21, [sp, #0x1b0]
   19f20: a95a5ff8     	ldp	x24, x23, [sp, #0x1a0]
   19f24: a95967fa     	ldp	x26, x25, [sp, #0x190]
   19f28: a9586ffc     	ldp	x28, x27, [sp, #0x180]
   19f2c: 910783ff     	add	sp, sp, #0x1e0
   19f30: d65f03c0     	ret
   19f34: 97ffe76f     	bl	0x13cf0 <__stack_chk_fail@plt>

000000000001e598 <_ZN16CxAudioHidDevice20MemoryPatchCheckFileEPKcP10__S37_FILE>:
   1e598: aa0203e8     	mov	x8, x2
   1e59c: aa0103e9     	mov	x9, x1
   1e5a0: b4000148     	cbz	x8, 0x1e5c8 <_ZN16CxAudioHidDevice20MemoryPatchCheckFileEPKcP10__S37_FILE+0x30>
   1e5a4: f940000a     	ldr	x10, [x0]
   1e5a8: 2a1f03e1     	mov	w1, wzr
   1e5ac: 2a1f03e2     	mov	w2, wzr
   1e5b0: aa0903e3     	mov	x3, x9
   1e5b4: f940cd47     	ldr	x7, [x10, #0x198]
   1e5b8: aa1f03e4     	mov	x4, xzr
   1e5bc: 2a1f03e5     	mov	w5, wzr
   1e5c0: aa0803e6     	mov	x6, x8
   1e5c4: d61f00e0     	br	x7
   1e5c8: 32000be0     	orr	w0, wzr, #0x7
   1e5cc: d65f03c0     	ret

000000000001f270 <_Z15HandleImageFilePKcP10sfs_info_s>:
   1f270: d106c3ff     	sub	sp, sp, #0x1b0
   1f274: a9156ffc     	stp	x28, x27, [sp, #0x150]
   1f278: a91667fa     	stp	x26, x25, [sp, #0x160]
   1f27c: a9175ff8     	stp	x24, x23, [sp, #0x170]
   1f280: a91857f6     	stp	x22, x21, [sp, #0x180]
   1f284: a9194ff4     	stp	x20, x19, [sp, #0x190]
   1f288: a91a7bfd     	stp	x29, x30, [sp, #0x1a0]
   1f28c: 910683fd     	add	x29, sp, #0x1a0
   1f290: d53bd056     	mrs	x22, TPIDR_EL0
   1f294: f94016c8     	ldr	x8, [x22, #0x28]
   1f298: aa0103f7     	mov	x23, x1
   1f29c: aa0003f8     	mov	x24, x0
   1f2a0: 910123e0     	add	x0, sp, #0x48
   1f2a4: 321803e2     	orr	w2, wzr, #0x100
   1f2a8: 2a1f03e1     	mov	w1, wzr
   1f2ac: f9001fe8     	str	x8, [sp, #0x38]
   1f2b0: 910123f9     	add	x25, sp, #0x48
   1f2b4: 97ffd3a7     	bl	0x14150 <memset@plt>
   1f2b8: aa1803e0     	mov	x0, x24
   1f2bc: 97ffd179     	bl	0x138a0 <_Z15CxUtilsFileSizePKc@plt>
   1f2c0: 2a0003f4     	mov	w20, w0
   1f2c4: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f2c8: 91227421     	add	x1, x1, #0x89d
   1f2cc: 321a03e0     	orr	w0, wzr, #0x40
   1f2d0: 2a1403e2     	mov	w2, w20
   1f2d4: 113ffe93     	add	w19, w20, #0xfff
   1f2d8: 97ffd276     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1f2dc: 530c6e7a     	ubfx	w26, w19, #12, #16
   1f2e0: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f2e4: 9122e021     	add	x1, x1, #0x8b8
   1f2e8: 321a03e0     	orr	w0, wzr, #0x40
   1f2ec: 2a1a03e2     	mov	w2, w26
   1f2f0: 97ffd270     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1f2f4: aa1f03f5     	mov	x21, xzr
   1f2f8: 320013fb     	orr	w27, wzr, #0x1f
   1f2fc: 34000e54     	cbz	w20, 0x1f4c4 <_Z15HandleImageFilePKcP10sfs_info_s+0x254>
   1f300: 12002e88     	and	w8, w20, #0xfff
   1f304: aa1503f4     	mov	x20, x21
   1f308: aa1503fc     	mov	x28, x21
   1f30c: 35001088     	cbnz	w8, 0x1f51c <_Z15HandleImageFilePKcP10sfs_info_s+0x2ac>
   1f310: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f314: 91235421     	add	x1, x1, #0x8d5
   1f318: 321a03e0     	orr	w0, wzr, #0x40
   1f31c: 97ffd295     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   1f320: 90000061     	adrp	x1, 0x2b000
   1f324: 912be421     	add	x1, x1, #0xaf9
   1f328: aa1803e0     	mov	x0, x24
   1f32c: 97ffd38d     	bl	0x14160 <fopen@plt>
   1f330: aa0003f4     	mov	x20, x0
   1f334: b4000cf4     	cbz	x20, 0x1f4d0 <_Z15HandleImageFilePKcP10sfs_info_s+0x260>
   1f338: 321403e0     	orr	w0, wzr, #0x1000
   1f33c: 97ffd365     	bl	0x140d0 <malloc@plt>
   1f340: aa0003f5     	mov	x21, x0
   1f344: b4000d75     	cbz	x21, 0x1f4f0 <_Z15HandleImageFilePKcP10sfs_info_s+0x280>
   1f348: 321403e2     	orr	w2, wzr, #0x1000
   1f34c: aa1503e0     	mov	x0, x21
   1f350: 2a1f03e1     	mov	w1, wzr
   1f354: 97ffd37f     	bl	0x14150 <memset@plt>
   1f358: 321203e0     	orr	w0, wzr, #0x4000
   1f35c: 97ffd35d     	bl	0x140d0 <malloc@plt>
   1f360: aa0003fc     	mov	x28, x0
   1f364: b4000d3c     	cbz	x28, 0x1f508 <_Z15HandleImageFilePKcP10sfs_info_s+0x298>
   1f368: 321203e2     	orr	w2, wzr, #0x4000
   1f36c: aa1c03e0     	mov	x0, x28
   1f370: 2a1f03e1     	mov	w1, wzr
   1f374: b90017fa     	str	w26, [sp, #0x14]
   1f378: a9025bf7     	stp	x23, x22, [sp, #0x20]
   1f37c: 97ffd375     	bl	0x14150 <memset@plt>
   1f380: 910123e8     	add	x8, sp, #0x48
   1f384: 5288ca77     	mov	w23, #0x4653            // =18003
   1f388: d000007a     	adrp	x26, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f38c: 2a1f03f8     	mov	w24, wzr
   1f390: aa1f03f9     	mov	x25, xzr
   1f394: 72a8aa77     	movk	w23, #0x4553, lsl #16
   1f398: 91003109     	add	x9, x8, #0xc
   1f39c: aa1c03f6     	mov	x22, x28
   1f3a0: 9100511c     	add	x28, x8, #0x14
   1f3a4: 9125a75a     	add	x26, x26, #0x969
   1f3a8: b90057ff     	str	wzr, [sp, #0x54]
   1f3ac: f9000fe9     	str	x9, [sp, #0x18]
   1f3b0: f9001bf6     	str	x22, [sp, #0x30]
   1f3b4: 321403e3     	orr	w3, wzr, #0x1000
   1f3b8: aa1403e0     	mov	x0, x20
   1f3bc: 2a1903e1     	mov	w1, w25
   1f3c0: aa1503e2     	mov	x2, x21
   1f3c4: 97ffd1cb     	bl	0x13af0 <_Z18ReadImageFileBlockP7__sFILEtPhm@plt>
   1f3c8: 2a0003fb     	mov	w27, w0
   1f3cc: 3500145b     	cbnz	w27, 0x1f654 <_Z15HandleImageFilePKcP10sfs_info_s+0x3e4>
   1f3d0: b94002a8     	ldr	w8, [x21]
   1f3d4: 6b17011f     	cmp	w8, w23
   1f3d8: 540001a1     	b.ne	0x1f40c <_Z15HandleImageFilePKcP10sfs_info_s+0x19c>
   1f3dc: 321a03e0     	orr	w0, wzr, #0x40
   1f3e0: aa1a03e1     	mov	x1, x26
   1f3e4: 97ffd263     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   1f3e8: 394002c8     	ldrb	w8, [x22]
   1f3ec: ad4106a0     	ldp	q0, q1, [x21, #0x20]
   1f3f0: ad400ea2     	ldp	q2, q3, [x21]
   1f3f4: 11000718     	add	w24, w24, #0x1
   1f3f8: 32000108     	orr	w8, w8, #0x1
   1f3fc: ad010780     	stp	q0, q1, [x28, #0x20]
   1f400: ad000f82     	stp	q2, q3, [x28]
   1f404: 390002c8     	strb	w8, [x22]
   1f408: b90057f8     	str	w24, [sp, #0x54]
   1f40c: 91000739     	add	x25, x25, #0x1
   1f410: f100073f     	cmp	x25, #0x1
   1f414: 54000088     	b.hi	0x1f424 <_Z15HandleImageFilePKcP10sfs_info_s+0x1b4>
   1f418: 9101939c     	add	x28, x28, #0x64
   1f41c: 910012d6     	add	x22, x22, #0x4
   1f420: 34fffcbb     	cbz	w27, 0x1f3b4 <_Z15HandleImageFilePKcP10sfs_info_s+0x144>
   1f424: 910123e8     	add	x8, sp, #0x48
   1f428: b9013fff     	str	wzr, [sp, #0x13c]
   1f42c: f80ec11f     	stur	xzr, [x8, #0xec]
   1f430: f80e411f     	stur	xzr, [x8, #0xe4]
   1f434: f80dc11f     	stur	xzr, [x8, #0xdc]
   1f438: b9405fe8     	ldr	w8, [sp, #0x5c]
   1f43c: 6b17011f     	cmp	w8, w23
   1f440: 54001601     	b.ne	0x1f700 <_Z15HandleImageFilePKcP10sfs_info_s+0x490>
   1f444: b9407bf9     	ldr	w25, [sp, #0x78]
   1f448: 3100073f     	cmn	w25, #0x1
   1f44c: 540010e0     	b.eq	0x1f668 <_Z15HandleImageFilePKcP10sfs_info_s+0x3f8>
   1f450: b9407fe8     	ldr	w8, [sp, #0x7c]
   1f454: 3100051f     	cmn	w8, #0x1
   1f458: 54001080     	b.eq	0x1f668 <_Z15HandleImageFilePKcP10sfs_info_s+0x3f8>
   1f45c: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f460: 91218c21     	add	x1, x1, #0x863
   1f464: 321a03e0     	orr	w0, wzr, #0x40
   1f468: 97ffd242     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   1f46c: b26003e9     	orr	x9, xzr, #0x100000000
   1f470: f90097e9     	str	x9, [sp, #0x128]
   1f474: 7940d3e9     	ldrh	w9, [sp, #0x68]
   1f478: 7940ebea     	ldrh	w10, [sp, #0x74]
   1f47c: f9401bfc     	ldr	x28, [sp, #0x30]
   1f480: 2a1f03e8     	mov	w8, wzr
   1f484: 790263e9     	strh	w9, [sp, #0x130]
   1f488: 7940d7e9     	ldrh	w9, [sp, #0x6a]
   1f48c: b90127f9     	str	w25, [sp, #0x124]
   1f490: 79027bea     	strh	w10, [sp, #0x13c]
   1f494: 32000bea     	orr	w10, wzr, #0x7
   1f498: 790267e9     	strh	w9, [sp, #0x132]
   1f49c: 7940dbe9     	ldrh	w9, [sp, #0x6c]
   1f4a0: 79026be9     	strh	w9, [sp, #0x134]
   1f4a4: 7940dfe9     	ldrh	w9, [sp, #0x6e]
   1f4a8: 79026fe9     	strh	w9, [sp, #0x136]
   1f4ac: 7940e3e9     	ldrh	w9, [sp, #0x70]
   1f4b0: 790273e9     	strh	w9, [sp, #0x138]
   1f4b4: 7940e7e9     	ldrh	w9, [sp, #0x72]
   1f4b8: 790277e9     	strh	w9, [sp, #0x13a]
   1f4bc: 321c03e9     	orr	w9, wzr, #0x10
   1f4c0: 14000081     	b	0x1f6c4 <_Z15HandleImageFilePKcP10sfs_info_s+0x454>
   1f4c4: aa1503f4     	mov	x20, x21
   1f4c8: aa1503fc     	mov	x28, x21
   1f4cc: 14000014     	b	0x1f51c <_Z15HandleImageFilePKcP10sfs_info_s+0x2ac>
   1f4d0: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f4d4: 91241021     	add	x1, x1, #0x904
   1f4d8: 52800860     	mov	w0, #0x43               // =67
   1f4dc: 97ffd225     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   1f4e0: aa1f03f5     	mov	x21, xzr
   1f4e4: aa1f03fc     	mov	x28, xzr
   1f4e8: 5280035b     	mov	w27, #0x1a              // =26
   1f4ec: 1400000c     	b	0x1f51c <_Z15HandleImageFilePKcP10sfs_info_s+0x2ac>
   1f4f0: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f4f4: 91246c21     	add	x1, x1, #0x91b
   1f4f8: 52800860     	mov	w0, #0x43               // =67
   1f4fc: 97ffd21d     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   1f500: aa1f03fc     	mov	x28, xzr
   1f504: 14000005     	b	0x1f518 <_Z15HandleImageFilePKcP10sfs_info_s+0x2a8>
   1f508: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f50c: 91250821     	add	x1, x1, #0x942
   1f510: 52800860     	mov	w0, #0x43               // =67
   1f514: 97ffd217     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   1f518: 528000bb     	mov	w27, #0x5               // =5
   1f51c: 91003333     	add	x19, x25, #0xc
   1f520: b90057ff     	str	wzr, [sp, #0x54]
   1f524: b4000075     	cbz	x21, 0x1f530 <_Z15HandleImageFilePKcP10sfs_info_s+0x2c0>
   1f528: aa1503e0     	mov	x0, x21
   1f52c: 97ffd325     	bl	0x141c0 <free@plt>
   1f530: b400007c     	cbz	x28, 0x1f53c <_Z15HandleImageFilePKcP10sfs_info_s+0x2cc>
   1f534: aa1c03e0     	mov	x0, x28
   1f538: 97ffd322     	bl	0x141c0 <free@plt>
   1f53c: b4000134     	cbz	x20, 0x1f560 <_Z15HandleImageFilePKcP10sfs_info_s+0x2f0>
   1f540: aa1403e0     	mov	x0, x20
   1f544: 97ffd1d3     	bl	0x13c90 <fclose@plt>
   1f548: 340000c0     	cbz	w0, 0x1f560 <_Z15HandleImageFilePKcP10sfs_info_s+0x2f0>
   1f54c: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f550: 91325c21     	add	x1, x1, #0xc97
   1f554: 52800860     	mov	w0, #0x43               // =67
   1f558: 97ffd206     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   1f55c: 528003bb     	mov	w27, #0x1d              // =29
   1f560: b9400268     	ldr	w8, [x19]
   1f564: 7100091f     	cmp	w8, #0x2
   1f568: 54000521     	b.ne	0x1f60c <_Z15HandleImageFilePKcP10sfs_info_s+0x39c>
   1f56c: 394123e8     	ldrb	w8, [sp, #0x48]
   1f570: 371004e8     	tbnz	w8, #0x2, 0x1f60c <_Z15HandleImageFilePKcP10sfs_info_s+0x39c>
   1f574: 79413be8     	ldrh	w8, [sp, #0x9c]
   1f578: 7940b3e9     	ldrh	w9, [sp, #0x58]
   1f57c: 0b080128     	add	w8, w9, w8
   1f580: 790203e8     	strh	w8, [sp, #0x100]
   1f584: 79413fe8     	ldrh	w8, [sp, #0x9e]
   1f588: 790207e8     	strh	w8, [sp, #0x102]
   1f58c: 79414be8     	ldrh	w8, [sp, #0xa4]
   1f590: 0b080128     	add	w8, w9, w8
   1f594: 790213e8     	strh	w8, [sp, #0x108]
   1f598: 79414fe8     	ldrh	w8, [sp, #0xa6]
   1f59c: 790217e8     	strh	w8, [sp, #0x10a]
   1f5a0: 794163e8     	ldrh	w8, [sp, #0xb0]
   1f5a4: 0b080128     	add	w8, w9, w8
   1f5a8: 79022be8     	strh	w8, [sp, #0x114]
   1f5ac: 794167e8     	ldrh	w8, [sp, #0xb2]
   1f5b0: 79022fe8     	strh	w8, [sp, #0x116]
   1f5b4: 79415be8     	ldrh	w8, [sp, #0xac]
   1f5b8: 0b080128     	add	w8, w9, w8
   1f5bc: 790223e8     	strh	w8, [sp, #0x110]
   1f5c0: 79415fe8     	ldrh	w8, [sp, #0xae]
   1f5c4: 790227e8     	strh	w8, [sp, #0x112]
   1f5c8: 794143e8     	ldrh	w8, [sp, #0xa0]
   1f5cc: 0b080128     	add	w8, w9, w8
   1f5d0: 79020be8     	strh	w8, [sp, #0x104]
   1f5d4: 794147e8     	ldrh	w8, [sp, #0xa2]
   1f5d8: 79020fe8     	strh	w8, [sp, #0x106]
   1f5dc: 79416be8     	ldrh	w8, [sp, #0xb4]
   1f5e0: 0b080128     	add	w8, w9, w8
   1f5e4: 790233e8     	strh	w8, [sp, #0x118]
   1f5e8: 79416fe8     	ldrh	w8, [sp, #0xb6]
   1f5ec: 790237e8     	strh	w8, [sp, #0x11a]
   1f5f0: 794153e8     	ldrh	w8, [sp, #0xa8]
   1f5f4: 0b080128     	add	w8, w9, w8
   1f5f8: 79021be8     	strh	w8, [sp, #0x10c]
   1f5fc: 794157e8     	ldrh	w8, [sp, #0xaa]
   1f600: 79021fe8     	strh	w8, [sp, #0x10e]
   1f604: b940bfe8     	ldr	w8, [sp, #0xbc]
   1f608: b90123e8     	str	w8, [sp, #0x120]
   1f60c: b40000b7     	cbz	x23, 0x1f620 <_Z15HandleImageFilePKcP10sfs_info_s+0x3b0>
   1f610: 910123e1     	add	x1, sp, #0x48
   1f614: 321803e2     	orr	w2, wzr, #0x100
   1f618: aa1703e0     	mov	x0, x23
   1f61c: 97ffd2b5     	bl	0x140f0 <memcpy@plt>
   1f620: f94016c8     	ldr	x8, [x22, #0x28]
   1f624: f9401fe9     	ldr	x9, [sp, #0x38]
   1f628: eb09011f     	cmp	x8, x9
   1f62c: 540032a1     	b.ne	0x1fc80 <_Z15HandleImageFilePKcP10sfs_info_s+0xa10>
   1f630: 2a1b03e0     	mov	w0, w27
   1f634: a95a7bfd     	ldp	x29, x30, [sp, #0x1a0]
   1f638: a9594ff4     	ldp	x20, x19, [sp, #0x190]
   1f63c: a95857f6     	ldp	x22, x21, [sp, #0x180]
   1f640: a9575ff8     	ldp	x24, x23, [sp, #0x170]
   1f644: a95667fa     	ldp	x26, x25, [sp, #0x160]
   1f648: a9556ffc     	ldp	x28, x27, [sp, #0x150]
   1f64c: 9106c3ff     	add	sp, sp, #0x1b0
   1f650: d65f03c0     	ret
   1f654: a9425bf7     	ldp	x23, x22, [sp, #0x20]
   1f658: f9401bfc     	ldr	x28, [sp, #0x30]
   1f65c: f9400ff3     	ldr	x19, [sp, #0x18]
   1f660: b5fff655     	cbnz	x21, 0x1f528 <_Z15HandleImageFilePKcP10sfs_info_s+0x2b8>
   1f664: 17ffffb3     	b	0x1f530 <_Z15HandleImageFilePKcP10sfs_info_s+0x2c0>
   1f668: b9406ff9     	ldr	w25, [sp, #0x6c]
   1f66c: 3100073f     	cmn	w25, #0x1
   1f670: 54000480     	b.eq	0x1f700 <_Z15HandleImageFilePKcP10sfs_info_s+0x490>
   1f674: b94073e8     	ldr	w8, [sp, #0x70]
   1f678: f9401bfc     	ldr	x28, [sp, #0x30]
   1f67c: 3100051f     	cmn	w8, #0x1
   1f680: 54002f80     	b.eq	0x1fc70 <_Z15HandleImageFilePKcP10sfs_info_s+0xa00>
   1f684: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f688: 9121fc21     	add	x1, x1, #0x87f
   1f68c: 321a03e0     	orr	w0, wzr, #0x40
   1f690: 97ffd1b8     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   1f694: 320003e8     	orr	w8, wzr, #0x1
   1f698: f90097e8     	str	x8, [sp, #0x128]
   1f69c: 7940d3e8     	ldrh	w8, [sp, #0x68]
   1f6a0: 7940ebea     	ldrh	w10, [sp, #0x74]
   1f6a4: 2a1f03e9     	mov	w9, wzr
   1f6a8: b90127f9     	str	w25, [sp, #0x124]
   1f6ac: 790263e8     	strh	w8, [sp, #0x130]
   1f6b0: 7940cfe8     	ldrh	w8, [sp, #0x66]
   1f6b4: 79026bea     	strh	w10, [sp, #0x134]
   1f6b8: 320007ea     	orr	w10, wzr, #0x3
   1f6bc: 790267e8     	strh	w8, [sp, #0x132]
   1f6c0: 321d03e8     	orr	w8, wzr, #0x8
   1f6c4: 7940efeb     	ldrh	w11, [sp, #0x76]
   1f6c8: 910123ec     	add	x12, sp, #0x48
   1f6cc: 2a080128     	orr	w8, w9, w8
   1f6d0: 8b0a0589     	add	x9, x12, x10, lsl #1
   1f6d4: 7901d12b     	strh	w11, [x9, #0xe8]
   1f6d8: 7940c7fa     	ldrh	w26, [sp, #0x62]
   1f6dc: 530c7e69     	lsr	w9, w19, #12
   1f6e0: 12bfffaa     	mov	w10, #0x2ffff           // =196607
   1f6e4: 390123e8     	strb	w8, [sp, #0x48]
   1f6e8: 6b29235f     	cmp	w26, w9, uxth
   1f6ec: b9004ff9     	str	w25, [sp, #0x4c]
   1f6f0: 7900b7fa     	strh	w26, [sp, #0x5a]
   1f6f4: 54000101     	b.ne	0x1f714 <_Z15HandleImageFilePKcP10sfs_info_s+0x4a4>
   1f6f8: 321e03f3     	orr	w19, wzr, #0x4
   1f6fc: 1400000a     	b	0x1f724 <_Z15HandleImageFilePKcP10sfs_info_s+0x4b4>
   1f700: a9425bf7     	ldp	x23, x22, [sp, #0x20]
   1f704: f9401bfc     	ldr	x28, [sp, #0x30]
   1f708: f9400ff3     	ldr	x19, [sp, #0x18]
   1f70c: 5280063b     	mov	w27, #0x31              // =49
   1f710: 17ffff86     	b	0x1f528 <_Z15HandleImageFilePKcP10sfs_info_s+0x2b8>
   1f714: 6b0a033f     	cmp	w25, w10
   1f718: 320003e9     	orr	w9, wzr, #0x1
   1f71c: 1a899533     	cinc	w19, w9, hi
   1f720: 390123e8     	strb	w8, [sp, #0x48]
   1f724: 2a080268     	orr	w8, w19, w8
   1f728: 6b0a033f     	cmp	w25, w10
   1f72c: 390123e8     	strb	w8, [sp, #0x48]
   1f730: 54000129     	b.ls	0x1f754 <_Z15HandleImageFilePKcP10sfs_info_s+0x4e4>
   1f734: 794117e8     	ldrh	w8, [sp, #0x8a]
   1f738: 794113e9     	ldrh	w9, [sp, #0x88]
   1f73c: 11000508     	add	w8, w8, #0x1
   1f740: 4b090108     	sub	w8, w8, w9
   1f744: 12003d08     	and	w8, w8, #0xffff
   1f748: 1ad80d16     	sdiv	w22, w8, w24
   1f74c: 2a1803e8     	mov	w8, w24
   1f750: 14000003     	b	0x1f75c <_Z15HandleImageFilePKcP10sfs_info_s+0x4ec>
   1f754: 2a1f03e8     	mov	w8, wzr
   1f758: 2a1a03f6     	mov	w22, w26
   1f75c: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f760: 91261c21     	add	x1, x1, #0x987
   1f764: 321a03e0     	orr	w0, wzr, #0x40
   1f768: 2a1903e2     	mov	w2, w25
   1f76c: 7900b3f6     	strh	w22, [sp, #0x58]
   1f770: b90053e8     	str	w8, [sp, #0x50]
   1f774: 97ffd14f     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1f778: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f77c: 91268021     	add	x1, x1, #0x9a0
   1f780: 321a03e0     	orr	w0, wzr, #0x40
   1f784: 2a1a03e2     	mov	w2, w26
   1f788: 97ffd14a     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1f78c: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f790: 9126e821     	add	x1, x1, #0x9ba
   1f794: 321a03e0     	orr	w0, wzr, #0x40
   1f798: 2a1803e2     	mov	w2, w24
   1f79c: 97ffd145     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1f7a0: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f7a4: 12003ec2     	and	w2, w22, #0xffff
   1f7a8: 91276c21     	add	x1, x1, #0x9db
   1f7ac: 321a03e0     	orr	w0, wzr, #0x40
   1f7b0: 97ffd140     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1f7b4: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f7b8: 53021e62     	ubfx	w2, w19, #2, #6
   1f7bc: 9127ec21     	add	x1, x1, #0x9fb
   1f7c0: 321a03e0     	orr	w0, wzr, #0x40
   1f7c4: 12001e76     	and	w22, w19, #0xff
   1f7c8: 97ffd13a     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1f7cc: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f7d0: 12000262     	and	w2, w19, #0x1
   1f7d4: 91285021     	add	x1, x1, #0xa14
   1f7d8: 321a03e0     	orr	w0, wzr, #0x40
   1f7dc: 97ffd135     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1f7e0: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f7e4: 530106c2     	ubfx	w2, w22, #1, #1
   1f7e8: 9128c421     	add	x1, x1, #0xa31
   1f7ec: 321a03e0     	orr	w0, wzr, #0x40
   1f7f0: 97ffd130     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1f7f4: aa1403e0     	mov	x0, x20
   1f7f8: 97ffd156     	bl	0x13d50 <feof@plt>
   1f7fc: 34000060     	cbz	w0, 0x1f808 <_Z15HandleImageFilePKcP10sfs_info_s+0x598>
   1f800: 2a1f03fb     	mov	w27, wzr
   1f804: 1400011c     	b	0x1fc74 <_Z15HandleImageFilePKcP10sfs_info_s+0xa04>
   1f808: 529735b3     	mov	w19, #0xb9ad            // =47533
   1f80c: d0000079     	adrp	x25, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f810: 2a1f03f6     	mov	w22, wzr
   1f814: 321f03fa     	orr	w26, wzr, #0x2
   1f818: 72b7f593     	movk	w19, #0xbfac, lsl #16
   1f81c: 911e9339     	add	x25, x25, #0x7a4
   1f820: 910123f7     	add	x23, sp, #0x48
   1f824: 1400010e     	b	0x1fc5c <_Z15HandleImageFilePKcP10sfs_info_s+0x9ec>
   1f828: 321403e3     	orr	w3, wzr, #0x1000
   1f82c: aa1403e0     	mov	x0, x20
   1f830: 2a1a03e1     	mov	w1, w26
   1f834: aa1503e2     	mov	x2, x21
   1f838: 97ffd0ae     	bl	0x13af0 <_Z18ReadImageFileBlockP7__sFILEtPhm@plt>
   1f83c: 2a0003fb     	mov	w27, w0
   1f840: 350021bb     	cbnz	w27, 0x1fc74 <_Z15HandleImageFilePKcP10sfs_info_s+0xa04>
   1f844: b94002a8     	ldr	w8, [x21]
   1f848: 0b130108     	add	w8, w8, w19
   1f84c: 13886108     	ror	w8, w8, #0x18
   1f850: 71003d1f     	cmp	w8, #0xf
   1f854: 54001428     	b.hi	0x1fad8 <_Z15HandleImageFilePKcP10sfs_info_s+0x868>
   1f858: b8a87b28     	ldrsw	x8, [x25, x8, lsl #2]
   1f85c: 8b190108     	add	x8, x8, x25
   1f860: d61f0100     	br	x8
   1f864: 79400aa2     	ldrh	w2, [x21, #0x4]
   1f868: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f86c: 52800820     	mov	w0, #0x41               // =65
   1f870: 9129e021     	add	x1, x1, #0xa78
   1f874: 97ffd10f     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1f878: b94002a8     	ldr	w8, [x21]
   1f87c: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f880: 390113ff     	strb	wzr, [sp, #0x44]
   1f884: 321a03e0     	orr	w0, wzr, #0x40
   1f888: 390103e8     	strb	w8, [sp, #0x40]
   1f88c: 53087d09     	lsr	w9, w8, #8
   1f890: 53107d0a     	lsr	w10, w8, #16
   1f894: 53187d08     	lsr	w8, w8, #24
   1f898: 390107e9     	strb	w9, [sp, #0x41]
   1f89c: 39010bea     	strb	w10, [sp, #0x42]
   1f8a0: 39010fe8     	strb	w8, [sp, #0x43]
   1f8a4: 910103e2     	add	x2, sp, #0x40
   1f8a8: 912a8421     	add	x1, x1, #0xaa1
   1f8ac: 140000c9     	b	0x1fbd0 <_Z15HandleImageFilePKcP10sfs_info_s+0x960>
   1f8b0: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f8b4: 321a03e0     	orr	w0, wzr, #0x40
   1f8b8: 9125a421     	add	x1, x1, #0x969
   1f8bc: 97ffd12d     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   1f8c0: 79400aa2     	ldrh	w2, [x21, #0x4]
   1f8c4: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f8c8: 52800820     	mov	w0, #0x41               // =65
   1f8cc: 91293421     	add	x1, x1, #0xa4d
   1f8d0: 97ffd0f8     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1f8d4: 140000c0     	b	0x1fbd4 <_Z15HandleImageFilePKcP10sfs_info_s+0x964>
   1f8d8: b9404fe8     	ldr	w8, [sp, #0x4c]
   1f8dc: 12bfffa9     	mov	w9, #0x2ffff            // =196607
   1f8e0: 6b09011f     	cmp	w8, w9
   1f8e4: 54000fe9     	b.ls	0x1fae0 <_Z15HandleImageFilePKcP10sfs_info_s+0x870>
   1f8e8: b98057e8     	ldrsw	x8, [sp, #0x54]
   1f8ec: 394123e9     	ldrb	w9, [sp, #0x48]
   1f8f0: 910123fb     	add	x27, sp, #0x48
   1f8f4: 79400aa2     	ldrh	w2, [x21, #0x4]
   1f8f8: d1000508     	sub	x8, x8, #0x1
   1f8fc: 721e013f     	tst	w9, #0x4
   1f900: 9a9f1108     	csel	x8, x8, xzr, ne
   1f904: 52800c89     	mov	w9, #0x64               // =100
   1f908: 9b096d08     	madd	x8, x8, x9, x27
   1f90c: 7940d908     	ldrh	w8, [x8, #0x6c]
   1f910: 34001288     	cbz	w8, 0x1fb60 <_Z15HandleImageFilePKcP10sfs_info_s+0x8f0>
   1f914: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f918: 321a03e0     	orr	w0, wzr, #0x40
   1f91c: 91302c21     	add	x1, x1, #0xc0b
   1f920: 910123f7     	add	x23, sp, #0x48
   1f924: 97ffd0e3     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1f928: b94147e8     	ldr	w8, [sp, #0x144]
   1f92c: 11000508     	add	w8, w8, #0x1
   1f930: b90147e8     	str	w8, [sp, #0x144]
   1f934: 794283e8     	ldrh	w8, [sp, #0x140]
   1f938: 35000048     	cbnz	w8, 0x1f940 <_Z15HandleImageFilePKcP10sfs_info_s+0x6d0>
   1f93c: 790283fa     	strh	w26, [sp, #0x140]
   1f940: 79400aa8     	ldrh	w8, [x21, #0x4]
   1f944: 794287e9     	ldrh	w9, [sp, #0x142]
   1f948: 0b080128     	add	w8, w9, w8
   1f94c: 790287e8     	strh	w8, [sp, #0x142]
   1f950: 1400008e     	b	0x1fb88 <_Z15HandleImageFilePKcP10sfs_info_s+0x918>
   1f954: 79400aa2     	ldrh	w2, [x21, #0x4]
   1f958: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f95c: 321a03e0     	orr	w0, wzr, #0x40
   1f960: 912fb021     	add	x1, x1, #0xbec
   1f964: 97ffd0d3     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1f968: 79400aa8     	ldrh	w8, [x21, #0x4]
   1f96c: 52800c89     	mov	w9, #0x64               // =100
   1f970: 9b295ec9     	smaddl	x9, w22, w9, x23
   1f974: 7900b93a     	strh	w26, [x9, #0x5c]
   1f978: 7900bd28     	strh	w8, [x9, #0x5e]
   1f97c: 14000097     	b	0x1fbd8 <_Z15HandleImageFilePKcP10sfs_info_s+0x968>
   1f980: 79400aa2     	ldrh	w2, [x21, #0x4]
   1f984: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f988: 321a03e0     	orr	w0, wzr, #0x40
   1f98c: 912f3421     	add	x1, x1, #0xbcd
   1f990: 97ffd0c8     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1f994: 79400aa8     	ldrh	w8, [x21, #0x4]
   1f998: 52800c89     	mov	w9, #0x64               // =100
   1f99c: 9b295ec9     	smaddl	x9, w22, w9, x23
   1f9a0: 7900b13a     	strh	w26, [x9, #0x58]
   1f9a4: 7900b528     	strh	w8, [x9, #0x5a]
   1f9a8: 1400008c     	b	0x1fbd8 <_Z15HandleImageFilePKcP10sfs_info_s+0x968>
   1f9ac: 79400aa2     	ldrh	w2, [x21, #0x4]
   1f9b0: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f9b4: 321a03e0     	orr	w0, wzr, #0x40
   1f9b8: 912bf821     	add	x1, x1, #0xafe
   1f9bc: 97ffd0bd     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1f9c0: 79400aa8     	ldrh	w8, [x21, #0x4]
   1f9c4: 52800c89     	mov	w9, #0x64               // =100
   1f9c8: 9b295ec9     	smaddl	x9, w22, w9, x23
   1f9cc: 7900d93a     	strh	w26, [x9, #0x6c]
   1f9d0: 7900dd28     	strh	w8, [x9, #0x6e]
   1f9d4: 394123e9     	ldrb	w9, [sp, #0x48]
   1f9d8: 721f013f     	tst	w9, #0x2
   1f9dc: 1a9f0508     	csinc	w8, w8, wzr, eq
   1f9e0: 710002df     	cmp	w22, #0x0
   1f9e4: 0b18011a     	add	w26, w8, w24
   1f9e8: 1a9616d6     	cinc	w22, w22, eq
   1f9ec: 1400007c     	b	0x1fbdc <_Z15HandleImageFilePKcP10sfs_info_s+0x96c>
   1f9f0: 79400aa2     	ldrh	w2, [x21, #0x4]
   1f9f4: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f9f8: 321a03e0     	orr	w0, wzr, #0x40
   1f9fc: 912c7c21     	add	x1, x1, #0xb1f
   1fa00: 97ffd0ac     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1fa04: 394123e8     	ldrb	w8, [sp, #0x48]
   1fa08: 371807c8     	tbnz	w8, #0x3, 0x1fb00 <_Z15HandleImageFilePKcP10sfs_info_s+0x890>
   1fa0c: 36200e48     	tbz	w8, #0x4, 0x1fbd4 <_Z15HandleImageFilePKcP10sfs_info_s+0x964>
   1fa10: 7940dfe9     	ldrh	w9, [sp, #0x6e]
   1fa14: 12003f48     	and	w8, w26, #0xffff
   1fa18: 6b09011f     	cmp	w8, w9
   1fa1c: 54000e81     	b.ne	0x1fbec <_Z15HandleImageFilePKcP10sfs_info_s+0x97c>
   1fa20: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1fa24: 321a03e0     	orr	w0, wzr, #0x40
   1fa28: 912cf421     	add	x1, x1, #0xb3d
   1fa2c: 97ffd0d1     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   1fa30: 52800c88     	mov	w8, #0x64               // =100
   1fa34: 9b285ec8     	smaddl	x8, w22, w8, x23
   1fa38: 91019113     	add	x19, x8, #0x64
   1fa3c: 1400007e     	b	0x1fc34 <_Z15HandleImageFilePKcP10sfs_info_s+0x9c4>
   1fa40: 79400aa2     	ldrh	w2, [x21, #0x4]
   1fa44: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1fa48: 321a03e0     	orr	w0, wzr, #0x40
   1fa4c: 912b5c21     	add	x1, x1, #0xad7
   1fa50: 97ffd098     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1fa54: 79400aaa     	ldrh	w10, [x21, #0x4]
   1fa58: 52800c88     	mov	w8, #0x64               // =100
   1fa5c: 9b285ec9     	smaddl	x9, w22, w8, x23
   1fa60: 12003f48     	and	w8, w26, #0xffff
   1fa64: 713ffd1f     	cmp	w8, #0xfff
   1fa68: 7900d13a     	strh	w26, [x9, #0x68]
   1fa6c: 7900d52a     	strh	w10, [x9, #0x6a]
   1fa70: b900753f     	str	wzr, [x9, #0x74]
   1fa74: 540002a9     	b.ls	0x1fac8 <_Z15HandleImageFilePKcP10sfs_info_s+0x858>
   1fa78: 14000018     	b	0x1fad8 <_Z15HandleImageFilePKcP10sfs_info_s+0x868>
   1fa7c: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1fa80: 321a03e0     	orr	w0, wzr, #0x40
   1fa84: 912ae821     	add	x1, x1, #0xaba
   1fa88: 97ffd0ba     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   1fa8c: 52800c88     	mov	w8, #0x64               // =100
   1fa90: 910123e9     	add	x9, sp, #0x48
   1fa94: 9b2826c8     	smaddl	x8, w22, w8, x9
   1fa98: 710006df     	cmp	w22, #0x1
   1fa9c: 320003e9     	orr	w9, wzr, #0x1
   1faa0: 7900e11a     	strh	w26, [x8, #0x70]
   1faa4: 7900e509     	strh	w9, [x8, #0x72]
   1faa8: 54000081     	b.ne	0x1fab8 <_Z15HandleImageFilePKcP10sfs_info_s+0x848>
   1faac: 320003e8     	orr	w8, wzr, #0x1
   1fab0: 790173fa     	strh	w26, [sp, #0xb8]
   1fab4: 790177e8     	strh	w8, [sp, #0xba]
   1fab8: 12003f48     	and	w8, w26, #0xffff
   1fabc: 910123f7     	add	x23, sp, #0x48
   1fac0: 713ffd1f     	cmp	w8, #0xfff
   1fac4: 540000a8     	b.hi	0x1fad8 <_Z15HandleImageFilePKcP10sfs_info_s+0x868>
   1fac8: d37ef508     	lsl	x8, x8, #2
   1facc: 38686b89     	ldrb	w9, [x28, x8]
   1fad0: 32000129     	orr	w9, w9, #0x1
   1fad4: 38286b89     	strb	w9, [x28, x8]
   1fad8: 1100075a     	add	w26, w26, #0x1
   1fadc: 14000040     	b	0x1fbdc <_Z15HandleImageFilePKcP10sfs_info_s+0x96c>
   1fae0: 79400aa2     	ldrh	w2, [x21, #0x4]
   1fae4: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1fae8: 321a03e0     	orr	w0, wzr, #0x40
   1faec: 91317821     	add	x1, x1, #0xc5e
   1faf0: 97ffd070     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1faf4: 52800c88     	mov	w8, #0x64               // =100
   1faf8: 9b285ec8     	smaddl	x8, w22, w8, x23
   1fafc: 14000020     	b	0x1fb7c <_Z15HandleImageFilePKcP10sfs_info_s+0x90c>
   1fb00: 7940efe9     	ldrh	w9, [sp, #0x76]
   1fb04: 12003f48     	and	w8, w26, #0xffff
   1fb08: 93407ed3     	sxtw	x19, w22
   1fb0c: 6b09011f     	cmp	w8, w9
   1fb10: 54000121     	b.ne	0x1fb34 <_Z15HandleImageFilePKcP10sfs_info_s+0x8c4>
   1fb14: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1fb18: 321a03e0     	orr	w0, wzr, #0x40
   1fb1c: 912cf421     	add	x1, x1, #0xb3d
   1fb20: 97ffd094     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   1fb24: 52800c88     	mov	w8, #0x64               // =100
   1fb28: 9b085e68     	madd	x8, x19, x8, x23
   1fb2c: 91019113     	add	x19, x8, #0x64
   1fb30: 14000041     	b	0x1fc34 <_Z15HandleImageFilePKcP10sfs_info_s+0x9c4>
   1fb34: 7940ebe9     	ldrh	w9, [sp, #0x74]
   1fb38: 6b09011f     	cmp	w8, w9
   1fb3c: 540006e1     	b.ne	0x1fc18 <_Z15HandleImageFilePKcP10sfs_info_s+0x9a8>
   1fb40: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1fb44: 321a03e0     	orr	w0, wzr, #0x40
   1fb48: 912d7c21     	add	x1, x1, #0xb5f
   1fb4c: 97ffd089     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   1fb50: 52800c88     	mov	w8, #0x64               // =100
   1fb54: 9b085e68     	madd	x8, x19, x8, x23
   1fb58: 91018113     	add	x19, x8, #0x60
   1fb5c: 14000036     	b	0x1fc34 <_Z15HandleImageFilePKcP10sfs_info_s+0x9c4>
   1fb60: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1fb64: 321a03e0     	orr	w0, wzr, #0x40
   1fb68: 9130cc21     	add	x1, x1, #0xc33
   1fb6c: 52800c9a     	mov	w26, #0x64              // =100
   1fb70: 97ffd050     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1fb74: 910123f7     	add	x23, sp, #0x48
   1fb78: 9b3a6ec8     	smaddl	x8, w22, w26, x27
   1fb7c: b9407509     	ldr	w9, [x8, #0x74]
   1fb80: 11000529     	add	w9, w9, #0x1
   1fb84: b9007509     	str	w9, [x8, #0x74]
   1fb88: b9400aa8     	ldr	w8, [x21, #0x8]
   1fb8c: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1fb90: 321a03e0     	orr	w0, wzr, #0x40
   1fb94: 910103e2     	add	x2, sp, #0x40
   1fb98: 53083509     	ubfx	w9, w8, #8, #6
   1fb9c: 530e4d0a     	ubfx	w10, w8, #14, #6
   1fba0: 5314650b     	ubfx	w11, w8, #20, #6
   1fba4: 531a7d08     	lsr	w8, w8, #26
   1fba8: 11008129     	add	w9, w9, #0x20
   1fbac: 1100814a     	add	w10, w10, #0x20
   1fbb0: 1100816b     	add	w11, w11, #0x20
   1fbb4: 11008108     	add	w8, w8, #0x20
   1fbb8: 9131f021     	add	x1, x1, #0xc7c
   1fbbc: 390103e9     	strb	w9, [sp, #0x40]
   1fbc0: 390107ea     	strb	w10, [sp, #0x41]
   1fbc4: 39010beb     	strb	w11, [sp, #0x42]
   1fbc8: 39010fe8     	strb	w8, [sp, #0x43]
   1fbcc: 390113ff     	strb	wzr, [sp, #0x44]
   1fbd0: 97ffd090     	bl	0x13e10 <_Z9LogStringjPKcS0_@plt>
   1fbd4: 79400aa8     	ldrh	w8, [x21, #0x4]
   1fbd8: 0b18011a     	add	w26, w8, w24
   1fbdc: aa1403e0     	mov	x0, x20
   1fbe0: 97ffd05c     	bl	0x13d50 <feof@plt>
   1fbe4: 340003c0     	cbz	w0, 0x1fc5c <_Z15HandleImageFilePKcP10sfs_info_s+0x9ec>
   1fbe8: 17ffff06     	b	0x1f800 <_Z15HandleImageFilePKcP10sfs_info_s+0x590>
   1fbec: 7940dbe9     	ldrh	w9, [sp, #0x6c]
   1fbf0: 321a03e0     	orr	w0, wzr, #0x40
   1fbf4: 6b09011f     	cmp	w8, w9
   1fbf8: 540002a1     	b.ne	0x1fc4c <_Z15HandleImageFilePKcP10sfs_info_s+0x9dc>
   1fbfc: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1fc00: 912d7c21     	add	x1, x1, #0xb5f
   1fc04: 97ffd05b     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   1fc08: 52800c88     	mov	w8, #0x64               // =100
   1fc0c: 9b285ec8     	smaddl	x8, w22, w8, x23
   1fc10: 91018113     	add	x19, x8, #0x60
   1fc14: 14000008     	b	0x1fc34 <_Z15HandleImageFilePKcP10sfs_info_s+0x9c4>
   1fc18: 52800c88     	mov	w8, #0x64               // =100
   1fc1c: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1fc20: 9b285ec8     	smaddl	x8, w22, w8, x23
   1fc24: 321a03e0     	orr	w0, wzr, #0x40
   1fc28: 912e0821     	add	x1, x1, #0xb82
   1fc2c: 91015113     	add	x19, x8, #0x54
   1fc30: 97ffd050     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   1fc34: 79400aa8     	ldrh	w8, [x21, #0x4]
   1fc38: 7900027a     	strh	w26, [x19]
   1fc3c: 79000668     	strh	w8, [x19, #0x2]
   1fc40: 529735b3     	mov	w19, #0xb9ad            // =47533
   1fc44: 72b7f593     	movk	w19, #0xbfac, lsl #16
   1fc48: 17ffffe3     	b	0x1fbd4 <_Z15HandleImageFilePKcP10sfs_info_s+0x964>
   1fc4c: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1fc50: 912e9021     	add	x1, x1, #0xba4
   1fc54: 97ffd047     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   1fc58: 17ffffdf     	b	0x1fbd4 <_Z15HandleImageFilePKcP10sfs_info_s+0x964>
   1fc5c: b94017e8     	ldr	w8, [sp, #0x14]
   1fc60: 12003f58     	and	w24, w26, #0xffff
   1fc64: 6b18011f     	cmp	w8, w24
   1fc68: 54ffde08     	b.hi	0x1f828 <_Z15HandleImageFilePKcP10sfs_info_s+0x5b8>
   1fc6c: 17fffee5     	b	0x1f800 <_Z15HandleImageFilePKcP10sfs_info_s+0x590>
   1fc70: 5280063b     	mov	w27, #0x31              // =49
   1fc74: a9425bf7     	ldp	x23, x22, [sp, #0x20]
   1fc78: f9400ff3     	ldr	x19, [sp, #0x18]
   1fc7c: 17fffe2b     	b	0x1f528 <_Z15HandleImageFilePKcP10sfs_info_s+0x2b8>
   1fc80: 97ffd01c     	bl	0x13cf0 <__stack_chk_fail@plt>
