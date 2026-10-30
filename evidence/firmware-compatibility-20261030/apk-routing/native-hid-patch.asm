
evidence/android-arm64/libCxAudioHidLib.so:	file format elf64-littleaarch64

Disassembly of section .text:

0000000000027b68 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)>:
   27b68: a9ba6ffc     	stp	x28, x27, [sp, #-0x60]!
   27b6c: a90167fa     	stp	x26, x25, [sp, #0x10]
   27b70: a9025ff8     	stp	x24, x23, [sp, #0x20]
   27b74: a90357f6     	stp	x22, x21, [sp, #0x30]
   27b78: a9044ff4     	stp	x20, x19, [sp, #0x40]
   27b7c: a9057bfd     	stp	x29, x30, [sp, #0x50]
   27b80: 910143fd     	add	x29, sp, #0x50
   27b84: d109c3ff     	sub	sp, sp, #0x270
   27b88: d53bd05c     	mrs	x28, TPIDR_EL0
   27b8c: f9401788     	ldr	x8, [x28, #0x28]
   27b90: aa0203f7     	mov	x23, x2
   27b94: aa0003f3     	mov	x19, x0
   27b98: aa1703e0     	mov	x0, x23
   27b9c: aa0303f5     	mov	x21, x3
   27ba0: 2a0103f6     	mov	w22, w1
   27ba4: f81a83a8     	stur	x8, [x29, #-0x58]
   27ba8: 97ffaf3e     	bl	0x138a0 <_Z15CxUtilsFileSizePKc@plt>
   27bac: 90000041     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   27bb0: 2a0003f8     	mov	w24, w0
   27bb4: 91002421     	add	x1, x1, #0x9
   27bb8: aa1703e0     	mov	x0, x23
   27bbc: 97ffb109     	bl	0x13fe0 <strstr@plt>
   27bc0: b4000520     	cbz	x0, 0x27c64 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xfc>
   27bc4: 9105a3e0     	add	x0, sp, #0x168
   27bc8: 52800d02     	mov	w2, #0x68               // =104
   27bcc: 2a1f03e1     	mov	w1, wzr
   27bd0: 97ffb160     	bl	0x14150 <memset@plt>
   27bd4: 90000021     	adrp	x1, 0x2b000
   27bd8: 912be421     	add	x1, x1, #0xaf9
   27bdc: aa1703e0     	mov	x0, x23
   27be0: 97ffb160     	bl	0x14160 <fopen@plt>
   27be4: aa0003f5     	mov	x21, x0
   27be8: b4000e15     	cbz	x21, 0x27da8 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x240>
   27bec: 6f00e400     	movi	v0.2d, #0000000000000000
   27bf0: 910203e0     	add	x0, sp, #0x80
   27bf4: 320003e1     	orr	w1, wzr, #0x1
   27bf8: 321b03e2     	orr	w2, wzr, #0x20
   27bfc: aa1503e3     	mov	x3, x21
   27c00: f9003bfc     	str	x28, [sp, #0x70]
   27c04: 2a1803fc     	mov	w28, w24
   27c08: ad0403e0     	stp	q0, q0, [sp, #0x80]
   27c0c: 97ffaf71     	bl	0x139d0 <fread@plt>
   27c10: 29505bf4     	ldp	w20, w22, [sp, #0x80]
   27c14: b9408bf7     	ldr	w23, [sp, #0x88]
   27c18: 5284601a     	mov	w26, #0x2300            // =8960
   27c1c: 7100801f     	cmp	w0, #0x20
   27c20: 72b665ba     	movk	w26, #0xb32d, lsl #16
   27c24: 54000c61     	b.ne	0x27db0 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x248>
   27c28: 90000041     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   27c2c: 91003821     	add	x1, x1, #0xe
   27c30: 321c03e0     	orr	w0, wzr, #0x10
   27c34: 2a1403e2     	mov	w2, w20
   27c38: 2a1603e3     	mov	w3, w22
   27c3c: 2a1703e4     	mov	w4, w23
   27c40: 97ffb078     	bl	0x13e20 <_Z10LogNumber3jPKcjjj@plt>
   27c44: 2951e7f8     	ldp	w24, w25, [sp, #0x8c]
   27c48: 90000041     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   27c4c: 91012021     	add	x1, x1, #0x48
   27c50: 321c03e0     	orr	w0, wzr, #0x10
   27c54: 2a1803e2     	mov	w2, w24
   27c58: 2a1903e3     	mov	w3, w25
   27c5c: 97ffafc1     	bl	0x13b60 <_Z10LogNumber2jPKcjj@plt>
   27c60: 14000055     	b	0x27db4 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x24c>
   27c64: 52971b00     	mov	w0, #0xb8d8             // =47320
   27c68: 72a000a0     	movk	w0, #0x5, lsl #16
   27c6c: 97ffb0ed     	bl	0x14020 <usleep@plt>
   27c70: 6f00e400     	movi	v0.2d, #0000000000000000
   27c74: 9105a3e0     	add	x0, sp, #0x168
   27c78: 321803e2     	orr	w2, wzr, #0x100
   27c7c: 2a1f03e1     	mov	w1, wzr
   27c80: ad0403e0     	stp	q0, q0, [sp, #0x80]
   27c84: 97ffb133     	bl	0x14150 <memset@plt>
   27c88: 9102a3e0     	add	x0, sp, #0xa8
   27c8c: 321a07e2     	orr	w2, wzr, #0xc0
   27c90: 2a1f03e1     	mov	w1, wzr
   27c94: 97ffb12f     	bl	0x14150 <memset@plt>
   27c98: 120006d9     	and	w25, w22, #0x3
   27c9c: b9005ff8     	str	w24, [sp, #0x5c]
   27ca0: 34001399     	cbz	w25, 0x27f10 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x3a8>
   27ca4: f9400268     	ldr	x8, [x19]
   27ca8: aa1303e0     	mov	x0, x19
   27cac: f9403908     	ldr	x8, [x8, #0x70]
   27cb0: d63f0100     	blr	x8
   27cb4: 2a0003fb     	mov	w27, w0
   27cb8: 3500025b     	cbnz	w27, 0x27d00 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x198>
   27cbc: 9105a3e1     	add	x1, sp, #0x168
   27cc0: aa1703e0     	mov	x0, x23
   27cc4: 97ffaf6f     	bl	0x13a80 <_Z15HandleImageFilePKcP10sfs_info_s@plt>
   27cc8: 2a0003fb     	mov	w27, w0
   27ccc: 350001bb     	cbnz	w27, 0x27d00 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x198>
   27cd0: 320003e8     	orr	w8, wzr, #0x1
   27cd4: aa1703e1     	mov	x1, x23
   27cd8: b9051a68     	str	w8, [x19, #0x518]
   27cdc: 97ffaf09     	bl	0x13900 <_ZN18CxAudioHidDev2080523IsPatchFileSupportResetEPKc@plt>
   27ce0: f9400268     	ldr	x8, [x19]
   27ce4: b9051e60     	str	w0, [x19, #0x51c]
   27ce8: 910203e1     	add	x1, sp, #0x80
   27cec: aa1303e0     	mov	x0, x19
   27cf0: f941a508     	ldr	x8, [x8, #0x348]
   27cf4: d63f0100     	blr	x8
   27cf8: 2a0003fb     	mov	w27, w0
   27cfc: 340018bb     	cbz	w27, 0x28010 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x4a8>
   27d00: aa1f03f4     	mov	x20, xzr
   27d04: aa1f03fa     	mov	x26, xzr
   27d08: aa1f03f8     	mov	x24, xzr
   27d0c: 2a1f03f7     	mov	w23, wzr
   27d10: 36000156     	tbz	w22, #0x0, 0x27d38 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x1d0>
   27d14: 90000041     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   27d18: 9112c821     	add	x1, x1, #0x4b2
   27d1c: 321a03e0     	orr	w0, wzr, #0x40
   27d20: 97ffb014     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   27d24: f9400268     	ldr	x8, [x19]
   27d28: 320003e1     	orr	w1, wzr, #0x1
   27d2c: aa1303e0     	mov	x0, x19
   27d30: f9419d08     	ldr	x8, [x8, #0x338]
   27d34: d63f0100     	blr	x8
   27d38: f9400268     	ldr	x8, [x19]
   27d3c: aa1303e0     	mov	x0, x19
   27d40: f9418908     	ldr	x8, [x8, #0x310]
   27d44: d63f0100     	blr	x8
   27d48: 36080116     	tbz	w22, #0x1, 0x27d68 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x200>
   27d4c: b40000f5     	cbz	x21, 0x27d68 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x200>
   27d50: b9405fe9     	ldr	w9, [sp, #0x5c]
   27d54: 320003e8     	orr	w8, wzr, #0x1
   27d58: b9001ab7     	str	w23, [x21, #0x18]
   27d5c: b90036a8     	str	w8, [x21, #0x34]
   27d60: b90012a9     	str	w9, [x21, #0x10]
   27d64: b9000abf     	str	wzr, [x21, #0x8]
   27d68: b4000078     	cbz	x24, 0x27d74 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x20c>
   27d6c: aa1803e0     	mov	x0, x24
   27d70: 97ffb114     	bl	0x141c0 <free@plt>
   27d74: b4000074     	cbz	x20, 0x27d80 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x218>
   27d78: aa1403e0     	mov	x0, x20
   27d7c: 97ffb111     	bl	0x141c0 <free@plt>
   27d80: b40011ba     	cbz	x26, 0x27fb4 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x44c>
   27d84: aa1a03e0     	mov	x0, x26
   27d88: 97ffafc2     	bl	0x13c90 <fclose@plt>
   27d8c: 34001140     	cbz	w0, 0x27fb4 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x44c>
   27d90: 90000041     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   27d94: 91135c21     	add	x1, x1, #0x4d7
   27d98: 52800860     	mov	w0, #0x43               // =67
   27d9c: 97ffaff5     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   27da0: 528003bb     	mov	w27, #0x1d              // =29
   27da4: 14000084     	b	0x27fb4 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x44c>
   27da8: 5280035b     	mov	w27, #0x1a              // =26
   27dac: 14000082     	b	0x27fb4 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x44c>
   27db0: 2951e7f8     	ldp	w24, w25, [sp, #0x8c]
   27db4: 528000a8     	mov	w8, #0x5                // =5
   27db8: 6f00e400     	movi	v0.2d, #0000000000000000
   27dbc: 72a01908     	movk	w8, #0xc8, lsl #16
   27dc0: 3c8d43e0     	stur	q0, [sp, #0xd4]
   27dc4: 3c8c43e0     	stur	q0, [sp, #0xc4]
   27dc8: 2914a3ff     	stp	wzr, w8, [sp, #0xa4]
   27dcc: 2915d3fa     	stp	w26, w20, [sp, #0xac]
   27dd0: 2916dff6     	stp	w22, w23, [sp, #0xb4]
   27dd4: 2917e7f8     	stp	w24, w25, [sp, #0xbc]
   27dd8: f9400268     	ldr	x8, [x19]
   27ddc: 9102a3e1     	add	x1, sp, #0xa8
   27de0: 910293e3     	add	x3, sp, #0xa4
   27de4: aa1303e0     	mov	x0, x19
   27de8: f9418108     	ldr	x8, [x8, #0x300]
   27dec: aa1f03e2     	mov	x2, xzr
   27df0: d63f0100     	blr	x8
   27df4: 2a0003fb     	mov	w27, w0
   27df8: 340000bb     	cbz	w27, 0x27e0c <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x2a4>
   27dfc: 90000041     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   27e00: 91022821     	add	x1, x1, #0x8a
   27e04: 320003e0     	orr	w0, wzr, #0x1
   27e08: 14000008     	b	0x27e28 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x2c0>
   27e0c: f0000021     	adrp	x1, 0x2e000 <AllHidDevProperties+0x2bf0>
   27e10: 913eec21     	add	x1, x1, #0xfbb
   27e14: 321e03e0     	orr	w0, wzr, #0x4
   27e18: 97ffafd6     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   27e1c: 90000041     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   27e20: 91018c21     	add	x1, x1, #0x63
   27e24: 321c03e0     	orr	w0, wzr, #0x10
   27e28: 97ffafd2     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   27e2c: 2a1c03e9     	mov	w9, w28
   27e30: f9403bfc     	ldr	x28, [sp, #0x70]
   27e34: 9102a3e8     	add	x8, sp, #0xa8
   27e38: 2a1f03f4     	mov	w20, wzr
   27e3c: 52a01937     	mov	w23, #0xc90000          // =13172736
   27e40: 91002116     	add	x22, x8, #0x8
   27e44: d1008138     	sub	x24, x9, #0x20
   27e48: 528001b9     	mov	w25, #0xd               // =13
   27e4c: 35000b1b     	cbnz	w27, 0x27fac <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x444>
   27e50: 9105a3e0     	add	x0, sp, #0x168
   27e54: 320003e1     	orr	w1, wzr, #0x1
   27e58: 52800682     	mov	w2, #0x34               // =52
   27e5c: aa1503e3     	mov	x3, x21
   27e60: 97ffaedc     	bl	0x139d0 <fread@plt>
   27e64: 34000700     	cbz	w0, 0x27f44 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x3dc>
   27e68: 53027c08     	lsr	w8, w0, #2
   27e6c: 121f3909     	and	w9, w8, #0xfffe
   27e70: 7100353f     	cmp	w9, #0xd
   27e74: 1a888328     	csel	w8, w25, w8, hi
   27e78: 12003d09     	and	w9, w8, #0xffff
   27e7c: 92403d08     	and	x8, x8, #0xffff
   27e80: 0b000294     	add	w20, w20, w0
   27e84: 6f00e400     	movi	v0.2d, #0000000000000000
   27e88: 2a170129     	orr	w9, w9, w23
   27e8c: d37ef502     	lsl	x2, x8, #2
   27e90: 9105a3e1     	add	x1, sp, #0x168
   27e94: aa1603e0     	mov	x0, x22
   27e98: b90032df     	str	wzr, [x22, #0x30]
   27e9c: ad0082c0     	stp	q0, q0, [x22, #0x10]
   27ea0: 3d8002c0     	str	q0, [x22]
   27ea4: 2914a7ff     	stp	wzr, w9, [sp, #0xa4]
   27ea8: b900affa     	str	w26, [sp, #0xac]
   27eac: 97ffb091     	bl	0x140f0 <memcpy@plt>
   27eb0: f9400268     	ldr	x8, [x19]
   27eb4: 9102a3e1     	add	x1, sp, #0xa8
   27eb8: 910293e3     	add	x3, sp, #0xa4
   27ebc: aa1303e0     	mov	x0, x19
   27ec0: f9418108     	ldr	x8, [x8, #0x300]
   27ec4: aa1f03e2     	mov	x2, xzr
   27ec8: d63f0100     	blr	x8
   27ecc: f941ba68     	ldr	x8, [x19, #0x370]
   27ed0: 2a0003fb     	mov	w27, w0
   27ed4: b40000e8     	cbz	x8, 0x27ef0 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x388>
   27ed8: f941c260     	ldr	x0, [x19, #0x380]
   27edc: 2a1403e1     	mov	w1, w20
   27ee0: aa1f03e2     	mov	x2, xzr
   27ee4: d63f0100     	blr	x8
   27ee8: 7100001f     	cmp	w0, #0x0
   27eec: 1a9f077b     	csinc	w27, w27, wzr, eq
   27ef0: eb34431f     	cmp	x24, w20, uxtw
   27ef4: 54fffac1     	b.ne	0x27e4c <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x2e4>
   27ef8: 90000041     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   27efc: 91032021     	add	x1, x1, #0xc8
   27f00: 321c03e0     	orr	w0, wzr, #0x10
   27f04: 97ffaf9b     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   27f08: 3500053b     	cbnz	w27, 0x27fac <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x444>
   27f0c: 14000012     	b	0x27f54 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x3ec>
   27f10: aa1f03fa     	mov	x26, xzr
   27f14: f90037ff     	str	xzr, [sp, #0x68]
   27f18: 360811f6     	tbz	w22, #0x1, 0x28154 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x5ec>
   27f1c: 321403e0     	orr	w0, wzr, #0x1000
   27f20: 97ffb06c     	bl	0x140d0 <malloc@plt>
   27f24: b4000620     	cbz	x0, 0x27fe8 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x480>
   27f28: 321403e2     	orr	w2, wzr, #0x1000
   27f2c: 2a1f03e1     	mov	w1, wzr
   27f30: f90027e0     	str	x0, [sp, #0x48]
   27f34: 97ffb087     	bl	0x14150 <memset@plt>
   27f38: 35001139     	cbnz	w25, 0x2815c <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x5f4>
   27f3c: 2a1f03fb     	mov	w27, wzr
   27f40: 140000a6     	b	0x281d8 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x670>
   27f44: 90000041     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   27f48: 9102d421     	add	x1, x1, #0xb5
   27f4c: 320003e0     	orr	w0, wzr, #0x1
   27f50: 97ffaf88     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   27f54: 6f00e400     	movi	v0.2d, #0000000000000000
   27f58: 114042e8     	add	w8, w23, #0x10, lsl #12 // =0x10000
   27f5c: b900e3ff     	str	wzr, [sp, #0xe0]
   27f60: ad0603e0     	stp	q0, q0, [sp, #0xc0]
   27f64: 3c8b03e0     	stur	q0, [sp, #0xb0]
   27f68: 2914a3ff     	stp	wzr, w8, [sp, #0xa4]
   27f6c: b900affa     	str	w26, [sp, #0xac]
   27f70: f9400268     	ldr	x8, [x19]
   27f74: 9102a3e1     	add	x1, sp, #0xa8
   27f78: 910293e3     	add	x3, sp, #0xa4
   27f7c: aa1303e0     	mov	x0, x19
   27f80: f9418108     	ldr	x8, [x8, #0x300]
   27f84: aa1f03e2     	mov	x2, xzr
   27f88: d63f0100     	blr	x8
   27f8c: 2a0003fb     	mov	w27, w0
   27f90: 3400009b     	cbz	w27, 0x27fa0 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x438>
   27f94: 90000040     	adrp	x0, 0x2f000 <AllHidDevProperties+0x3bf0>
   27f98: 911e8000     	add	x0, x0, #0x7a0
   27f9c: 14000003     	b	0x27fa8 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x440>
   27fa0: 90000040     	adrp	x0, 0x2f000 <AllHidDevProperties+0x3bf0>
   27fa4: 911f0000     	add	x0, x0, #0x7c0
   27fa8: 97ffafce     	bl	0x13ee0 <puts@plt>
   27fac: aa1503e0     	mov	x0, x21
   27fb0: 97ffaf38     	bl	0x13c90 <fclose@plt>
   27fb4: f9401788     	ldr	x8, [x28, #0x28]
   27fb8: f85a83a9     	ldur	x9, [x29, #-0x58]
   27fbc: eb09011f     	cmp	x8, x9
   27fc0: 54004961     	b.ne	0x288ec <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xd84>
   27fc4: 2a1b03e0     	mov	w0, w27
   27fc8: 9109c3ff     	add	sp, sp, #0x270
   27fcc: a9457bfd     	ldp	x29, x30, [sp, #0x50]
   27fd0: a9444ff4     	ldp	x20, x19, [sp, #0x40]
   27fd4: a94357f6     	ldp	x22, x21, [sp, #0x30]
   27fd8: a9425ff8     	ldp	x24, x23, [sp, #0x20]
   27fdc: a94167fa     	ldp	x26, x25, [sp, #0x10]
   27fe0: a8c66ffc     	ldp	x28, x27, [sp], #0x60
   27fe4: d65f03c0     	ret
   27fe8: 90000041     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   27fec: 9106a021     	add	x1, x1, #0x1a8
   27ff0: 52800860     	mov	w0, #0x43               // =67
   27ff4: 97ffaf5f     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   27ff8: aa1f03f4     	mov	x20, xzr
   27ffc: 2a1f03f7     	mov	w23, wzr
   28000: 528000bb     	mov	w27, #0x5               // =5
   28004: f94037f8     	ldr	x24, [sp, #0x68]
   28008: 3707e876     	tbnz	w22, #0x0, 0x27d14 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x1ac>
   2800c: 17ffff4b     	b	0x27d38 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x1d0>
   28010: f9400268     	ldr	x8, [x19]
   28014: aa1303e0     	mov	x0, x19
   28018: f9403508     	ldr	x8, [x8, #0x68]
   2801c: d63f0100     	blr	x8
   28020: 2a0003f4     	mov	w20, w0
   28024: 3100069f     	cmn	w20, #0x1
   28028: 54004160     	b.eq	0x28854 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xcec>
   2802c: 9105a3e1     	add	x1, sp, #0x168
   28030: 910203e2     	add	x2, sp, #0x80
   28034: 9102a3e3     	add	x3, sp, #0xa8
   28038: 2a1603e0     	mov	w0, w22
   2803c: 97ffaf9d     	bl	0x13eb0 <_Z19GenerateUpgradeInfojP10sfs_info_sP16sfs_flash_info_sP18sfs_upgrade_info_s@plt>
   28040: b940abe2     	ldr	w2, [sp, #0xa8]
   28044: f0000021     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   28048: 2a0003fb     	mov	w27, w0
   2804c: 91042c21     	add	x1, x1, #0x10b
   28050: 321a03e0     	orr	w0, wzr, #0x40
   28054: 97ffaf17     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   28058: 35ffe55b     	cbnz	w27, 0x27d00 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x198>
   2805c: b94103e8     	ldr	w8, [sp, #0x100]
   28060: 7100051f     	cmp	w8, #0x1
   28064: 5400054b     	b.lt	0x2810c <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x5a4>
   28068: 9102a3e8     	add	x8, sp, #0xa8
   2806c: f9003bfc     	str	x28, [sp, #0x70]
   28070: aa1f03fa     	mov	x26, xzr
   28074: 2a1f03fb     	mov	w27, wzr
   28078: 32003ffc     	orr	w28, wzr, #0xffff
   2807c: 91019918     	add	x24, x8, #0x66
   28080: 785fc308     	ldurh	w8, [x24, #-0x4]
   28084: 340001a8     	cbz	w8, 0x280b8 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x550>
   28088: 785fa309     	ldurh	w9, [x24, #-0x6]
   2808c: 0b090108     	add	w8, w8, w9
   28090: 0b1c0108     	add	w8, w8, w28
   28094: 12003d02     	and	w2, w8, #0xffff
   28098: 53144c48     	lsl	w8, w2, #12
   2809c: 6b14011f     	cmp	w8, w20
   280a0: 540000c9     	b.ls	0x280b8 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x550>
   280a4: f0000021     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   280a8: 52800820     	mov	w0, #0x41               // =65
   280ac: 91049421     	add	x1, x1, #0x125
   280b0: 97ffaf00     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   280b4: 320013fb     	orr	w27, wzr, #0x1f
   280b8: 79400308     	ldrh	w8, [x24]
   280bc: 340001a8     	cbz	w8, 0x280f0 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x588>
   280c0: 785fe309     	ldurh	w9, [x24, #-0x2]
   280c4: 0b090108     	add	w8, w8, w9
   280c8: 0b1c0108     	add	w8, w8, w28
   280cc: 12003d02     	and	w2, w8, #0xffff
   280d0: 53144c48     	lsl	w8, w2, #12
   280d4: 6b14011f     	cmp	w8, w20
   280d8: 540000c9     	b.ls	0x280f0 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x588>
   280dc: f0000021     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   280e0: 52800820     	mov	w0, #0x41               // =65
   280e4: 91049421     	add	x1, x1, #0x125
   280e8: 97ffaef2     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   280ec: 320013fb     	orr	w27, wzr, #0x1f
   280f0: b98103e8     	ldrsw	x8, [sp, #0x100]
   280f4: 9100075a     	add	x26, x26, #0x1
   280f8: 91003318     	add	x24, x24, #0xc
   280fc: eb08035f     	cmp	x26, x8
   28100: 54fffc0b     	b.lt	0x28080 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x518>
   28104: f9403bfc     	ldr	x28, [sp, #0x70]
   28108: 35ffdfdb     	cbnz	w27, 0x27d00 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x198>
   2810c: f0000021     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   28110: 9104fc21     	add	x1, x1, #0x13f
   28114: 321a03e0     	orr	w0, wzr, #0x40
   28118: 97ffaf16     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   2811c: f0000001     	adrp	x1, 0x2b000
   28120: 912be421     	add	x1, x1, #0xaf9
   28124: aa1703e0     	mov	x0, x23
   28128: 97ffb00e     	bl	0x14160 <fopen@plt>
   2812c: aa0003fa     	mov	x26, x0
   28130: b4003b7a     	cbz	x26, 0x2889c <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xd34>
   28134: 321403e0     	orr	w0, wzr, #0x1000
   28138: 97ffafe6     	bl	0x140d0 <malloc@plt>
   2813c: b4003c40     	cbz	x0, 0x288c4 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xd5c>
   28140: 321403e2     	orr	w2, wzr, #0x1000
   28144: 2a1f03e1     	mov	w1, wzr
   28148: f90037e0     	str	x0, [sp, #0x68]
   2814c: 97ffb001     	bl	0x14150 <memset@plt>
   28150: 370fee76     	tbnz	w22, #0x1, 0x27f1c <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x3b4>
   28154: f90027ff     	str	xzr, [sp, #0x48]
   28158: 34ffef39     	cbz	w25, 0x27f3c <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x3d4>
   2815c: f0000021     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   28160: 321403e8     	orr	w8, wzr, #0x1000
   28164: 91075021     	add	x1, x1, #0x1d4
   28168: 321a03e0     	orr	w0, wzr, #0x40
   2816c: 321603e2     	orr	w2, wzr, #0x400
   28170: b900a7e8     	str	w8, [sp, #0xa4]
   28174: 321603f4     	orr	w20, wzr, #0x400
   28178: 97ffaece     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   2817c: f9400268     	ldr	x8, [x19]
   28180: 910293e1     	add	x1, sp, #0xa4
   28184: 321603e2     	orr	w2, wzr, #0x400
   28188: aa1303e0     	mov	x0, x19
   2818c: f9418508     	ldr	x8, [x8, #0x308]
   28190: d63f0100     	blr	x8
   28194: 2a0003fb     	mov	w27, w0
   28198: 7100c37f     	cmp	w27, #0x30
   2819c: 540001e1     	b.ne	0x281d8 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x670>
   281a0: f0000021     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   281a4: 91080421     	add	x1, x1, #0x201
   281a8: 321a03e0     	orr	w0, wzr, #0x40
   281ac: 321603e2     	orr	w2, wzr, #0x400
   281b0: 321803e3     	orr	w3, wzr, #0x100
   281b4: b900a7f4     	str	w20, [sp, #0xa4]
   281b8: 97ffae6a     	bl	0x13b60 <_Z10LogNumber2jPKcjj@plt>
   281bc: f9400268     	ldr	x8, [x19]
   281c0: 910293e1     	add	x1, sp, #0xa4
   281c4: 321803e2     	orr	w2, wzr, #0x100
   281c8: aa1303e0     	mov	x0, x19
   281cc: f9418508     	ldr	x8, [x8, #0x308]
   281d0: d63f0100     	blr	x8
   281d4: 2a0003fb     	mov	w27, w0
   281d8: f94027f4     	ldr	x20, [sp, #0x48]
   281dc: f94037f8     	ldr	x24, [sp, #0x68]
   281e0: 36000196     	tbz	w22, #0x0, 0x28210 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x6a8>
   281e4: 3500017b     	cbnz	w27, 0x28210 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x6a8>
   281e8: f0000021     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   281ec: 9108f821     	add	x1, x1, #0x23e
   281f0: 321a03e0     	orr	w0, wzr, #0x40
   281f4: 97ffaedf     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   281f8: f9400268     	ldr	x8, [x19]
   281fc: aa1303e0     	mov	x0, x19
   28200: 2a1f03e1     	mov	w1, wzr
   28204: f9419d08     	ldr	x8, [x8, #0x338]
   28208: d63f0100     	blr	x8
   2820c: 2a0003fb     	mov	w27, w0
   28210: 3400009b     	cbz	w27, 0x28220 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x6b8>
   28214: 2a1f03f7     	mov	w23, wzr
   28218: 3707d7f6     	tbnz	w22, #0x0, 0x27d14 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x1ac>
   2821c: 17fffec7     	b	0x27d38 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x1d0>
   28220: 720002df     	tst	w22, #0x1
   28224: 52800468     	mov	w8, #0x23               // =35
   28228: aa1f03f9     	mov	x25, xzr
   2822c: 2a1f03f8     	mov	w24, wzr
   28230: 1a9f1108     	csel	w8, w8, wzr, ne
   28234: b9002bff     	str	wzr, [sp, #0x28]
   28238: b9001fe8     	str	w8, [sp, #0x1c]
   2823c: f90033fa     	str	x26, [sp, #0x60]
   28240: f9003bfc     	str	x28, [sp, #0x70]
   28244: 14000004     	b	0x28254 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x6ec>
   28248: f9403bfc     	ldr	x28, [sp, #0x70]
   2824c: f94033fa     	ldr	x26, [sp, #0x60]
   28250: 91000739     	add	x25, x25, #0x1
   28254: b90053f8     	str	w24, [sp, #0x50]
   28258: b980afe8     	ldrsw	x8, [sp, #0xac]
   2825c: eb08033f     	cmp	x25, x8
   28260: 54002e2a     	b.ge	0x28824 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xcbc>
   28264: 9102a3e8     	add	x8, sp, #0xa8
   28268: 8b190908     	add	x8, x8, x25, lsl #2
   2826c: b9400917     	ldr	w23, [x8, #0x8]
   28270: 5288ca7c     	mov	w28, #0x4653            // =18003
   28274: 72a8aa7c     	movk	w28, #0x4553, lsl #16
   28278: 710c3eff     	cmp	w23, #0x30f
   2827c: 5400008c     	b.gt	0x2828c <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x724>
   28280: 710c02ff     	cmp	w23, #0x300
   28284: 54000e80     	b.eq	0x28454 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x8ec>
   28288: 140000c1     	b	0x2858c <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xa24>
   2828c: 710c42ff     	cmp	w23, #0x310
   28290: 54000e20     	b.eq	0x28454 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x8ec>
   28294: 711042ff     	cmp	w23, #0x410
   28298: 54000060     	b.eq	0x282a4 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x73c>
   2829c: 711002ff     	cmp	w23, #0x400
   282a0: 54fffd41     	b.ne	0x28248 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x6e0>
   282a4: b900a7ff     	str	wzr, [sp, #0xa4]
   282a8: f9400268     	ldr	x8, [x19]
   282ac: 721c0eff     	tst	w23, #0xf0
   282b0: 1a9f17e9     	cset	w9, eq
   282b4: 53144d21     	lsl	w1, w9, #12
   282b8: f9418d08     	ldr	x8, [x8, #0x318]
   282bc: 321e03e2     	orr	w2, wzr, #0x4
   282c0: 910293e3     	add	x3, sp, #0xa4
   282c4: 321e03e4     	orr	w4, wzr, #0x4
   282c8: aa1303e0     	mov	x0, x19
   282cc: aa1f03e5     	mov	x5, xzr
   282d0: 121c0ef4     	and	w20, w23, #0xf0
   282d4: d63f0100     	blr	x8
   282d8: b940a7e2     	ldr	w2, [sp, #0xa4]
   282dc: 35000080     	cbnz	w0, 0x282ec <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x784>
   282e0: 6b1c005f     	cmp	w2, w28
   282e4: 2a1f03fb     	mov	w27, wzr
   282e8: 540000e0     	b.eq	0x28304 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x79c>
   282ec: f0000021     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   282f0: 321a03e0     	orr	w0, wzr, #0x40
   282f4: 91099421     	add	x1, x1, #0x265
   282f8: 97ffae6e     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   282fc: b940a7fc     	ldr	w28, [sp, #0xa4]
   28300: 5280069b     	mov	w27, #0x34              // =52
   28304: f0000021     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   28308: 7100029f     	cmp	w20, #0x0
   2830c: 321a03e0     	orr	w0, wzr, #0x40
   28310: 910a7021     	add	x1, x1, #0x29c
   28314: 2a1c03e2     	mov	w2, w28
   28318: 1a9f07fa     	cset	w26, ne
   2831c: 97ffae65     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   28320: b9007fff     	str	wzr, [sp, #0x7c]
   28324: f9400268     	ldr	x8, [x19]
   28328: 53144f54     	lsl	w20, w26, #12
   2832c: 321e03e2     	orr	w2, wzr, #0x4
   28330: 9101f3e3     	add	x3, sp, #0x7c
   28334: f9418d08     	ldr	x8, [x8, #0x318]
   28338: 321e03e4     	orr	w4, wzr, #0x4
   2833c: aa1303e0     	mov	x0, x19
   28340: 2a1403e1     	mov	w1, w20
   28344: aa1f03e5     	mov	x5, xzr
   28348: d63f0100     	blr	x8
   2834c: b9407fe2     	ldr	w2, [sp, #0x7c]
   28350: f0000021     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   28354: 321a03e0     	orr	w0, wzr, #0x40
   28358: 910b3021     	add	x1, x1, #0x2cc
   2835c: 97ffae55     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   28360: 3500077b     	cbnz	w27, 0x2844c <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x8e4>
   28364: 3945a3e8     	ldrb	w8, [sp, #0x168]
   28368: 5288ca69     	mov	w9, #0x4653             // =18003
   2836c: f0000021     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   28370: 72a80a69     	movk	w9, #0x4053, lsl #16
   28374: 121c0108     	and	w8, w8, #0x10
   28378: 321a03e0     	orr	w0, wzr, #0x40
   2837c: 910bf021     	add	x1, x1, #0x2fc
   28380: 2a1a03e2     	mov	w2, w26
   28384: 2a08513c     	orr	w28, w9, w8, lsl #20
   28388: 97ffae4a     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   2838c: f0000021     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   28390: 321a03e0     	orr	w0, wzr, #0x40
   28394: 910c7421     	add	x1, x1, #0x31d
   28398: 2a1c03e2     	mov	w2, w28
   2839c: 97ffae45     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   283a0: a9460be0     	ldp	x0, x2, [sp, #0x60]
   283a4: 321403e3     	orr	w3, wzr, #0x1000
   283a8: 2a1a03e1     	mov	w1, w26
   283ac: 97ffadd1     	bl	0x13af0 <_Z18ReadImageFileBlockP7__sFILEtPhm@plt>
   283b0: 2a0003fb     	mov	w27, w0
   283b4: 350004db     	cbnz	w27, 0x2844c <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x8e4>
   283b8: f94037f7     	ldr	x23, [sp, #0x68]
   283bc: f0000021     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   283c0: 321a03e0     	orr	w0, wzr, #0x40
   283c4: 910cf421     	add	x1, x1, #0x33d
   283c8: 2a1a03e2     	mov	w2, w26
   283cc: b90002fc     	str	w28, [x23]
   283d0: 97ffae38     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   283d4: f9400268     	ldr	x8, [x19]
   283d8: 321403e3     	orr	w3, wzr, #0x1000
   283dc: aa1303e0     	mov	x0, x19
   283e0: 2a1a03e1     	mov	w1, w26
   283e4: f9419508     	ldr	x8, [x8, #0x328]
   283e8: aa1703e2     	mov	x2, x23
   283ec: aa1503e4     	mov	x4, x21
   283f0: d63f0100     	blr	x8
   283f4: 2a0003fb     	mov	w27, w0
   283f8: 350002bb     	cbnz	w27, 0x2844c <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x8e4>
   283fc: b9007bff     	str	wzr, [sp, #0x78]
   28400: f9400268     	ldr	x8, [x19]
   28404: 321e03e2     	orr	w2, wzr, #0x4
   28408: 9101e3e3     	add	x3, sp, #0x78
   2840c: 321e03e4     	orr	w4, wzr, #0x4
   28410: f9418d08     	ldr	x8, [x8, #0x318]
   28414: aa1303e0     	mov	x0, x19
   28418: 2a1403e1     	mov	w1, w20
   2841c: aa1f03e5     	mov	x5, xzr
   28420: d63f0100     	blr	x8
   28424: b9407be2     	ldr	w2, [sp, #0x78]
   28428: 35000080     	cbnz	w0, 0x28438 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x8d0>
   2842c: 6b1c005f     	cmp	w2, w28
   28430: 2a1f03fb     	mov	w27, wzr
   28434: 540000c0     	b.eq	0x2844c <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x8e4>
   28438: f0000021     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   2843c: 321a03e0     	orr	w0, wzr, #0x40
   28440: 910d6021     	add	x1, x1, #0x358
   28444: 97ffae1b     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   28448: 5280067b     	mov	w27, #0x33              // =51
   2844c: f94033fa     	ldr	x26, [sp, #0x60]
   28450: 1400004a     	b	0x28578 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xa10>
   28454: 721c0eff     	tst	w23, #0xf0
   28458: 1a9f07f4     	cset	w20, ne
   2845c: f0000021     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   28460: 321a03e0     	orr	w0, wzr, #0x40
   28464: 910de021     	add	x1, x1, #0x378
   28468: 2a1403e2     	mov	w2, w20
   2846c: 97ffae11     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   28470: f94037f8     	ldr	x24, [sp, #0x68]
   28474: 321403e3     	orr	w3, wzr, #0x1000
   28478: aa1a03e0     	mov	x0, x26
   2847c: 2a1403e1     	mov	w1, w20
   28480: aa1803e2     	mov	x2, x24
   28484: 97ffad9b     	bl	0x13af0 <_Z18ReadImageFileBlockP7__sFILEtPhm@plt>
   28488: 2a0003fb     	mov	w27, w0
   2848c: 35001d1b     	cbnz	w27, 0x2882c <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xcc4>
   28490: f0000021     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   28494: 321a03e0     	orr	w0, wzr, #0x40
   28498: 910cf421     	add	x1, x1, #0x33d
   2849c: 2a1403e2     	mov	w2, w20
   284a0: 97ffae04     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   284a4: f9400268     	ldr	x8, [x19]
   284a8: 321403e3     	orr	w3, wzr, #0x1000
   284ac: aa1303e0     	mov	x0, x19
   284b0: 2a1403e1     	mov	w1, w20
   284b4: f9419508     	ldr	x8, [x8, #0x328]
   284b8: aa1803e2     	mov	x2, x24
   284bc: aa1503e4     	mov	x4, x21
   284c0: d63f0100     	blr	x8
   284c4: 2a0003fb     	mov	w27, w0
   284c8: 35001bdb     	cbnz	w27, 0x28840 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xcd8>
   284cc: b900a7ff     	str	wzr, [sp, #0xa4]
   284d0: f9400268     	ldr	x8, [x19]
   284d4: 53144e81     	lsl	w1, w20, #12
   284d8: 321e03e2     	orr	w2, wzr, #0x4
   284dc: 910293e3     	add	x3, sp, #0xa4
   284e0: f9418d08     	ldr	x8, [x8, #0x318]
   284e4: 321e03e4     	orr	w4, wzr, #0x4
   284e8: aa1303e0     	mov	x0, x19
   284ec: aa1f03e5     	mov	x5, xzr
   284f0: 121c0ef7     	and	w23, w23, #0xf0
   284f4: d63f0100     	blr	x8
   284f8: b940a7e2     	ldr	w2, [sp, #0xa4]
   284fc: 35000060     	cbnz	w0, 0x28508 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x9a0>
   28500: 6b1c005f     	cmp	w2, w28
   28504: 540000c0     	b.eq	0x2851c <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x9b4>
   28508: f0000021     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   2850c: 321a03e0     	orr	w0, wzr, #0x40
   28510: 910e5c21     	add	x1, x1, #0x397
   28514: 97ffade7     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   28518: b940a7fc     	ldr	w28, [sp, #0xa4]
   2851c: f0000021     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   28520: 710002ff     	cmp	w23, #0x0
   28524: 321a03e0     	orr	w0, wzr, #0x40
   28528: 910f4021     	add	x1, x1, #0x3d0
   2852c: 2a1c03e2     	mov	w2, w28
   28530: 1a9f17f4     	cset	w20, eq
   28534: 97ffaddf     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   28538: b9007fff     	str	wzr, [sp, #0x7c]
   2853c: f9400268     	ldr	x8, [x19]
   28540: 53144e81     	lsl	w1, w20, #12
   28544: 321e03e2     	orr	w2, wzr, #0x4
   28548: 9101f3e3     	add	x3, sp, #0x7c
   2854c: f9418d08     	ldr	x8, [x8, #0x318]
   28550: 321e03e4     	orr	w4, wzr, #0x4
   28554: aa1303e0     	mov	x0, x19
   28558: aa1f03e5     	mov	x5, xzr
   2855c: d63f0100     	blr	x8
   28560: b9407fe2     	ldr	w2, [sp, #0x7c]
   28564: f0000021     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   28568: 2a0003fb     	mov	w27, w0
   2856c: 321a03e0     	orr	w0, wzr, #0x40
   28570: 91100821     	add	x1, x1, #0x402
   28574: 97ffadcf     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   28578: f9403bfc     	ldr	x28, [sp, #0x70]
   2857c: b94053f8     	ldr	w24, [sp, #0x50]
   28580: 91000739     	add	x25, x25, #0x1
   28584: 34ffe6bb     	cbz	w27, 0x28258 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x6f0>
   28588: 140000c0     	b	0x28888 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xd20>
   2858c: 510402e8     	sub	w8, w23, #0x100
   28590: 7100811f     	cmp	w8, #0x20
   28594: 54000169     	b.ls	0x285c0 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xa58>
   28598: 510802e8     	sub	w8, w23, #0x200
   2859c: 7100811f     	cmp	w8, #0x20
   285a0: 54ffe548     	b.hi	0x28248 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x6e0>
   285a4: 320003e9     	orr	w9, wzr, #0x1
   285a8: 9ac82128     	lsl	x8, x9, x8
   285ac: b20003e9     	mov	x9, #0x100000001        // =4294967297
   285b0: f2a00029     	movk	x9, #0x1, lsl #16
   285b4: 8a090108     	and	x8, x8, x9
   285b8: b5000108     	cbnz	x8, 0x285d8 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xa70>
   285bc: 17ffff23     	b	0x28248 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x6e0>
   285c0: 320003e9     	orr	w9, wzr, #0x1
   285c4: 9ac82128     	lsl	x8, x9, x8
   285c8: b20003e9     	mov	x9, #0x100000001        // =4294967297
   285cc: f2a00029     	movk	x9, #0x1, lsl #16
   285d0: 8a090108     	and	x8, x8, x9
   285d4: b4fffe28     	cbz	x8, 0x28598 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xa30>
   285d8: b94103e8     	ldr	w8, [sp, #0x100]
   285dc: 121c0ee9     	and	w9, w23, #0xf0
   285e0: 7100413f     	cmp	w9, #0x10
   285e4: 1a9f17eb     	cset	w11, eq
   285e8: 7100051f     	cmp	w8, #0x1
   285ec: 54ffe2eb     	b.lt	0x28248 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x6e0>
   285f0: aa1f03ec     	mov	x12, xzr
   285f4: 12180ee8     	and	w8, w23, #0xf00
   285f8: b9002fe8     	str	w8, [sp, #0x2c]
   285fc: f90013f5     	str	x21, [sp, #0x20]
   28600: f90007eb     	str	x11, [sp, #0x8]
   28604: 9102a3e8     	add	x8, sp, #0xa8
   28608: 321e07e9     	orr	w9, wzr, #0xc
   2860c: f9000bec     	str	x12, [sp, #0x10]
   28610: d503201f     	nop
   28614: 9b092189     	madd	x9, x12, x9, x8
   28618: 7845cd34     	ldrh	w20, [x9, #0x5c]!
   2861c: 2a1f03f7     	mov	w23, wzr
   28620: 8b0b0928     	add	x8, x9, x11, lsl #2
   28624: 91001108     	add	x8, x8, #0x4
   28628: f9001be8     	str	x8, [sp, #0x30]
   2862c: b27f0108     	orr	x8, x8, #0x2
   28630: f9002be8     	str	x8, [sp, #0x50]
   28634: b27f0128     	orr	x8, x9, #0x2
   28638: a903a7e8     	stp	x8, x9, [sp, #0x38]
   2863c: f9402be8     	ldr	x8, [sp, #0x50]
   28640: 79400108     	ldrh	w8, [x8]
   28644: 34000e48     	cbz	w8, 0x2880c <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xca4>
   28648: a943a3e9     	ldp	x9, x8, [sp, #0x38]
   2864c: 12003e9a     	and	w26, w20, #0xffff
   28650: 79400108     	ldrh	w8, [x8]
   28654: 79400129     	ldrh	w9, [x9]
   28658: 0b080128     	add	w8, w9, w8
   2865c: 6b1a011f     	cmp	w8, w26
   28660: 54000d69     	b.ls	0x2880c <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xca4>
   28664: a9460be0     	ldp	x0, x2, [sp, #0x60]
   28668: 321403e3     	orr	w3, wzr, #0x1000
   2866c: 2a1403e1     	mov	w1, w20
   28670: 97ffad20     	bl	0x13af0 <_Z18ReadImageFileBlockP7__sFILEtPhm@plt>
   28674: f9401be8     	ldr	x8, [sp, #0x30]
   28678: 79400108     	ldrh	w8, [x8]
   2867c: 0b37211b     	add	w27, w8, w23, uxth
   28680: 36000296     	tbz	w22, #0x0, 0x286d0 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xb68>
   28684: 12003e88     	and	w8, w20, #0xffff
   28688: 7100051f     	cmp	w8, #0x1
   2868c: 54000228     	b.hi	0x286d0 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xb68>
   28690: f94037e8     	ldr	x8, [sp, #0x68]
   28694: b9400108     	ldr	w8, [x8]
   28698: 6b1c011f     	cmp	w8, w28
   2869c: 540001a1     	b.ne	0x286d0 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xb68>
   286a0: f0000021     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   286a4: 321a03e0     	orr	w0, wzr, #0x40
   286a8: 9110d421     	add	x1, x1, #0x435
   286ac: 2a1a03e2     	mov	w2, w26
   286b0: 97ffad80     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   286b4: 3945a3e8     	ldrb	w8, [sp, #0x168]
   286b8: 5288ca69     	mov	w9, #0x4653             // =18003
   286bc: 72a80a69     	movk	w9, #0x4053, lsl #16
   286c0: 121c0108     	and	w8, w8, #0x10
   286c4: 2a085128     	orr	w8, w9, w8, lsl #20
   286c8: f94037e9     	ldr	x9, [sp, #0x68]
   286cc: b9000128     	str	w8, [x9]
   286d0: b9402fe8     	ldr	w8, [sp, #0x2c]
   286d4: 12003f7a     	and	w26, w27, #0xffff
   286d8: 321a03e0     	orr	w0, wzr, #0x40
   286dc: 7108011f     	cmp	w8, #0x200
   286e0: 54000201     	b.ne	0x28720 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xbb8>
   286e4: f0000021     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   286e8: 910cf421     	add	x1, x1, #0x33d
   286ec: 2a1a03e2     	mov	w2, w26
   286f0: 97ffad70     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   286f4: f9400268     	ldr	x8, [x19]
   286f8: f94037e2     	ldr	x2, [sp, #0x68]
   286fc: 321403e3     	orr	w3, wzr, #0x1000
   28700: aa1303e0     	mov	x0, x19
   28704: f9419508     	ldr	x8, [x8, #0x328]
   28708: 2a1a03e1     	mov	w1, w26
   2870c: aa1503e4     	mov	x4, x21
   28710: d63f0100     	blr	x8
   28714: f94033fa     	ldr	x26, [sp, #0x60]
   28718: 2a0003fb     	mov	w27, w0
   2871c: 1400002e     	b	0x287d4 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xc6c>
   28720: f0000021     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   28724: 91116421     	add	x1, x1, #0x459
   28728: 2a1a03e2     	mov	w2, w26
   2872c: 97ffad61     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   28730: b9451268     	ldr	w8, [x19, #0x510]
   28734: 34000448     	cbz	w8, 0x287bc <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xc54>
   28738: f9400268     	ldr	x8, [x19]
   2873c: aa1503e5     	mov	x5, x21
   28740: f94027f5     	ldr	x21, [sp, #0x48]
   28744: 53144f41     	lsl	w1, w26, #12
   28748: f9418d08     	ldr	x8, [x8, #0x318]
   2874c: 321403e2     	orr	w2, wzr, #0x1000
   28750: 321403e4     	orr	w4, wzr, #0x1000
   28754: aa1303e0     	mov	x0, x19
   28758: aa1503e3     	mov	x3, x21
   2875c: d63f0100     	blr	x8
   28760: 2a0003fb     	mov	w27, w0
   28764: 3500035b     	cbnz	w27, 0x287cc <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xc64>
   28768: f0000021     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   2876c: 321a03e0     	orr	w0, wzr, #0x40
   28770: 9111d021     	add	x1, x1, #0x474
   28774: 2a1a03e2     	mov	w2, w26
   28778: 97ffad4e     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   2877c: f94037e0     	ldr	x0, [sp, #0x68]
   28780: 321403e2     	orr	w2, wzr, #0x1000
   28784: aa1503e1     	mov	x1, x21
   28788: 97ffad36     	bl	0x13c60 <memcmp@plt>
   2878c: 2a0003e8     	mov	w8, w0
   28790: 340001c8     	cbz	w8, 0x287c8 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xc60>
   28794: b9402be9     	ldr	w9, [sp, #0x28]
   28798: f0000021     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   2879c: 52800820     	mov	w0, #0x41               // =65
   287a0: 91124421     	add	x1, x1, #0x491
   287a4: 11000529     	add	w9, w9, #0x1
   287a8: 2a0803e2     	mov	w2, w8
   287ac: b9002be9     	str	w9, [sp, #0x28]
   287b0: 97ffad40     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   287b4: b9401ffb     	ldr	w27, [sp, #0x1c]
   287b8: 14000005     	b	0x287cc <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xc64>
   287bc: f94033fa     	ldr	x26, [sp, #0x60]
   287c0: 5280017b     	mov	w27, #0xb               // =11
   287c4: 14000004     	b	0x287d4 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xc6c>
   287c8: 2a1f03fb     	mov	w27, wzr
   287cc: f94033fa     	ldr	x26, [sp, #0x60]
   287d0: f94013f5     	ldr	x21, [sp, #0x20]
   287d4: f941ba68     	ldr	x8, [x19, #0x370]
   287d8: 11400709     	add	w9, w24, #0x1, lsl #12  // =0x1000
   287dc: 7100037f     	cmp	w27, #0x0
   287e0: 1a980138     	csel	w24, w9, w24, eq
   287e4: b40000c8     	cbz	x8, 0x287fc <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xc94>
   287e8: f941c260     	ldr	x0, [x19, #0x380]
   287ec: 2a1803e1     	mov	w1, w24
   287f0: aa1f03e2     	mov	x2, xzr
   287f4: d63f0100     	blr	x8
   287f8: 35000440     	cbnz	w0, 0x28880 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xd18>
   287fc: 11000694     	add	w20, w20, #0x1
   28800: 110006f7     	add	w23, w23, #0x1
   28804: 34fff1db     	cbz	w27, 0x2863c <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xad4>
   28808: 14000010     	b	0x28848 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xce0>
   2880c: a940b3eb     	ldp	x11, x12, [sp, #0x8]
   28810: b98103e8     	ldrsw	x8, [sp, #0x100]
   28814: 9100058c     	add	x12, x12, #0x1
   28818: eb08019f     	cmp	x12, x8
   2881c: 54ffef4b     	b.lt	0x28604 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xa9c>
   28820: 17fffe8a     	b	0x28248 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x6e0>
   28824: 2a1f03fb     	mov	w27, wzr
   28828: 14000018     	b	0x28888 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xd20>
   2882c: f9403bfc     	ldr	x28, [sp, #0x70]
   28830: f94027f4     	ldr	x20, [sp, #0x48]
   28834: b9402bf7     	ldr	w23, [sp, #0x28]
   28838: 3707a6f6     	tbnz	w22, #0x0, 0x27d14 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x1ac>
   2883c: 17fffd3f     	b	0x27d38 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x1d0>
   28840: f9403bfc     	ldr	x28, [sp, #0x70]
   28844: 14000011     	b	0x28888 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xd20>
   28848: f9403bfc     	ldr	x28, [sp, #0x70]
   2884c: f94033fa     	ldr	x26, [sp, #0x60]
   28850: 1400000e     	b	0x28888 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0xd20>
   28854: f0000021     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   28858: 9103ac21     	add	x1, x1, #0xeb
   2885c: 52800820     	mov	w0, #0x41               // =65
   28860: 97ffad44     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   28864: aa1f03f4     	mov	x20, xzr
   28868: aa1f03fa     	mov	x26, xzr
   2886c: aa1f03f8     	mov	x24, xzr
   28870: 2a1f03f7     	mov	w23, wzr
   28874: 320013fb     	orr	w27, wzr, #0x1f
   28878: 3707a4f6     	tbnz	w22, #0x0, 0x27d14 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x1ac>
   2887c: 17fffd2f     	b	0x27d38 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x1d0>
   28880: f9403bfc     	ldr	x28, [sp, #0x70]
   28884: 320003fb     	orr	w27, wzr, #0x1
   28888: f94027f4     	ldr	x20, [sp, #0x48]
   2888c: b9402bf7     	ldr	w23, [sp, #0x28]
   28890: f94037f8     	ldr	x24, [sp, #0x68]
   28894: 3707a416     	tbnz	w22, #0x0, 0x27d14 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x1ac>
   28898: 17fffd28     	b	0x27d38 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x1d0>
   2889c: f0000021     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   288a0: 9105a821     	add	x1, x1, #0x16a
   288a4: 52800860     	mov	w0, #0x43               // =67
   288a8: 97ffad32     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   288ac: aa1f03f4     	mov	x20, xzr
   288b0: aa1f03f8     	mov	x24, xzr
   288b4: 2a1f03f7     	mov	w23, wzr
   288b8: 5280035b     	mov	w27, #0x1a              // =26
   288bc: 3707a2d6     	tbnz	w22, #0x0, 0x27d14 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x1ac>
   288c0: 17fffd1e     	b	0x27d38 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x1d0>
   288c4: f0000021     	adrp	x1, 0x2f000 <AllHidDevProperties+0x3bf0>
   288c8: 9105f421     	add	x1, x1, #0x17d
   288cc: 52800860     	mov	w0, #0x43               // =67
   288d0: 97ffad28     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   288d4: aa1f03f4     	mov	x20, xzr
   288d8: aa1f03f8     	mov	x24, xzr
   288dc: 2a1f03f7     	mov	w23, wzr
   288e0: 528000bb     	mov	w27, #0x5               // =5
   288e4: 3707a196     	tbnz	w22, #0x0, 0x27d14 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x1ac>
   288e8: 17fffd14     	b	0x27d38 <CxAudioHidDev20805::EepromPatch(unsigned int, char const*, void*)+0x1d0>
   288ec: 97ffad01     	bl	0x13cf0 <__stack_chk_fail@plt>
