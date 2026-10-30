
evidence/android-arm64/libCxAudioHidLib.so:	file format elf64-littleaarch64

Disassembly of section .text:

000000000001f140 <GenerateCombinedSfsInfo(sfs_header_u*, sfs_header_combined_s*)>:
   1f140: a9be4ff4     	stp	x20, x19, [sp, #-0x20]!
   1f144: a9017bfd     	stp	x29, x30, [sp, #0x10]
   1f148: 910043fd     	add	x29, sp, #0x10
   1f14c: aa0103f3     	mov	x19, x1
   1f150: aa0003f4     	mov	x20, x0
   1f154: 321e07e0     	orr	w0, wzr, #0xc
   1f158: b4000874     	cbz	x20, 0x1f264 <GenerateCombinedSfsInfo(sfs_header_u*, sfs_header_combined_s*)+0x124>
   1f15c: b4000853     	cbz	x19, 0x1f264 <GenerateCombinedSfsInfo(sfs_header_u*, sfs_header_combined_s*)+0x124>
   1f160: b9001a7f     	str	wzr, [x19, #0x18]
   1f164: a900fe7f     	stp	xzr, xzr, [x19, #0x8]
   1f168: f900027f     	str	xzr, [x19]
   1f16c: b9400288     	ldr	w8, [x20]
   1f170: 5288ca69     	mov	w9, #0x4653             // =18003
   1f174: 72a8aa69     	movk	w9, #0x4553, lsl #16
   1f178: 6b09011f     	cmp	w8, w9
   1f17c: 54000721     	b.ne	0x1f260 <GenerateCombinedSfsInfo(sfs_header_u*, sfs_header_combined_s*)+0x120>
   1f180: b9401e88     	ldr	w8, [x20, #0x1c]
   1f184: 3100051f     	cmn	w8, #0x1
   1f188: 540003c0     	b.eq	0x1f200 <GenerateCombinedSfsInfo(sfs_header_u*, sfs_header_combined_s*)+0xc0>
   1f18c: b9402288     	ldr	w8, [x20, #0x20]
   1f190: 3100051f     	cmn	w8, #0x1
   1f194: 54000360     	b.eq	0x1f200 <GenerateCombinedSfsInfo(sfs_header_u*, sfs_header_combined_s*)+0xc0>
   1f198: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f19c: 91218c21     	add	x1, x1, #0x863
   1f1a0: 321a03e0     	orr	w0, wzr, #0x40
   1f1a4: 97ffd2f3     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   1f1a8: b26003e8     	orr	x8, xzr, #0x100000000
   1f1ac: f8004268     	stur	x8, [x19, #0x4]
   1f1b0: b9401e88     	ldr	w8, [x20, #0x1c]
   1f1b4: 2a1f03e0     	mov	w0, wzr
   1f1b8: b9000268     	str	w8, [x19]
   1f1bc: 79401a88     	ldrh	w8, [x20, #0xc]
   1f1c0: 79001a68     	strh	w8, [x19, #0xc]
   1f1c4: 79401e88     	ldrh	w8, [x20, #0xe]
   1f1c8: 79001e68     	strh	w8, [x19, #0xe]
   1f1cc: 79402288     	ldrh	w8, [x20, #0x10]
   1f1d0: 79002268     	strh	w8, [x19, #0x10]
   1f1d4: 79402688     	ldrh	w8, [x20, #0x12]
   1f1d8: 79002668     	strh	w8, [x19, #0x12]
   1f1dc: 79402a88     	ldrh	w8, [x20, #0x14]
   1f1e0: 79002a68     	strh	w8, [x19, #0x14]
   1f1e4: 79402e88     	ldrh	w8, [x20, #0x16]
   1f1e8: 79002e68     	strh	w8, [x19, #0x16]
   1f1ec: 79403288     	ldrh	w8, [x20, #0x18]
   1f1f0: 79003268     	strh	w8, [x19, #0x18]
   1f1f4: 79403688     	ldrh	w8, [x20, #0x1a]
   1f1f8: 79003668     	strh	w8, [x19, #0x1a]
   1f1fc: 1400001a     	b	0x1f264 <GenerateCombinedSfsInfo(sfs_header_u*, sfs_header_combined_s*)+0x124>
   1f200: b9401288     	ldr	w8, [x20, #0x10]
   1f204: 3100051f     	cmn	w8, #0x1
   1f208: 540002c0     	b.eq	0x1f260 <GenerateCombinedSfsInfo(sfs_header_u*, sfs_header_combined_s*)+0x120>
   1f20c: b9401688     	ldr	w8, [x20, #0x14]
   1f210: 3100051f     	cmn	w8, #0x1
   1f214: 54000260     	b.eq	0x1f260 <GenerateCombinedSfsInfo(sfs_header_u*, sfs_header_combined_s*)+0x120>
   1f218: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1f21c: 9121fc21     	add	x1, x1, #0x87f
   1f220: 321a03e0     	orr	w0, wzr, #0x40
   1f224: 97ffd2d3     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   1f228: 320003e8     	orr	w8, wzr, #0x1
   1f22c: f8004268     	stur	x8, [x19, #0x4]
   1f230: b9401288     	ldr	w8, [x20, #0x10]
   1f234: 2a1f03e0     	mov	w0, wzr
   1f238: b9000268     	str	w8, [x19]
   1f23c: 79401a88     	ldrh	w8, [x20, #0xc]
   1f240: 79001a68     	strh	w8, [x19, #0xc]
   1f244: 79401688     	ldrh	w8, [x20, #0xa]
   1f248: 79001e68     	strh	w8, [x19, #0xe]
   1f24c: 79403288     	ldrh	w8, [x20, #0x18]
   1f250: 79002268     	strh	w8, [x19, #0x10]
   1f254: 79403688     	ldrh	w8, [x20, #0x1a]
   1f258: 79002668     	strh	w8, [x19, #0x12]
   1f25c: 14000002     	b	0x1f264 <GenerateCombinedSfsInfo(sfs_header_u*, sfs_header_combined_s*)+0x124>
   1f260: 52800620     	mov	w0, #0x31               // =49
   1f264: a9417bfd     	ldp	x29, x30, [sp, #0x10]
   1f268: a8c24ff4     	ldp	x20, x19, [sp], #0x20
   1f26c: d65f03c0     	ret
