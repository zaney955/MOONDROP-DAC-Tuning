
evidence/android-arm64/libCxAudioHidLib.so:	file format elf64-littleaarch64

Disassembly of section .text:

00000000000270d4 <CxAudioHidDev20805::SpimemSize()>:
   270d4: d10343ff     	sub	sp, sp, #0xd0
   270d8: f90053f5     	str	x21, [sp, #0xa0]
   270dc: a90b4ff4     	stp	x20, x19, [sp, #0xb0]
   270e0: a90c7bfd     	stp	x29, x30, [sp, #0xc0]
   270e4: 910303fd     	add	x29, sp, #0xc0
   270e8: d53bd054     	mrs	x20, TPIDR_EL0
   270ec: f9401688     	ldr	x8, [x20, #0x28]
   270f0: 910003f5     	mov	x21, sp
   270f4: aa0003f3     	mov	x19, x0
   270f8: f90002a8     	str	x8, [x21]
   270fc: b9451268     	ldr	w8, [x19, #0x510]
   27100: 340006c8     	cbz	w8, 0x271d8 <CxAudioHidDev20805::SpimemSize()+0x104>
   27104: b944d668     	ldr	w8, [x19, #0x4d4]
   27108: 340005a8     	cbz	w8, 0x271bc <CxAudioHidDev20805::SpimemSize()+0xe8>
   2710c: f0000028     	adrp	x8, 0x2e000 <AllHidDevProperties+0x2bf0>
   27110: 3dc1d501     	ldr	q1, [x8, #0x750]
   27114: 6f00e400     	movi	v0.2d, #0000000000000000
   27118: b9008bff     	str	wzr, [sp, #0x88]
   2711c: f90043ff     	str	xzr, [sp, #0x80]
   27120: ad0303e0     	stp	q0, q0, [sp, #0x60]
   27124: 3d8007e0     	str	q0, [sp, #0x10]
   27128: b9004bff     	str	wzr, [sp, #0x48]
   2712c: f90023ff     	str	xzr, [sp, #0x40]
   27130: ad0103e0     	stp	q0, q0, [sp, #0x20]
   27134: b9000fff     	str	wzr, [sp, #0xc]
   27138: 3d8017e1     	str	q1, [sp, #0x50]
   2713c: f9400268     	ldr	x8, [x19]
   27140: 910143e1     	add	x1, sp, #0x50
   27144: 910043e2     	add	x2, sp, #0x10
   27148: 910033e3     	add	x3, sp, #0xc
   2714c: f9418108     	ldr	x8, [x8, #0x300]
   27150: aa1303e0     	mov	x0, x19
   27154: d63f0100     	blr	x8
   27158: 35000400     	cbnz	w0, 0x271d8 <CxAudioHidDev20805::SpimemSize()+0x104>
   2715c: b9401bf3     	ldr	w19, [sp, #0x18]
   27160: f0000021     	adrp	x1, 0x2e000 <AllHidDevProperties+0x2bf0>
   27164: 91392821     	add	x1, x1, #0xe4a
   27168: 321e03e0     	orr	w0, wzr, #0x4
   2716c: 2a1303e2     	mov	w2, w19
   27170: 97ffb2d0     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   27174: 528818e8     	mov	w8, #0x40c7             // =16583
   27178: 72a00288     	movk	w8, #0x14, lsl #16
   2717c: 6b08027f     	cmp	w19, w8
   27180: 5400040c     	b.gt	0x27200 <CxAudioHidDev20805::SpimemSize()+0x12c>
   27184: 528883c8     	mov	w8, #0x441e             // =17438
   27188: 72a00028     	movk	w8, #0x1, lsl #16
   2718c: 6b08027f     	cmp	w19, w8
   27190: 540005ac     	b.gt	0x27244 <CxAudioHidDev20805::SpimemSize()+0x170>
   27194: 528903e8     	mov	w8, #0x481f             // =18463
   27198: 6b08027f     	cmp	w19, w8
   2719c: 54000900     	b.eq	0x272bc <CxAudioHidDev20805::SpimemSize()+0x1e8>
   271a0: 5290c3e8     	mov	w8, #0x861f             // =34335
   271a4: 6b08027f     	cmp	w19, w8
   271a8: 54000820     	b.eq	0x272ac <CxAudioHidDev20805::SpimemSize()+0x1d8>
   271ac: 5290e3e8     	mov	w8, #0x871f             // =34591
   271b0: 6b08027f     	cmp	w19, w8
   271b4: 54000800     	b.eq	0x272b4 <CxAudioHidDev20805::SpimemSize()+0x1e0>
   271b8: 14000045     	b	0x272cc <CxAudioHidDev20805::SpimemSize()+0x1f8>
   271bc: f9400268     	ldr	x8, [x19]
   271c0: aa1303e0     	mov	x0, x19
   271c4: aa1f03e1     	mov	x1, xzr
   271c8: 2a1f03e2     	mov	w2, wzr
   271cc: f9418508     	ldr	x8, [x8, #0x308]
   271d0: d63f0100     	blr	x8
   271d4: 34fff9c0     	cbz	w0, 0x2710c <CxAudioHidDev20805::SpimemSize()+0x38>
   271d8: 12800000     	mov	w0, #-0x1               // =-1
   271dc: f9401688     	ldr	x8, [x20, #0x28]
   271e0: f94002a9     	ldr	x9, [x21]
   271e4: eb09011f     	cmp	x8, x9
   271e8: 540007c1     	b.ne	0x272e0 <CxAudioHidDev20805::SpimemSize()+0x20c>
   271ec: a94c7bfd     	ldp	x29, x30, [sp, #0xc0]
   271f0: a94b4ff4     	ldp	x20, x19, [sp, #0xb0]
   271f4: f94053f5     	ldr	x21, [sp, #0xa0]
   271f8: 910343ff     	add	sp, sp, #0xd0
   271fc: d65f03c0     	ret
   27200: 528818e8     	mov	w8, #0x40c7             // =16583
   27204: 72a002c8     	movk	w8, #0x16, lsl #16
   27208: 6b08027f     	cmp	w19, w8
   2720c: 5400038c     	b.gt	0x2727c <CxAudioHidDev20805::SpimemSize()+0x1a8>
   27210: 52881908     	mov	w8, #0x40c8             // =16584
   27214: 72a00288     	movk	w8, #0x14, lsl #16
   27218: 6b08027f     	cmp	w19, w8
   2721c: 54000540     	b.eq	0x272c4 <CxAudioHidDev20805::SpimemSize()+0x1f0>
   27220: 52804028     	mov	w8, #0x201              // =513
   27224: 72a002a8     	movk	w8, #0x15, lsl #16
   27228: 6b08027f     	cmp	w19, w8
   2722c: 54000440     	b.eq	0x272b4 <CxAudioHidDev20805::SpimemSize()+0x1e0>
   27230: 52841848     	mov	w8, #0x20c2             // =8386
   27234: 72a002c8     	movk	w8, #0x16, lsl #16
   27238: 6b08027f     	cmp	w19, w8
   2723c: 540003c0     	b.eq	0x272b4 <CxAudioHidDev20805::SpimemSize()+0x1e0>
   27240: 14000023     	b	0x272cc <CxAudioHidDev20805::SpimemSize()+0x1f8>
   27244: 528883e8     	mov	w8, #0x441f             // =17439
   27248: 72a00028     	movk	w8, #0x1, lsl #16
   2724c: 6b08027f     	cmp	w19, w8
   27250: 320d03e0     	orr	w0, wzr, #0x80000
   27254: 54fffc40     	b.eq	0x271dc <CxAudioHidDev20805::SpimemSize()+0x108>
   27258: 5288e3e8     	mov	w8, #0x471f             // =18207
   2725c: 72a00028     	movk	w8, #0x1, lsl #16
   27260: 6b08027f     	cmp	w19, w8
   27264: 54000280     	b.eq	0x272b4 <CxAudioHidDev20805::SpimemSize()+0x1e0>
   27268: 52841848     	mov	w8, #0x20c2             // =8386
   2726c: 72a00268     	movk	w8, #0x13, lsl #16
   27270: 6b08027f     	cmp	w19, w8
   27274: 54fffb40     	b.eq	0x271dc <CxAudioHidDev20805::SpimemSize()+0x108>
   27278: 14000015     	b	0x272cc <CxAudioHidDev20805::SpimemSize()+0x1f8>
   2727c: 52881908     	mov	w8, #0x40c8             // =16584
   27280: 72a002c8     	movk	w8, #0x16, lsl #16
   27284: 6b08027f     	cmp	w19, w8
   27288: 54000160     	b.eq	0x272b4 <CxAudioHidDev20805::SpimemSize()+0x1e0>
   2728c: 52841848     	mov	w8, #0x20c2             // =8386
   27290: 72a002e8     	movk	w8, #0x17, lsl #16
   27294: 6b08027f     	cmp	w19, w8
   27298: 54000120     	b.eq	0x272bc <CxAudioHidDev20805::SpimemSize()+0x1e8>
   2729c: 5284b7e8     	mov	w8, #0x25bf             // =9663
   272a0: 72a00828     	movk	w8, #0x41, lsl #16
   272a4: 6b08027f     	cmp	w19, w8
   272a8: 54000121     	b.ne	0x272cc <CxAudioHidDev20805::SpimemSize()+0x1f8>
   272ac: 320b03e0     	orr	w0, wzr, #0x200000
   272b0: 17ffffcb     	b	0x271dc <CxAudioHidDev20805::SpimemSize()+0x108>
   272b4: 320a03e0     	orr	w0, wzr, #0x400000
   272b8: 17ffffc9     	b	0x271dc <CxAudioHidDev20805::SpimemSize()+0x108>
   272bc: 320903e0     	orr	w0, wzr, #0x800000
   272c0: 17ffffc7     	b	0x271dc <CxAudioHidDev20805::SpimemSize()+0x108>
   272c4: 320c03e0     	orr	w0, wzr, #0x100000
   272c8: 17ffffc5     	b	0x271dc <CxAudioHidDev20805::SpimemSize()+0x108>
   272cc: f0000021     	adrp	x1, 0x2e000 <AllHidDevProperties+0x2bf0>
   272d0: 9139cc21     	add	x1, x1, #0xe73
   272d4: 321a03e0     	orr	w0, wzr, #0x40
   272d8: 97ffb2a6     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   272dc: 17ffffbf     	b	0x271d8 <CxAudioHidDev20805::SpimemSize()+0x104>
   272e0: 97ffb284     	bl	0x13cf0 <__stack_chk_fail@plt>
