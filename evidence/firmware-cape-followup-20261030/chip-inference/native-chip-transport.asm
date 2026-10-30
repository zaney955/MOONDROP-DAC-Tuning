
evidence/android-arm64/libCxAudioHidLib.so:	file format elf64-littleaarch64

Disassembly of section .text:

0000000000014460 <_ZN16CxAudioHidDevice10InitializeE20_CXHID_AUDIO_DEVTYPEjP13_HID_DEV_INFO>:
   14460: a9be4ff4     	stp	x20, x19, [sp, #-0x20]!
   14464: a9017bfd     	stp	x29, x30, [sp, #0x10]
   14468: 910043fd     	add	x29, sp, #0x10
   1446c: aa0003f3     	mov	x19, x0
   14470: f9400268     	ldr	x8, [x19]
   14474: 2a0103f4     	mov	w20, w1
   14478: aa0303e1     	mov	x1, x3
   1447c: f9401508     	ldr	x8, [x8, #0x28]
   14480: d63f0100     	blr	x8
   14484: b9044274     	str	w20, [x19, #0x440]
   14488: f000018a     	adrp	x10, 0x47000 <_ZTV18CxAudioHidDev2089x+0x198>
   1448c: f947dd4a     	ldr	x10, [x10, #0xfb8]
   14490: 321c07e9     	orr	w9, wzr, #0x30
   14494: 93407e88     	sxtw	x8, w20
   14498: 7100229f     	cmp	w20, #0x8
   1449c: 9b292a89     	smaddl	x9, w20, w9, x10
   144a0: 54000061     	b.ne	0x144ac <_ZN16CxAudioHidDevice10InitializeE20_CXHID_AUDIO_DEVTYPEjP13_HID_DEV_INFO+0x4c>
   144a4: aa1f03ea     	mov	x10, xzr
   144a8: 1400002f     	b	0x14564 <_ZN16CxAudioHidDevice10InitializeE20_CXHID_AUDIO_DEVTYPEjP13_HID_DEV_INFO+0x104>
   144ac: 321c07eb     	orr	w11, wzr, #0x30
   144b0: 9b0b290a     	madd	x10, x8, x11, x10
   144b4: f940054a     	ldr	x10, [x10, #0x8]
   144b8: f940114b     	ldr	x11, [x10, #0x20]
   144bc: f900e26b     	str	x11, [x19, #0x1c0]
   144c0: 3dc00540     	ldr	q0, [x10, #0x10]
   144c4: 3d806e60     	str	q0, [x19, #0x1b0]
   144c8: 3dc00140     	ldr	q0, [x10]
   144cc: 3d806a60     	str	q0, [x19, #0x1a0]
   144d0: f940254b     	ldr	x11, [x10, #0x48]
   144d4: f900f66b     	str	x11, [x19, #0x1e8]
   144d8: 3cc38140     	ldur	q0, [x10, #0x38]
   144dc: 9107626b     	add	x11, x19, #0x1d8
   144e0: 3d800160     	str	q0, [x11]
   144e4: 3cc28140     	ldur	q0, [x10, #0x28]
   144e8: 9107226b     	add	x11, x19, #0x1c8
   144ec: 3d800160     	str	q0, [x11]
   144f0: f940394b     	ldr	x11, [x10, #0x70]
   144f4: f9010a6b     	str	x11, [x19, #0x210]
   144f8: 3dc01940     	ldr	q0, [x10, #0x60]
   144fc: 3d808260     	str	q0, [x19, #0x200]
   14500: 3dc01540     	ldr	q0, [x10, #0x50]
   14504: 3d807e60     	str	q0, [x19, #0x1f0]
   14508: f9404d4b     	ldr	x11, [x10, #0x98]
   1450c: f9011e6b     	str	x11, [x19, #0x238]
   14510: 3cc88140     	ldur	q0, [x10, #0x88]
   14514: 9108a26b     	add	x11, x19, #0x228
   14518: 3d800160     	str	q0, [x11]
   1451c: 3cc78140     	ldur	q0, [x10, #0x78]
   14520: 9108626b     	add	x11, x19, #0x218
   14524: 3d800160     	str	q0, [x11]
   14528: f940614b     	ldr	x11, [x10, #0xc0]
   1452c: f901326b     	str	x11, [x19, #0x260]
   14530: 3dc02d40     	ldr	q0, [x10, #0xb0]
   14534: 3d809660     	str	q0, [x19, #0x250]
   14538: 3dc02940     	ldr	q0, [x10, #0xa0]
   1453c: 3d809260     	str	q0, [x19, #0x240]
   14540: f940754b     	ldr	x11, [x10, #0xe8]
   14544: f901466b     	str	x11, [x19, #0x288]
   14548: 3ccd8140     	ldur	q0, [x10, #0xd8]
   1454c: 9109e26b     	add	x11, x19, #0x278
   14550: 3d800160     	str	q0, [x11]
   14554: 3ccc8140     	ldur	q0, [x10, #0xc8]
   14558: 9106826a     	add	x10, x19, #0x1a0
   1455c: 9109a26b     	add	x11, x19, #0x268
   14560: 3d800160     	str	q0, [x11]
   14564: f9014e6a     	str	x10, [x19, #0x298]
   14568: ad408122     	ldp	q2, q0, [x9, #0x10]
   1456c: 3dc00121     	ldr	q1, [x9]
   14570: f0000189     	adrp	x9, 0x47000 <_ZTV18CxAudioHidDev2089x+0x198>
   14574: f947cd29     	ldr	x9, [x9, #0xf98]
   14578: 5280158b     	mov	w11, #0xac              // =172
   1457c: 910e526a     	add	x10, x19, #0x394
   14580: ad150262     	stp	q2, q0, [x19, #0x2a0]
   14584: d503201f     	nop
   14588: 9b0b250b     	madd	x11, x8, x11, x9
   1458c: 9102b16c     	add	x12, x11, #0xac
   14590: eb0c015f     	cmp	x10, x12
   14594: 3d80a661     	str	q1, [x19, #0x290]
   14598: 540000c2     	b.hs	0x145b0 <_ZN16CxAudioHidDevice10InitializeE20_CXHID_AUDIO_DEVTYPEjP13_HID_DEV_INFO+0x150>
   1459c: 9111026c     	add	x12, x19, #0x440
   145a0: eb0c017f     	cmp	x11, x12
   145a4: 54000062     	b.hs	0x145b0 <_ZN16CxAudioHidDevice10InitializeE20_CXHID_AUDIO_DEVTYPEjP13_HID_DEV_INFO+0x150>
   145a8: aa1f03ea     	mov	x10, xzr
   145ac: 14000020     	b	0x1462c <_ZN16CxAudioHidDevice10InitializeE20_CXHID_AUDIO_DEVTYPEjP13_HID_DEV_INFO+0x1cc>
   145b0: 5280158b     	mov	w11, #0xac              // =172
   145b4: 9b0b250b     	madd	x11, x8, x11, x9
   145b8: ad400560     	ldp	q0, q1, [x11]
   145bc: 3d800140     	str	q0, [x10]
   145c0: 910e926a     	add	x10, x19, #0x3a4
   145c4: 3dc00960     	ldr	q0, [x11, #0x20]
   145c8: 3d800141     	str	q1, [x10]
   145cc: 3dc00d61     	ldr	q1, [x11, #0x30]
   145d0: 910ed26a     	add	x10, x19, #0x3b4
   145d4: 3d800140     	str	q0, [x10]
   145d8: 910f126a     	add	x10, x19, #0x3c4
   145dc: 3dc01160     	ldr	q0, [x11, #0x40]
   145e0: 3d800141     	str	q1, [x10]
   145e4: 3dc01561     	ldr	q1, [x11, #0x50]
   145e8: 910f526a     	add	x10, x19, #0x3d4
   145ec: 3d800140     	str	q0, [x10]
   145f0: 910f926a     	add	x10, x19, #0x3e4
   145f4: 3dc01960     	ldr	q0, [x11, #0x60]
   145f8: 3d800141     	str	q1, [x10]
   145fc: 3dc01d61     	ldr	q1, [x11, #0x70]
   14600: 910fd26a     	add	x10, x19, #0x3f4
   14604: 3d800140     	str	q0, [x10]
   14608: 9110126a     	add	x10, x19, #0x404
   1460c: 3dc02160     	ldr	q0, [x11, #0x80]
   14610: 3d800141     	str	q1, [x10]
   14614: 3dc02561     	ldr	q1, [x11, #0x90]
   14618: 9110526a     	add	x10, x19, #0x414
   1461c: 3d800140     	str	q0, [x10]
   14620: 9110926a     	add	x10, x19, #0x424
   14624: 3d800141     	str	q1, [x10]
   14628: 5280050a     	mov	w10, #0x28              // =40
   1462c: 5280158b     	mov	w11, #0xac              // =172
   14630: 9b0b2508     	madd	x8, x8, x11, x9
   14634: d37ef549     	lsl	x9, x10, #2
   14638: b869690b     	ldr	w11, [x8, x9]
   1463c: 9100054a     	add	x10, x10, #0x1
   14640: 8b090269     	add	x9, x19, x9
   14644: f100ad5f     	cmp	x10, #0x2b
   14648: b903952b     	str	w11, [x9, #0x394]
   1464c: 54ffff41     	b.ne	0x14634 <_ZN16CxAudioHidDevice10InitializeE20_CXHID_AUDIO_DEVTYPEjP13_HID_DEV_INFO+0x1d4>
   14650: a9417bfd     	ldp	x29, x30, [sp, #0x10]
   14654: a8c24ff4     	ldp	x20, x19, [sp], #0x20
   14658: d65f03c0     	ret

0000000000014740 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK>:
   14740: a9ba6ffc     	stp	x28, x27, [sp, #-0x60]!
   14744: a90167fa     	stp	x26, x25, [sp, #0x10]
   14748: a9025ff8     	stp	x24, x23, [sp, #0x20]
   1474c: a90357f6     	stp	x22, x21, [sp, #0x30]
   14750: a9044ff4     	stp	x20, x19, [sp, #0x40]
   14754: a9057bfd     	stp	x29, x30, [sp, #0x50]
   14758: 910143fd     	add	x29, sp, #0x50
   1475c: d11983ff     	sub	sp, sp, #0x660
   14760: b9007fe3     	str	w3, [sp, #0x7c]
   14764: d53bd053     	mrs	x19, TPIDR_EL0
   14768: f9401668     	ldr	x8, [x19, #0x28]
   1476c: 9104c3e9     	add	x9, sp, #0x130
   14770: 2a0203f9     	mov	w25, w2
   14774: 2a0103f7     	mov	w23, w1
   14778: aa0003f5     	mov	x21, x0
   1477c: 910283ea     	add	x10, sp, #0xa0
   14780: b27e0120     	orr	x0, x9, #0x4
   14784: 5280a402     	mov	w2, #0x520              // =1312
   14788: 2a1f03e1     	mov	w1, wzr
   1478c: 2a0703fb     	mov	w27, w7
   14790: aa0603f4     	mov	x20, x6
   14794: 2a0503fa     	mov	w26, w5
   14798: 2a0403f6     	mov	w22, w4
   1479c: f9000148     	str	x8, [x10]
   147a0: 97fffe6c     	bl	0x14150 <memset@plt>
   147a4: 5280a488     	mov	w8, #0x524              // =1316
   147a8: 91009ffe     	add	x30, sp, #0x27
   147ac: 6f00e400     	movi	v0.2d, #0000000000000000
   147b0: f80ff3df     	stur	xzr, [x30, #0xff]
   147b4: f90093ff     	str	xzr, [sp, #0x120]
   147b8: f80e63ff     	stur	xzr, [sp, #0xe6]
   147bc: f90073ff     	str	xzr, [sp, #0xe0]
   147c0: b90133e8     	str	w8, [sp, #0x130]
   147c4: ad0803e0     	stp	q0, q0, [sp, #0x100]
   147c8: 3d803fe0     	str	q0, [sp, #0xf0]
   147cc: ad0603e0     	stp	q0, q0, [sp, #0xc0]
   147d0: 3d802fe0     	str	q0, [sp, #0xb0]
   147d4: b94442a8     	ldr	w8, [x21, #0x440]
   147d8: 910a42a9     	add	x9, x21, #0x290
   147dc: 7100251f     	cmp	w8, #0x9
   147e0: 9a9f3129     	csel	x9, x9, xzr, lo
   147e4: 7100211f     	cmp	w8, #0x8
   147e8: a908a7f5     	stp	x21, x9, [sp, #0x88]
   147ec: 540000c8     	b.hi	0x14804 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0xc4>
   147f0: f9400528     	ldr	x8, [x9, #0x8]
   147f4: f100011f     	cmp	x8, #0x0
   147f8: 52800168     	mov	w8, #0xb                // =11
   147fc: 1a9f0108     	csel	w8, w8, wzr, eq
   14800: 14000002     	b	0x14808 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0xc8>
   14804: 52800148     	mov	w8, #0xa                // =10
   14808: 7100011f     	cmp	w8, #0x0
   1480c: 7a410ae0     	ccmp	w23, #0x1, #0x0, eq
   14810: 52800169     	mov	w9, #0xb                // =11
   14814: 1a888128     	csel	w8, w9, w8, hi
   14818: f90023f3     	str	x19, [sp, #0x40]
   1481c: 34000068     	cbz	w8, 0x14828 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0xe8>
   14820: aa1f03f5     	mov	x21, xzr
   14824: 14000029     	b	0x148c8 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x188>
   14828: 7100173f     	cmp	w25, #0x5
   1482c: 54000208     	b.hi	0x1486c <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x12c>
   14830: f94047ea     	ldr	x10, [sp, #0x88]
   14834: 52800509     	mov	w9, #0x28               // =40
   14838: 93407f28     	sxtw	x8, w25
   1483c: 710006ff     	cmp	w23, #0x1
   14840: 9b292b29     	smaddl	x9, w25, w9, x10
   14844: 91068135     	add	x21, x9, #0x1a0
   14848: 54000180     	b.eq	0x14878 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x138>
   1484c: 35000217     	cbnz	w23, 0x1488c <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x14c>
   14850: f94047ea     	ldr	x10, [sp, #0x88]
   14854: 52800509     	mov	w9, #0x28               // =40
   14858: 9b092909     	madd	x9, x8, x9, x10
   1485c: 39469129     	ldrb	w9, [x9, #0x1a4]
   14860: 37000169     	tbnz	w9, #0x0, 0x1488c <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x14c>
   14864: 32000fe8     	orr	w8, wzr, #0xf
   14868: 14000018     	b	0x148c8 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x188>
   1486c: aa1f03f5     	mov	x21, xzr
   14870: 321f0be8     	orr	w8, wzr, #0xe
   14874: 14000015     	b	0x148c8 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x188>
   14878: f94047ea     	ldr	x10, [sp, #0x88]
   1487c: 52800509     	mov	w9, #0x28               // =40
   14880: 9b092909     	madd	x9, x8, x9, x10
   14884: 39469129     	ldrb	w9, [x9, #0x1a4]
   14888: 360ffee9     	tbz	w9, #0x1, 0x14864 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x124>
   1488c: f94047ea     	ldr	x10, [sp, #0x88]
   14890: 52800509     	mov	w9, #0x28               // =40
   14894: 9b092909     	madd	x9, x8, x9, x10
   14898: b941a929     	ldr	w9, [x9, #0x1a8]
   1489c: 6b16013f     	cmp	w9, w22
   148a0: 540000e8     	b.hi	0x148bc <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x17c>
   148a4: f94047ea     	ldr	x10, [sp, #0x88]
   148a8: 52800509     	mov	w9, #0x28               // =40
   148ac: 9b092908     	madd	x8, x8, x9, x10
   148b0: b941ad08     	ldr	w8, [x8, #0x1ac]
   148b4: 6b16011f     	cmp	w8, w22
   148b8: 54000062     	b.hs	0x148c4 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x184>
   148bc: 321c03e8     	orr	w8, wzr, #0x10
   148c0: 14000002     	b	0x148c8 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x188>
   148c4: 2a1f03e8     	mov	w8, wzr
   148c8: f9400ba9     	ldr	x9, [x29, #0x10]
   148cc: f9001fe9     	str	x9, [sp, #0x38]
   148d0: 2a1a0109     	orr	w9, w8, w26
   148d4: 7100013f     	cmp	w9, #0x0
   148d8: 32000fe9     	orr	w9, wzr, #0xf
   148dc: 1a880128     	csel	w8, w9, w8, eq
   148e0: 350000e8     	cbnz	w8, 0x148fc <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x1bc>
   148e4: b94016a8     	ldr	w8, [x21, #0x14]
   148e8: 0b1a02c9     	add	w9, w22, w26
   148ec: 51000529     	sub	w9, w9, #0x1
   148f0: 6b08013f     	cmp	w9, w8
   148f4: 1a9f97e8     	cset	w8, hi
   148f8: 531c6d08     	lsl	w8, w8, #4
   148fc: 7100011f     	cmp	w8, #0x0
   14900: 52800229     	mov	w9, #0x11               // =17
   14904: fa400a80     	ccmp	x20, #0x0, #0x0, eq
   14908: 1a880128     	csel	w8, w9, w8, eq
   1490c: 2a1b0109     	orr	w9, w8, w27
   14910: 7100013f     	cmp	w9, #0x0
   14914: 52800249     	mov	w9, #0x12               // =18
   14918: 1a880133     	csel	w19, w9, w8, eq
   1491c: b90037f6     	str	w22, [sp, #0x34]
   14920: 34000413     	cbz	w19, 0x149a0 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x260>
   14924: f9401fe0     	ldr	x0, [sp, #0x38]
   14928: b40001e0     	cbz	x0, 0x14964 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x224>
   1492c: b94037e9     	ldr	w9, [sp, #0x34]
   14930: b94143e8     	ldr	w8, [sp, #0x140]
   14934: 9104c3e1     	add	x1, sp, #0x130
   14938: b9015fe9     	str	w9, [sp, #0x15c]
   1493c: 0b080128     	add	w8, w9, w8
   14940: 51000508     	sub	w8, w8, #0x1
   14944: b90163e8     	str	w8, [sp, #0x160]
   14948: b9400008     	ldr	w8, [x0]
   1494c: b94133e9     	ldr	w9, [sp, #0x130]
   14950: 6b09011f     	cmp	w8, w9
   14954: 9104c3e8     	add	x8, sp, #0x130
   14958: 9a883008     	csel	x8, x0, x8, lo
   1495c: b9400102     	ldr	w2, [x8]
   14960: 97fffde4     	bl	0x140f0 <memcpy@plt>
   14964: f94023e8     	ldr	x8, [sp, #0x40]
   14968: 910283e9     	add	x9, sp, #0xa0
   1496c: f9401508     	ldr	x8, [x8, #0x28]
   14970: f9400129     	ldr	x9, [x9]
   14974: eb09011f     	cmp	x8, x9
   14978: 54002b01     	b.ne	0x14ed8 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x798>
   1497c: 2a1303e0     	mov	w0, w19
   14980: 911983ff     	add	sp, sp, #0x660
   14984: a9457bfd     	ldp	x29, x30, [sp, #0x50]
   14988: a9444ff4     	ldp	x20, x19, [sp, #0x40]
   1498c: a94357f6     	ldp	x22, x21, [sp, #0x30]
   14990: a9425ff8     	ldp	x24, x23, [sp, #0x20]
   14994: a94167fa     	ldp	x26, x25, [sp, #0x10]
   14998: a8c66ffc     	ldp	x28, x27, [sp], #0x60
   1499c: d65f03c0     	ret
   149a0: 6f00e400     	movi	v0.2d, #0000000000000000
   149a4: f80e63ff     	stur	xzr, [sp, #0xe6]
   149a8: f90073ff     	str	xzr, [sp, #0xe0]
   149ac: ad0603e0     	stp	q0, q0, [sp, #0xc0]
   149b0: 3d802fe0     	str	q0, [sp, #0xb0]
   149b4: 394062a8     	ldrb	w8, [x21, #0x18]
   149b8: 6b1b035f     	cmp	w26, w27
   149bc: 1a9b3349     	csel	w9, w26, w27, lo
   149c0: 710002ff     	cmp	w23, #0x0
   149c4: 1a9a013a     	csel	w26, w9, w26, eq
   149c8: 3902c3e8     	strb	w8, [sp, #0xb0]
   149cc: b9013ffa     	str	w26, [sp, #0x13c]
   149d0: 340027da     	cbz	w26, 0x14ec8 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x788>
   149d4: f9404be9     	ldr	x9, [sp, #0x90]
   149d8: b9407feb     	ldr	w11, [sp, #0x7c]
   149dc: 9102c3f6     	add	x22, sp, #0xb0
   149e0: 710006ff     	cmp	w23, #0x1
   149e4: 9100492a     	add	x10, x9, #0x12
   149e8: f9003bea     	str	x10, [sp, #0x70]
   149ec: 91004d2a     	add	x10, x9, #0x13
   149f0: 9104c3e8     	add	x8, sp, #0x130
   149f4: f9002fea     	str	x10, [sp, #0x58]
   149f8: 91004529     	add	x9, x9, #0x11
   149fc: b24002ca     	orr	x10, x22, #0x1
   14a00: f90027e9     	str	x9, [sp, #0x48]
   14a04: 531e7569     	lsl	w9, w11, #2
   14a08: f9002bea     	str	x10, [sp, #0x50]
   14a0c: 1a9f07ea     	cset	w10, ne
   14a10: 721c017f     	tst	w11, #0x10
   14a14: 9100e10b     	add	x11, x8, #0x38
   14a18: f90037eb     	str	x11, [sp, #0x68]
   14a1c: b24006cb     	orr	x11, x22, #0x3
   14a20: 9101f508     	add	x8, x8, #0x7d
   14a24: a90223eb     	stp	x11, x8, [sp, #0x20]
   14a28: 1a9f17e8     	cset	w8, eq
   14a2c: 2a0a0108     	orr	w8, w8, w10
   14a30: b90067e8     	str	w8, [sp, #0x64]
   14a34: b94037e8     	ldr	w8, [sp, #0x34]
   14a38: 121d0929     	and	w9, w9, #0x38
   14a3c: 8b3b429c     	add	x28, x20, w27, uxtw
   14a40: b9001fe9     	str	w9, [sp, #0x1c]
   14a44: 910046c9     	add	x9, x22, #0x11
   14a48: aa1403fb     	mov	x27, x20
   14a4c: b90083ff     	str	wzr, [sp, #0x80]
   14a50: a900d7e9     	stp	x9, x21, [sp, #0x8]
   14a54: b90087e8     	str	w8, [sp, #0x84]
   14a58: f9004ff9     	str	x25, [sp, #0x98]
   14a5c: f9404bec     	ldr	x12, [sp, #0x90]
   14a60: 39406ea9     	ldrb	w9, [x21, #0x1b]
   14a64: 3902c7ff     	strb	wzr, [sp, #0xb1]
   14a68: b9400588     	ldr	w8, [x12, #0x4]
   14a6c: 6b09035f     	cmp	w26, w9
   14a70: 1a9a8138     	csel	w24, w9, w26, hi
   14a74: 12000d09     	and	w9, w8, #0xf
   14a78: 7100053f     	cmp	w9, #0x1
   14a7c: 540000e0     	b.eq	0x14a98 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x358>
   14a80: b94087ed     	ldr	w13, [sp, #0x84]
   14a84: 350002c9     	cbnz	w9, 0x14adc <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x39c>
   14a88: f9402beb     	ldr	x11, [sp, #0x50]
   14a8c: 530831a9     	ubfx	w9, w13, #8, #5
   14a90: 321f03ea     	orr	w10, wzr, #0x2
   14a94: 1400000c     	b	0x14ac4 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x384>
   14a98: 394012a9     	ldrb	w9, [x21, #0x4]
   14a9c: b94087ed     	ldr	w13, [sp, #0x84]
   14aa0: 37100189     	tbnz	w9, #0x2, 0x14ad0 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x390>
   14aa4: 714041bf     	cmp	w13, #0x10, lsl #12     // =0x10000
   14aa8: 54000063     	b.lo	0x14ab4 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x374>
   14aac: 321c03e9     	orr	w9, wzr, #0x10
   14ab0: 3902c7e9     	strb	w9, [sp, #0xb1]
   14ab4: f94013eb     	ldr	x11, [sp, #0x20]
   14ab8: 53087da9     	lsr	w9, w13, #8
   14abc: 321e03ea     	orr	w10, wzr, #0x4
   14ac0: 3902cbf8     	strb	w24, [sp, #0xb2]
   14ac4: 39000169     	strb	w9, [x11]
   14ac8: 12001da9     	and	w9, w13, #0xff
   14acc: 14000003     	b	0x14ad8 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x398>
   14ad0: b9401fe9     	ldr	w9, [sp, #0x1c]
   14ad4: 320003ea     	orr	w10, wzr, #0x1
   14ad8: 382a6ac9     	strb	w9, [x22, x10]
   14adc: 710006ff     	cmp	w23, #0x1
   14ae0: 540000a1     	b.ne	0x14af4 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x3b4>
   14ae4: 39404189     	ldrb	w9, [x12, #0x10]
   14ae8: 3942c7ea     	ldrb	w10, [sp, #0xb1]
   14aec: 2a090149     	orr	w9, w10, w9
   14af0: 3902c7e9     	strb	w9, [sp, #0xb1]
   14af4: f9403be9     	ldr	x9, [sp, #0x70]
   14af8: 34000419     	cbz	w25, 0x14b78 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x438>
   14afc: 71000f3f     	cmp	w25, #0x3
   14b00: 540003a0     	b.eq	0x14b74 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x434>
   14b04: f9402fe9     	ldr	x9, [sp, #0x58]
   14b08: 7100173f     	cmp	w25, #0x5
   14b0c: 54000360     	b.eq	0x14b78 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x438>
   14b10: 710006ff     	cmp	w23, #0x1
   14b14: 540003e1     	b.ne	0x14b90 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x450>
   14b18: f94047f3     	ldr	x19, [sp, #0x88]
   14b1c: 7100071f     	cmp	w24, #0x1
   14b20: 5400016b     	b.lt	0x14b4c <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x40c>
   14b24: 394072aa     	ldrb	w10, [x21, #0x1c]
   14b28: aa1f03e9     	mov	x9, xzr
   14b2c: 8b0a02ca     	add	x10, x22, x10
   14b30: 3840176b     	ldrb	w11, [x27], #0x1
   14b34: 3829694b     	strb	w11, [x10, x9]
   14b38: eb1c037f     	cmp	x27, x28
   14b3c: 91000529     	add	x9, x9, #0x1
   14b40: 9a94337b     	csel	x27, x27, x20, lo
   14b44: 6b18013f     	cmp	w9, w24
   14b48: 54ffff4b     	b.lt	0x14b30 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x3f0>
   14b4c: 36280688     	tbz	w8, #0x5, 0x14c1c <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x4dc>
   14b50: 394072a8     	ldrb	w8, [x21, #0x1c]
   14b54: 8b384108     	add	x8, x8, w24, uxtw
   14b58: 7100091f     	cmp	w8, #0x2
   14b5c: 54000203     	b.lo	0x14b9c <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x45c>
   14b60: d1000509     	sub	x9, x8, #0x1
   14b64: f1007d3f     	cmp	x9, #0x1f
   14b68: 540001e8     	b.hi	0x14ba4 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x464>
   14b6c: 2a1f03eb     	mov	w11, wzr
   14b70: 14000022     	b	0x14bf8 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x4b8>
   14b74: f94027e9     	ldr	x9, [sp, #0x48]
   14b78: 39400129     	ldrb	w9, [x9]
   14b7c: 3942c7ea     	ldrb	w10, [sp, #0xb1]
   14b80: 2a090149     	orr	w9, w10, w9
   14b84: 3902c7e9     	strb	w9, [sp, #0xb1]
   14b88: 710006ff     	cmp	w23, #0x1
   14b8c: 54fffc60     	b.eq	0x14b18 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x3d8>
   14b90: f94047f3     	ldr	x19, [sp, #0x88]
   14b94: 372ffde8     	tbnz	w8, #0x5, 0x14b50 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x410>
   14b98: 14000021     	b	0x14c1c <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x4dc>
   14b9c: 2a1f03eb     	mov	w11, wzr
   14ba0: 1400001e     	b	0x14c18 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x4d8>
   14ba4: 11007d0a     	add	w10, w8, #0x1f
   14ba8: 1200114a     	and	w10, w10, #0x1f
   14bac: cb0a012b     	sub	x11, x9, x10
   14bb0: b400024b     	cbz	x11, 0x14bf8 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x4b8>
   14bb4: f94007ec     	ldr	x12, [sp, #0x8]
   14bb8: 91000569     	add	x9, x11, #0x1
   14bbc: 6f00e400     	movi	v0.2d, #0000000000000000
   14bc0: 6f00e401     	movi	v1.2d, #0000000000000000
   14bc4: ad7f8d82     	ldp	q2, q3, [x12, #-0x10]
   14bc8: d100816b     	sub	x11, x11, #0x20
   14bcc: 9100818c     	add	x12, x12, #0x20
   14bd0: 6e205842     	mvn	v2.16b, v2.16b
   14bd4: 6e205863     	mvn	v3.16b, v3.16b
   14bd8: 4e228400     	add	v0.16b, v0.16b, v2.16b
   14bdc: 4e238421     	add	v1.16b, v1.16b, v3.16b
   14be0: b5ffff2b     	cbnz	x11, 0x14bc4 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x484>
   14be4: 4e208420     	add	v0.16b, v1.16b, v0.16b
   14be8: 4e31b800     	addv	b0, v0.16b
   14bec: 1e26000b     	fmov	w11, s0
   14bf0: 3500006a     	cbnz	w10, 0x14bfc <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x4bc>
   14bf4: 14000009     	b	0x14c18 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x4d8>
   14bf8: 320003e9     	orr	w9, wzr, #0x1
   14bfc: 38696aca     	ldrb	w10, [x22, x9]
   14c00: 12001d6b     	and	w11, w11, #0xff
   14c04: 91000529     	add	x9, x9, #0x1
   14c08: eb08013f     	cmp	x9, x8
   14c0c: 2a2a03ea     	mvn	w10, w10
   14c10: 0b2a016b     	add	w11, w11, w10, uxtb
   14c14: 54ffff4b     	b.lt	0x14bfc <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x4bc>
   14c18: 38286acb     	strb	w11, [x22, x8]
   14c1c: 79407e61     	ldrh	w1, [x19, #0x3e]
   14c20: 9102c3e0     	add	x0, sp, #0xb0
   14c24: 97fffcfb     	bl	0x14010 <_Z33CxAudioHidLibUSBWriteOutputReportPht@plt>
   14c28: 7100001f     	cmp	w0, #0x0
   14c2c: 5400082d     	b.le	0x14d30 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x5f0>
   14c30: b94067e8     	ldr	w8, [sp, #0x64]
   14c34: 370001c8     	tbnz	w8, #0x0, 0x14c6c <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x52c>
   14c38: f9404be8     	ldr	x8, [sp, #0x90]
   14c3c: 39401108     	ldrb	w8, [x8, #0x4]
   14c40: 37200168     	tbnz	w8, #0x4, 0x14c6c <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x52c>
   14c44: f9404be8     	ldr	x8, [sp, #0x90]
   14c48: 3942c7e9     	ldrb	w9, [sp, #0xb1]
   14c4c: 9102c3e0     	add	x0, sp, #0xb0
   14c50: 39404108     	ldrb	w8, [x8, #0x10]
   14c54: 0a280128     	bic	w8, w9, w8
   14c58: 3902c7e8     	strb	w8, [sp, #0xb1]
   14c5c: 79407e61     	ldrh	w1, [x19, #0x3e]
   14c60: 97fffcec     	bl	0x14010 <_Z33CxAudioHidLibUSBWriteOutputReportPht@plt>
   14c64: 7100001f     	cmp	w0, #0x0
   14c68: 5400064d     	b.le	0x14d30 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x5f0>
   14c6c: 340006f7     	cbz	w23, 0x14d48 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x608>
   14c70: f9404be8     	ldr	x8, [sp, #0x90]
   14c74: b9407fe9     	ldr	w9, [sp, #0x7c]
   14c78: b9400508     	ldr	w8, [x8, #0x4]
   14c7c: 2a090108     	orr	w8, w8, w9
   14c80: 37200648     	tbnz	w8, #0x4, 0x14d48 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x608>
   14c84: 2a1f03f3     	mov	w19, wzr
   14c88: b9407fe8     	ldr	w8, [sp, #0x7c]
   14c8c: 36200808     	tbz	w8, #0x4, 0x14d8c <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x64c>
   14c90: 710006ff     	cmp	w23, #0x1
   14c94: 540007c1     	b.ne	0x14d8c <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x64c>
   14c98: 350007b3     	cbnz	w19, 0x14d8c <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x64c>
   14c9c: 34000438     	cbz	w24, 0x14d20 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x5e0>
   14ca0: 394076aa     	ldrb	w10, [x21, #0x1d]
   14ca4: 9103c3ec     	add	x12, sp, #0xf0
   14ca8: 394072ab     	ldrb	w11, [x21, #0x1c]
   14cac: f94017ed     	ldr	x13, [sp, #0x28]
   14cb0: 8b0a018a     	add	x10, x12, x10
   14cb4: b94087ec     	ldr	w12, [sp, #0x84]
   14cb8: aa1f03e8     	mov	x8, xzr
   14cbc: 2a1803e9     	mov	w9, w24
   14cc0: 8b0b02cb     	add	x11, x22, x11
   14cc4: 2a0c03ec     	mov	w12, w12
   14cc8: 3868696e     	ldrb	w14, [x11, x8]
   14ccc: 3868694f     	ldrb	w15, [x10, x8]
   14cd0: 6b0e01ff     	cmp	w15, w14
   14cd4: 1a9f07f0     	cset	w16, ne
   14cd8: 540000e0     	b.eq	0x14cf4 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x5b4>
   14cdc: b94157f1     	ldr	w17, [sp, #0x154]
   14ce0: 11000631     	add	w17, w17, #0x1
   14ce4: b90157f1     	str	w17, [sp, #0x154]
   14ce8: b9414bf1     	ldr	w17, [sp, #0x148]
   14cec: 11000631     	add	w17, w17, #0x1
   14cf0: b9014bf1     	str	w17, [sp, #0x148]
   14cf4: f100ed1f     	cmp	x8, #0x3b
   14cf8: 540000c8     	b.hi	0x14d10 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x5d0>
   14cfc: 0b080191     	add	w17, w12, w8
   14d00: 381ff1ae     	sturb	w14, [x13, #-0x1]
   14d04: 390001af     	strb	w15, [x13]
   14d08: b81fb1b1     	stur	w17, [x13, #-0x5]
   14d0c: b81f71b0     	stur	w16, [x13, #-0x9]
   14d10: 91000508     	add	x8, x8, #0x1
   14d14: eb09011f     	cmp	x8, x9
   14d18: 910031ad     	add	x13, x13, #0xc
   14d1c: 54fffd63     	b.lo	0x14cc8 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x588>
   14d20: 320003e8     	orr	w8, wzr, #0x1
   14d24: b90167e8     	str	w8, [sp, #0x164]
   14d28: 35000353     	cbnz	w19, 0x14d90 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x650>
   14d2c: 14000029     	b	0x14dd0 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x690>
   14d30: f00000a1     	adrp	x1, 0x2b000
   14d34: 320003e0     	orr	w0, wzr, #0x1
   14d38: 910ce821     	add	x1, x1, #0x33a
   14d3c: 97fffc0d     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   14d40: 52800333     	mov	w19, #0x19              // =25
   14d44: 14000013     	b	0x14d90 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x650>
   14d48: 91009ff9     	add	x25, sp, #0x27
   14d4c: 6f00e400     	movi	v0.2d, #0000000000000000
   14d50: f80ff33f     	stur	xzr, [x25, #0xff]
   14d54: f90093ff     	str	xzr, [sp, #0x120]
   14d58: ad0803e0     	stp	q0, q0, [sp, #0x100]
   14d5c: 3d803fe0     	str	q0, [sp, #0xf0]
   14d60: f9400268     	ldr	x8, [x19]
   14d64: 79407a63     	ldrh	w3, [x19, #0x3c]
   14d68: 394066a1     	ldrb	w1, [x21, #0x19]
   14d6c: 9103c3e2     	add	x2, sp, #0xf0
   14d70: f9414508     	ldr	x8, [x8, #0x288]
   14d74: 9102b3e4     	add	x4, sp, #0xac
   14d78: aa1303e0     	mov	x0, x19
   14d7c: d63f0100     	blr	x8
   14d80: 2a0003f3     	mov	w19, w0
   14d84: b9407fe8     	ldr	w8, [sp, #0x7c]
   14d88: 3727f848     	tbnz	w8, #0x4, 0x14c90 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x550>
   14d8c: 34000233     	cbz	w19, 0x14dd0 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x690>
   14d90: b94083e8     	ldr	w8, [sp, #0x80]
   14d94: 2a1f03f9     	mov	w25, wzr
   14d98: b90153ff     	str	wzr, [sp, #0x150]
   14d9c: b90147fa     	str	w26, [sp, #0x144]
   14da0: b90143e8     	str	w8, [sp, #0x140]
   14da4: f9404fe8     	ldr	x8, [sp, #0x98]
   14da8: b90137f7     	str	w23, [sp, #0x134]
   14dac: b9013be8     	str	w8, [sp, #0x138]
   14db0: 340005f7     	cbz	w23, 0x14e6c <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x72c>
   14db4: 710006ff     	cmp	w23, #0x1
   14db8: 54000321     	b.ne	0x14e1c <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x6dc>
   14dbc: 394072a8     	ldrb	w8, [x21, #0x1c]
   14dc0: 2a1803e9     	mov	w9, w24
   14dc4: 7100f31f     	cmp	w24, #0x3c
   14dc8: 8b0802c1     	add	x1, x22, x8
   14dcc: 1400002d     	b	0x14e80 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x740>
   14dd0: 295023e9     	ldp	w9, w8, [sp, #0x80]
   14dd4: 4b18035a     	sub	w26, w26, w24
   14dd8: b9015fe8     	str	w8, [sp, #0x15c]
   14ddc: 0b080308     	add	w8, w24, w8
   14de0: 0b090309     	add	w9, w24, w9
   14de4: 291023e9     	stp	w9, w8, [sp, #0x80]
   14de8: 51000508     	sub	w8, w8, #0x1
   14dec: b90163e8     	str	w8, [sp, #0x160]
   14df0: 340001b7     	cbz	w23, 0x14e24 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x6e4>
   14df4: f9404fe8     	ldr	x8, [sp, #0x98]
   14df8: 2a1f03f3     	mov	w19, wzr
   14dfc: 320003f9     	orr	w25, wzr, #0x1
   14e00: b90153f8     	str	w24, [sp, #0x150]
   14e04: b90147fa     	str	w26, [sp, #0x144]
   14e08: b90143e9     	str	w9, [sp, #0x140]
   14e0c: b90137f7     	str	w23, [sp, #0x134]
   14e10: b9013be8     	str	w8, [sp, #0x138]
   14e14: 710006ff     	cmp	w23, #0x1
   14e18: 54fffd20     	b.eq	0x14dbc <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x67c>
   14e1c: 350003d9     	cbnz	w25, 0x14e94 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x754>
   14e20: 14000026     	b	0x14eb8 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x778>
   14e24: 394076a8     	ldrb	w8, [x21, #0x1d]
   14e28: 9103c3ea     	add	x10, sp, #0xf0
   14e2c: 2a1803f9     	mov	w25, w24
   14e30: aa1b03e0     	mov	x0, x27
   14e34: 8b080141     	add	x1, x10, x8
   14e38: aa1903e2     	mov	x2, x25
   14e3c: 2a0903f5     	mov	w21, w9
   14e40: 97fffcac     	bl	0x140f0 <memcpy@plt>
   14e44: b90143f5     	str	w21, [sp, #0x140]
   14e48: f9400bf5     	ldr	x21, [sp, #0x10]
   14e4c: f9404fe8     	ldr	x8, [sp, #0x98]
   14e50: 2a1f03f3     	mov	w19, wzr
   14e54: 8b19037b     	add	x27, x27, x25
   14e58: 320003f9     	orr	w25, wzr, #0x1
   14e5c: b90153f8     	str	w24, [sp, #0x150]
   14e60: b90147fa     	str	w26, [sp, #0x144]
   14e64: b90137f7     	str	w23, [sp, #0x134]
   14e68: b9013be8     	str	w8, [sp, #0x138]
   14e6c: 394076a8     	ldrb	w8, [x21, #0x1d]
   14e70: 9103c3ea     	add	x10, sp, #0xf0
   14e74: 2a1803e9     	mov	w9, w24
   14e78: 7100f31f     	cmp	w24, #0x3c
   14e7c: 8b080141     	add	x1, x10, x8
   14e80: f94037e0     	ldr	x0, [sp, #0x68]
   14e84: 321e0fe8     	orr	w8, wzr, #0x3c
   14e88: 9a883122     	csel	x2, x9, x8, lo
   14e8c: 97fffc99     	bl	0x140f0 <memcpy@plt>
   14e90: 36000159     	tbz	w25, #0x0, 0x14eb8 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x778>
   14e94: f94047e9     	ldr	x9, [sp, #0x88]
   14e98: f941bd28     	ldr	x8, [x9, #0x378]
   14e9c: b40000e8     	cbz	x8, 0x14eb8 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x778>
   14ea0: f941c120     	ldr	x0, [x9, #0x380]
   14ea4: b94083e1     	ldr	w1, [sp, #0x80]
   14ea8: 9104c3e2     	add	x2, sp, #0x130
   14eac: d63f0100     	blr	x8
   14eb0: 7100001f     	cmp	w0, #0x0
   14eb4: 1a9f0673     	csinc	w19, w19, wzr, eq
   14eb8: 35ffd373     	cbnz	w19, 0x14924 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x1e4>
   14ebc: f9404ff9     	ldr	x25, [sp, #0x98]
   14ec0: 35ffdcfa     	cbnz	w26, 0x14a5c <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x31c>
   14ec4: 17fffe98     	b	0x14924 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x1e4>
   14ec8: 2a1f03f3     	mov	w19, wzr
   14ecc: f9401fe0     	ldr	x0, [sp, #0x38]
   14ed0: b5ffd2e0     	cbnz	x0, 0x1492c <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x1ec>
   14ed4: 17fffea4     	b	0x14964 <_ZN16CxAudioHidDevice15MemoryOperationE16_CXHID_OPERATION20_CXHID_AUDIO_MEMTYPEjjjPhjP15_MEMOP_FEEDBACK+0x224>
   14ed8: 97fffb86     	bl	0x13cf0 <__stack_chk_fail@plt>

0000000000023fc4 <_ZN18CxAudioHidDev20805C1E20_CXHID_AUDIO_DEVTYPEjP13_HID_DEV_INFO>:
   23fc4: a9bd57f6     	stp	x22, x21, [sp, #-0x30]!
   23fc8: a9014ff4     	stp	x20, x19, [sp, #0x10]
   23fcc: a9027bfd     	stp	x29, x30, [sp, #0x20]
   23fd0: 910083fd     	add	x29, sp, #0x20
   23fd4: aa0303f3     	mov	x19, x3
   23fd8: 2a0203f4     	mov	w20, w2
   23fdc: 2a0103f5     	mov	w21, w1
   23fe0: aa0003f6     	mov	x22, x0
   23fe4: 97ffbf57     	bl	0x13d40 <_ZN16CxAudioHidDeviceC2Ev@plt>
   23fe8: 9000012a     	adrp	x10, 0x47000 <_ZTV18CxAudioHidDev2089x+0x198>
   23fec: f947e94a     	ldr	x10, [x10, #0xfd0]
   23ff0: 911162c8     	add	x8, x22, #0x458
   23ff4: 9111a2c9     	add	x9, x22, #0x468
   23ff8: aa1603e0     	mov	x0, x22
   23ffc: 910f414c     	add	x12, x10, #0x3d0
   24000: 9e670180     	fmov	d0, x12
   24004: 9110214c     	add	x12, x10, #0x408
   24008: 9100414b     	add	x11, x10, #0x10
   2400c: 4e181d80     	mov	v0.d[1], x12
   24010: 9111614c     	add	x12, x10, #0x458
   24014: f90002cb     	str	x11, [x22]
   24018: 3d800100     	str	q0, [x8]
   2401c: 91122148     	add	x8, x10, #0x488
   24020: 9e670180     	fmov	d0, x12
   24024: 9113e14c     	add	x12, x10, #0x4f8
   24028: 4e181d00     	mov	v0.d[1], x8
   2402c: 9115814a     	add	x10, x10, #0x560
   24030: 3d800120     	str	q0, [x9]
   24034: 9e670180     	fmov	d0, x12
   24038: 9111e2cb     	add	x11, x22, #0x478
   2403c: 4e181d40     	mov	v0.d[1], x10
   24040: 2a1503e1     	mov	w1, w21
   24044: 2a1403e2     	mov	w2, w20
   24048: aa1303e3     	mov	x3, x19
   2404c: 3d800160     	str	q0, [x11]
   24050: 97ffbe48     	bl	0x13970 <_ZN16CxAudioHidDevice10InitializeE20_CXHID_AUDIO_DEVTYPEjP13_HID_DEV_INFO@plt>
   24054: a9427bfd     	ldp	x29, x30, [sp, #0x20]
   24058: a9414ff4     	ldp	x20, x19, [sp, #0x10]
   2405c: aa1603e0     	mov	x0, x22
   24060: a8c357f6     	ldp	x22, x21, [sp], #0x30
   24064: 17ffbf33     	b	0x13d30 <_ZN18CxAudioHidDev2080513AutoConfigureEv@plt>

0000000000024068 <_ZN18CxAudioHidDev2080513AutoConfigureEv>:
   24068: d10543ff     	sub	sp, sp, #0x150
   2406c: a90f6ffc     	stp	x28, x27, [sp, #0xf0]
   24070: a91067fa     	stp	x26, x25, [sp, #0x100]
   24074: a9115ff8     	stp	x24, x23, [sp, #0x110]
   24078: a91257f6     	stp	x22, x21, [sp, #0x120]
   2407c: a9134ff4     	stp	x20, x19, [sp, #0x130]
   24080: a9147bfd     	stp	x29, x30, [sp, #0x140]
   24084: 910503fd     	add	x29, sp, #0x140
   24088: d53bd057     	mrs	x23, TPIDR_EL0
   2408c: f94016e9     	ldr	x9, [x23, #0x28]
   24090: aa0003f3     	mov	x19, x0
   24094: 52846014     	mov	w20, #0x2300            // =8960
   24098: 91143268     	add	x8, x19, #0x50c
   2409c: 6f00e400     	movi	v0.2d, #0000000000000000
   240a0: d0000138     	adrp	x24, 0x4a000 <s_EepromShadow+0x1edc>
   240a4: 320003f5     	orr	w21, wzr, #0x1
   240a8: 91122260     	add	x0, x19, #0x488
   240ac: 52801082     	mov	w2, #0x84               // =132
   240b0: 2a1f03e1     	mov	w1, wzr
   240b4: 72b665b4     	movk	w20, #0xb32d, lsl #16
   240b8: f81a83a9     	stur	x9, [x29, #-0x58]
   240bc: b9051e7f     	str	wzr, [x19, #0x51c]
   240c0: 3d800100     	str	q0, [x8]
   240c4: b9025315     	str	w21, [x24, #0x250]
   240c8: 97ffc022     	bl	0x14150 <memset@plt>
   240cc: d2a00108     	mov	x8, #0x80000            // =524288
   240d0: 6f00e400     	movi	v0.2d, #0000000000000000
   240d4: f2c46008     	movk	x8, #0x2300, lsl #32
   240d8: ad0403e0     	stp	q0, q0, [sp, #0x80]
   240dc: 6f00e400     	movi	v0.2d, #0000000000000000
   240e0: f2f665a8     	movk	x8, #0xb32d, lsl #48
   240e4: b900a3ff     	str	wzr, [sp, #0xa0]
   240e8: 3c8703e0     	stur	q0, [sp, #0x70]
   240ec: f90037e8     	str	x8, [sp, #0x68]
   240f0: b9000bff     	str	wzr, [sp, #0x8]
   240f4: f9400268     	ldr	x8, [x19]
   240f8: 9101a3e1     	add	x1, sp, #0x68
   240fc: 910023e3     	add	x3, sp, #0x8
   24100: aa1303e0     	mov	x0, x19
   24104: f9418108     	ldr	x8, [x8, #0x300]
   24108: aa1f03e2     	mov	x2, xzr
   2410c: d63f0100     	blr	x8
   24110: 340000e0     	cbz	w0, 0x2412c <_ZN18CxAudioHidDev2080513AutoConfigureEv+0xc4>
   24114: b9400be8     	ldr	w8, [sp, #0x8]
   24118: 7100c01f     	cmp	w0, #0x30
   2411c: 1a9f17e9     	cset	w9, eq
   24120: 3110891f     	cmn	w8, #0x422
   24124: 1a9f17e8     	cset	w8, eq
   24128: 0a080135     	and	w21, w9, w8
   2412c: b9050e75     	str	w21, [x19, #0x50c]
   24130: b9406be8     	ldr	w8, [sp, #0x68]
   24134: b9000bff     	str	wzr, [sp, #0x8]
   24138: 9101a3e1     	add	x1, sp, #0x68
   2413c: 910023e3     	add	x3, sp, #0x8
   24140: 12010108     	and	w8, w8, #0x80000000
   24144: 320e0508     	orr	w8, w8, #0xc0000
   24148: 290d53e8     	stp	w8, w20, [sp, #0x68]
   2414c: f9400268     	ldr	x8, [x19]
   24150: aa1303e0     	mov	x0, x19
   24154: aa1f03e2     	mov	x2, xzr
   24158: f9418108     	ldr	x8, [x8, #0x300]
   2415c: d63f0100     	blr	x8
   24160: 34000140     	cbz	w0, 0x24188 <_ZN18CxAudioHidDev2080513AutoConfigureEv+0x120>
   24164: b9400be8     	ldr	w8, [sp, #0x8]
   24168: 7100c01f     	cmp	w0, #0x30
   2416c: 1a9f17e9     	cset	w9, eq
   24170: 3110891f     	cmn	w8, #0x422
   24174: 1a9f17e8     	cset	w8, eq
   24178: 0a080128     	and	w8, w9, w8
   2417c: b9051268     	str	w8, [x19, #0x510]
   24180: 35000088     	cbnz	w8, 0x24190 <_ZN18CxAudioHidDev2080513AutoConfigureEv+0x128>
   24184: 14000034     	b	0x24254 <_ZN18CxAudioHidDev2080513AutoConfigureEv+0x1ec>
   24188: 320003e8     	orr	w8, wzr, #0x1
   2418c: b9051268     	str	w8, [x19, #0x510]
   24190: f9400268     	ldr	x8, [x19]
   24194: aa1303e0     	mov	x0, x19
   24198: f941a108     	ldr	x8, [x8, #0x340]
   2419c: d63f0100     	blr	x8
   241a0: 3100041f     	cmn	w0, #0x1
   241a4: 54000060     	b.eq	0x241b0 <_ZN18CxAudioHidDev2080513AutoConfigureEv+0x148>
   241a8: b9000e60     	str	w0, [x19, #0xc]
   241ac: 14000026     	b	0x24244 <_ZN18CxAudioHidDev2080513AutoConfigureEv+0x1dc>
   241b0: 5288ca7a     	mov	w26, #0x4653            // =18003
   241b4: d0000055     	adrp	x21, 0x2e000 <AllHidDevProperties+0x2bf0>
   241b8: 2a1f03f4     	mov	w20, wzr
   241bc: 2a1f03fb     	mov	w27, wzr
   241c0: 320003f9     	orr	w25, wzr, #0x1
   241c4: 72a8aa7a     	movk	w26, #0x4553, lsl #16
   241c8: 912fa2b5     	add	x21, x21, #0xbe8
   241cc: 6f00e400     	movi	v0.2d, #0000000000000000
   241d0: ad0203e0     	stp	q0, q0, [sp, #0x40]
   241d4: ad0103e0     	stp	q0, q0, [sp, #0x20]
   241d8: f9400268     	ldr	x8, [x19]
   241dc: 321a03e2     	orr	w2, wzr, #0x40
   241e0: 910083e3     	add	x3, sp, #0x20
   241e4: 321a03e4     	orr	w4, wzr, #0x40
   241e8: f9402d08     	ldr	x8, [x8, #0x58]
   241ec: aa1303e0     	mov	x0, x19
   241f0: 2a1403e1     	mov	w1, w20
   241f4: aa1f03e5     	mov	x5, xzr
   241f8: d63f0100     	blr	x8
   241fc: 2a0003f6     	mov	w22, w0
   24200: 35000176     	cbnz	w22, 0x2422c <_ZN18CxAudioHidDev2080513AutoConfigureEv+0x1c4>
   24204: b94023e8     	ldr	w8, [sp, #0x20]
   24208: 6b1a011f     	cmp	w8, w26
   2420c: 54000101     	b.ne	0x2422c <_ZN18CxAudioHidDev2080513AutoConfigureEv+0x1c4>
   24210: 79404fe8     	ldrh	w8, [sp, #0x26]
   24214: 321e03e0     	orr	w0, wzr, #0x4
   24218: aa1503e1     	mov	x1, x21
   2421c: 53144d02     	lsl	w2, w8, #12
   24220: b9000e62     	str	w2, [x19, #0xc]
   24224: 97ffbea3     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   24228: 320003fb     	orr	w27, wzr, #0x1
   2422c: 2a160368     	orr	w8, w27, w22
   24230: 350000a8     	cbnz	w8, 0x24244 <_ZN18CxAudioHidDev2080513AutoConfigureEv+0x1dc>
   24234: 71000b3f     	cmp	w25, #0x2
   24238: 11000739     	add	w25, w25, #0x1
   2423c: 11400694     	add	w20, w20, #0x1, lsl #12 // =0x1000
   24240: 54fffc63     	b.lo	0x241cc <_ZN18CxAudioHidDev2080513AutoConfigureEv+0x164>
   24244: f9400268     	ldr	x8, [x19]
   24248: aa1303e0     	mov	x0, x19
   2424c: f9418908     	ldr	x8, [x8, #0x310]
   24250: d63f0100     	blr	x8
   24254: 528004e1     	mov	w1, #0x27               // =39
   24258: 320003e2     	orr	w2, wzr, #0x1
   2425c: aa1303e0     	mov	x0, x19
   24260: 97ffbd94     	bl	0x138b0 <_ZN16CxAudioHidDevice11PropertySetE21__CXHID_PROPERTY_TYPEj@plt>
   24264: d0000048     	adrp	x8, 0x2e000 <AllHidDevProperties+0x2bf0>
   24268: 3dc1bd00     	ldr	q0, [x8, #0x6f0]
   2426c: 910043e0     	add	x0, sp, #0x10
   24270: 321f03e1     	orr	w1, wzr, #0x2
   24274: 3d8007e0     	str	q0, [sp, #0x10]
   24278: 97ffbe4a     	bl	0x13ba0 <_Z25CxUtilsCheckPreConditionsP19_CXHID_PRECONDITIONj@plt>
   2427c: 35000400     	cbnz	w0, 0x242fc <_ZN18CxAudioHidDev2080513AutoConfigureEv+0x294>
   24280: d0000048     	adrp	x8, 0x2e000 <AllHidDevProperties+0x2bf0>
   24284: 3dc1c101     	ldr	q1, [x8, #0x700]
   24288: 6f00e400     	movi	v0.2d, #0000000000000000
   2428c: b9005bff     	str	wzr, [sp, #0x58]
   24290: f9002bff     	str	xzr, [sp, #0x50]
   24294: ad0183e0     	stp	q0, q0, [sp, #0x30]
   24298: 3c9683a0     	stur	q0, [x29, #-0x98]
   2429c: b81a03bf     	stur	wzr, [x29, #-0x60]
   242a0: f81983bf     	stur	xzr, [x29, #-0x68]
   242a4: 3c9883a0     	stur	q0, [x29, #-0x78]
   242a8: 3c9783a0     	stur	q0, [x29, #-0x88]
   242ac: b9000fff     	str	wzr, [sp, #0xc]
   242b0: 3d800be1     	str	q1, [sp, #0x20]
   242b4: f9400268     	ldr	x8, [x19]
   242b8: 910083e1     	add	x1, sp, #0x20
   242bc: d10263a2     	sub	x2, x29, #0x98
   242c0: 910033e3     	add	x3, sp, #0xc
   242c4: f9418108     	ldr	x8, [x8, #0x300]
   242c8: aa1303e0     	mov	x0, x19
   242cc: d63f0100     	blr	x8
   242d0: 35000160     	cbnz	w0, 0x242fc <_ZN18CxAudioHidDev2080513AutoConfigureEv+0x294>
   242d4: b85703a3     	ldur	w3, [x29, #-0x90]
   242d8: f0000041     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   242dc: 529f2242     	mov	w2, #0xf912             // =63762
   242e0: 9113ac21     	add	x1, x1, #0x4eb
   242e4: 321e03e0     	orr	w0, wzr, #0x4
   242e8: 72a00062     	movk	w2, #0x3, lsl #16
   242ec: 97ffbe1d     	bl	0x13b60 <_Z10LogNumber2jPKcjj@plt>
   242f0: 320003e8     	orr	w8, wzr, #0x1
   242f4: b9051668     	str	w8, [x19, #0x514]
   242f8: b9001a68     	str	w8, [x19, #0x18]
   242fc: b902531f     	str	wzr, [x24, #0x250]
   24300: f94016e8     	ldr	x8, [x23, #0x28]
   24304: f85a83a9     	ldur	x9, [x29, #-0x58]
   24308: eb09011f     	cmp	x8, x9
   2430c: 54000141     	b.ne	0x24334 <_ZN18CxAudioHidDev2080513AutoConfigureEv+0x2cc>
   24310: a9547bfd     	ldp	x29, x30, [sp, #0x140]
   24314: a9534ff4     	ldp	x20, x19, [sp, #0x130]
   24318: a95257f6     	ldp	x22, x21, [sp, #0x120]
   2431c: a9515ff8     	ldp	x24, x23, [sp, #0x110]
   24320: a95067fa     	ldp	x26, x25, [sp, #0x100]
   24324: a94f6ffc     	ldp	x28, x27, [sp, #0xf0]
   24328: 2a1f03e0     	mov	w0, wzr
   2432c: 910543ff     	add	sp, sp, #0x150
   24330: d65f03c0     	ret
   24334: 97ffbe6f     	bl	0x13cf0 <__stack_chk_fail@plt>

00000000000249b4 <_ZN18CxAudioHidDev2080511SendCommandEP20CAPE_FW_FULL_COMMANDS1_P19ModuleReturnCodeTag>:
   249b4: d10283ff     	sub	sp, sp, #0xa0
   249b8: f9002bf9     	str	x25, [sp, #0x50]
   249bc: a9065ff8     	stp	x24, x23, [sp, #0x60]
   249c0: a90757f6     	stp	x22, x21, [sp, #0x70]
   249c4: a9084ff4     	stp	x20, x19, [sp, #0x80]
   249c8: a9097bfd     	stp	x29, x30, [sp, #0x90]
   249cc: 910243fd     	add	x29, sp, #0x90
   249d0: d53bd057     	mrs	x23, TPIDR_EL0
   249d4: f94016e8     	ldr	x8, [x23, #0x28]
   249d8: aa0303f4     	mov	x20, x3
   249dc: aa0203f3     	mov	x19, x2
   249e0: aa0003f6     	mov	x22, x0
   249e4: 6f00e400     	movi	v0.2d, #0000000000000000
   249e8: f90027e8     	str	x8, [sp, #0x48]
   249ec: b90043ff     	str	wzr, [sp, #0x40]
   249f0: f9001fff     	str	xzr, [sp, #0x38]
   249f4: 3c8283e0     	stur	q0, [sp, #0x28]
   249f8: 3c8183e0     	stur	q0, [sp, #0x18]
   249fc: 3c8083e0     	stur	q0, [sp, #0x8]
   24a00: b40006c1     	cbz	x1, 0x24ad8 <_ZN18CxAudioHidDev2080511SendCommandEP20CAPE_FW_FULL_COMMANDS1_P19ModuleReturnCodeTag+0x124>
   24a04: f94002c8     	ldr	x8, [x22]
   24a08: 321e0fe2     	orr	w2, wzr, #0x3c
   24a0c: aa1603e0     	mov	x0, x22
   24a10: f9416508     	ldr	x8, [x8, #0x2c8]
   24a14: d63f0100     	blr	x8
   24a18: 2a0003f5     	mov	w21, w0
   24a1c: 350002f5     	cbnz	w21, 0x24a78 <_ZN18CxAudioHidDev2080511SendCommandEP20CAPE_FW_FULL_COMMANDS1_P19ModuleReturnCodeTag+0xc4>
   24a20: 2a1f03f9     	mov	w25, wzr
   24a24: 12800018     	mov	w24, #-0x1              // =-1
   24a28: f94002c8     	ldr	x8, [x22]
   24a2c: 910023e1     	add	x1, sp, #0x8
   24a30: 321e0fe2     	orr	w2, wzr, #0x3c
   24a34: aa1603e0     	mov	x0, x22
   24a38: f9416908     	ldr	x8, [x8, #0x2d0]
   24a3c: d63f0100     	blr	x8
   24a40: 2a0003f5     	mov	w21, w0
   24a44: 350000f5     	cbnz	w21, 0x24a60 <_ZN18CxAudioHidDev2080511SendCommandEP20CAPE_FW_FULL_COMMANDS1_P19ModuleReturnCodeTag+0xac>
   24a48: b9400be8     	ldr	w8, [sp, #0x8]
   24a4c: 37f80088     	tbnz	w8, #0x1f, 0x24a5c <_ZN18CxAudioHidDev2080511SendCommandEP20CAPE_FW_FULL_COMMANDS1_P19ModuleReturnCodeTag+0xa8>
   24a50: 52800fa0     	mov	w0, #0x7d               // =125
   24a54: 97ffbd73     	bl	0x14020 <usleep@plt>
   24a58: 14000002     	b	0x24a60 <_ZN18CxAudioHidDev2080511SendCommandEP20CAPE_FW_FULL_COMMANDS1_P19ModuleReturnCodeTag+0xac>
   24a5c: 320003f9     	orr	w25, wzr, #0x1
   24a60: 2a150328     	orr	w8, w25, w21
   24a64: 11000718     	add	w24, w24, #0x1
   24a68: 35000068     	cbnz	w8, 0x24a74 <_ZN18CxAudioHidDev2080511SendCommandEP20CAPE_FW_FULL_COMMANDS1_P19ModuleReturnCodeTag+0xc0>
   24a6c: 710f9f1f     	cmp	w24, #0x3e7
   24a70: 54fffdcb     	b.lt	0x24a28 <_ZN18CxAudioHidDev2080511SendCommandEP20CAPE_FW_FULL_COMMANDS1_P19ModuleReturnCodeTag+0x74>
   24a74: 340003b5     	cbz	w21, 0x24ae8 <_ZN18CxAudioHidDev2080511SendCommandEP20CAPE_FW_FULL_COMMANDS1_P19ModuleReturnCodeTag+0x134>
   24a78: 2a1f03e8     	mov	w8, wzr
   24a7c: b4000054     	cbz	x20, 0x24a84 <_ZN18CxAudioHidDev2080511SendCommandEP20CAPE_FW_FULL_COMMANDS1_P19ModuleReturnCodeTag+0xd0>
   24a80: b9000288     	str	w8, [x20]
   24a84: b4000133     	cbz	x19, 0x24aa8 <_ZN18CxAudioHidDev2080511SendCommandEP20CAPE_FW_FULL_COMMANDS1_P19ModuleReturnCodeTag+0xf4>
   24a88: 3cc343e0     	ldur	q0, [sp, #0x34]
   24a8c: 3c82c260     	stur	q0, [x19, #0x2c]
   24a90: 3cc283e0     	ldur	q0, [sp, #0x28]
   24a94: 3d800a60     	str	q0, [x19, #0x20]
   24a98: 3cc183e0     	ldur	q0, [sp, #0x18]
   24a9c: 3d800660     	str	q0, [x19, #0x10]
   24aa0: 3cc083e0     	ldur	q0, [sp, #0x8]
   24aa4: 3d800260     	str	q0, [x19]
   24aa8: f94016e8     	ldr	x8, [x23, #0x28]
   24aac: f94027e9     	ldr	x9, [sp, #0x48]
   24ab0: eb09011f     	cmp	x8, x9
   24ab4: 540007a1     	b.ne	0x24ba8 <_ZN18CxAudioHidDev2080511SendCommandEP20CAPE_FW_FULL_COMMANDS1_P19ModuleReturnCodeTag+0x1f4>
   24ab8: 2a1503e0     	mov	w0, w21
   24abc: a9497bfd     	ldp	x29, x30, [sp, #0x90]
   24ac0: a9484ff4     	ldp	x20, x19, [sp, #0x80]
   24ac4: a94757f6     	ldp	x22, x21, [sp, #0x70]
   24ac8: a9465ff8     	ldp	x24, x23, [sp, #0x60]
   24acc: f9402bf9     	ldr	x25, [sp, #0x50]
   24ad0: 910283ff     	add	sp, sp, #0xa0
   24ad4: d65f03c0     	ret
   24ad8: 2a1f03e8     	mov	w8, wzr
   24adc: 321e07f5     	orr	w21, wzr, #0xc
   24ae0: b5fffd14     	cbnz	x20, 0x24a80 <_ZN18CxAudioHidDev2080511SendCommandEP20CAPE_FW_FULL_COMMANDS1_P19ModuleReturnCodeTag+0xcc>
   24ae4: 17ffffe8     	b	0x24a84 <_ZN18CxAudioHidDev2080511SendCommandEP20CAPE_FW_FULL_COMMANDS1_P19ModuleReturnCodeTag+0xd0>
   24ae8: 340001d9     	cbz	w25, 0x24b20 <_ZN18CxAudioHidDev2080511SendCommandEP20CAPE_FW_FULL_COMMANDS1_P19ModuleReturnCodeTag+0x16c>
   24aec: 71002b1f     	cmp	w24, #0xa
   24af0: 540000cb     	b.lt	0x24b08 <_ZN18CxAudioHidDev2080511SendCommandEP20CAPE_FW_FULL_COMMANDS1_P19ModuleReturnCodeTag+0x154>
   24af4: d0000041     	adrp	x1, 0x2e000 <AllHidDevProperties+0x2bf0>
   24af8: 11000702     	add	w2, w24, #0x1
   24afc: 91304c21     	add	x1, x1, #0xc13
   24b00: 321903e0     	orr	w0, wzr, #0x80
   24b04: 97ffbc6b     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   24b08: b9400be8     	ldr	w8, [sp, #0x8]
   24b0c: 37780208     	tbnz	w8, #0xf, 0x24b4c <_ZN18CxAudioHidDev2080511SendCommandEP20CAPE_FW_FULL_COMMANDS1_P19ModuleReturnCodeTag+0x198>
   24b10: 2a1f03f5     	mov	w21, wzr
   24b14: 2a1f03e8     	mov	w8, wzr
   24b18: b5fffb54     	cbnz	x20, 0x24a80 <_ZN18CxAudioHidDev2080511SendCommandEP20CAPE_FW_FULL_COMMANDS1_P19ModuleReturnCodeTag+0xcc>
   24b1c: 17ffffda     	b	0x24a84 <_ZN18CxAudioHidDev2080511SendCommandEP20CAPE_FW_FULL_COMMANDS1_P19ModuleReturnCodeTag+0xd0>
   24b20: d0000128     	adrp	x8, 0x4a000 <s_EepromShadow+0x1edc>
   24b24: b9425108     	ldr	w8, [x8, #0x250]
   24b28: 350000a8     	cbnz	w8, 0x24b3c <_ZN18CxAudioHidDev2080511SendCommandEP20CAPE_FW_FULL_COMMANDS1_P19ModuleReturnCodeTag+0x188>
   24b2c: d0000041     	adrp	x1, 0x2e000 <AllHidDevProperties+0x2bf0>
   24b30: 9130ec21     	add	x1, x1, #0xc3b
   24b34: 320003e0     	orr	w0, wzr, #0x1
   24b38: 97ffbc8e     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   24b3c: 2a1f03e8     	mov	w8, wzr
   24b40: 321d07f5     	orr	w21, wzr, #0x18
   24b44: b5fff9f4     	cbnz	x20, 0x24a80 <_ZN18CxAudioHidDev2080511SendCommandEP20CAPE_FW_FULL_COMMANDS1_P19ModuleReturnCodeTag+0xcc>
   24b48: 17ffffcf     	b	0x24a84 <_ZN18CxAudioHidDev2080511SendCommandEP20CAPE_FW_FULL_COMMANDS1_P19ModuleReturnCodeTag+0xd0>
   24b4c: d0000129     	adrp	x9, 0x4a000 <s_EepromShadow+0x1edc>
   24b50: b9425129     	ldr	w9, [x9, #0x250]
   24b54: 35000229     	cbnz	w9, 0x24b98 <_ZN18CxAudioHidDev2080511SendCommandEP20CAPE_FW_FULL_COMMANDS1_P19ModuleReturnCodeTag+0x1e4>
   24b58: d0000041     	adrp	x1, 0x2e000 <AllHidDevProperties+0x2bf0>
   24b5c: 53107902     	ubfx	w2, w8, #16, #15
   24b60: 91319421     	add	x1, x1, #0xc65
   24b64: 320003e0     	orr	w0, wzr, #0x1
   24b68: 97ffbc52     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   24b6c: b9400fe2     	ldr	w2, [sp, #0xc]
   24b70: d0000041     	adrp	x1, 0x2e000 <AllHidDevProperties+0x2bf0>
   24b74: 91326821     	add	x1, x1, #0xc9a
   24b78: 320003e0     	orr	w0, wzr, #0x1
   24b7c: 97ffbc4d     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   24b80: 79c013e2     	ldrsh	w2, [sp, #0x8]
   24b84: d0000041     	adrp	x1, 0x2e000 <AllHidDevProperties+0x2bf0>
   24b88: 91334821     	add	x1, x1, #0xcd2
   24b8c: 320003e0     	orr	w0, wzr, #0x1
   24b90: 97ffbc48     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   24b94: b9400be8     	ldr	w8, [sp, #0x8]
   24b98: 13003d08     	sxth	w8, w8
   24b9c: 321c07f5     	orr	w21, wzr, #0x30
   24ba0: b5fff714     	cbnz	x20, 0x24a80 <_ZN18CxAudioHidDev2080511SendCommandEP20CAPE_FW_FULL_COMMANDS1_P19ModuleReturnCodeTag+0xcc>
   24ba4: 17ffffb8     	b	0x24a84 <_ZN18CxAudioHidDev2080511SendCommandEP20CAPE_FW_FULL_COMMANDS1_P19ModuleReturnCodeTag+0xd0>
   24ba8: 97ffbc52     	bl	0x13cf0 <__stack_chk_fail@plt>

000000000002539c <_ZN18CxAudioHidDev2080517DeviceGetChipCodeEPj>:
   2539c: d10303ff     	sub	sp, sp, #0xc0
   253a0: f9004bf5     	str	x21, [sp, #0x90]
   253a4: a90a4ff4     	stp	x20, x19, [sp, #0xa0]
   253a8: a90b7bfd     	stp	x29, x30, [sp, #0xb0]
   253ac: 9102c3fd     	add	x29, sp, #0xb0
   253b0: d53bd055     	mrs	x21, TPIDR_EL0
   253b4: f94016a8     	ldr	x8, [x21, #0x28]
   253b8: aa0103f3     	mov	x19, x1
   253bc: aa0003f4     	mov	x20, x0
   253c0: 321e03e1     	orr	w1, wzr, #0x4
   253c4: 321e03e2     	orr	w2, wzr, #0x4
   253c8: aa1303e0     	mov	x0, x19
   253cc: f81d83a8     	stur	x8, [x29, #-0x28]
   253d0: 97ffbb90     	bl	0x14210 <_Z18CheckAndZeroBufferPvjj@plt>
   253d4: 35000420     	cbnz	w0, 0x25458 <_ZN18CxAudioHidDev2080517DeviceGetChipCodeEPj+0xbc>
   253d8: d2800089     	mov	x9, #0x4                // =4
   253dc: f2a02069     	movk	x9, #0x103, lsl #16
   253e0: f2c46009     	movk	x9, #0x2300, lsl #32
   253e4: b0000041     	adrp	x1, 0x2e000 <AllHidDevProperties+0x2bf0>
   253e8: 528a28a8     	mov	w8, #0x5145             // =20805
   253ec: 6f00e400     	movi	v0.2d, #0000000000000000
   253f0: f2f665a9     	movk	x9, #0xb32d, lsl #48
   253f4: 320003ea     	orr	w10, wzr, #0x1
   253f8: 91356021     	add	x1, x1, #0xd58
   253fc: 320003e0     	orr	w0, wzr, #0x1
   25400: b9000268     	str	w8, [x19]
   25404: 3c8743e0     	stur	q0, [sp, #0x74]
   25408: 3c8643e0     	stur	q0, [sp, #0x64]
   2540c: 3c8543e0     	stur	q0, [sp, #0x54]
   25410: 3c8083e0     	stur	q0, [sp, #0x8]
   25414: b90043ff     	str	wzr, [sp, #0x40]
   25418: f9001fff     	str	xzr, [sp, #0x38]
   2541c: 3c8283e0     	stur	q0, [sp, #0x28]
   25420: 3c8183e0     	stur	q0, [sp, #0x18]
   25424: f90027e9     	str	x9, [sp, #0x48]
   25428: b90053ea     	str	w10, [sp, #0x50]
   2542c: 97ffba51     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   25430: f9400288     	ldr	x8, [x20]
   25434: 910123e1     	add	x1, sp, #0x48
   25438: 910023e2     	add	x2, sp, #0x8
   2543c: aa1403e0     	mov	x0, x20
   25440: f9418108     	ldr	x8, [x8, #0x300]
   25444: aa1f03e3     	mov	x3, xzr
   25448: d63f0100     	blr	x8
   2544c: 35000060     	cbnz	w0, 0x25458 <_ZN18CxAudioHidDev2080517DeviceGetChipCodeEPj+0xbc>
   25450: b94013e8     	ldr	w8, [sp, #0x10]
   25454: b9000268     	str	w8, [x19]
   25458: f94016a8     	ldr	x8, [x21, #0x28]
   2545c: f85d83a9     	ldur	x9, [x29, #-0x28]
   25460: eb09011f     	cmp	x8, x9
   25464: 540000c1     	b.ne	0x2547c <_ZN18CxAudioHidDev2080517DeviceGetChipCodeEPj+0xe0>
   25468: a94b7bfd     	ldp	x29, x30, [sp, #0xb0]
   2546c: a94a4ff4     	ldp	x20, x19, [sp, #0xa0]
   25470: f9404bf5     	ldr	x21, [sp, #0x90]
   25474: 910303ff     	add	sp, sp, #0xc0
   25478: d65f03c0     	ret
   2547c: 97ffba1d     	bl	0x13cf0 <__stack_chk_fail@plt>

0000000000025480 <_ZN18CxAudioHidDev2080523DeviceGetChipCodeStringEPcj>:
   25480: d10103ff     	sub	sp, sp, #0x40
   25484: f9000bf5     	str	x21, [sp, #0x10]
   25488: a9024ff4     	stp	x20, x19, [sp, #0x20]
   2548c: a9037bfd     	stp	x29, x30, [sp, #0x30]
   25490: 9100c3fd     	add	x29, sp, #0x30
   25494: d53bd055     	mrs	x21, TPIDR_EL0
   25498: f94016a8     	ldr	x8, [x21, #0x28]
   2549c: aa0103f4     	mov	x20, x1
   254a0: 910013e1     	add	x1, sp, #0x4
   254a4: 2a0203f3     	mov	w19, w2
   254a8: f90007e8     	str	x8, [sp, #0x8]
   254ac: b90007ff     	str	wzr, [sp, #0x4]
   254b0: f9400008     	ldr	x8, [x0]
   254b4: f9412508     	ldr	x8, [x8, #0x248]
   254b8: d63f0100     	blr	x8
   254bc: 35000280     	cbnz	w0, 0x2550c <_ZN18CxAudioHidDev2080523DeviceGetChipCodeStringEPcj+0x8c>
   254c0: 528001a2     	mov	w2, #0xd                // =13
   254c4: aa1403e0     	mov	x0, x20
   254c8: 2a1303e1     	mov	w1, w19
   254cc: 97ffbb51     	bl	0x14210 <_Z18CheckAndZeroBufferPvjj@plt>
   254d0: 350001e0     	cbnz	w0, 0x2550c <_ZN18CxAudioHidDev2080523DeviceGetChipCodeStringEPcj+0x8c>
   254d4: b0000042     	adrp	x2, 0x2e000 <AllHidDevProperties+0x2bf0>
   254d8: 2a1303e1     	mov	w1, w19
   254dc: 9135cc42     	add	x2, x2, #0xd73
   254e0: aa1403e0     	mov	x0, x20
   254e4: 97ffb99b     	bl	0x13b50 <snprintf@plt>
   254e8: 3100041f     	cmn	w0, #0x1
   254ec: 54000060     	b.eq	0x254f8 <_ZN18CxAudioHidDev2080523DeviceGetChipCodeStringEPcj+0x78>
   254f0: 2a1f03e0     	mov	w0, wzr
   254f4: 14000006     	b	0x2550c <_ZN18CxAudioHidDev2080523DeviceGetChipCodeStringEPcj+0x8c>
   254f8: b0000041     	adrp	x1, 0x2e000 <AllHidDevProperties+0x2bf0>
   254fc: 9135ec21     	add	x1, x1, #0xd7b
   25500: 320007e0     	orr	w0, wzr, #0x3
   25504: 97ffba1b     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   25508: 321f03e0     	orr	w0, wzr, #0x2
   2550c: f94016a8     	ldr	x8, [x21, #0x28]
   25510: f94007e9     	ldr	x9, [sp, #0x8]
   25514: eb09011f     	cmp	x8, x9
   25518: 540000c1     	b.ne	0x25530 <_ZN18CxAudioHidDev2080523DeviceGetChipCodeStringEPcj+0xb0>
   2551c: a9437bfd     	ldp	x29, x30, [sp, #0x30]
   25520: a9424ff4     	ldp	x20, x19, [sp, #0x20]
   25524: f9400bf5     	ldr	x21, [sp, #0x10]
   25528: 910103ff     	add	sp, sp, #0x40
   2552c: d65f03c0     	ret
   25530: 97ffb9f0     	bl	0x13cf0 <__stack_chk_fail@plt>
