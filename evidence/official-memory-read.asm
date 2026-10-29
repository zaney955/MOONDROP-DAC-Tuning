
evidence/android-arm64/libCxAudioHidLib.so:	file format elf64-littleaarch64

Disassembly of section .text:

0000000000024470 <_ZN18CxAudioHidDev2080515MemoryReadDwordE18CXCAPE_MEMORY_TYPEjPj>:
   24470: d10403ff     	sub	sp, sp, #0x100
   24474: f9005bf9     	str	x25, [sp, #0xb0]
   24478: a90c5ff8     	stp	x24, x23, [sp, #0xc0]
   2447c: a90d57f6     	stp	x22, x21, [sp, #0xd0]
   24480: a90e4ff4     	stp	x20, x19, [sp, #0xe0]
   24484: a90f7bfd     	stp	x29, x30, [sp, #0xf0]
   24488: 9103c3fd     	add	x29, sp, #0xf0
   2448c: d53bd058     	mrs	x24, TPIDR_EL0
   24490: f9401708     	ldr	x8, [x24, #0x28]
   24494: 2a0103f6     	mov	w22, w1
   24498: 910023f9     	add	x25, sp, #0x8
   2449c: 710006df     	cmp	w22, #0x1
   244a0: aa0303f3     	mov	x19, x3
   244a4: f9000328     	str	x8, [x25]
   244a8: 1a9f97e8     	cset	w8, hi
   244ac: b81a83a8     	stur	w8, [x29, #-0x58]
   244b0: 321f0be8     	orr	w8, wzr, #0xe
   244b4: f100027f     	cmp	x19, #0x0
   244b8: b81ac3a8     	stur	w8, [x29, #-0x54]
   244bc: 1a9f17e8     	cset	w8, eq
   244c0: aa0003f5     	mov	x21, x0
   244c4: b81b03a8     	stur	w8, [x29, #-0x50]
   244c8: 52800228     	mov	w8, #0x11               // =17
   244cc: d10163a0     	sub	x0, x29, #0x58
   244d0: 321f03e1     	orr	w1, wzr, #0x2
   244d4: 2a0203f4     	mov	w20, w2
   244d8: b81b43a8     	stur	w8, [x29, #-0x4c]
   244dc: 97ffbdb1     	bl	0x13ba0 <_Z25CxUtilsCheckPreConditionsP19_CXHID_PRECONDITIONj@plt>
   244e0: 2a0003f7     	mov	w23, w0
   244e4: 35000477     	cbnz	w23, 0x24570 <_ZN18CxAudioHidDev2080515MemoryReadDwordE18CXCAPE_MEMORY_TYPEjPj+0x100>
   244e8: d2800088     	mov	x8, #0x4                // =4
   244ec: f2a020c8     	movk	x8, #0x106, lsl #16
   244f0: f2c46008     	movk	x8, #0x2300, lsl #32
   244f4: 6f00e400     	movi	v0.2d, #0000000000000000
   244f8: f2f665a8     	movk	x8, #0xb32d, lsl #48
   244fc: b90017ff     	str	wzr, [sp, #0x14]
   24500: b90093ff     	str	wzr, [sp, #0x90]
   24504: f90047ff     	str	xzr, [sp, #0x88]
   24508: 3c8783e0     	stur	q0, [sp, #0x78]
   2450c: 3c8683e0     	stur	q0, [sp, #0x68]
   24510: 3c8183e0     	stur	q0, [sp, #0x18]
   24514: b90053ff     	str	wzr, [sp, #0x50]
   24518: f90027ff     	str	xzr, [sp, #0x48]
   2451c: 3c8383e0     	stur	q0, [sp, #0x38]
   24520: 3c8283e0     	stur	q0, [sp, #0x28]
   24524: f9002fe8     	str	x8, [sp, #0x58]
   24528: 290c53f6     	stp	w22, w20, [sp, #0x60]
   2452c: f94002a8     	ldr	x8, [x21]
   24530: 910163e1     	add	x1, sp, #0x58
   24534: 910063e2     	add	x2, sp, #0x18
   24538: 910053e3     	add	x3, sp, #0x14
   2453c: f9418108     	ldr	x8, [x8, #0x300]
   24540: aa1503e0     	mov	x0, x21
   24544: d63f0100     	blr	x8
   24548: 2a0003f7     	mov	w23, w0
   2454c: 35000137     	cbnz	w23, 0x24570 <_ZN18CxAudioHidDev2080515MemoryReadDwordE18CXCAPE_MEMORY_TYPEjPj+0x100>
   24550: b94023f5     	ldr	w21, [sp, #0x20]
   24554: f0000041     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   24558: 9113ac21     	add	x1, x1, #0x4eb
   2455c: 321e03e0     	orr	w0, wzr, #0x4
   24560: 2a1403e2     	mov	w2, w20
   24564: 2a1503e3     	mov	w3, w21
   24568: 97ffbd7e     	bl	0x13b60 <_Z10LogNumber2jPKcjj@plt>
   2456c: b9000275     	str	w21, [x19]
   24570: f9401708     	ldr	x8, [x24, #0x28]
   24574: f9400329     	ldr	x9, [x25]
   24578: eb09011f     	cmp	x8, x9
   2457c: 54000121     	b.ne	0x245a0 <_ZN18CxAudioHidDev2080515MemoryReadDwordE18CXCAPE_MEMORY_TYPEjPj+0x130>
   24580: 2a1703e0     	mov	w0, w23
   24584: a94f7bfd     	ldp	x29, x30, [sp, #0xf0]
   24588: a94e4ff4     	ldp	x20, x19, [sp, #0xe0]
   2458c: a94d57f6     	ldp	x22, x21, [sp, #0xd0]
   24590: a94c5ff8     	ldp	x24, x23, [sp, #0xc0]
   24594: f9405bf9     	ldr	x25, [sp, #0xb0]
   24598: 910403ff     	add	sp, sp, #0x100
   2459c: d65f03c0     	ret
   245a0: 97ffbdd4     	bl	0x13cf0 <__stack_chk_fail@plt>
