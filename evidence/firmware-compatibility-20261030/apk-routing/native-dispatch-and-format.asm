
evidence/android-arm64/libCxAudioHidLib.so:	file format elf64-littleaarch64

Disassembly of section .text:

0000000000019440 <_Z24CxAudioHidDevConnectByFdiP13_CXDEV_STATUS>:
   19440: a9be4ff4     	stp	x20, x19, [sp, #-0x20]!
   19444: a9017bfd     	stp	x29, x30, [sp, #0x10]
   19448: 910043fd     	add	x29, sp, #0x10
   1944c: f0000174     	adrp	x20, 0x48000
   19450: f9408688     	ldr	x8, [x20, #0x108]
   19454: 2a0003f3     	mov	w19, w0
   19458: b40000c8     	cbz	x8, 0x19470 <_Z24CxAudioHidDevConnectByFdiP13_CXDEV_STATUS+0x30>
   1945c: f9400109     	ldr	x9, [x8]
   19460: aa0803e0     	mov	x0, x8
   19464: f9400929     	ldr	x9, [x9, #0x10]
   19468: d63f0120     	blr	x9
   1946c: f900869f     	str	xzr, [x20, #0x108]
   19470: 2a1303e1     	mov	w1, w19
   19474: 97ffe96f     	bl	0x13a30 <_ZN20CxAudioHidDevFactory7ConnectEiP13_CXDEV_STATUS@plt>
   19478: a9417bfd     	ldp	x29, x30, [sp, #0x10]
   1947c: f9008680     	str	x0, [x20, #0x108]
   19480: a8c24ff4     	ldp	x20, x19, [sp], #0x20
   19484: d65f03c0     	ret

0000000000019f5c <_Z22CxMemoryPatchCheckFilePKcP10__S37_FILE>:
   19f5c: f81d0ff5     	str	x21, [sp, #-0x30]!
   19f60: a9014ff4     	stp	x20, x19, [sp, #0x10]
   19f64: a9027bfd     	stp	x29, x30, [sp, #0x20]
   19f68: 910083fd     	add	x29, sp, #0x20
   19f6c: aa0003f4     	mov	x20, x0
   19f70: 52808b00     	mov	w0, #0x458              // =1112
   19f74: aa0103f3     	mov	x19, x1
   19f78: 97ffe766     	bl	0x13d10 <_Znwm@plt>
   19f7c: aa0003f5     	mov	x21, x0
   19f80: 97ffe858     	bl	0x140e0 <_ZN16CxAudioHidDeviceC1Ev@plt>
   19f84: f94002a8     	ldr	x8, [x21]
   19f88: aa1503e0     	mov	x0, x21
   19f8c: aa1403e1     	mov	x1, x20
   19f90: aa1303e2     	mov	x2, x19
   19f94: f940d908     	ldr	x8, [x8, #0x1b0]
   19f98: d63f0100     	blr	x8
   19f9c: f94002a8     	ldr	x8, [x21]
   19fa0: 2a0003f3     	mov	w19, w0
   19fa4: aa1503e0     	mov	x0, x21
   19fa8: f9416108     	ldr	x8, [x8, #0x2c0]
   19fac: d63f0100     	blr	x8
   19fb0: 2a1303e0     	mov	w0, w19
   19fb4: a9427bfd     	ldp	x29, x30, [sp, #0x20]
   19fb8: a9414ff4     	ldp	x20, x19, [sp, #0x10]
   19fbc: f84307f5     	ldr	x21, [sp], #0x30
   19fc0: d65f03c0     	ret

000000000001a868 <_ZN16CxAudioHidDevice13AutoConfigureEv>:
   1a868: d107c3ff     	sub	sp, sp, #0x1f0
   1a86c: a91a67fc     	stp	x28, x25, [sp, #0x1a0]
   1a870: a91b5ff8     	stp	x24, x23, [sp, #0x1b0]
   1a874: a91c57f6     	stp	x22, x21, [sp, #0x1c0]
   1a878: a91d4ff4     	stp	x20, x19, [sp, #0x1d0]
   1a87c: a91e7bfd     	stp	x29, x30, [sp, #0x1e0]
   1a880: 910783fd     	add	x29, sp, #0x1e0
   1a884: d53bd056     	mrs	x22, TPIDR_EL0
   1a888: f94016c8     	ldr	x8, [x22, #0x28]
   1a88c: 910263f7     	add	x23, sp, #0x98
   1a890: 528004e1     	mov	w1, #0x27               // =39
   1a894: 2a1f03e2     	mov	w2, wzr
   1a898: aa0003f3     	mov	x19, x0
   1a89c: f90082e8     	str	x8, [x23, #0x100]
   1a8a0: 97ffe404     	bl	0x138b0 <_ZN16CxAudioHidDevice11PropertySetE21__CXHID_PROPERTY_TYPEj@plt>
   1a8a4: 52800501     	mov	w1, #0x28               // =40
   1a8a8: aa1303e0     	mov	x0, x19
   1a8ac: 2a1f03e2     	mov	w2, wzr
   1a8b0: 97ffe400     	bl	0x138b0 <_ZN16CxAudioHidDevice11PropertySetE21__CXHID_PROPERTY_TYPEj@plt>
   1a8b4: f9400268     	ldr	x8, [x19]
   1a8b8: 92800009     	mov	x9, #-0x1               // =-1
   1a8bc: f800c269     	stur	x9, [x19, #0xc]
   1a8c0: 910b6a74     	add	x20, x19, #0x2da
   1a8c4: f9402d08     	ldr	x8, [x8, #0x58]
   1a8c8: 321f03e2     	orr	w2, wzr, #0x2
   1a8cc: 321f03e4     	orr	w4, wzr, #0x2
   1a8d0: aa1303e0     	mov	x0, x19
   1a8d4: 2a1f03e1     	mov	w1, wzr
   1a8d8: aa1403e3     	mov	x3, x20
   1a8dc: aa1f03e5     	mov	x5, xzr
   1a8e0: d63f0100     	blr	x8
   1a8e4: 394b6a62     	ldrb	w2, [x19, #0x2da]
   1a8e8: d0000081     	adrp	x1, 0x2c000 <AllHidDevProperties+0xbf0>
   1a8ec: 2a0003f5     	mov	w21, w0
   1a8f0: 91170421     	add	x1, x1, #0x5c1
   1a8f4: 321e03e0     	orr	w0, wzr, #0x4
   1a8f8: 97ffe4ee     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1a8fc: 394b6e62     	ldrb	w2, [x19, #0x2db]
   1a900: d0000081     	adrp	x1, 0x2c000 <AllHidDevProperties+0xbf0>
   1a904: 9117c021     	add	x1, x1, #0x5f0
   1a908: 321e03e0     	orr	w0, wzr, #0x4
   1a90c: 97ffe4e9     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1a910: 340001b5     	cbz	w21, 0x1a944 <_ZN16CxAudioHidDevice13AutoConfigureEv+0xdc>
   1a914: f94016c8     	ldr	x8, [x22, #0x28]
   1a918: f94082e9     	ldr	x9, [x23, #0x100]
   1a91c: eb09011f     	cmp	x8, x9
   1a920: 54002ba1     	b.ne	0x1ae94 <_ZN16CxAudioHidDevice13AutoConfigureEv+0x62c>
   1a924: 2a1503e0     	mov	w0, w21
   1a928: a95e7bfd     	ldp	x29, x30, [sp, #0x1e0]
   1a92c: a95d4ff4     	ldp	x20, x19, [sp, #0x1d0]
   1a930: a95c57f6     	ldp	x22, x21, [sp, #0x1c0]
   1a934: a95b5ff8     	ldp	x24, x23, [sp, #0x1b0]
   1a938: a95a67fc     	ldp	x28, x25, [sp, #0x1a0]
   1a93c: 9107c3ff     	add	sp, sp, #0x1f0
   1a940: d65f03c0     	ret
   1a944: 39400288     	ldrb	w8, [x20]
   1a948: 7103fd1f     	cmp	w8, #0xff
   1a94c: 54000081     	b.ne	0x1a95c <_ZN16CxAudioHidDevice13AutoConfigureEv+0xf4>
   1a950: 394b6e68     	ldrb	w8, [x19, #0x2db]
   1a954: 7103fd1f     	cmp	w8, #0xff
   1a958: 54000920     	b.eq	0x1aa7c <_ZN16CxAudioHidDevice13AutoConfigureEv+0x214>
   1a95c: 394b6a62     	ldrb	w2, [x19, #0x2da]
   1a960: d0000081     	adrp	x1, 0x2c000 <AllHidDevProperties+0xbf0>
   1a964: 911b4421     	add	x1, x1, #0x6d1
   1a968: 321e03e0     	orr	w0, wzr, #0x4
   1a96c: 97ffe4d1     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1a970: 394b6e62     	ldrb	w2, [x19, #0x2db]
   1a974: d0000081     	adrp	x1, 0x2c000 <AllHidDevProperties+0xbf0>
   1a978: 911bf821     	add	x1, x1, #0x6fe
   1a97c: 321e03e0     	orr	w0, wzr, #0x4
   1a980: 97ffe4cc     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1a984: 394b6a68     	ldrb	w8, [x19, #0x2da]
   1a988: 34000188     	cbz	w8, 0x1a9b8 <_ZN16CxAudioHidDevice13AutoConfigureEv+0x150>
   1a98c: 7103fd1f     	cmp	w8, #0xff
   1a990: 54000181     	b.ne	0x1a9c0 <_ZN16CxAudioHidDevice13AutoConfigureEv+0x158>
   1a994: 394b6e68     	ldrb	w8, [x19, #0x2db]
   1a998: 34001488     	cbz	w8, 0x1ac28 <_ZN16CxAudioHidDevice13AutoConfigureEv+0x3c0>
   1a99c: 7103fd1f     	cmp	w8, #0xff
   1a9a0: 54000101     	b.ne	0x1a9c0 <_ZN16CxAudioHidDevice13AutoConfigureEv+0x158>
   1a9a4: d0000081     	adrp	x1, 0x2c000 <AllHidDevProperties+0xbf0>
   1a9a8: d0000082     	adrp	x2, 0x2c000 <AllHidDevProperties+0xbf0>
   1a9ac: 9119e421     	add	x1, x1, #0x679
   1a9b0: 911cc442     	add	x2, x2, #0x731
   1a9b4: 140000a1     	b	0x1ac38 <_ZN16CxAudioHidDevice13AutoConfigureEv+0x3d0>
   1a9b8: 394b6e68     	ldrb	w8, [x19, #0x2db]
   1a9bc: 34001268     	cbz	w8, 0x1ac08 <_ZN16CxAudioHidDevice13AutoConfigureEv+0x3a0>
   1a9c0: 528004e1     	mov	w1, #0x27               // =39
   1a9c4: 320003e2     	orr	w2, wzr, #0x1
   1a9c8: aa1303e0     	mov	x0, x19
   1a9cc: 97ffe3b9     	bl	0x138b0 <_ZN16CxAudioHidDevice11PropertySetE21__CXHID_PROPERTY_TYPEj@plt>
   1a9d0: d0000081     	adrp	x1, 0x2c000 <AllHidDevProperties+0xbf0>
   1a9d4: d0000082     	adrp	x2, 0x2c000 <AllHidDevProperties+0xbf0>
   1a9d8: 9119e421     	add	x1, x1, #0x679
   1a9dc: 911d9042     	add	x2, x2, #0x764
   1a9e0: 321e03e0     	orr	w0, wzr, #0x4
   1a9e4: 97ffe50b     	bl	0x13e10 <_Z9LogStringjPKcS0_@plt>
   1a9e8: 394b6a68     	ldrb	w8, [x19, #0x2da]
   1a9ec: 7101311f     	cmp	w8, #0x4c
   1a9f0: 54001501     	b.ne	0x1ac90 <_ZN16CxAudioHidDevice13AutoConfigureEv+0x428>
   1a9f4: d0000081     	adrp	x1, 0x2c000 <AllHidDevProperties+0xbf0>
   1a9f8: d0000082     	adrp	x2, 0x2c000 <AllHidDevProperties+0xbf0>
   1a9fc: 9119e421     	add	x1, x1, #0x679
   1aa00: 911ddc42     	add	x2, x2, #0x777
   1aa04: 321e03e0     	orr	w0, wzr, #0x4
   1aa08: 97ffe502     	bl	0x13e10 <_Z9LogStringjPKcS0_@plt>
   1aa0c: 52800501     	mov	w1, #0x28               // =40
   1aa10: 320003e2     	orr	w2, wzr, #0x1
   1aa14: aa1303e0     	mov	x0, x19
   1aa18: 97ffe3a6     	bl	0x138b0 <_ZN16CxAudioHidDevice11PropertySetE21__CXHID_PROPERTY_TYPEj@plt>
   1aa1c: 394b6e60     	ldrb	w0, [x19, #0x2db]
   1aa20: 97ffe5f4     	bl	0x141f0 <_Z20EepromSizeCode2Bytesh@plt>
   1aa24: 2a0003e8     	mov	w8, w0
   1aa28: d0000081     	adrp	x1, 0x2c000 <AllHidDevProperties+0xbf0>
   1aa2c: 911e1c21     	add	x1, x1, #0x787
   1aa30: 321e03e0     	orr	w0, wzr, #0x4
   1aa34: 2a0803e2     	mov	w2, w8
   1aa38: b9000e68     	str	w8, [x19, #0xc]
   1aa3c: 97ffe49d     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1aa40: b9444268     	ldr	w8, [x19, #0x440]
   1aa44: 34000ec8     	cbz	w8, 0x1ac1c <_ZN16CxAudioHidDevice13AutoConfigureEv+0x3b4>
   1aa48: 790133ff     	strh	wzr, [sp, #0x98]
   1aa4c: f9400268     	ldr	x8, [x19]
   1aa50: 528000a1     	mov	w1, #0x5                // =5
   1aa54: 321f03e2     	orr	w2, wzr, #0x2
   1aa58: 910263e3     	add	x3, sp, #0x98
   1aa5c: f9402d08     	ldr	x8, [x8, #0x58]
   1aa60: 321f03e4     	orr	w4, wzr, #0x2
   1aa64: aa1303e0     	mov	x0, x19
   1aa68: aa1f03e5     	mov	x5, xzr
   1aa6c: d63f0100     	blr	x8
   1aa70: 34000ea0     	cbz	w0, 0x1ac44 <_ZN16CxAudioHidDevice13AutoConfigureEv+0x3dc>
   1aa74: b9401262     	ldr	w2, [x19, #0x10]
   1aa78: 1400007d     	b	0x1ac6c <_ZN16CxAudioHidDevice13AutoConfigureEv+0x404>
   1aa7c: f9400268     	ldr	x8, [x19]
   1aa80: aa1303e0     	mov	x0, x19
   1aa84: 2a1f03e1     	mov	w1, wzr
   1aa88: f940a908     	ldr	x8, [x8, #0x150]
   1aa8c: d63f0100     	blr	x8
   1aa90: 34fff660     	cbz	w0, 0x1a95c <_ZN16CxAudioHidDevice13AutoConfigureEv+0xf4>
   1aa94: 52800828     	mov	w8, #0x41               // =65
   1aa98: 390263e8     	strb	w8, [sp, #0x98]
   1aa9c: f9400268     	ldr	x8, [x19]
   1aaa0: 52800561     	mov	w1, #0x2b               // =43
   1aaa4: 320003e2     	orr	w2, wzr, #0x1
   1aaa8: 910263e3     	add	x3, sp, #0x98
   1aaac: f9402d08     	ldr	x8, [x8, #0x58]
   1aab0: 320003e4     	orr	w4, wzr, #0x1
   1aab4: aa1303e0     	mov	x0, x19
   1aab8: aa1f03e5     	mov	x5, xzr
   1aabc: d63f0100     	blr	x8
   1aac0: 2a0003f5     	mov	w21, w0
   1aac4: 35fff295     	cbnz	w21, 0x1a914 <_ZN16CxAudioHidDevice13AutoConfigureEv+0xac>
   1aac8: 52800a88     	mov	w8, #0x54               // =84
   1aacc: 390063e8     	strb	w8, [sp, #0x18]
   1aad0: f9400268     	ldr	x8, [x19]
   1aad4: 52800561     	mov	w1, #0x2b               // =43
   1aad8: 320003e2     	orr	w2, wzr, #0x1
   1aadc: 910063e3     	add	x3, sp, #0x18
   1aae0: f9403108     	ldr	x8, [x8, #0x60]
   1aae4: 320003e4     	orr	w4, wzr, #0x1
   1aae8: aa1303e0     	mov	x0, x19
   1aaec: aa1f03e5     	mov	x5, xzr
   1aaf0: d63f0100     	blr	x8
   1aaf4: 394063e2     	ldrb	w2, [sp, #0x18]
   1aaf8: d0000081     	adrp	x1, 0x2c000 <AllHidDevProperties+0xbf0>
   1aafc: 2a0003f5     	mov	w21, w0
   1ab00: 91189421     	add	x1, x1, #0x625
   1ab04: 321e03e0     	orr	w0, wzr, #0x4
   1ab08: 97ffe46a     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1ab0c: 35fff055     	cbnz	w21, 0x1a914 <_ZN16CxAudioHidDevice13AutoConfigureEv+0xac>
   1ab10: 32001fe8     	orr	w8, wzr, #0xff
   1ab14: 390053e8     	strb	w8, [sp, #0x14]
   1ab18: f9400268     	ldr	x8, [x19]
   1ab1c: 52800561     	mov	w1, #0x2b               // =43
   1ab20: 320003e2     	orr	w2, wzr, #0x1
   1ab24: 910053e3     	add	x3, sp, #0x14
   1ab28: f9402d08     	ldr	x8, [x8, #0x58]
   1ab2c: 320003e4     	orr	w4, wzr, #0x1
   1ab30: aa1303e0     	mov	x0, x19
   1ab34: aa1f03e5     	mov	x5, xzr
   1ab38: d63f0100     	blr	x8
   1ab3c: 394053e2     	ldrb	w2, [sp, #0x14]
   1ab40: d0000081     	adrp	x1, 0x2c000 <AllHidDevProperties+0xbf0>
   1ab44: 2a0003f5     	mov	w21, w0
   1ab48: 91193821     	add	x1, x1, #0x64e
   1ab4c: 321e03e0     	orr	w0, wzr, #0x4
   1ab50: 97ffe458     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1ab54: 35000435     	cbnz	w21, 0x1abd8 <_ZN16CxAudioHidDevice13AutoConfigureEv+0x370>
   1ab58: 394063e9     	ldrb	w9, [sp, #0x18]
   1ab5c: 394053e8     	ldrb	w8, [sp, #0x14]
   1ab60: 6b08013f     	cmp	w9, w8
   1ab64: 54000181     	b.ne	0x1ab94 <_ZN16CxAudioHidDevice13AutoConfigureEv+0x32c>
   1ab68: 528004e1     	mov	w1, #0x27               // =39
   1ab6c: 320003e2     	orr	w2, wzr, #0x1
   1ab70: aa1303e0     	mov	x0, x19
   1ab74: 97ffe34f     	bl	0x138b0 <_ZN16CxAudioHidDevice11PropertySetE21__CXHID_PROPERTY_TYPEj@plt>
   1ab78: d0000081     	adrp	x1, 0x2c000 <AllHidDevProperties+0xbf0>
   1ab7c: d0000082     	adrp	x2, 0x2c000 <AllHidDevProperties+0xbf0>
   1ab80: 9119e421     	add	x1, x1, #0x679
   1ab84: 911a3442     	add	x2, x2, #0x68d
   1ab88: 321e03e0     	orr	w0, wzr, #0x4
   1ab8c: 97ffe4a1     	bl	0x13e10 <_Z9LogStringjPKcS0_@plt>
   1ab90: 394053e8     	ldrb	w8, [sp, #0x14]
   1ab94: 394263e9     	ldrb	w9, [sp, #0x98]
   1ab98: 6b08013f     	cmp	w9, w8
   1ab9c: 540001e0     	b.eq	0x1abd8 <_ZN16CxAudioHidDevice13AutoConfigureEv+0x370>
   1aba0: f9400268     	ldr	x8, [x19]
   1aba4: 320003e2     	orr	w2, wzr, #0x1
   1aba8: 910263e3     	add	x3, sp, #0x98
   1abac: 320003e4     	orr	w4, wzr, #0x1
   1abb0: f9403108     	ldr	x8, [x8, #0x60]
   1abb4: aa1303e0     	mov	x0, x19
   1abb8: 2a1f03e1     	mov	w1, wzr
   1abbc: aa1f03e5     	mov	x5, xzr
   1abc0: d63f0100     	blr	x8
   1abc4: 394263e2     	ldrb	w2, [sp, #0x98]
   1abc8: d0000081     	adrp	x1, 0x2c000 <AllHidDevProperties+0xbf0>
   1abcc: 911a8c21     	add	x1, x1, #0x6a3
   1abd0: 321e03e0     	orr	w0, wzr, #0x4
   1abd4: 97ffe437     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1abd8: f9400268     	ldr	x8, [x19]
   1abdc: 321f03e2     	orr	w2, wzr, #0x2
   1abe0: 321f03e4     	orr	w4, wzr, #0x2
   1abe4: aa1303e0     	mov	x0, x19
   1abe8: f9402d08     	ldr	x8, [x8, #0x58]
   1abec: 2a1f03e1     	mov	w1, wzr
   1abf0: aa1403e3     	mov	x3, x20
   1abf4: aa1f03e5     	mov	x5, xzr
   1abf8: d63f0100     	blr	x8
   1abfc: 2a0003f5     	mov	w21, w0
   1ac00: 35ffe8b5     	cbnz	w21, 0x1a914 <_ZN16CxAudioHidDevice13AutoConfigureEv+0xac>
   1ac04: 17ffff56     	b	0x1a95c <_ZN16CxAudioHidDevice13AutoConfigureEv+0xf4>
   1ac08: d0000081     	adrp	x1, 0x2c000 <AllHidDevProperties+0xbf0>
   1ac0c: d0000082     	adrp	x2, 0x2c000 <AllHidDevProperties+0xbf0>
   1ac10: 9119e421     	add	x1, x1, #0x679
   1ac14: 911d4c42     	add	x2, x2, #0x753
   1ac18: 14000008     	b	0x1ac38 <_ZN16CxAudioHidDevice13AutoConfigureEv+0x3d0>
   1ac1c: 2a1f03e2     	mov	w2, wzr
   1ac20: b900127f     	str	wzr, [x19, #0x10]
   1ac24: 14000012     	b	0x1ac6c <_ZN16CxAudioHidDevice13AutoConfigureEv+0x404>
   1ac28: d0000081     	adrp	x1, 0x2c000 <AllHidDevProperties+0xbf0>
   1ac2c: d0000082     	adrp	x2, 0x2c000 <AllHidDevProperties+0xbf0>
   1ac30: 9119e421     	add	x1, x1, #0x679
   1ac34: 911d0842     	add	x2, x2, #0x742
   1ac38: 321e03e0     	orr	w0, wzr, #0x4
   1ac3c: 97ffe475     	bl	0x13e10 <_Z9LogStringjPKcS0_@plt>
   1ac40: 14000014     	b	0x1ac90 <_ZN16CxAudioHidDevice13AutoConfigureEv+0x428>
   1ac44: b9400e68     	ldr	w8, [x19, #0xc]
   1ac48: 794133e2     	ldrh	w2, [sp, #0x98]
   1ac4c: 51001109     	sub	w9, w8, #0x4
   1ac50: 6b02013f     	cmp	w9, w2
   1ac54: b9001262     	str	w2, [x19, #0x10]
   1ac58: 540000a9     	b.ls	0x1ac6c <_ZN16CxAudioHidDevice13AutoConfigureEv+0x404>
   1ac5c: 321e77e9     	orr	w9, wzr, #0xfffffffc
   1ac60: 4b020129     	sub	w9, w9, w2
   1ac64: 0b080128     	add	w8, w9, w8
   1ac68: b9001668     	str	w8, [x19, #0x14]
   1ac6c: d0000081     	adrp	x1, 0x2c000 <AllHidDevProperties+0xbf0>
   1ac70: 911ea021     	add	x1, x1, #0x7a8
   1ac74: 321e03e0     	orr	w0, wzr, #0x4
   1ac78: 97ffe40e     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1ac7c: b9401662     	ldr	w2, [x19, #0x14]
   1ac80: d0000081     	adrp	x1, 0x2c000 <AllHidDevProperties+0xbf0>
   1ac84: 911f4421     	add	x1, x1, #0x7d1
   1ac88: 321e03e0     	orr	w0, wzr, #0x4
   1ac8c: 97ffe409     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   1ac90: f9400268     	ldr	x8, [x19]
   1ac94: 52800501     	mov	w1, #0x28               // =40
   1ac98: aa1303e0     	mov	x0, x19
   1ac9c: f9413d08     	ldr	x8, [x8, #0x278]
   1aca0: d63f0100     	blr	x8
   1aca4: 7100041f     	cmp	w0, #0x1
   1aca8: 54000181     	b.ne	0x1acd8 <_ZN16CxAudioHidDevice13AutoConfigureEv+0x470>
   1acac: f9400268     	ldr	x8, [x19]
   1acb0: 910b0263     	add	x3, x19, #0x2c0
   1acb4: 321b03e1     	orr	w1, wzr, #0x20
   1acb8: 52800342     	mov	w2, #0x1a               // =26
   1acbc: f9402d08     	ldr	x8, [x8, #0x58]
   1acc0: 52800344     	mov	w4, #0x1a               // =26
   1acc4: aa1303e0     	mov	x0, x19
   1acc8: aa1f03e5     	mov	x5, xzr
   1accc: d63f0100     	blr	x8
   1acd0: 2a0003f5     	mov	w21, w0
   1acd4: 35ffe215     	cbnz	w21, 0x1a914 <_ZN16CxAudioHidDevice13AutoConfigureEv+0xac>
   1acd8: f9400268     	ldr	x8, [x19]
   1acdc: 528004e1     	mov	w1, #0x27               // =39
   1ace0: aa1303e0     	mov	x0, x19
   1ace4: f9413d08     	ldr	x8, [x8, #0x278]
   1ace8: d63f0100     	blr	x8
   1acec: 7100041f     	cmp	w0, #0x1
   1acf0: 54000461     	b.ne	0x1ad7c <_ZN16CxAudioHidDevice13AutoConfigureEv+0x514>
   1acf4: f9400268     	ldr	x8, [x19]
   1acf8: 52800341     	mov	w1, #0x1a               // =26
   1acfc: aa1303e0     	mov	x0, x19
   1ad00: f9413d08     	ldr	x8, [x8, #0x278]
   1ad04: d63f0100     	blr	x8
   1ad08: 2a0003e8     	mov	w8, w0
   1ad0c: 3100051f     	cmn	w8, #0x1
   1ad10: 54000360     	b.eq	0x1ad7c <_ZN16CxAudioHidDevice13AutoConfigureEv+0x514>
   1ad14: 32001fe9     	orr	w9, wzr, #0xff
   1ad18: 390263e9     	strb	w9, [sp, #0x98]
   1ad1c: f9400269     	ldr	x9, [x19]
   1ad20: 910263e2     	add	x2, sp, #0x98
   1ad24: aa1303e0     	mov	x0, x19
   1ad28: 2a0803e1     	mov	w1, w8
   1ad2c: f9406d29     	ldr	x9, [x9, #0xd8]
   1ad30: d63f0120     	blr	x9
   1ad34: 2a0003f5     	mov	w21, w0
   1ad38: 35ffdef5     	cbnz	w21, 0x1a914 <_ZN16CxAudioHidDevice13AutoConfigureEv+0xac>
   1ad3c: 394263e8     	ldrb	w8, [sp, #0x98]
   1ad40: 394b6e69     	ldrb	w9, [x19, #0x2db]
   1ad44: 6b09011f     	cmp	w8, w9
   1ad48: 540001a0     	b.eq	0x1ad7c <_ZN16CxAudioHidDevice13AutoConfigureEv+0x514>
   1ad4c: 320003e8     	orr	w8, wzr, #0x1
   1ad50: 52800521     	mov	w1, #0x29               // =41
   1ad54: aa1303e0     	mov	x0, x19
   1ad58: 2a1f03e2     	mov	w2, wzr
   1ad5c: 3906ee68     	strb	w8, [x19, #0x1bb]
   1ad60: 97ffe2d4     	bl	0x138b0 <_ZN16CxAudioHidDevice11PropertySetE21__CXHID_PROPERTY_TYPEj@plt>
   1ad64: d0000081     	adrp	x1, 0x2c000 <AllHidDevProperties+0xbf0>
   1ad68: d0000082     	adrp	x2, 0x2c000 <AllHidDevProperties+0xbf0>
   1ad6c: 9119e421     	add	x1, x1, #0x679
   1ad70: 911ff442     	add	x2, x2, #0x7fd
   1ad74: 321e03e0     	orr	w0, wzr, #0x4
   1ad78: 97ffe426     	bl	0x13e10 <_Z9LogStringjPKcS0_@plt>
   1ad7c: a9007eff     	stp	xzr, xzr, [x23]
   1ad80: f9400268     	ldr	x8, [x19]
   1ad84: 910263e1     	add	x1, sp, #0x98
   1ad88: aa1303e0     	mov	x0, x19
   1ad8c: f9411d08     	ldr	x8, [x8, #0x238]
   1ad90: d63f0100     	blr	x8
   1ad94: 2a0003f5     	mov	w21, w0
   1ad98: 35ffdbf5     	cbnz	w21, 0x1a914 <_ZN16CxAudioHidDevice13AutoConfigureEv+0xac>
   1ad9c: b9409be8     	ldr	w8, [sp, #0x98]
   1ada0: 35000068     	cbnz	w8, 0x1adac <_ZN16CxAudioHidDevice13AutoConfigureEv+0x544>
   1ada4: b9409fe8     	ldr	w8, [sp, #0x9c]
   1ada8: 340006e8     	cbz	w8, 0x1ae84 <_ZN16CxAudioHidDevice13AutoConfigureEv+0x61c>
   1adac: 320003e2     	orr	w2, wzr, #0x1
   1adb0: 52800541     	mov	w1, #0x2a               // =42
   1adb4: aa1303e0     	mov	x0, x19
   1adb8: 97ffe2be     	bl	0x138b0 <_ZN16CxAudioHidDevice11PropertySetE21__CXHID_PROPERTY_TYPEj@plt>
   1adbc: 910263e0     	add	x0, sp, #0x98
   1adc0: 321f1be2     	orr	w2, wzr, #0xfe
   1adc4: 2a1f03e1     	mov	w1, wzr
   1adc8: 910263f5     	add	x21, sp, #0x98
   1adcc: 97ffe4e1     	bl	0x14150 <memset@plt>
   1add0: 910063f4     	add	x20, sp, #0x18
   1add4: 91002280     	add	x0, x20, #0x8
   1add8: 321d0fe2     	orr	w2, wzr, #0x78
   1addc: 2a1f03e1     	mov	w1, wzr
   1ade0: 97ffe4dc     	bl	0x14150 <memset@plt>
   1ade4: f9000ff5     	str	x21, [sp, #0x18]
   1ade8: f9400268     	ldr	x8, [x19]
   1adec: 52800641     	mov	w1, #0x32               // =50
   1adf0: 910263e2     	add	x2, sp, #0x98
   1adf4: 321f1be3     	orr	w3, wzr, #0xfe
   1adf8: f940f908     	ldr	x8, [x8, #0x1f0]
   1adfc: aa1303e0     	mov	x0, x19
   1ae00: d63f0100     	blr	x8
   1ae04: 350003c0     	cbnz	w0, 0x1ae7c <_ZN16CxAudioHidDevice13AutoConfigureEv+0x614>
   1ae08: 320003e8     	orr	w8, wzr, #0x1
   1ae0c: 910263e9     	add	x9, sp, #0x98
   1ae10: 14000004     	b	0x1ae20 <_ZN16CxAudioHidDevice13AutoConfigureEv+0x5b8>
   1ae14: f8285a89     	str	x9, [x20, w8, uxtw #3]
   1ae18: 11000508     	add	w8, w8, #0x1
   1ae1c: 381ff13f     	sturb	wzr, [x9, #-0x1]
   1ae20: 91000529     	add	x9, x9, #0x1
   1ae24: 385ff12a     	ldurb	w10, [x9, #-0x1]
   1ae28: 3400008a     	cbz	w10, 0x1ae38 <_ZN16CxAudioHidDevice13AutoConfigureEv+0x5d0>
   1ae2c: 7100ed5f     	cmp	w10, #0x3b
   1ae30: 54ffff81     	b.ne	0x1ae20 <_ZN16CxAudioHidDevice13AutoConfigureEv+0x5b8>
   1ae34: 17fffff8     	b	0x1ae14 <_ZN16CxAudioHidDevice13AutoConfigureEv+0x5ac>
   1ae38: 34000228     	cbz	w8, 0x1ae7c <_ZN16CxAudioHidDevice13AutoConfigureEv+0x614>
   1ae3c: d0000094     	adrp	x20, 0x2c000 <AllHidDevProperties+0xbf0>
   1ae40: 2a0803f5     	mov	w21, w8
   1ae44: 910063f8     	add	x24, sp, #0x18
   1ae48: 91211694     	add	x20, x20, #0x845
   1ae4c: 320003f9     	orr	w25, wzr, #0x1
   1ae50: f9400300     	ldr	x0, [x24]
   1ae54: b40000e0     	cbz	x0, 0x1ae70 <_ZN16CxAudioHidDevice13AutoConfigureEv+0x608>
   1ae58: 39400008     	ldrb	w8, [x0]
   1ae5c: 340000a8     	cbz	w8, 0x1ae70 <_ZN16CxAudioHidDevice13AutoConfigureEv+0x608>
   1ae60: aa1403e1     	mov	x1, x20
   1ae64: 97ffe407     	bl	0x13e80 <strcmp@plt>
   1ae68: 35000040     	cbnz	w0, 0x1ae70 <_ZN16CxAudioHidDevice13AutoConfigureEv+0x608>
   1ae6c: b9001a79     	str	w25, [x19, #0x18]
   1ae70: d10006b5     	sub	x21, x21, #0x1
   1ae74: 91002318     	add	x24, x24, #0x8
   1ae78: b5fffed5     	cbnz	x21, 0x1ae50 <_ZN16CxAudioHidDevice13AutoConfigureEv+0x5e8>
   1ae7c: 2a1f03f5     	mov	w21, wzr
   1ae80: 17fffea5     	b	0x1a914 <_ZN16CxAudioHidDevice13AutoConfigureEv+0xac>
   1ae84: b940a3e8     	ldr	w8, [sp, #0xa0]
   1ae88: 7100011f     	cmp	w8, #0x0
   1ae8c: 1a9f07e2     	cset	w2, ne
   1ae90: 17ffffc8     	b	0x1adb0 <_ZN16CxAudioHidDevice13AutoConfigureEv+0x548>
   1ae94: 97ffe397     	bl	0x13cf0 <__stack_chk_fail@plt>

000000000001bd24 <_ZN16CxAudioHidDevice14FirmwareDetectEPKc>:
   1bd24: d10283ff     	sub	sp, sp, #0xa0
   1bd28: f9002bf9     	str	x25, [sp, #0x50]
   1bd2c: a9065ff8     	stp	x24, x23, [sp, #0x60]
   1bd30: a90757f6     	stp	x22, x21, [sp, #0x70]
   1bd34: a9084ff4     	stp	x20, x19, [sp, #0x80]
   1bd38: a9097bfd     	stp	x29, x30, [sp, #0x90]
   1bd3c: 910243fd     	add	x29, sp, #0x90
   1bd40: d53bd054     	mrs	x20, TPIDR_EL0
   1bd44: f9401688     	ldr	x8, [x20, #0x28]
   1bd48: 6f00e400     	movi	v0.2d, #0000000000000000
   1bd4c: aa0003f3     	mov	x19, x0
   1bd50: 910043e2     	add	x2, sp, #0x10
   1bd54: f90027e8     	str	x8, [sp, #0x48]
   1bd58: b90043ff     	str	wzr, [sp, #0x40]
   1bd5c: ad0103e0     	stp	q0, q0, [sp, #0x20]
   1bd60: 3d8007e0     	str	q0, [sp, #0x10]
   1bd64: f9400268     	ldr	x8, [x19]
   1bd68: f940d908     	ldr	x8, [x8, #0x1b0]
   1bd6c: d63f0100     	blr	x8
   1bd70: 2a0003e8     	mov	w8, w0
   1bd74: 2a1f03e0     	mov	w0, wzr
   1bd78: 35000528     	cbnz	w8, 0x1be1c <_ZN16CxAudioHidDevice14FirmwareDetectEPKc+0xf8>
   1bd7c: a9007fff     	stp	xzr, xzr, [sp]
   1bd80: 90000168     	adrp	x8, 0x47000 <_ZTV18CxAudioHidDev2089x+0x198>
   1bd84: f947c908     	ldr	x8, [x8, #0xf90]
   1bd88: f9400269     	ldr	x9, [x19]
   1bd8c: 910003e1     	mov	x1, sp
   1bd90: aa1303e0     	mov	x0, x19
   1bd94: 39408919     	ldrb	w25, [x8, #0x22]
   1bd98: 39408d17     	ldrb	w23, [x8, #0x23]
   1bd9c: 39409115     	ldrb	w21, [x8, #0x24]
   1bda0: 3940c518     	ldrb	w24, [x8, #0x31]
   1bda4: 3940c116     	ldrb	w22, [x8, #0x30]
   1bda8: f9411d28     	ldr	x8, [x9, #0x238]
   1bdac: d63f0100     	blr	x8
   1bdb0: 34000060     	cbz	w0, 0x1bdbc <_ZN16CxAudioHidDevice14FirmwareDetectEPKc+0x98>
   1bdb4: 2a1f03e0     	mov	w0, wzr
   1bdb8: 14000019     	b	0x1be1c <_ZN16CxAudioHidDevice14FirmwareDetectEPKc+0xf8>
   1bdbc: b94003e8     	ldr	w8, [sp]
   1bdc0: 6b19011f     	cmp	w8, w25
   1bdc4: 540002a3     	b.lo	0x1be18 <_ZN16CxAudioHidDevice14FirmwareDetectEPKc+0xf4>
   1bdc8: 54ffff61     	b.ne	0x1bdb4 <_ZN16CxAudioHidDevice14FirmwareDetectEPKc+0x90>
   1bdcc: b94007e8     	ldr	w8, [sp, #0x4]
   1bdd0: 6b17011f     	cmp	w8, w23
   1bdd4: 54000223     	b.lo	0x1be18 <_ZN16CxAudioHidDevice14FirmwareDetectEPKc+0xf4>
   1bdd8: b94007e9     	ldr	w9, [sp, #0x4]
   1bddc: 7945a268     	ldrh	w8, [x19, #0x2d0]
   1bde0: 6b17013f     	cmp	w9, w23
   1bde4: 54000081     	b.ne	0x1bdf4 <_ZN16CxAudioHidDevice14FirmwareDetectEPKc+0xd0>
   1bde8: b9400be9     	ldr	w9, [sp, #0x8]
   1bdec: 6b15013f     	cmp	w9, w21
   1bdf0: 54000143     	b.lo	0x1be18 <_ZN16CxAudioHidDevice14FirmwareDetectEPKc+0xf4>
   1bdf4: b94007e9     	ldr	w9, [sp, #0x4]
   1bdf8: 6b17013f     	cmp	w9, w23
   1bdfc: 54fffdc1     	b.ne	0x1bdb4 <_ZN16CxAudioHidDevice14FirmwareDetectEPKc+0x90>
   1be00: 33181f16     	bfi	w22, w24, #8, #8
   1be04: 6b0802df     	cmp	w22, w8
   1be08: 54fffd69     	b.ls	0x1bdb4 <_ZN16CxAudioHidDevice14FirmwareDetectEPKc+0x90>
   1be0c: b9400be8     	ldr	w8, [sp, #0x8]
   1be10: 6b15011f     	cmp	w8, w21
   1be14: 54fffd01     	b.ne	0x1bdb4 <_ZN16CxAudioHidDevice14FirmwareDetectEPKc+0x90>
   1be18: 320003e0     	orr	w0, wzr, #0x1
   1be1c: f9401688     	ldr	x8, [x20, #0x28]
   1be20: f94027e9     	ldr	x9, [sp, #0x48]
   1be24: eb09011f     	cmp	x8, x9
   1be28: 54000101     	b.ne	0x1be48 <_ZN16CxAudioHidDevice14FirmwareDetectEPKc+0x124>
   1be2c: a9497bfd     	ldp	x29, x30, [sp, #0x90]
   1be30: a9484ff4     	ldp	x20, x19, [sp, #0x80]
   1be34: a94757f6     	ldp	x22, x21, [sp, #0x70]
   1be38: a9465ff8     	ldp	x24, x23, [sp, #0x60]
   1be3c: f9402bf9     	ldr	x25, [sp, #0x50]
   1be40: 910283ff     	add	sp, sp, #0xa0
   1be44: d65f03c0     	ret
   1be48: 97ffdfaa     	bl	0x13cf0 <__stack_chk_fail@plt>
