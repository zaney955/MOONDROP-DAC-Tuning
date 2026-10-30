
evidence/android-arm64/libCxAudioHidLib.so:	file format elf64-littleaarch64

Disassembly of section .text:

00000000000266bc <CxAudioHidDev20805::SpimemOpen(unsigned int*, unsigned int)>:
   266bc: d10303ff     	sub	sp, sp, #0xc0
   266c0: f9003bf9     	str	x25, [sp, #0x70]
   266c4: a9085ff8     	stp	x24, x23, [sp, #0x80]
   266c8: a90957f6     	stp	x22, x21, [sp, #0x90]
   266cc: a90a4ff4     	stp	x20, x19, [sp, #0xa0]
   266d0: a90b7bfd     	stp	x29, x30, [sp, #0xb0]
   266d4: 9102c3fd     	add	x29, sp, #0xb0
   266d8: d53bd057     	mrs	x23, TPIDR_EL0
   266dc: f94016e8     	ldr	x8, [x23, #0x28]
   266e0: aa0103f3     	mov	x19, x1
   266e4: aa0003f4     	mov	x20, x0
   266e8: f81b83a8     	stur	x8, [x29, #-0x48]
   266ec: b4000073     	cbz	x19, 0x266f8 <CxAudioHidDev20805::SpimemOpen(unsigned int*, unsigned int)+0x3c>
   266f0: b9400275     	ldr	w21, [x19]
   266f4: 14000002     	b	0x266fc <CxAudioHidDev20805::SpimemOpen(unsigned int*, unsigned int)+0x40>
   266f8: 321a03f5     	orr	w21, wzr, #0x40
   266fc: b945128b     	ldr	w11, [x20, #0x510]
   26700: 6b0202bf     	cmp	w21, w2
   26704: 53027ea8     	lsr	w8, w21, #2
   26708: 1a95804a     	csel	w10, w2, w21, hi
   2670c: 7100005f     	cmp	w2, #0x0
   26710: 5280016c     	mov	w12, #0xb               // =11
   26714: 1a8a0118     	csel	w24, w8, w10, eq
   26718: 7100017f     	cmp	w11, #0x0
   2671c: 2a1f03e9     	mov	w9, wzr
   26720: 1a9f07ea     	cset	w10, ne
   26724: 1a8c13e0     	csel	w0, wzr, w12, ne
   26728: 320003e8     	orr	w8, wzr, #0x1
   2672c: 340005d5     	cbz	w21, 0x267e4 <CxAudioHidDev20805::SpimemOpen(unsigned int*, unsigned int)+0x128>
   26730: 340005ab     	cbz	w11, 0x267e4 <CxAudioHidDev20805::SpimemOpen(unsigned int*, unsigned int)+0x128>
   26734: 90000049     	adrp	x9, 0x2e000 <AllHidDevProperties+0x2bf0>
   26738: 3dc1c520     	ldr	q0, [x9, #0x710]
   2673c: 910083e8     	add	x8, sp, #0x20
   26740: 90000056     	adrp	x22, 0x2e000 <AllHidDevProperties+0x2bf0>
   26744: 91007119     	add	x25, x8, #0x1c
   26748: 9136f2d6     	add	x22, x22, #0xdbc
   2674c: 3d8003e0     	str	q0, [sp]
   26750: 6f00e400     	movi	v0.2d, #0000000000000000
   26754: ad000320     	stp	q0, q0, [x25]
   26758: 3dc003e0     	ldr	q0, [sp]
   2675c: 321e03e0     	orr	w0, wzr, #0x4
   26760: aa1603e1     	mov	x1, x22
   26764: 2a1503e2     	mov	w2, w21
   26768: b9001fff     	str	wzr, [sp, #0x1c]
   2676c: 3d800be0     	str	q0, [sp, #0x20]
   26770: 290657f5     	stp	w21, w21, [sp, #0x30]
   26774: b9003bff     	str	wzr, [sp, #0x38]
   26778: 97ffb54e     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   2677c: f9400288     	ldr	x8, [x20]
   26780: 910083e1     	add	x1, sp, #0x20
   26784: 910073e3     	add	x3, sp, #0x1c
   26788: aa1403e0     	mov	x0, x20
   2678c: f9418108     	ldr	x8, [x8, #0x300]
   26790: aa1f03e2     	mov	x2, xzr
   26794: d63f0100     	blr	x8
   26798: 34000140     	cbz	w0, 0x267c0 <CxAudioHidDev20805::SpimemOpen(unsigned int*, unsigned int)+0x104>
   2679c: b9401fe8     	ldr	w8, [sp, #0x1c]
   267a0: 3110651f     	cmn	w8, #0x419
   267a4: 540000a1     	b.ne	0x267b8 <CxAudioHidDev20805::SpimemOpen(unsigned int*, unsigned int)+0xfc>
   267a8: 6b1802bf     	cmp	w21, w24
   267ac: 1a9832a8     	csel	w8, w21, w24, lo
   267b0: 2a1f03e0     	mov	w0, wzr
   267b4: 4b0802b5     	sub	w21, w21, w8
   267b8: 320003e8     	orr	w8, wzr, #0x1
   267bc: 14000002     	b	0x267c4 <CxAudioHidDev20805::SpimemOpen(unsigned int*, unsigned int)+0x108>
   267c0: 2a1f03e8     	mov	w8, wzr
   267c4: 7100001f     	cmp	w0, #0x0
   267c8: 1a9f17ea     	cset	w10, eq
   267cc: 710002bf     	cmp	w21, #0x0
   267d0: 1a9f07e9     	cset	w9, ne
   267d4: 0a0a0129     	and	w9, w9, w10
   267d8: 7100053f     	cmp	w9, #0x1
   267dc: 54000041     	b.ne	0x267e4 <CxAudioHidDev20805::SpimemOpen(unsigned int*, unsigned int)+0x128>
   267e0: 3707fb88     	tbnz	w8, #0x0, 0x26750 <CxAudioHidDev20805::SpimemOpen(unsigned int*, unsigned int)+0x94>
   267e4: 7100015f     	cmp	w10, #0x0
   267e8: b904d689     	str	w9, [x20, #0x4d4]
   267ec: 1a9f12a9     	csel	w9, w21, wzr, ne
   267f0: b904d289     	str	w9, [x20, #0x4d0]
   267f4: b4000053     	cbz	x19, 0x267fc <CxAudioHidDev20805::SpimemOpen(unsigned int*, unsigned int)+0x140>
   267f8: b9000269     	str	w9, [x19]
   267fc: 710002bf     	cmp	w21, #0x0
   26800: f94016ea     	ldr	x10, [x23, #0x28]
   26804: f85b83ab     	ldur	x11, [x29, #-0x48]
   26808: 1a9f17ec     	cset	w12, eq
   2680c: 2a080188     	orr	w8, w12, w8
   26810: 321c07e9     	orr	w9, wzr, #0x30
   26814: 7100011f     	cmp	w8, #0x0
   26818: 1a801120     	csel	w0, w9, w0, ne
   2681c: eb0b015f     	cmp	x10, x11
   26820: 54000101     	b.ne	0x26840 <CxAudioHidDev20805::SpimemOpen(unsigned int*, unsigned int)+0x184>
   26824: a94b7bfd     	ldp	x29, x30, [sp, #0xb0]
   26828: a94a4ff4     	ldp	x20, x19, [sp, #0xa0]
   2682c: a94957f6     	ldp	x22, x21, [sp, #0x90]
   26830: a9485ff8     	ldp	x24, x23, [sp, #0x80]
   26834: f9403bf9     	ldr	x25, [sp, #0x70]
   26838: 910303ff     	add	sp, sp, #0xc0
   2683c: d65f03c0     	ret
   26840: 97ffb52c     	bl	0x13cf0 <__stack_chk_fail@plt>

0000000000026844 <non-virtual thunk to CxAudioHidDev20805::SpimemOpen(unsigned int*, unsigned int)>:
   26844: d111c000     	sub	x0, x0, #0x470
   26848: 17ffb652     	b	0x14190 <_ZN18CxAudioHidDev2080510SpimemOpenEPjj@plt>

000000000002684c <CxAudioHidDev20805::SpimemClose()>:
   2684c: d10243ff     	sub	sp, sp, #0x90
   26850: f90033f5     	str	x21, [sp, #0x60]
   26854: a9074ff4     	stp	x20, x19, [sp, #0x70]
   26858: a9087bfd     	stp	x29, x30, [sp, #0x80]
   2685c: 910203fd     	add	x29, sp, #0x80
   26860: d53bd055     	mrs	x21, TPIDR_EL0
   26864: f94016a8     	ldr	x8, [x21, #0x28]
   26868: aa0003f3     	mov	x19, x0
   2686c: f81d83a8     	stur	x8, [x29, #-0x28]
   26870: b9451268     	ldr	w8, [x19, #0x510]
   26874: 34000328     	cbz	w8, 0x268d8 <CxAudioHidDev20805::SpimemClose()+0x8c>
   26878: 90000048     	adrp	x8, 0x2e000 <AllHidDevProperties+0x2bf0>
   2687c: 3dc1c500     	ldr	q0, [x8, #0x710]
   26880: 6f00e401     	movi	v1.2d, #0000000000000000
   26884: b9000fff     	str	wzr, [sp, #0xc]
   26888: 3c83c3e1     	stur	q1, [sp, #0x3c]
   2688c: 3c82c3e1     	stur	q1, [sp, #0x2c]
   26890: 3d8007e0     	str	q0, [sp, #0x10]
   26894: f90013ff     	str	xzr, [sp, #0x20]
   26898: b9002bff     	str	wzr, [sp, #0x28]
   2689c: f9400268     	ldr	x8, [x19]
   268a0: 910043e1     	add	x1, sp, #0x10
   268a4: 910033e3     	add	x3, sp, #0xc
   268a8: aa1303e0     	mov	x0, x19
   268ac: f9418108     	ldr	x8, [x8, #0x300]
   268b0: aa1f03e2     	mov	x2, xzr
   268b4: d63f0100     	blr	x8
   268b8: 2a0003f4     	mov	w20, w0
   268bc: 35000114     	cbnz	w20, 0x268dc <CxAudioHidDev20805::SpimemClose()+0x90>
   268c0: 90000041     	adrp	x1, 0x2e000 <AllHidDevProperties+0x2bf0>
   268c4: 91379c21     	add	x1, x1, #0xde7
   268c8: 321e03e0     	orr	w0, wzr, #0x4
   268cc: 97ffb529     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   268d0: f9026a7f     	str	xzr, [x19, #0x4d0]
   268d4: 14000002     	b	0x268dc <CxAudioHidDev20805::SpimemClose()+0x90>
   268d8: 52800174     	mov	w20, #0xb               // =11
   268dc: f94016a8     	ldr	x8, [x21, #0x28]
   268e0: f85d83a9     	ldur	x9, [x29, #-0x28]
   268e4: eb09011f     	cmp	x8, x9
   268e8: 540000e1     	b.ne	0x26904 <CxAudioHidDev20805::SpimemClose()+0xb8>
   268ec: 2a1403e0     	mov	w0, w20
   268f0: a9487bfd     	ldp	x29, x30, [sp, #0x80]
   268f4: a9474ff4     	ldp	x20, x19, [sp, #0x70]
   268f8: f94033f5     	ldr	x21, [sp, #0x60]
   268fc: 910243ff     	add	sp, sp, #0x90
   26900: d65f03c0     	ret
   26904: 97ffb4fb     	bl	0x13cf0 <__stack_chk_fail@plt>

0000000000026908 <non-virtual thunk to CxAudioHidDev20805::SpimemClose()>:
   26908: d10243ff     	sub	sp, sp, #0x90
   2690c: f90033f5     	str	x21, [sp, #0x60]
   26910: a9074ff4     	stp	x20, x19, [sp, #0x70]
   26914: a9087bfd     	stp	x29, x30, [sp, #0x80]
   26918: 910203fd     	add	x29, sp, #0x80
   2691c: d53bd055     	mrs	x21, TPIDR_EL0
   26920: f94016a8     	ldr	x8, [x21, #0x28]
   26924: f81d83a8     	stur	x8, [x29, #-0x28]
   26928: b940a008     	ldr	w8, [x0, #0xa0]
   2692c: 34000348     	cbz	w8, 0x26994 <non-virtual thunk to CxAudioHidDev20805::SpimemClose()+0x8c>
   26930: 90000048     	adrp	x8, 0x2e000 <AllHidDevProperties+0x2bf0>
   26934: 3dc1c500     	ldr	q0, [x8, #0x710]
   26938: 6f00e401     	movi	v1.2d, #0000000000000000
   2693c: d111c013     	sub	x19, x0, #0x470
   26940: b9000fff     	str	wzr, [sp, #0xc]
   26944: 3c83c3e1     	stur	q1, [sp, #0x3c]
   26948: 3c82c3e1     	stur	q1, [sp, #0x2c]
   2694c: 3d8007e0     	str	q0, [sp, #0x10]
   26950: f90013ff     	str	xzr, [sp, #0x20]
   26954: b9002bff     	str	wzr, [sp, #0x28]
   26958: f9400268     	ldr	x8, [x19]
   2695c: 910043e1     	add	x1, sp, #0x10
   26960: 910033e3     	add	x3, sp, #0xc
   26964: aa1303e0     	mov	x0, x19
   26968: f9418108     	ldr	x8, [x8, #0x300]
   2696c: aa1f03e2     	mov	x2, xzr
   26970: d63f0100     	blr	x8
   26974: 2a0003f4     	mov	w20, w0
   26978: 35000114     	cbnz	w20, 0x26998 <non-virtual thunk to CxAudioHidDev20805::SpimemClose()+0x90>
   2697c: 90000041     	adrp	x1, 0x2e000 <AllHidDevProperties+0x2bf0>
   26980: 91379c21     	add	x1, x1, #0xde7
   26984: 321e03e0     	orr	w0, wzr, #0x4
   26988: 97ffb4fa     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   2698c: f9026a7f     	str	xzr, [x19, #0x4d0]
   26990: 14000002     	b	0x26998 <non-virtual thunk to CxAudioHidDev20805::SpimemClose()+0x90>
   26994: 52800174     	mov	w20, #0xb               // =11
   26998: f94016a8     	ldr	x8, [x21, #0x28]
   2699c: f85d83a9     	ldur	x9, [x29, #-0x28]
   269a0: eb09011f     	cmp	x8, x9
   269a4: 540000e1     	b.ne	0x269c0 <non-virtual thunk to CxAudioHidDev20805::SpimemClose()+0xb8>
   269a8: 2a1403e0     	mov	w0, w20
   269ac: a9487bfd     	ldp	x29, x30, [sp, #0x80]
   269b0: a9474ff4     	ldp	x20, x19, [sp, #0x70]
   269b4: f94033f5     	ldr	x21, [sp, #0x60]
   269b8: 910243ff     	add	sp, sp, #0x90
   269bc: d65f03c0     	ret
   269c0: 97ffb4cc     	bl	0x13cf0 <__stack_chk_fail@plt>

00000000000269c4 <CxAudioHidDev20805::SpimemOperation(_CXHID_OPERATION, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)>:
   269c4: d10583ff     	sub	sp, sp, #0x160
   269c8: a9106ffc     	stp	x28, x27, [sp, #0x100]
   269cc: a91167fa     	stp	x26, x25, [sp, #0x110]
   269d0: a9125ff8     	stp	x24, x23, [sp, #0x120]
   269d4: a91357f6     	stp	x22, x21, [sp, #0x130]
   269d8: a9144ff4     	stp	x20, x19, [sp, #0x140]
   269dc: a9157bfd     	stp	x29, x30, [sp, #0x150]
   269e0: 910543fd     	add	x29, sp, #0x150
   269e4: d53bd048     	mrs	x8, TPIDR_EL0
   269e8: f90007e8     	str	x8, [sp, #0x8]
   269ec: f9401508     	ldr	x8, [x8, #0x28]
   269f0: aa0003f5     	mov	x21, x0
   269f4: 2a0103f4     	mov	w20, w1
   269f8: 52800169     	mov	w9, #0xb                // =11
   269fc: f81a83a8     	stur	x8, [x29, #-0x58]
   26a00: b94512a8     	ldr	w8, [x21, #0x510]
   26a04: 2a0503f7     	mov	w23, w5
   26a08: aa0403f3     	mov	x19, x4
   26a0c: 2a0303f8     	mov	w24, w3
   26a10: 7100011f     	cmp	w8, #0x0
   26a14: 1a8913e8     	csel	w8, wzr, w9, ne
   26a18: 7a411a80     	ccmp	w20, #0x1, #0x0, ne
   26a1c: 1a888139     	csel	w25, w9, w8, hi
   26a20: 2a0203fa     	mov	w26, w2
   26a24: 340001f9     	cbz	w25, 0x26a60 <CxAudioHidDev20805::SpimemOperation(_CXHID_OPERATION, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x9c>
   26a28: f94007e8     	ldr	x8, [sp, #0x8]
   26a2c: f9401508     	ldr	x8, [x8, #0x28]
   26a30: f85a83a9     	ldur	x9, [x29, #-0x58]
   26a34: eb09011f     	cmp	x8, x9
   26a38: 54001281     	b.ne	0x26c88 <CxAudioHidDev20805::SpimemOperation(_CXHID_OPERATION, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x2c4>
   26a3c: 2a1903e0     	mov	w0, w25
   26a40: a9557bfd     	ldp	x29, x30, [sp, #0x150]
   26a44: a9544ff4     	ldp	x20, x19, [sp, #0x140]
   26a48: a95357f6     	ldp	x22, x21, [sp, #0x130]
   26a4c: a9525ff8     	ldp	x24, x23, [sp, #0x120]
   26a50: a95167fa     	ldp	x26, x25, [sp, #0x110]
   26a54: a9506ffc     	ldp	x28, x27, [sp, #0x100]
   26a58: 910583ff     	add	sp, sp, #0x160
   26a5c: d65f03c0     	ret
