
evidence/android-arm64/libCxAudioHidLib.so:	file format elf64-littleaarch64

Disassembly of section .text:

0000000000014740 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)>:
   14740: a9ba6ffc     	stp	x28, x27, [sp, #-0x60]!
   14744: a90167fa     	stp	x26, x25, [sp, #0x10]
   14748: a9025ff8     	stp	x24, x23, [sp, #0x20]
   1474c: a90357f6     	stp	x22, x21, [sp, #0x30]
   14750: a9044ff4     	stp	x20, x19, [sp, #0x40]
   14754: a9057bfd     	stp	x29, x30, [sp, #0x50]
   14758: 910143fd     	add	x29, sp, #0x50
   1475c: d11983ff     	sub	sp, sp, #0x660
   14760: b9007fe3     	str	w3, [sp, #0x7c]
   14764: d53bd053     	mrs	x19, TPIDR_EL0
   14768: f9401668     	ldr	x8, [x19, #0x28]
   1476c: 9104c3e9     	add	x9, sp, #0x130
   14770: 2a0203f9     	mov	w25, w2
   14774: 2a0103f7     	mov	w23, w1
   14778: aa0003f5     	mov	x21, x0
   1477c: 910283ea     	add	x10, sp, #0xa0
   14780: b27e0120     	orr	x0, x9, #0x4
   14784: 5280a402     	mov	w2, #0x520              // =1312
   14788: 2a1f03e1     	mov	w1, wzr
   1478c: 2a0703fb     	mov	w27, w7
   14790: aa0603f4     	mov	x20, x6
   14794: 2a0503fa     	mov	w26, w5
   14798: 2a0403f6     	mov	w22, w4
   1479c: f9000148     	str	x8, [x10]
   147a0: 97fffe6c     	bl	0x14150 <memset@plt>
   147a4: 5280a488     	mov	w8, #0x524              // =1316
   147a8: 91009ffe     	add	x30, sp, #0x27
   147ac: 6f00e400     	movi	v0.2d, #0000000000000000
   147b0: f80ff3df     	stur	xzr, [x30, #0xff]
   147b4: f90093ff     	str	xzr, [sp, #0x120]
   147b8: f80e63ff     	stur	xzr, [sp, #0xe6]
   147bc: f90073ff     	str	xzr, [sp, #0xe0]
   147c0: b90133e8     	str	w8, [sp, #0x130]
   147c4: ad0803e0     	stp	q0, q0, [sp, #0x100]
   147c8: 3d803fe0     	str	q0, [sp, #0xf0]
   147cc: ad0603e0     	stp	q0, q0, [sp, #0xc0]
   147d0: 3d802fe0     	str	q0, [sp, #0xb0]
   147d4: b94442a8     	ldr	w8, [x21, #0x440]
   147d8: 910a42a9     	add	x9, x21, #0x290
   147dc: 7100251f     	cmp	w8, #0x9
   147e0: 9a9f3129     	csel	x9, x9, xzr, lo
   147e4: 7100211f     	cmp	w8, #0x8
   147e8: a908a7f5     	stp	x21, x9, [sp, #0x88]
   147ec: 540000c8     	b.hi	0x14804 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0xc4>
   147f0: f9400528     	ldr	x8, [x9, #0x8]
   147f4: f100011f     	cmp	x8, #0x0
   147f8: 52800168     	mov	w8, #0xb                // =11
   147fc: 1a9f0108     	csel	w8, w8, wzr, eq
   14800: 14000002     	b	0x14808 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0xc8>
   14804: 52800148     	mov	w8, #0xa                // =10
   14808: 7100011f     	cmp	w8, #0x0
   1480c: 7a410ae0     	ccmp	w23, #0x1, #0x0, eq
   14810: 52800169     	mov	w9, #0xb                // =11
   14814: 1a888128     	csel	w8, w9, w8, hi
   14818: f90023f3     	str	x19, [sp, #0x40]
   1481c: 34000068     	cbz	w8, 0x14828 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0xe8>
   14820: aa1f03f5     	mov	x21, xzr
   14824: 14000029     	b	0x148c8 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x188>
   14828: 7100173f     	cmp	w25, #0x5
   1482c: 54000208     	b.hi	0x1486c <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x12c>
   14830: f94047ea     	ldr	x10, [sp, #0x88]
   14834: 52800509     	mov	w9, #0x28               // =40
   14838: 93407f28     	sxtw	x8, w25
   1483c: 710006ff     	cmp	w23, #0x1
   14840: 9b292b29     	smaddl	x9, w25, w9, x10
   14844: 91068135     	add	x21, x9, #0x1a0
   14848: 54000180     	b.eq	0x14878 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x138>
   1484c: 35000217     	cbnz	w23, 0x1488c <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x14c>
   14850: f94047ea     	ldr	x10, [sp, #0x88]
   14854: 52800509     	mov	w9, #0x28               // =40
   14858: 9b092909     	madd	x9, x8, x9, x10
   1485c: 39469129     	ldrb	w9, [x9, #0x1a4]
   14860: 37000169     	tbnz	w9, #0x0, 0x1488c <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x14c>
   14864: 32000fe8     	orr	w8, wzr, #0xf
   14868: 14000018     	b	0x148c8 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x188>
   1486c: aa1f03f5     	mov	x21, xzr
   14870: 321f0be8     	orr	w8, wzr, #0xe
   14874: 14000015     	b	0x148c8 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x188>
   14878: f94047ea     	ldr	x10, [sp, #0x88]
   1487c: 52800509     	mov	w9, #0x28               // =40
   14880: 9b092909     	madd	x9, x8, x9, x10
   14884: 39469129     	ldrb	w9, [x9, #0x1a4]
   14888: 360ffee9     	tbz	w9, #0x1, 0x14864 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x124>
   1488c: f94047ea     	ldr	x10, [sp, #0x88]
   14890: 52800509     	mov	w9, #0x28               // =40
   14894: 9b092909     	madd	x9, x8, x9, x10
   14898: b941a929     	ldr	w9, [x9, #0x1a8]
   1489c: 6b16013f     	cmp	w9, w22
   148a0: 540000e8     	b.hi	0x148bc <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x17c>
   148a4: f94047ea     	ldr	x10, [sp, #0x88]
   148a8: 52800509     	mov	w9, #0x28               // =40
   148ac: 9b092908     	madd	x8, x8, x9, x10
   148b0: b941ad08     	ldr	w8, [x8, #0x1ac]
   148b4: 6b16011f     	cmp	w8, w22
   148b8: 54000062     	b.hs	0x148c4 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x184>
   148bc: 321c03e8     	orr	w8, wzr, #0x10
   148c0: 14000002     	b	0x148c8 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x188>
   148c4: 2a1f03e8     	mov	w8, wzr
   148c8: f9400ba9     	ldr	x9, [x29, #0x10]
   148cc: f9001fe9     	str	x9, [sp, #0x38]
   148d0: 2a1a0109     	orr	w9, w8, w26
   148d4: 7100013f     	cmp	w9, #0x0
   148d8: 32000fe9     	orr	w9, wzr, #0xf
   148dc: 1a880128     	csel	w8, w9, w8, eq
   148e0: 350000e8     	cbnz	w8, 0x148fc <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x1bc>
   148e4: b94016a8     	ldr	w8, [x21, #0x14]
   148e8: 0b1a02c9     	add	w9, w22, w26
   148ec: 51000529     	sub	w9, w9, #0x1
   148f0: 6b08013f     	cmp	w9, w8
   148f4: 1a9f97e8     	cset	w8, hi
   148f8: 531c6d08     	lsl	w8, w8, #4
   148fc: 7100011f     	cmp	w8, #0x0
   14900: 52800229     	mov	w9, #0x11               // =17
   14904: fa400a80     	ccmp	x20, #0x0, #0x0, eq
   14908: 1a880128     	csel	w8, w9, w8, eq
   1490c: 2a1b0109     	orr	w9, w8, w27
   14910: 7100013f     	cmp	w9, #0x0
   14914: 52800249     	mov	w9, #0x12               // =18
   14918: 1a880133     	csel	w19, w9, w8, eq
   1491c: b90037f6     	str	w22, [sp, #0x34]
   14920: 34000413     	cbz	w19, 0x149a0 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x260>
   14924: f9401fe0     	ldr	x0, [sp, #0x38]
   14928: b40001e0     	cbz	x0, 0x14964 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x224>
   1492c: b94037e9     	ldr	w9, [sp, #0x34]
   14930: b94143e8     	ldr	w8, [sp, #0x140]
   14934: 9104c3e1     	add	x1, sp, #0x130
   14938: b9015fe9     	str	w9, [sp, #0x15c]
   1493c: 0b080128     	add	w8, w9, w8
   14940: 51000508     	sub	w8, w8, #0x1
   14944: b90163e8     	str	w8, [sp, #0x160]
   14948: b9400008     	ldr	w8, [x0]
   1494c: b94133e9     	ldr	w9, [sp, #0x130]
   14950: 6b09011f     	cmp	w8, w9
   14954: 9104c3e8     	add	x8, sp, #0x130
   14958: 9a883008     	csel	x8, x0, x8, lo
   1495c: b9400102     	ldr	w2, [x8]
   14960: 97fffde4     	bl	0x140f0 <memcpy@plt>
   14964: f94023e8     	ldr	x8, [sp, #0x40]
   14968: 910283e9     	add	x9, sp, #0xa0
   1496c: f9401508     	ldr	x8, [x8, #0x28]
   14970: f9400129     	ldr	x9, [x9]
   14974: eb09011f     	cmp	x8, x9
   14978: 54002b01     	b.ne	0x14ed8 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x798>
   1497c: 2a1303e0     	mov	w0, w19
   14980: 911983ff     	add	sp, sp, #0x660
   14984: a9457bfd     	ldp	x29, x30, [sp, #0x50]
   14988: a9444ff4     	ldp	x20, x19, [sp, #0x40]
   1498c: a94357f6     	ldp	x22, x21, [sp, #0x30]
   14990: a9425ff8     	ldp	x24, x23, [sp, #0x20]
   14994: a94167fa     	ldp	x26, x25, [sp, #0x10]
   14998: a8c66ffc     	ldp	x28, x27, [sp], #0x60
   1499c: d65f03c0     	ret
   149a0: 6f00e400     	movi	v0.2d, #0000000000000000
   149a4: f80e63ff     	stur	xzr, [sp, #0xe6]
   149a8: f90073ff     	str	xzr, [sp, #0xe0]
   149ac: ad0603e0     	stp	q0, q0, [sp, #0xc0]
   149b0: 3d802fe0     	str	q0, [sp, #0xb0]
   149b4: 394062a8     	ldrb	w8, [x21, #0x18]
   149b8: 6b1b035f     	cmp	w26, w27
   149bc: 1a9b3349     	csel	w9, w26, w27, lo
   149c0: 710002ff     	cmp	w23, #0x0
   149c4: 1a9a013a     	csel	w26, w9, w26, eq
   149c8: 3902c3e8     	strb	w8, [sp, #0xb0]
   149cc: b9013ffa     	str	w26, [sp, #0x13c]
   149d0: 340027da     	cbz	w26, 0x14ec8 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x788>
   149d4: f9404be9     	ldr	x9, [sp, #0x90]
   149d8: b9407feb     	ldr	w11, [sp, #0x7c]
   149dc: 9102c3f6     	add	x22, sp, #0xb0
   149e0: 710006ff     	cmp	w23, #0x1
   149e4: 9100492a     	add	x10, x9, #0x12
   149e8: f9003bea     	str	x10, [sp, #0x70]
   149ec: 91004d2a     	add	x10, x9, #0x13
   149f0: 9104c3e8     	add	x8, sp, #0x130
   149f4: f9002fea     	str	x10, [sp, #0x58]
   149f8: 91004529     	add	x9, x9, #0x11
   149fc: b24002ca     	orr	x10, x22, #0x1
   14a00: f90027e9     	str	x9, [sp, #0x48]
   14a04: 531e7569     	lsl	w9, w11, #2
   14a08: f9002bea     	str	x10, [sp, #0x50]
   14a0c: 1a9f07ea     	cset	w10, ne
   14a10: 721c017f     	tst	w11, #0x10
   14a14: 9100e10b     	add	x11, x8, #0x38
   14a18: f90037eb     	str	x11, [sp, #0x68]
   14a1c: b24006cb     	orr	x11, x22, #0x3
   14a20: 9101f508     	add	x8, x8, #0x7d
   14a24: a90223eb     	stp	x11, x8, [sp, #0x20]
   14a28: 1a9f17e8     	cset	w8, eq
   14a2c: 2a0a0108     	orr	w8, w8, w10
   14a30: b90067e8     	str	w8, [sp, #0x64]
   14a34: b94037e8     	ldr	w8, [sp, #0x34]
   14a38: 121d0929     	and	w9, w9, #0x38
   14a3c: 8b3b429c     	add	x28, x20, w27, uxtw
   14a40: b9001fe9     	str	w9, [sp, #0x1c]
   14a44: 910046c9     	add	x9, x22, #0x11
   14a48: aa1403fb     	mov	x27, x20
   14a4c: b90083ff     	str	wzr, [sp, #0x80]
   14a50: a900d7e9     	stp	x9, x21, [sp, #0x8]
   14a54: b90087e8     	str	w8, [sp, #0x84]
   14a58: f9004ff9     	str	x25, [sp, #0x98]
   14a5c: f9404bec     	ldr	x12, [sp, #0x90]
   14a60: 39406ea9     	ldrb	w9, [x21, #0x1b]
   14a64: 3902c7ff     	strb	wzr, [sp, #0xb1]
   14a68: b9400588     	ldr	w8, [x12, #0x4]
   14a6c: 6b09035f     	cmp	w26, w9
   14a70: 1a9a8138     	csel	w24, w9, w26, hi
   14a74: 12000d09     	and	w9, w8, #0xf
   14a78: 7100053f     	cmp	w9, #0x1
   14a7c: 540000e0     	b.eq	0x14a98 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x358>
   14a80: b94087ed     	ldr	w13, [sp, #0x84]
   14a84: 350002c9     	cbnz	w9, 0x14adc <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x39c>
   14a88: f9402beb     	ldr	x11, [sp, #0x50]
   14a8c: 530831a9     	ubfx	w9, w13, #8, #5
   14a90: 321f03ea     	orr	w10, wzr, #0x2
   14a94: 1400000c     	b	0x14ac4 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x384>
   14a98: 394012a9     	ldrb	w9, [x21, #0x4]
   14a9c: b94087ed     	ldr	w13, [sp, #0x84]
   14aa0: 37100189     	tbnz	w9, #0x2, 0x14ad0 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x390>
   14aa4: 714041bf     	cmp	w13, #0x10, lsl #12     // =0x10000
   14aa8: 54000063     	b.lo	0x14ab4 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x374>
   14aac: 321c03e9     	orr	w9, wzr, #0x10
   14ab0: 3902c7e9     	strb	w9, [sp, #0xb1]
   14ab4: f94013eb     	ldr	x11, [sp, #0x20]
   14ab8: 53087da9     	lsr	w9, w13, #8
   14abc: 321e03ea     	orr	w10, wzr, #0x4
   14ac0: 3902cbf8     	strb	w24, [sp, #0xb2]
   14ac4: 39000169     	strb	w9, [x11]
   14ac8: 12001da9     	and	w9, w13, #0xff
   14acc: 14000003     	b	0x14ad8 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x398>
   14ad0: b9401fe9     	ldr	w9, [sp, #0x1c]
   14ad4: 320003ea     	orr	w10, wzr, #0x1
   14ad8: 382a6ac9     	strb	w9, [x22, x10]
   14adc: 710006ff     	cmp	w23, #0x1
   14ae0: 540000a1     	b.ne	0x14af4 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x3b4>
   14ae4: 39404189     	ldrb	w9, [x12, #0x10]
   14ae8: 3942c7ea     	ldrb	w10, [sp, #0xb1]
   14aec: 2a090149     	orr	w9, w10, w9
   14af0: 3902c7e9     	strb	w9, [sp, #0xb1]
   14af4: f9403be9     	ldr	x9, [sp, #0x70]
   14af8: 34000419     	cbz	w25, 0x14b78 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x438>
   14afc: 71000f3f     	cmp	w25, #0x3
   14b00: 540003a0     	b.eq	0x14b74 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x434>
   14b04: f9402fe9     	ldr	x9, [sp, #0x58]
   14b08: 7100173f     	cmp	w25, #0x5
   14b0c: 54000360     	b.eq	0x14b78 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x438>
   14b10: 710006ff     	cmp	w23, #0x1
   14b14: 540003e1     	b.ne	0x14b90 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x450>
   14b18: f94047f3     	ldr	x19, [sp, #0x88]
   14b1c: 7100071f     	cmp	w24, #0x1
   14b20: 5400016b     	b.lt	0x14b4c <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x40c>
   14b24: 394072aa     	ldrb	w10, [x21, #0x1c]
   14b28: aa1f03e9     	mov	x9, xzr
   14b2c: 8b0a02ca     	add	x10, x22, x10
   14b30: 3840176b     	ldrb	w11, [x27], #0x1
   14b34: 3829694b     	strb	w11, [x10, x9]
   14b38: eb1c037f     	cmp	x27, x28
   14b3c: 91000529     	add	x9, x9, #0x1
   14b40: 9a94337b     	csel	x27, x27, x20, lo
   14b44: 6b18013f     	cmp	w9, w24
   14b48: 54ffff4b     	b.lt	0x14b30 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x3f0>
   14b4c: 36280688     	tbz	w8, #0x5, 0x14c1c <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x4dc>
   14b50: 394072a8     	ldrb	w8, [x21, #0x1c]
   14b54: 8b384108     	add	x8, x8, w24, uxtw
   14b58: 7100091f     	cmp	w8, #0x2
   14b5c: 54000203     	b.lo	0x14b9c <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x45c>
   14b60: d1000509     	sub	x9, x8, #0x1
   14b64: f1007d3f     	cmp	x9, #0x1f
   14b68: 540001e8     	b.hi	0x14ba4 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x464>
   14b6c: 2a1f03eb     	mov	w11, wzr
   14b70: 14000022     	b	0x14bf8 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x4b8>
   14b74: f94027e9     	ldr	x9, [sp, #0x48]
   14b78: 39400129     	ldrb	w9, [x9]
   14b7c: 3942c7ea     	ldrb	w10, [sp, #0xb1]
   14b80: 2a090149     	orr	w9, w10, w9
   14b84: 3902c7e9     	strb	w9, [sp, #0xb1]
   14b88: 710006ff     	cmp	w23, #0x1
   14b8c: 54fffc60     	b.eq	0x14b18 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x3d8>
   14b90: f94047f3     	ldr	x19, [sp, #0x88]
   14b94: 372ffde8     	tbnz	w8, #0x5, 0x14b50 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x410>
   14b98: 14000021     	b	0x14c1c <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x4dc>
   14b9c: 2a1f03eb     	mov	w11, wzr
   14ba0: 1400001e     	b	0x14c18 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x4d8>
   14ba4: 11007d0a     	add	w10, w8, #0x1f
   14ba8: 1200114a     	and	w10, w10, #0x1f
   14bac: cb0a012b     	sub	x11, x9, x10
   14bb0: b400024b     	cbz	x11, 0x14bf8 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x4b8>
   14bb4: f94007ec     	ldr	x12, [sp, #0x8]
   14bb8: 91000569     	add	x9, x11, #0x1
   14bbc: 6f00e400     	movi	v0.2d, #0000000000000000
   14bc0: 6f00e401     	movi	v1.2d, #0000000000000000
   14bc4: ad7f8d82     	ldp	q2, q3, [x12, #-0x10]
   14bc8: d100816b     	sub	x11, x11, #0x20
   14bcc: 9100818c     	add	x12, x12, #0x20
   14bd0: 6e205842     	mvn	v2.16b, v2.16b
   14bd4: 6e205863     	mvn	v3.16b, v3.16b
   14bd8: 4e228400     	add	v0.16b, v0.16b, v2.16b
   14bdc: 4e238421     	add	v1.16b, v1.16b, v3.16b
   14be0: b5ffff2b     	cbnz	x11, 0x14bc4 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x484>
   14be4: 4e208420     	add	v0.16b, v1.16b, v0.16b
   14be8: 4e31b800     	addv	b0, v0.16b
   14bec: 1e26000b     	fmov	w11, s0
   14bf0: 3500006a     	cbnz	w10, 0x14bfc <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x4bc>
   14bf4: 14000009     	b	0x14c18 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x4d8>
   14bf8: 320003e9     	orr	w9, wzr, #0x1
   14bfc: 38696aca     	ldrb	w10, [x22, x9]
   14c00: 12001d6b     	and	w11, w11, #0xff
   14c04: 91000529     	add	x9, x9, #0x1
   14c08: eb08013f     	cmp	x9, x8
   14c0c: 2a2a03ea     	mvn	w10, w10
   14c10: 0b2a016b     	add	w11, w11, w10, uxtb
   14c14: 54ffff4b     	b.lt	0x14bfc <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x4bc>
   14c18: 38286acb     	strb	w11, [x22, x8]
   14c1c: 79407e61     	ldrh	w1, [x19, #0x3e]
   14c20: 9102c3e0     	add	x0, sp, #0xb0
   14c24: 97fffcfb     	bl	0x14010 <_Z33CxAudioHidLibUSBWriteOutputReportPht@plt>
   14c28: 7100001f     	cmp	w0, #0x0
   14c2c: 5400082d     	b.le	0x14d30 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x5f0>
   14c30: b94067e8     	ldr	w8, [sp, #0x64]
   14c34: 370001c8     	tbnz	w8, #0x0, 0x14c6c <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x52c>
   14c38: f9404be8     	ldr	x8, [sp, #0x90]
   14c3c: 39401108     	ldrb	w8, [x8, #0x4]
   14c40: 37200168     	tbnz	w8, #0x4, 0x14c6c <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x52c>
   14c44: f9404be8     	ldr	x8, [sp, #0x90]
   14c48: 3942c7e9     	ldrb	w9, [sp, #0xb1]
   14c4c: 9102c3e0     	add	x0, sp, #0xb0
   14c50: 39404108     	ldrb	w8, [x8, #0x10]
   14c54: 0a280128     	bic	w8, w9, w8
   14c58: 3902c7e8     	strb	w8, [sp, #0xb1]
   14c5c: 79407e61     	ldrh	w1, [x19, #0x3e]
   14c60: 97fffcec     	bl	0x14010 <_Z33CxAudioHidLibUSBWriteOutputReportPht@plt>
   14c64: 7100001f     	cmp	w0, #0x0
   14c68: 5400064d     	b.le	0x14d30 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x5f0>
   14c6c: 340006f7     	cbz	w23, 0x14d48 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x608>
   14c70: f9404be8     	ldr	x8, [sp, #0x90]
   14c74: b9407fe9     	ldr	w9, [sp, #0x7c]
   14c78: b9400508     	ldr	w8, [x8, #0x4]
   14c7c: 2a090108     	orr	w8, w8, w9
   14c80: 37200648     	tbnz	w8, #0x4, 0x14d48 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x608>
   14c84: 2a1f03f3     	mov	w19, wzr
   14c88: b9407fe8     	ldr	w8, [sp, #0x7c]
   14c8c: 36200808     	tbz	w8, #0x4, 0x14d8c <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x64c>
   14c90: 710006ff     	cmp	w23, #0x1
   14c94: 540007c1     	b.ne	0x14d8c <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x64c>
   14c98: 350007b3     	cbnz	w19, 0x14d8c <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x64c>
   14c9c: 34000438     	cbz	w24, 0x14d20 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x5e0>
   14ca0: 394076aa     	ldrb	w10, [x21, #0x1d]
   14ca4: 9103c3ec     	add	x12, sp, #0xf0
   14ca8: 394072ab     	ldrb	w11, [x21, #0x1c]
   14cac: f94017ed     	ldr	x13, [sp, #0x28]
   14cb0: 8b0a018a     	add	x10, x12, x10
   14cb4: b94087ec     	ldr	w12, [sp, #0x84]
   14cb8: aa1f03e8     	mov	x8, xzr
   14cbc: 2a1803e9     	mov	w9, w24
   14cc0: 8b0b02cb     	add	x11, x22, x11
   14cc4: 2a0c03ec     	mov	w12, w12
   14cc8: 3868696e     	ldrb	w14, [x11, x8]
   14ccc: 3868694f     	ldrb	w15, [x10, x8]
   14cd0: 6b0e01ff     	cmp	w15, w14
   14cd4: 1a9f07f0     	cset	w16, ne
   14cd8: 540000e0     	b.eq	0x14cf4 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x5b4>
   14cdc: b94157f1     	ldr	w17, [sp, #0x154]
   14ce0: 11000631     	add	w17, w17, #0x1
   14ce4: b90157f1     	str	w17, [sp, #0x154]
   14ce8: b9414bf1     	ldr	w17, [sp, #0x148]
   14cec: 11000631     	add	w17, w17, #0x1
   14cf0: b9014bf1     	str	w17, [sp, #0x148]
   14cf4: f100ed1f     	cmp	x8, #0x3b
   14cf8: 540000c8     	b.hi	0x14d10 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x5d0>
   14cfc: 0b080191     	add	w17, w12, w8
   14d00: 381ff1ae     	sturb	w14, [x13, #-0x1]
   14d04: 390001af     	strb	w15, [x13]
   14d08: b81fb1b1     	stur	w17, [x13, #-0x5]
   14d0c: b81f71b0     	stur	w16, [x13, #-0x9]
   14d10: 91000508     	add	x8, x8, #0x1
   14d14: eb09011f     	cmp	x8, x9
   14d18: 910031ad     	add	x13, x13, #0xc
   14d1c: 54fffd63     	b.lo	0x14cc8 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x588>
   14d20: 320003e8     	orr	w8, wzr, #0x1
   14d24: b90167e8     	str	w8, [sp, #0x164]
   14d28: 35000353     	cbnz	w19, 0x14d90 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x650>
   14d2c: 14000029     	b	0x14dd0 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x690>
   14d30: f00000a1     	adrp	x1, 0x2b000
   14d34: 320003e0     	orr	w0, wzr, #0x1
   14d38: 910ce821     	add	x1, x1, #0x33a
   14d3c: 97fffc0d     	bl	0x13d70 <_Z10LogMessagejPKc@plt>
   14d40: 52800333     	mov	w19, #0x19              // =25
   14d44: 14000013     	b	0x14d90 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x650>
   14d48: 91009ff9     	add	x25, sp, #0x27
   14d4c: 6f00e400     	movi	v0.2d, #0000000000000000
   14d50: f80ff33f     	stur	xzr, [x25, #0xff]
   14d54: f90093ff     	str	xzr, [sp, #0x120]
   14d58: ad0803e0     	stp	q0, q0, [sp, #0x100]
   14d5c: 3d803fe0     	str	q0, [sp, #0xf0]
   14d60: f9400268     	ldr	x8, [x19]
   14d64: 79407a63     	ldrh	w3, [x19, #0x3c]
   14d68: 394066a1     	ldrb	w1, [x21, #0x19]
   14d6c: 9103c3e2     	add	x2, sp, #0xf0
   14d70: f9414508     	ldr	x8, [x8, #0x288]
   14d74: 9102b3e4     	add	x4, sp, #0xac
   14d78: aa1303e0     	mov	x0, x19
   14d7c: d63f0100     	blr	x8
   14d80: 2a0003f3     	mov	w19, w0
   14d84: b9407fe8     	ldr	w8, [sp, #0x7c]
   14d88: 3727f848     	tbnz	w8, #0x4, 0x14c90 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x550>
   14d8c: 34000233     	cbz	w19, 0x14dd0 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x690>
   14d90: b94083e8     	ldr	w8, [sp, #0x80]
   14d94: 2a1f03f9     	mov	w25, wzr
   14d98: b90153ff     	str	wzr, [sp, #0x150]
   14d9c: b90147fa     	str	w26, [sp, #0x144]
   14da0: b90143e8     	str	w8, [sp, #0x140]
   14da4: f9404fe8     	ldr	x8, [sp, #0x98]
   14da8: b90137f7     	str	w23, [sp, #0x134]
   14dac: b9013be8     	str	w8, [sp, #0x138]
   14db0: 340005f7     	cbz	w23, 0x14e6c <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x72c>
   14db4: 710006ff     	cmp	w23, #0x1
   14db8: 54000321     	b.ne	0x14e1c <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x6dc>
   14dbc: 394072a8     	ldrb	w8, [x21, #0x1c]
   14dc0: 2a1803e9     	mov	w9, w24
   14dc4: 7100f31f     	cmp	w24, #0x3c
   14dc8: 8b0802c1     	add	x1, x22, x8
   14dcc: 1400002d     	b	0x14e80 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x740>
   14dd0: 295023e9     	ldp	w9, w8, [sp, #0x80]
   14dd4: 4b18035a     	sub	w26, w26, w24
   14dd8: b9015fe8     	str	w8, [sp, #0x15c]
   14ddc: 0b080308     	add	w8, w24, w8
   14de0: 0b090309     	add	w9, w24, w9
   14de4: 291023e9     	stp	w9, w8, [sp, #0x80]
   14de8: 51000508     	sub	w8, w8, #0x1
   14dec: b90163e8     	str	w8, [sp, #0x160]
   14df0: 340001b7     	cbz	w23, 0x14e24 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x6e4>
   14df4: f9404fe8     	ldr	x8, [sp, #0x98]
   14df8: 2a1f03f3     	mov	w19, wzr
   14dfc: 320003f9     	orr	w25, wzr, #0x1
   14e00: b90153f8     	str	w24, [sp, #0x150]
   14e04: b90147fa     	str	w26, [sp, #0x144]
   14e08: b90143e9     	str	w9, [sp, #0x140]
   14e0c: b90137f7     	str	w23, [sp, #0x134]
   14e10: b9013be8     	str	w8, [sp, #0x138]
   14e14: 710006ff     	cmp	w23, #0x1
   14e18: 54fffd20     	b.eq	0x14dbc <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x67c>
   14e1c: 350003d9     	cbnz	w25, 0x14e94 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x754>
   14e20: 14000026     	b	0x14eb8 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x778>
   14e24: 394076a8     	ldrb	w8, [x21, #0x1d]
   14e28: 9103c3ea     	add	x10, sp, #0xf0
   14e2c: 2a1803f9     	mov	w25, w24
   14e30: aa1b03e0     	mov	x0, x27
   14e34: 8b080141     	add	x1, x10, x8
   14e38: aa1903e2     	mov	x2, x25
   14e3c: 2a0903f5     	mov	w21, w9
   14e40: 97fffcac     	bl	0x140f0 <memcpy@plt>
   14e44: b90143f5     	str	w21, [sp, #0x140]
   14e48: f9400bf5     	ldr	x21, [sp, #0x10]
   14e4c: f9404fe8     	ldr	x8, [sp, #0x98]
   14e50: 2a1f03f3     	mov	w19, wzr
   14e54: 8b19037b     	add	x27, x27, x25
   14e58: 320003f9     	orr	w25, wzr, #0x1
   14e5c: b90153f8     	str	w24, [sp, #0x150]
   14e60: b90147fa     	str	w26, [sp, #0x144]
   14e64: b90137f7     	str	w23, [sp, #0x134]
   14e68: b9013be8     	str	w8, [sp, #0x138]
   14e6c: 394076a8     	ldrb	w8, [x21, #0x1d]
   14e70: 9103c3ea     	add	x10, sp, #0xf0
   14e74: 2a1803e9     	mov	w9, w24
   14e78: 7100f31f     	cmp	w24, #0x3c
   14e7c: 8b080141     	add	x1, x10, x8
   14e80: f94037e0     	ldr	x0, [sp, #0x68]
   14e84: 321e0fe8     	orr	w8, wzr, #0x3c
   14e88: 9a883122     	csel	x2, x9, x8, lo
   14e8c: 97fffc99     	bl	0x140f0 <memcpy@plt>
   14e90: 36000159     	tbz	w25, #0x0, 0x14eb8 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x778>
   14e94: f94047e9     	ldr	x9, [sp, #0x88]
   14e98: f941bd28     	ldr	x8, [x9, #0x378]
   14e9c: b40000e8     	cbz	x8, 0x14eb8 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x778>
   14ea0: f941c120     	ldr	x0, [x9, #0x380]
   14ea4: b94083e1     	ldr	w1, [sp, #0x80]
   14ea8: 9104c3e2     	add	x2, sp, #0x130
   14eac: d63f0100     	blr	x8
   14eb0: 7100001f     	cmp	w0, #0x0
   14eb4: 1a9f0673     	csinc	w19, w19, wzr, eq
   14eb8: 35ffd373     	cbnz	w19, 0x14924 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x1e4>
   14ebc: f9404ff9     	ldr	x25, [sp, #0x98]
   14ec0: 35ffdcfa     	cbnz	w26, 0x14a5c <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x31c>
   14ec4: 17fffe98     	b	0x14924 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x1e4>
   14ec8: 2a1f03f3     	mov	w19, wzr
   14ecc: f9401fe0     	ldr	x0, [sp, #0x38]
   14ed0: b5ffd2e0     	cbnz	x0, 0x1492c <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x1ec>
   14ed4: 17fffea4     	b	0x14964 <CxAudioHidDevice::MemoryOperation(_CXHID_OPERATION, _CXHID_AUDIO_MEMTYPE, unsigned int, unsigned int, unsigned int, unsigned char*, unsigned int, _MEMOP_FEEDBACK*)+0x224>
   14ed8: 97fffb86     	bl	0x13cf0 <__stack_chk_fail@plt>
