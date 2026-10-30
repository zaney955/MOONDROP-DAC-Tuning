
evidence/android-arm64/libCxAudioHidLib.so:	file format elf64-littleaarch64

Disassembly of section .text:

00000000000245a4 <_ZN18CxAudioHidDev208055WriteEPhj>:
   245a4: d10283ff     	sub	sp, sp, #0xa0
   245a8: a90567fa     	stp	x26, x25, [sp, #0x50]
   245ac: a9065ff8     	stp	x24, x23, [sp, #0x60]
   245b0: a90757f6     	stp	x22, x21, [sp, #0x70]
   245b4: a9084ff4     	stp	x20, x19, [sp, #0x80]
   245b8: a9097bfd     	stp	x29, x30, [sp, #0x90]
   245bc: 910243fd     	add	x29, sp, #0x90
   245c0: d53bd058     	mrs	x24, TPIDR_EL0
   245c4: f9401709     	ldr	x9, [x24, #0x28]
   245c8: aa0103f4     	mov	x20, x1
   245cc: f100029f     	cmp	x20, #0x0
   245d0: 52800228     	mov	w8, #0x11               // =17
   245d4: 2a0203f3     	mov	w19, w2
   245d8: 1a9f0108     	csel	w8, w8, wzr, eq
   245dc: 2a13010a     	orr	w10, w8, w19
   245e0: 6f00e400     	movi	v0.2d, #0000000000000000
   245e4: f90027e9     	str	x9, [sp, #0x48]
   245e8: 320003e9     	orr	w9, wzr, #0x1
   245ec: 7100015f     	cmp	w10, #0x0
   245f0: 3c8083e0     	stur	q0, [sp, #0x8]
   245f4: 390023e9     	strb	w9, [sp, #0x8]
   245f8: 52800249     	mov	w9, #0x12               // =18
   245fc: aa0003f5     	mov	x21, x0
   24600: 1a880120     	csel	w0, w9, w8, eq
   24604: f803e3ff     	stur	xzr, [sp, #0x3e]
   24608: f9001fff     	str	xzr, [sp, #0x38]
   2460c: 3c8283e0     	stur	q0, [sp, #0x28]
   24610: 3c8183e0     	stur	q0, [sp, #0x18]
   24614: 340003f3     	cbz	w19, 0x24690 <_ZN18CxAudioHidDev208055WriteEPhj+0xec>
   24618: 350003c0     	cbnz	w0, 0x24690 <_ZN18CxAudioHidDev208055WriteEPhj+0xec>
   2461c: 910023f9     	add	x25, sp, #0x8
   24620: b27f0336     	orr	x22, x25, #0x2
   24624: 321e0ffa     	orr	w26, wzr, #0x3c
   24628: 2a1303e8     	mov	w8, w19
   2462c: 7100f27f     	cmp	w19, #0x3c
   24630: 9a9a3117     	csel	x23, x8, x26, lo
   24634: cb170348     	sub	x8, x26, x23
   24638: f100eeff     	cmp	x23, #0x3b
   2463c: 8b170329     	add	x9, x25, x23
   24640: 9a8883e2     	csel	x2, xzr, x8, hi
   24644: 91000920     	add	x0, x9, #0x2
   24648: 2a1f03e1     	mov	w1, wzr
   2464c: 97ffbec1     	bl	0x14150 <memset@plt>
   24650: aa1603e0     	mov	x0, x22
   24654: aa1403e1     	mov	x1, x20
   24658: aa1703e2     	mov	x2, x23
   2465c: 97ffbea5     	bl	0x140f0 <memcpy@plt>
   24660: b90007ff     	str	wzr, [sp, #0x4]
   24664: f94002a8     	ldr	x8, [x21]
   24668: 910023e1     	add	x1, sp, #0x8
   2466c: 321f13e2     	orr	w2, wzr, #0x3e
   24670: 910013e3     	add	x3, sp, #0x4
   24674: f9414108     	ldr	x8, [x8, #0x280]
   24678: aa1503e0     	mov	x0, x21
   2467c: 4b170273     	sub	w19, w19, w23
   24680: d63f0100     	blr	x8
   24684: 34000073     	cbz	w19, 0x24690 <_ZN18CxAudioHidDev208055WriteEPhj+0xec>
   24688: 8b170294     	add	x20, x20, x23
   2468c: 34fffce0     	cbz	w0, 0x24628 <_ZN18CxAudioHidDev208055WriteEPhj+0x84>
   24690: f9401708     	ldr	x8, [x24, #0x28]
   24694: f94027e9     	ldr	x9, [sp, #0x48]
   24698: eb09011f     	cmp	x8, x9
   2469c: 54000101     	b.ne	0x246bc <_ZN18CxAudioHidDev208055WriteEPhj+0x118>
   246a0: a9497bfd     	ldp	x29, x30, [sp, #0x90]
   246a4: a9484ff4     	ldp	x20, x19, [sp, #0x80]
   246a8: a94757f6     	ldp	x22, x21, [sp, #0x70]
   246ac: a9465ff8     	ldp	x24, x23, [sp, #0x60]
   246b0: a94567fa     	ldp	x26, x25, [sp, #0x50]
   246b4: 910283ff     	add	sp, sp, #0xa0
   246b8: d65f03c0     	ret
   246bc: 97ffbd8d     	bl	0x13cf0 <__stack_chk_fail@plt>

00000000000247e4 <_ZN18CxAudioHidDev208054ReadEPhj>:
   247e4: d10203ff     	sub	sp, sp, #0x80
   247e8: a90557f6     	stp	x22, x21, [sp, #0x50]
   247ec: a9064ff4     	stp	x20, x19, [sp, #0x60]
   247f0: a9077bfd     	stp	x29, x30, [sp, #0x70]
   247f4: 9101c3fd     	add	x29, sp, #0x70
   247f8: aa0103f3     	mov	x19, x1
   247fc: d53bd055     	mrs	x21, TPIDR_EL0
   24800: f100027f     	cmp	x19, #0x0
   24804: 52800228     	mov	w8, #0x11               // =17
   24808: 2a0203f4     	mov	w20, w2
   2480c: f94016a9     	ldr	x9, [x21, #0x28]
   24810: 1a9f0108     	csel	w8, w8, wzr, eq
   24814: 2a14010a     	orr	w10, w8, w20
   24818: 7100015f     	cmp	w10, #0x0
   2481c: 5280024a     	mov	w10, #0x12              // =18
   24820: 1a880148     	csel	w8, w10, w8, eq
   24824: f81d83a9     	stur	x9, [x29, #-0x28]
   24828: 321e0fe9     	orr	w9, wzr, #0x3c
   2482c: 7100011f     	cmp	w8, #0x0
   24830: 7a490282     	ccmp	w20, w9, #0x2, eq
   24834: 52800269     	mov	w9, #0x13               // =19
   24838: 6f00e400     	movi	v0.2d, #0000000000000000
   2483c: 1a883120     	csel	w0, w9, w8, lo
   24840: 320003e8     	orr	w8, wzr, #0x1
   24844: 3c8083e0     	stur	q0, [sp, #0x8]
   24848: f803e3ff     	stur	xzr, [sp, #0x3e]
   2484c: f9001fff     	str	xzr, [sp, #0x38]
   24850: 3c8283e0     	stur	q0, [sp, #0x28]
   24854: 3c8183e0     	stur	q0, [sp, #0x18]
   24858: 390023e8     	strb	w8, [sp, #0x8]
   2485c: 35000240     	cbnz	w0, 0x248a4 <_ZN18CxAudioHidDev208054ReadEPhj+0xc0>
   24860: 320003e0     	orr	w0, wzr, #0x1
   24864: 910023e1     	add	x1, sp, #0x8
   24868: 321f13e2     	orr	w2, wzr, #0x3e
   2486c: 910023f6     	add	x22, sp, #0x8
   24870: 97ffbdcc     	bl	0x13fa0 <_Z31CxAudioHidLibUSBReadInputReportjPht@plt>
   24874: 7100041f     	cmp	w0, #0x1
   24878: 5400014b     	b.lt	0x248a0 <_ZN18CxAudioHidDev208054ReadEPhj+0xbc>
   2487c: 2a1403e8     	mov	w8, w20
   24880: 7100f29f     	cmp	w20, #0x3c
   24884: 321e0fe9     	orr	w9, wzr, #0x3c
   24888: b27f02c1     	orr	x1, x22, #0x2
   2488c: 9a893102     	csel	x2, x8, x9, lo
   24890: aa1303e0     	mov	x0, x19
   24894: 97ffbe17     	bl	0x140f0 <memcpy@plt>
   24898: 2a1f03e0     	mov	w0, wzr
   2489c: 14000002     	b	0x248a4 <_ZN18CxAudioHidDev208054ReadEPhj+0xc0>
   248a0: 321d07e0     	orr	w0, wzr, #0x18
   248a4: f94016a8     	ldr	x8, [x21, #0x28]
   248a8: f85d83a9     	ldur	x9, [x29, #-0x28]
   248ac: eb09011f     	cmp	x8, x9
   248b0: 540000c1     	b.ne	0x248c8 <_ZN18CxAudioHidDev208054ReadEPhj+0xe4>
   248b4: a9477bfd     	ldp	x29, x30, [sp, #0x70]
   248b8: a9464ff4     	ldp	x20, x19, [sp, #0x60]
   248bc: a94557f6     	ldp	x22, x21, [sp, #0x50]
   248c0: 910203ff     	add	sp, sp, #0x80
   248c4: d65f03c0     	ret
   248c8: 97ffbd0a     	bl	0x13cf0 <__stack_chk_fail@plt>

0000000000025040 <_ZN18CxAudioHidDev2080525DeviceGetRomVersionStringEPcj>:
   25040: d10143ff     	sub	sp, sp, #0x50
   25044: f90013f5     	str	x21, [sp, #0x20]
   25048: a9034ff4     	stp	x20, x19, [sp, #0x30]
   2504c: a9047bfd     	stp	x29, x30, [sp, #0x40]
   25050: 910103fd     	add	x29, sp, #0x40
   25054: d53bd055     	mrs	x21, TPIDR_EL0
   25058: f94016a8     	ldr	x8, [x21, #0x28]
   2505c: aa0103f4     	mov	x20, x1
   25060: 910023e1     	add	x1, sp, #0x8
   25064: 2a0203f3     	mov	w19, w2
   25068: f9000fe8     	str	x8, [sp, #0x18]
   2506c: a900ffff     	stp	xzr, xzr, [sp, #0x8]
   25070: f9400008     	ldr	x8, [x0]
   25074: f9411908     	ldr	x8, [x8, #0x230]
   25078: d63f0100     	blr	x8
   2507c: 350001a0     	cbnz	w0, 0x250b0 <_ZN18CxAudioHidDev2080525DeviceGetRomVersionStringEPcj+0x70>
   25080: b9400be8     	ldr	w8, [sp, #0x8]
   25084: 71000d1f     	cmp	w8, #0x3
   25088: 54000063     	b.lo	0x25094 <_ZN18CxAudioHidDev2080525DeviceGetRomVersionStringEPcj+0x54>
   2508c: 321f03e8     	orr	w8, wzr, #0x2
   25090: b9000be8     	str	w8, [sp, #0x8]
   25094: 910023e2     	add	x2, sp, #0x8
   25098: aa1403e0     	mov	x0, x20
   2509c: 2a1303e1     	mov	w1, w19
   250a0: 2a1f03e3     	mov	w3, wzr
   250a4: f800c3ff     	stur	xzr, [sp, #0xc]
   250a8: b90017ff     	str	wzr, [sp, #0x14]
   250ac: 97ffbad5     	bl	0x13c00 <_Z30ConvertFirmwareVersionToStringPcjP16_HID_DEV_VERSIONb@plt>
   250b0: f94016a8     	ldr	x8, [x21, #0x28]
   250b4: f9400fe9     	ldr	x9, [sp, #0x18]
   250b8: eb09011f     	cmp	x8, x9
   250bc: 540000c1     	b.ne	0x250d4 <_ZN18CxAudioHidDev2080525DeviceGetRomVersionStringEPcj+0x94>
   250c0: a9447bfd     	ldp	x29, x30, [sp, #0x40]
   250c4: a9434ff4     	ldp	x20, x19, [sp, #0x30]
   250c8: f94013f5     	ldr	x21, [sp, #0x20]
   250cc: 910143ff     	add	sp, sp, #0x50
   250d0: d65f03c0     	ret
   250d4: 97ffbb07     	bl	0x13cf0 <__stack_chk_fail@plt>

00000000000258a8 <_ZN18CxAudioHidDev2080510EepromReadEjjPhjP15_MEMOP_FEEDBACK>:
   258a8: f9400008     	ldr	x8, [x0]
   258ac: f9418d06     	ldr	x6, [x8, #0x318]
   258b0: d61f00c0     	br	x6

00000000000258c0 <_ZN18CxAudioHidDev2080513EepromGetSizeEv>:
   258c0: b9400c00     	ldr	w0, [x0, #0xc]
   258c4: d65f03c0     	ret
