
evidence/android-arm64/libCxAudioHidLib.so:	file format elf64-littleaarch64

Disassembly of section .text:

00000000000269c4 <_ZN18CxAudioHidDev2080515SpimemOperationE16_CXHID_OPERATIONjjPhjP15_MEMOP_FEEDBACK>:
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
   26a24: 340001f9     	cbz	w25, 0x26a60 <_ZN18CxAudioHidDev2080515SpimemOperationE16_CXHID_OPERATIONjjPhjP15_MEMOP_FEEDBACK+0x9c>
   26a28: f94007e8     	ldr	x8, [sp, #0x8]
   26a2c: f9401508     	ldr	x8, [x8, #0x28]
   26a30: f85a83a9     	ldur	x9, [x29, #-0x58]
   26a34: eb09011f     	cmp	x8, x9
   26a38: 54001281     	b.ne	0x26c88 <_ZN18CxAudioHidDev2080515SpimemOperationE16_CXHID_OPERATIONjjPhjP15_MEMOP_FEEDBACK+0x2c4>
   26a3c: 2a1903e0     	mov	w0, w25
   26a40: a9557bfd     	ldp	x29, x30, [sp, #0x150]
   26a44: a9544ff4     	ldp	x20, x19, [sp, #0x140]
   26a48: a95357f6     	ldp	x22, x21, [sp, #0x130]
   26a4c: a9525ff8     	ldp	x24, x23, [sp, #0x120]
   26a50: a95167fa     	ldp	x26, x25, [sp, #0x110]
   26a54: a9506ffc     	ldp	x28, x27, [sp, #0x100]
   26a58: 910583ff     	add	sp, sp, #0x160
   26a5c: d65f03c0     	ret
   26a60: b944d6a8     	ldr	w8, [x21, #0x4d4]
   26a64: 34000068     	cbz	w8, 0x26a70 <_ZN18CxAudioHidDev2080515SpimemOperationE16_CXHID_OPERATIONjjPhjP15_MEMOP_FEEDBACK+0xac>
   26a68: 2a1f03f9     	mov	w25, wzr
   26a6c: 14000008     	b	0x26a8c <_ZN18CxAudioHidDev2080515SpimemOperationE16_CXHID_OPERATIONjjPhjP15_MEMOP_FEEDBACK+0xc8>
   26a70: f94002a8     	ldr	x8, [x21]
   26a74: aa1503e0     	mov	x0, x21
   26a78: aa1f03e1     	mov	x1, xzr
   26a7c: 2a1f03e2     	mov	w2, wzr
   26a80: f9418508     	ldr	x8, [x8, #0x308]
   26a84: d63f0100     	blr	x8
   26a88: 2a0003f9     	mov	w25, w0
   26a8c: 6b17031f     	cmp	w24, w23
   26a90: 1a97331c     	csel	w28, w24, w23, lo
   26a94: 34fffcbc     	cbz	w28, 0x26a28 <_ZN18CxAudioHidDev2080515SpimemOperationE16_CXHID_OPERATIONjjPhjP15_MEMOP_FEEDBACK+0x64>
   26a98: 35fffc99     	cbnz	w25, 0x26a28 <_ZN18CxAudioHidDev2080515SpimemOperationE16_CXHID_OPERATIONjjPhjP15_MEMOP_FEEDBACK+0x64>
   26a9c: 52800068     	mov	w8, #0x3                // =3
   26aa0: 52800069     	mov	w9, #0x3                // =3
   26aa4: 7100029f     	cmp	w20, #0x0
   26aa8: 72a001c8     	movk	w8, #0xe, lsl #16
   26aac: 72a021c9     	movk	w9, #0x10e, lsl #16
   26ab0: 9100e3ed     	add	x13, sp, #0x38
   26ab4: 1a880128     	csel	w8, w9, w8, eq
   26ab8: 52a001aa     	mov	w10, #0xd0000           // =851968
   26abc: 52a021ab     	mov	w11, #0x10d0000         // =17629184
   26ac0: 9101e3ec     	add	x12, sp, #0x78
   26ac4: d10263ae     	sub	x14, x29, #0x98
   26ac8: b9001fe8     	str	w8, [sp, #0x1c]
   26acc: 910021a8     	add	x8, x13, #0x8
   26ad0: 1a9f07f8     	cset	w24, ne
   26ad4: 1a8a0176     	csel	w22, w11, w10, eq
   26ad8: 91003197     	add	x23, x12, #0xc
   26adc: f90017e8     	str	x8, [sp, #0x28]
   26ae0: 910051c8     	add	x8, x14, #0x14
   26ae4: f9000be8     	str	x8, [sp, #0x10]
   26ae8: f9400be9     	ldr	x9, [sp, #0x10]
   26aec: 6f00e400     	movi	v0.2d, #0000000000000000
   26af0: b944d2a8     	ldr	w8, [x21, #0x4d0]
   26af4: 2a1f03f9     	mov	w25, wzr
   26af8: f900113f     	str	xzr, [x9, #0x20]
   26afc: ad000120     	stp	q0, q0, [x9]
   26b00: b9401fe9     	ldr	w9, [sp, #0x1c]
   26b04: 6b1c011f     	cmp	w8, w28
   26b08: 1a9c311b     	csel	w27, w8, w28, lo
   26b0c: b90037ff     	str	wzr, [sp, #0x34]
   26b10: b81683a9     	stur	w9, [x29, #-0x98]
   26b14: 52846009     	mov	w9, #0x2300             // =8960
   26b18: 72b665a9     	movk	w9, #0xb32d, lsl #16
   26b1c: 292dffa9     	stp	w9, wzr, [x29, #-0x94]
   26b20: b90027fa     	str	w26, [sp, #0x24]
   26b24: 292eefba     	stp	w26, w27, [x29, #-0x8c]
   26b28: 35000134     	cbnz	w20, 0x26b4c <_ZN18CxAudioHidDev2080515SpimemOperationE16_CXHID_OPERATIONjjPhjP15_MEMOP_FEEDBACK+0x188>
   26b2c: f94002a8     	ldr	x8, [x21]
   26b30: d10263a1     	sub	x1, x29, #0x98
   26b34: 9100d3e3     	add	x3, sp, #0x34
   26b38: aa1503e0     	mov	x0, x21
   26b3c: f9418108     	ldr	x8, [x8, #0x300]
   26b40: aa1f03e2     	mov	x2, xzr
   26b44: d63f0100     	blr	x8
   26b48: 2a0003f9     	mov	w25, w0
   26b4c: b90023fb     	str	w27, [sp, #0x20]
   26b50: 53027f7b     	lsr	w27, w27, #2
   26b54: 3400073b     	cbz	w27, 0x26c38 <_ZN18CxAudioHidDev2080515SpimemOperationE16_CXHID_OPERATIONjjPhjP15_MEMOP_FEEDBACK+0x274>
   26b58: 35000719     	cbnz	w25, 0x26c38 <_ZN18CxAudioHidDev2080515SpimemOperationE16_CXHID_OPERATIONjjPhjP15_MEMOP_FEEDBACK+0x274>
   26b5c: 7100337f     	cmp	w27, #0xc
   26b60: 321e07e8     	orr	w8, wzr, #0xc
   26b64: 1a883368     	csel	w8, w27, w8, lo
   26b68: 7100029f     	cmp	w20, #0x0
   26b6c: 528001a9     	mov	w9, #0xd                // =13
   26b70: 1a88013a     	csel	w26, w9, w8, eq
   26b74: 0b180348     	add	w8, w26, w24
   26b78: 6f00e400     	movi	v0.2d, #0000000000000000
   26b7c: 2a160108     	orr	w8, w8, w22
   26b80: ad0082e0     	stp	q0, q0, [x23, #0x10]
   26b84: 3d8002e0     	str	q0, [x23]
   26b88: b9007be8     	str	w8, [sp, #0x78]
   26b8c: 52846008     	mov	w8, #0x2300             // =8960
   26b90: 72b665a8     	movk	w8, #0xb32d, lsl #16
   26b94: b90033ff     	str	wzr, [sp, #0x30]
   26b98: 3c8383e0     	stur	q0, [sp, #0x38]
   26b9c: b90073ff     	str	wzr, [sp, #0x70]
   26ba0: f90037ff     	str	xzr, [sp, #0x68]
   26ba4: 3c8583e0     	stur	q0, [sp, #0x58]
   26ba8: 3c8483e0     	stur	q0, [sp, #0x48]
   26bac: 290fffe8     	stp	w8, wzr, [sp, #0x7c]
   26bb0: 34000134     	cbz	w20, 0x26bd4 <_ZN18CxAudioHidDev2080515SpimemOperationE16_CXHID_OPERATIONjjPhjP15_MEMOP_FEEDBACK+0x210>
   26bb4: 531e7759     	lsl	w25, w26, #2
   26bb8: aa1703e0     	mov	x0, x23
   26bbc: aa1303e1     	mov	x1, x19
   26bc0: aa1903e2     	mov	x2, x25
   26bc4: 97ffb54b     	bl	0x140f0 <memcpy@plt>
   26bc8: 8b190273     	add	x19, x19, x25
   26bcc: 4b1a037b     	sub	w27, w27, w26
   26bd0: 14000003     	b	0x26bdc <_ZN18CxAudioHidDev2080515SpimemOperationE16_CXHID_OPERATIONjjPhjP15_MEMOP_FEEDBACK+0x218>
   26bd4: 52800688     	mov	w8, #0x34               // =52
   26bd8: b90087e8     	str	w8, [sp, #0x84]
   26bdc: f94002a8     	ldr	x8, [x21]
   26be0: 9101e3e1     	add	x1, sp, #0x78
   26be4: 9100e3e2     	add	x2, sp, #0x38
   26be8: 9100c3e3     	add	x3, sp, #0x30
   26bec: f9418108     	ldr	x8, [x8, #0x300]
   26bf0: aa1503e0     	mov	x0, x21
   26bf4: d63f0100     	blr	x8
   26bf8: 2a0003f9     	mov	w25, w0
   26bfc: 2a140328     	orr	w8, w25, w20
   26c00: 35000188     	cbnz	w8, 0x26c30 <_ZN18CxAudioHidDev2080515SpimemOperationE16_CXHID_OPERATIONjjPhjP15_MEMOP_FEEDBACK+0x26c>
   26c04: b9403be8     	ldr	w8, [sp, #0x38]
   26c08: 12003d09     	and	w9, w8, #0xffff
   26c0c: 34000169     	cbz	w9, 0x26c38 <_ZN18CxAudioHidDev2080515SpimemOperationE16_CXHID_OPERATIONjjPhjP15_MEMOP_FEEDBACK+0x274>
   26c10: f94017e1     	ldr	x1, [sp, #0x28]
   26c14: 13003d08     	sxth	w8, w8
   26c18: 937e7d1a     	sbfiz	x26, x8, #2, #32
   26c1c: aa1303e0     	mov	x0, x19
   26c20: aa1a03e2     	mov	x2, x26
   26c24: 4b08037b     	sub	w27, w27, w8
   26c28: 97ffb532     	bl	0x140f0 <memcpy@plt>
   26c2c: 8b1a0273     	add	x19, x19, x26
   26c30: 3400005b     	cbz	w27, 0x26c38 <_ZN18CxAudioHidDev2080515SpimemOperationE16_CXHID_OPERATIONjjPhjP15_MEMOP_FEEDBACK+0x274>
   26c34: 34fff959     	cbz	w25, 0x26b5c <_ZN18CxAudioHidDev2080515SpimemOperationE16_CXHID_OPERATIONjjPhjP15_MEMOP_FEEDBACK+0x198>
   26c38: 34000214     	cbz	w20, 0x26c78 <_ZN18CxAudioHidDev2080515SpimemOperationE16_CXHID_OPERATIONjjPhjP15_MEMOP_FEEDBACK+0x2b4>
   26c3c: 29446bfb     	ldp	w27, w26, [sp, #0x20]
   26c40: 35000139     	cbnz	w25, 0x26c64 <_ZN18CxAudioHidDev2080515SpimemOperationE16_CXHID_OPERATIONjjPhjP15_MEMOP_FEEDBACK+0x2a0>
   26c44: f94002a8     	ldr	x8, [x21]
   26c48: d10263a1     	sub	x1, x29, #0x98
   26c4c: 9100d3e3     	add	x3, sp, #0x34
   26c50: aa1503e0     	mov	x0, x21
   26c54: f9418108     	ldr	x8, [x8, #0x300]
   26c58: aa1f03e2     	mov	x2, xzr
   26c5c: d63f0100     	blr	x8
   26c60: 2a0003f9     	mov	w25, w0
   26c64: 4b1b039c     	sub	w28, w28, w27
   26c68: 34ffee1c     	cbz	w28, 0x26a28 <_ZN18CxAudioHidDev2080515SpimemOperationE16_CXHID_OPERATIONjjPhjP15_MEMOP_FEEDBACK+0x64>
   26c6c: 0b1a037a     	add	w26, w27, w26
   26c70: 34fff3d9     	cbz	w25, 0x26ae8 <_ZN18CxAudioHidDev2080515SpimemOperationE16_CXHID_OPERATIONjjPhjP15_MEMOP_FEEDBACK+0x124>
   26c74: 17ffff6d     	b	0x26a28 <_ZN18CxAudioHidDev2080515SpimemOperationE16_CXHID_OPERATIONjjPhjP15_MEMOP_FEEDBACK+0x64>
   26c78: 29446bfb     	ldp	w27, w26, [sp, #0x20]
   26c7c: 4b1b039c     	sub	w28, w28, w27
   26c80: 35ffff7c     	cbnz	w28, 0x26c6c <_ZN18CxAudioHidDev2080515SpimemOperationE16_CXHID_OPERATIONjjPhjP15_MEMOP_FEEDBACK+0x2a8>
   26c84: 17ffff69     	b	0x26a28 <_ZN18CxAudioHidDev2080515SpimemOperationE16_CXHID_OPERATIONjjPhjP15_MEMOP_FEEDBACK+0x64>
   26c88: 97ffb41a     	bl	0x13cf0 <__stack_chk_fail@plt>
