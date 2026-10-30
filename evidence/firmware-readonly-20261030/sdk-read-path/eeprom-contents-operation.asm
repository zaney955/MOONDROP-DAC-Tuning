
evidence/android-arm64/libCxAudioHidLib.so:	file format elf64-littleaarch64

Disassembly of section .text:

0000000000017bc0 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)>:
   17bc0: d10203ff     	sub	sp, sp, #0x80
   17bc4: a9026ffc     	stp	x28, x27, [sp, #0x20]
   17bc8: a90367fa     	stp	x26, x25, [sp, #0x30]
   17bcc: a9045ff8     	stp	x24, x23, [sp, #0x40]
   17bd0: a90557f6     	stp	x22, x21, [sp, #0x50]
   17bd4: a9064ff4     	stp	x20, x19, [sp, #0x60]
   17bd8: a9077bfd     	stp	x29, x30, [sp, #0x70]
   17bdc: 9101c3fd     	add	x29, sp, #0x70
   17be0: d53bd059     	mrs	x25, TPIDR_EL0
   17be4: f9401729     	ldr	x9, [x25, #0x28]
   17be8: 51000428     	sub	w8, w1, #0x1
   17bec: aa0203f5     	mov	x21, x2
   17bf0: aa0003f3     	mov	x19, x0
   17bf4: 7100091f     	cmp	w8, #0x2
   17bf8: f9000fe9     	str	x9, [sp, #0x18]
   17bfc: 540004a8     	b.hi	0x17c90 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0xd0>
   17c00: d000016a     	adrp	x10, 0x45000
   17c04: d000016b     	adrp	x11, 0x45000
   17c08: 900000ac     	adrp	x12, 0x2b000
   17c0c: 900000ad     	adrp	x13, 0x2b000
   17c10: 900000ae     	adrp	x14, 0x2b000
   17c14: 937d7d09     	sbfiz	x9, x8, #3, #32
   17c18: 9119414a     	add	x10, x10, #0x650
   17c1c: 9119c16b     	add	x11, x11, #0x670
   17c20: 937e7d08     	sbfiz	x8, x8, #2, #32
   17c24: 9136018c     	add	x12, x12, #0xd80
   17c28: 913631ad     	add	x13, x13, #0xd8c
   17c2c: 913661ce     	add	x14, x14, #0xd98
   17c30: f8696941     	ldr	x1, [x10, x9]
   17c34: f8696978     	ldr	x24, [x11, x9]
   17c38: b868699a     	ldr	w26, [x12, x8]
   17c3c: b86869bb     	ldr	w27, [x13, x8]
   17c40: b86869dc     	ldr	w28, [x14, x8]
   17c44: b4000355     	cbz	x21, 0x17cac <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0xec>
   17c48: 321c03e0     	orr	w0, wzr, #0x10
   17c4c: aa1503e2     	mov	x2, x21
   17c50: 97fff13c     	bl	0x14140 <_Z16LogUnicodeStringjPKcS0_@plt>
   17c54: f9400268     	ldr	x8, [x19]
   17c58: aa1303e0     	mov	x0, x19
   17c5c: f9403908     	ldr	x8, [x8, #0x70]
   17c60: d63f0100     	blr	x8
   17c64: 2a0003f6     	mov	w22, w0
   17c68: 350003d6     	cbnz	w22, 0x17ce0 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x120>
   17c6c: f9400268     	ldr	x8, [x19]
   17c70: 528004e1     	mov	w1, #0x27               // =39
   17c74: aa1303e0     	mov	x0, x19
   17c78: f9413d08     	ldr	x8, [x8, #0x278]
   17c7c: d63f0100     	blr	x8
   17c80: 7100041f     	cmp	w0, #0x1
   17c84: 54000241     	b.ne	0x17ccc <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x10c>
   17c88: 2a1f03f6     	mov	w22, wzr
   17c8c: 14000015     	b	0x17ce0 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x120>
   17c90: b00000a1     	adrp	x1, 0x2c000 <AllHidDevProperties+0xbf0>
   17c94: 912a0021     	add	x1, x1, #0xa80
   17c98: 2a1f03fa     	mov	w26, wzr
   17c9c: 2a1f03fb     	mov	w27, wzr
   17ca0: 2a1f03fc     	mov	w28, wzr
   17ca4: aa0103f8     	mov	x24, x1
   17ca8: b5fffd15     	cbnz	x21, 0x17c48 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x88>
   17cac: 2a1b0388     	orr	w8, w28, w27
   17cb0: 34fffd28     	cbz	w8, 0x17c54 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x94>
   17cb4: 900000a1     	adrp	x1, 0x2b000
   17cb8: 912c5421     	add	x1, x1, #0xb15
   17cbc: 320003e0     	orr	w0, wzr, #0x1
   17cc0: 97fff02c     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   17cc4: 321e07f6     	orr	w22, wzr, #0xc
   17cc8: 14000006     	b	0x17ce0 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x120>
   17ccc: 900000a1     	adrp	x1, 0x2b000
   17cd0: 912d4021     	add	x1, x1, #0xb50
   17cd4: 320003e0     	orr	w0, wzr, #0x1
   17cd8: 97fff026     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   17cdc: 52800596     	mov	w22, #0x2c              // =44
   17ce0: f9400268     	ldr	x8, [x19]
   17ce4: aa1303e0     	mov	x0, x19
   17ce8: f9403508     	ldr	x8, [x8, #0x68]
   17cec: d63f0100     	blr	x8
   17cf0: 2a0003f7     	mov	w23, w0
   17cf4: 35000116     	cbnz	w22, 0x17d14 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x154>
   17cf8: 310006ff     	cmn	w23, #0x1
   17cfc: 540000c1     	b.ne	0x17d14 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x154>
   17d00: 900000a1     	adrp	x1, 0x2b000
   17d04: 912e4821     	add	x1, x1, #0xb92
   17d08: 320003e0     	orr	w0, wzr, #0x1
   17d0c: 97fff019     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   17d10: 528005b6     	mov	w22, #0x2d              // =45
   17d14: 900000a1     	adrp	x1, 0x2b000
   17d18: 912f0821     	add	x1, x1, #0xbc2
   17d1c: 321c03e0     	orr	w0, wzr, #0x10
   17d20: 2a1703e2     	mov	w2, w23
   17d24: 97ffefe3     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   17d28: 2a1b0388     	orr	w8, w28, w27
   17d2c: aa1f03f4     	mov	x20, xzr
   17d30: 340000e8     	cbz	w8, 0x17d4c <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x18c>
   17d34: 350000d6     	cbnz	w22, 0x17d4c <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x18c>
   17d38: aa1503e0     	mov	x0, x21
   17d3c: aa1803e1     	mov	x1, x24
   17d40: 97fff108     	bl	0x14160 <fopen@plt>
   17d44: aa0003f4     	mov	x20, x0
   17d48: b40001f4     	cbz	x20, 0x17d84 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x1c4>
   17d4c: 2a1f03e8     	mov	w8, wzr
   17d50: 3400051b     	cbz	w27, 0x17df0 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x230>
   17d54: 350004f6     	cbnz	w22, 0x17df0 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x230>
   17d58: 321f03e2     	orr	w2, wzr, #0x2
   17d5c: aa1403e0     	mov	x0, x20
   17d60: aa1f03e1     	mov	x1, xzr
   17d64: 97fff03f     	bl	0x13e60 <fseek@plt>
   17d68: 340001a0     	cbz	w0, 0x17d9c <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x1dc>
   17d6c: 900000a1     	adrp	x1, 0x2b000
   17d70: 91315421     	add	x1, x1, #0xc55
   17d74: 320007e0     	orr	w0, wzr, #0x3
   17d78: 97ffeffe     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   17d7c: 2a1f03f5     	mov	w21, wzr
   17d80: 14000013     	b	0x17dcc <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x20c>
   17d84: 900000a1     	adrp	x1, 0x2b000
   17d88: 912f9c21     	add	x1, x1, #0xbe7
   17d8c: 320007e0     	orr	w0, wzr, #0x3
   17d90: 97ffeff8     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   17d94: 52800356     	mov	w22, #0x1a              // =26
   17d98: 14000020     	b	0x17e18 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x258>
   17d9c: aa1403e0     	mov	x0, x20
   17da0: 97ffeefc     	bl	0x13990 <ftell@plt>
   17da4: aa0003f5     	mov	x21, x0
   17da8: aa1403e0     	mov	x0, x20
   17dac: aa1f03e1     	mov	x1, xzr
   17db0: 2a1f03e2     	mov	w2, wzr
   17db4: 97fff02b     	bl	0x13e60 <fseek@plt>
   17db8: 340009c0     	cbz	w0, 0x17ef0 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x330>
   17dbc: 900000a1     	adrp	x1, 0x2b000
   17dc0: 91305021     	add	x1, x1, #0xc14
   17dc4: 320007e0     	orr	w0, wzr, #0x3
   17dc8: 97ffefea     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   17dcc: 52800376     	mov	w22, #0x1b              // =27
   17dd0: 900000a1     	adrp	x1, 0x2b000
   17dd4: 91324021     	add	x1, x1, #0xc90
   17dd8: 321c03e0     	orr	w0, wzr, #0x10
   17ddc: 2a1503e2     	mov	w2, w21
   17de0: 97ffefb4     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   17de4: 6b1702bf     	cmp	w21, w23
   17de8: 54000641     	b.ne	0x17eb0 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x2f0>
   17dec: 2a1703e8     	mov	w8, w23
   17df0: 340002f6     	cbz	w22, 0x17e4c <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x28c>
   17df4: b4000134     	cbz	x20, 0x17e18 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x258>
   17df8: aa1403e0     	mov	x0, x20
   17dfc: 97ffefa5     	bl	0x13c90 <fclose@plt>
   17e00: 340000c0     	cbz	w0, 0x17e18 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x258>
   17e04: 900000a1     	adrp	x1, 0x2b000
   17e08: 91354021     	add	x1, x1, #0xd50
   17e0c: 320007e0     	orr	w0, wzr, #0x3
   17e10: 97ffefd8     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   17e14: 528003b6     	mov	w22, #0x1d              // =29
   17e18: f9401728     	ldr	x8, [x25, #0x28]
   17e1c: f9400fe9     	ldr	x9, [sp, #0x18]
   17e20: eb09011f     	cmp	x8, x9
   17e24: 54001221     	b.ne	0x18068 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x4a8>
   17e28: 2a1603e0     	mov	w0, w22
   17e2c: a9477bfd     	ldp	x29, x30, [sp, #0x70]
   17e30: a9464ff4     	ldp	x20, x19, [sp, #0x60]
   17e34: a94557f6     	ldp	x22, x21, [sp, #0x50]
   17e38: a9445ff8     	ldp	x24, x23, [sp, #0x40]
   17e3c: a94367fa     	ldp	x26, x25, [sp, #0x30]
   17e40: a9426ffc     	ldp	x28, x27, [sp, #0x20]
   17e44: 910203ff     	add	sp, sp, #0x80
   17e48: d65f03c0     	ret
   17e4c: 7100037f     	cmp	w27, #0x0
   17e50: 1a971117     	csel	w23, w8, w23, ne
   17e54: 34000417     	cbz	w23, 0x17ed4 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x314>
   17e58: 2a1703f8     	mov	w24, w23
   17e5c: aa1803e0     	mov	x0, x24
   17e60: 97fff09c     	bl	0x140d0 <malloc@plt>
   17e64: aa0003f5     	mov	x21, x0
   17e68: b4000495     	cbz	x21, 0x17ef8 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x338>
   17e6c: 3400057b     	cbz	w27, 0x17f18 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x358>
   17e70: 320003e1     	orr	w1, wzr, #0x1
   17e74: aa1503e0     	mov	x0, x21
   17e78: aa1803e2     	mov	x2, x24
   17e7c: aa1403e3     	mov	x3, x20
   17e80: 97ffeed4     	bl	0x139d0 <fread@plt>
   17e84: aa0003e8     	mov	x8, x0
   17e88: eb18011f     	cmp	x8, x24
   17e8c: 54000500     	b.eq	0x17f2c <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x36c>
   17e90: 900000a1     	adrp	x1, 0x2b000
   17e94: 91345421     	add	x1, x1, #0xd15
   17e98: 320007e0     	orr	w0, wzr, #0x3
   17e9c: 2a0803e2     	mov	w2, w8
   17ea0: 2a1703e3     	mov	w3, w23
   17ea4: 97ffef2f     	bl	0x13b60 <_Z10LogNumber2jPKcjj@plt>
   17ea8: 52800376     	mov	w22, #0x1b              // =27
   17eac: 1400006b     	b	0x18058 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x498>
   17eb0: 900000a1     	adrp	x1, 0x2b000
   17eb4: 9132cc21     	add	x1, x1, #0xcb3
   17eb8: 320003e0     	orr	w0, wzr, #0x1
   17ebc: 2a1503e2     	mov	w2, w21
   17ec0: 2a1703e3     	mov	w3, w23
   17ec4: 97ffef27     	bl	0x13b60 <_Z10LogNumber2jPKcjj@plt>
   17ec8: 52800176     	mov	w22, #0xb               // =11
   17ecc: b5fff974     	cbnz	x20, 0x17df8 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x238>
   17ed0: 17ffffd2     	b	0x17e18 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x258>
   17ed4: 900000a1     	adrp	x1, 0x2b000
   17ed8: 9133c421     	add	x1, x1, #0xcf1
   17edc: 320007e0     	orr	w0, wzr, #0x3
   17ee0: 97ffefa4     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   17ee4: 52800256     	mov	w22, #0x12              // =18
   17ee8: b5fff894     	cbnz	x20, 0x17df8 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x238>
   17eec: 17ffffcb     	b	0x17e18 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x258>
   17ef0: 2a1f03f6     	mov	w22, wzr
   17ef4: 17ffffb7     	b	0x17dd0 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x210>
   17ef8: 900000a1     	adrp	x1, 0x2b000
   17efc: 91335c21     	add	x1, x1, #0xcd7
   17f00: 320007e0     	orr	w0, wzr, #0x3
   17f04: 2a1703e2     	mov	w2, w23
   17f08: 97ffef6a     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   17f0c: 52800236     	mov	w22, #0x11              // =17
   17f10: b5fff754     	cbnz	x20, 0x17df8 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x238>
   17f14: 17ffffc1     	b	0x17e18 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x258>
   17f18: 340000ba     	cbz	w26, 0x17f2c <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x36c>
   17f1c: 32001fe1     	orr	w1, wzr, #0xff
   17f20: aa1503e0     	mov	x0, x21
   17f24: aa1803e2     	mov	x2, x24
   17f28: 97fff08a     	bl	0x14150 <memset@plt>
   17f2c: 3400039c     	cbz	w28, 0x17f9c <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x3dc>
   17f30: f9400268     	ldr	x8, [x19]
   17f34: aa1303e0     	mov	x0, x19
   17f38: 2a1f03e1     	mov	w1, wzr
   17f3c: 2a1703e2     	mov	w2, w23
   17f40: f9402d08     	ldr	x8, [x8, #0x58]
   17f44: aa1503e3     	mov	x3, x21
   17f48: 2a1703e4     	mov	w4, w23
   17f4c: aa1f03e5     	mov	x5, xzr
   17f50: d63f0100     	blr	x8
   17f54: 2a0003f6     	mov	w22, w0
   17f58: 35000816     	cbnz	w22, 0x18058 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x498>
   17f5c: 320003e1     	orr	w1, wzr, #0x1
   17f60: aa1503e0     	mov	x0, x21
   17f64: aa1803e2     	mov	x2, x24
   17f68: aa1403e3     	mov	x3, x20
   17f6c: 97fff085     	bl	0x14180 <fwrite@plt>
   17f70: aa0003e8     	mov	x8, x0
   17f74: eb18011f     	cmp	x8, x24
   17f78: 540006e0     	b.eq	0x18054 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x494>
   17f7c: 900000a1     	adrp	x1, 0x2b000
   17f80: 9134c421     	add	x1, x1, #0xd31
   17f84: 320007e0     	orr	w0, wzr, #0x3
   17f88: 2a0803e2     	mov	w2, w8
   17f8c: 2a1703e3     	mov	w3, w23
   17f90: 97ffeef4     	bl	0x13b60 <_Z10LogNumber2jPKcjj@plt>
   17f94: 321e0bf6     	orr	w22, wzr, #0x1c
   17f98: 14000030     	b	0x18058 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x498>
   17f9c: 340003fb     	cbz	w27, 0x18018 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x458>
   17fa0: 394002a8     	ldrb	w8, [x21]
   17fa4: 32001fe9     	orr	w9, wzr, #0xff
   17fa8: 390002a9     	strb	w9, [x21]
   17fac: 320003e1     	orr	w1, wzr, #0x1
   17fb0: 390053e8     	strb	w8, [sp, #0x14]
   17fb4: f9400268     	ldr	x8, [x19]
   17fb8: 321c03e3     	orr	w3, wzr, #0x10
   17fbc: aa1303e0     	mov	x0, x19
   17fc0: 2a1f03e2     	mov	w2, wzr
   17fc4: f940a508     	ldr	x8, [x8, #0x148]
   17fc8: 2a1f03e4     	mov	w4, wzr
   17fcc: 2a1703e5     	mov	w5, w23
   17fd0: aa1503e6     	mov	x6, x21
   17fd4: 2a1703e7     	mov	w7, w23
   17fd8: f90003ff     	str	xzr, [sp]
   17fdc: d63f0100     	blr	x8
   17fe0: 2a0003f6     	mov	w22, w0
   17fe4: 350003b6     	cbnz	w22, 0x18058 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x498>
   17fe8: f9400268     	ldr	x8, [x19]
   17fec: 320003e1     	orr	w1, wzr, #0x1
   17ff0: 321c03e3     	orr	w3, wzr, #0x10
   17ff4: 320003e5     	orr	w5, wzr, #0x1
   17ff8: f940a508     	ldr	x8, [x8, #0x148]
   17ffc: 910053e6     	add	x6, sp, #0x14
   18000: 320003e7     	orr	w7, wzr, #0x1
   18004: aa1303e0     	mov	x0, x19
   18008: 2a1f03e2     	mov	w2, wzr
   1800c: 2a1f03e4     	mov	w4, wzr
   18010: f90003ff     	str	xzr, [sp]
   18014: 1400000d     	b	0x18048 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x488>
   18018: 340001fa     	cbz	w26, 0x18054 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x494>
   1801c: f9400268     	ldr	x8, [x19]
   18020: 320003e1     	orr	w1, wzr, #0x1
   18024: 321c03e3     	orr	w3, wzr, #0x10
   18028: aa1303e0     	mov	x0, x19
   1802c: f940a508     	ldr	x8, [x8, #0x148]
   18030: f90003ff     	str	xzr, [sp]
   18034: 2a1f03e2     	mov	w2, wzr
   18038: 2a1f03e4     	mov	w4, wzr
   1803c: 2a1703e5     	mov	w5, w23
   18040: aa1503e6     	mov	x6, x21
   18044: 2a1703e7     	mov	w7, w23
   18048: d63f0100     	blr	x8
   1804c: 2a0003f6     	mov	w22, w0
   18050: 14000002     	b	0x18058 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x498>
   18054: 2a1f03f6     	mov	w22, wzr
   18058: aa1503e0     	mov	x0, x21
   1805c: 97fff059     	bl	0x141c0 <free@plt>
   18060: b5ffecd4     	cbnz	x20, 0x17df8 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x238>
   18064: 17ffff6d     	b	0x17e18 <CxAudioHidDevice::EepromContentsOperation(unsigned int, char const*)+0x258>
   18068: 97ffef22     	bl	0x13cf0 <__stack_chk_fail@plt>
