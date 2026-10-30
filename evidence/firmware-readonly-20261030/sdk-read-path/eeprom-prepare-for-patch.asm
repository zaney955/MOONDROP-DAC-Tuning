
evidence/android-arm64/libCxAudioHidLib.so:	file format elf64-littleaarch64

Disassembly of section .text:

0000000000027a54 <CxAudioHidDev20805::EepromPrepareForPatch()>:
   27a54: d101c3ff     	sub	sp, sp, #0x70
   27a58: a9054ff4     	stp	x20, x19, [sp, #0x50]
   27a5c: a9067bfd     	stp	x29, x30, [sp, #0x60]
   27a60: 910183fd     	add	x29, sp, #0x60
   27a64: d53bd054     	mrs	x20, TPIDR_EL0
   27a68: f9401688     	ldr	x8, [x20, #0x28]
   27a6c: d2a00029     	mov	x9, #0x10000            // =65536
   27a70: f2c66009     	movk	x9, #0x3300, lsl #32
   27a74: 6f00e400     	movi	v0.2d, #0000000000000000
   27a78: f2f6e5a9     	movk	x9, #0xb72d, lsl #48
   27a7c: f81e83a8     	stur	x8, [x29, #-0x18]
   27a80: b90007ff     	str	wzr, [sp, #0x4]
   27a84: ad0103e0     	stp	q0, q0, [sp, #0x20]
   27a88: b90043ff     	str	wzr, [sp, #0x40]
   27a8c: 3c8103e0     	stur	q0, [sp, #0x10]
   27a90: f90007e9     	str	x9, [sp, #0x8]
   27a94: f9400008     	ldr	x8, [x0]
   27a98: 910023e1     	add	x1, sp, #0x8
   27a9c: 910013e3     	add	x3, sp, #0x4
   27aa0: aa1f03e2     	mov	x2, xzr
   27aa4: f9418108     	ldr	x8, [x8, #0x300]
   27aa8: d63f0100     	blr	x8
   27aac: 2a0003f3     	mov	w19, w0
   27ab0: 350000b3     	cbnz	w19, 0x27ac4 <CxAudioHidDev20805::EepromPrepareForPatch()+0x70>
   27ab4: f0000021     	adrp	x1, 0x2e000 <AllHidDevProperties+0x2bf0>
   27ab8: 913f7c21     	add	x1, x1, #0xfdf
   27abc: 321a03e0     	orr	w0, wzr, #0x40
   27ac0: 97ffb0ac     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   27ac4: f9401688     	ldr	x8, [x20, #0x28]
   27ac8: f85e83a9     	ldur	x9, [x29, #-0x18]
   27acc: eb09011f     	cmp	x8, x9
   27ad0: 540000c1     	b.ne	0x27ae8 <CxAudioHidDev20805::EepromPrepareForPatch()+0x94>
   27ad4: 2a1303e0     	mov	w0, w19
   27ad8: a9467bfd     	ldp	x29, x30, [sp, #0x60]
   27adc: a9454ff4     	ldp	x20, x19, [sp, #0x50]
   27ae0: 9101c3ff     	add	sp, sp, #0x70
   27ae4: d65f03c0     	ret
   27ae8: 97ffb082     	bl	0x13cf0 <__stack_chk_fail@plt>
