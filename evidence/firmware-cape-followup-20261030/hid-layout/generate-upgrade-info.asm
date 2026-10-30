
evidence/android-arm64/libCxAudioHidLib.so:	file format elf64-littleaarch64

Disassembly of section .text:

000000000001fc84 <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)>:
   1fc84: d101c3ff     	sub	sp, sp, #0x70
   1fc88: a9016ffc     	stp	x28, x27, [sp, #0x10]
   1fc8c: a90267fa     	stp	x26, x25, [sp, #0x20]
   1fc90: a9035ff8     	stp	x24, x23, [sp, #0x30]
   1fc94: a90457f6     	stp	x22, x21, [sp, #0x40]
   1fc98: a9054ff4     	stp	x20, x19, [sp, #0x50]
   1fc9c: a9067bfd     	stp	x29, x30, [sp, #0x60]
   1fca0: 910183fd     	add	x29, sp, #0x60
   1fca4: aa0303f3     	mov	x19, x3
   1fca8: aa0203f7     	mov	x23, x2
   1fcac: aa0103f6     	mov	x22, x1
   1fcb0: 2a0003f4     	mov	w20, w0
   1fcb4: 2a1f03f8     	mov	w24, wzr
   1fcb8: b4000416     	cbz	x22, 0x1fd38 <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0xb4>
   1fcbc: b40003f7     	cbz	x23, 0x1fd38 <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0xb4>
   1fcc0: b94006c8     	ldr	w8, [x22, #0x4]
   1fcc4: 12bfffa9     	mov	w9, #0x2ffff            // =196607
   1fcc8: 7140c11f     	cmp	w8, #0x30, lsl #12      // =0x30000
   1fccc: 54000063     	b.lo	0x1fcd8 <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0x54>
   1fcd0: b9400ec8     	ldr	w8, [x22, #0xc]
   1fcd4: 14000002     	b	0x1fcdc <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0x58>
   1fcd8: 2a1f03e8     	mov	w8, wzr
   1fcdc: b94002ea     	ldr	w10, [x23]
   1fce0: 6b09015f     	cmp	w10, w9
   1fce4: 54000069     	b.ls	0x1fcf0 <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0x6c>
   1fce8: b9400ae9     	ldr	w9, [x23, #0x8]
   1fcec: 14000002     	b	0x1fcf4 <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0x70>
   1fcf0: 2a1f03e9     	mov	w9, wzr
   1fcf4: 7100091f     	cmp	w8, #0x2
   1fcf8: 2a1f03f8     	mov	w24, wzr
   1fcfc: 540001e8     	b.hi	0x1fd38 <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0xb4>
   1fd00: 7100093f     	cmp	w9, #0x2
   1fd04: 540001a8     	b.hi	0x1fd38 <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0xb4>
   1fd08: d000006a     	adrp	x10, 0x2d000 <AllHidDevProperties+0x1bf0>
   1fd0c: 9133514a     	add	x10, x10, #0xcd4
   1fd10: 321e07eb     	orr	w11, wzr, #0xc
   1fd14: 9b2b2908     	smaddl	x8, w8, w11, x10
   1fd18: b869d918     	ldr	w24, [x8, w9, sxtw #2]
   1fd1c: 7100271f     	cmp	w24, #0x9
   1fd20: 540000c1     	b.ne	0x1fd38 <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0xb4>
   1fd24: 794022c8     	ldrh	w8, [x22, #0x10]
   1fd28: 79401ae9     	ldrh	w9, [x23, #0xc]
   1fd2c: 6b09011f     	cmp	w8, w9
   1fd30: 52800128     	mov	w8, #0x9                // =9
   1fd34: 1a880518     	cinc	w24, w8, ne
   1fd38: 7100031f     	cmp	w24, #0x0
   1fd3c: 52800648     	mov	w8, #0x32               // =50
   1fd40: 1a9f0100     	csel	w0, w8, wzr, eq
   1fd44: b4002257     	cbz	x23, 0x2018c <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0x508>
   1fd48: b4002236     	cbz	x22, 0x2018c <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0x508>
   1fd4c: b4002213     	cbz	x19, 0x2018c <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0x508>
   1fd50: 340021f8     	cbz	w24, 0x2018c <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0x508>
   1fd54: b9000fe0     	str	w0, [sp, #0xc]
   1fd58: 3942fa6d     	ldrb	w13, [x19, #0xbe]
   1fd5c: 721f029f     	tst	w20, #0x2
   1fd60: 52802208     	mov	w8, #0x110              // =272
   1fd64: d0000061     	adrp	x1, 0x2d000 <AllHidDevProperties+0x1bf0>
   1fd68: 321807e9     	orr	w9, wzr, #0x300
   1fd6c: 5280820a     	mov	w10, #0x410             // =1040
   1fd70: 5280420b     	mov	w11, #0x210             // =528
   1fd74: 5280620c     	mov	w12, #0x310             // =784
   1fd78: 1a9f111a     	csel	w26, w8, wzr, ne
   1fd7c: 7200029f     	tst	w20, #0x1
   1fd80: 121f19a8     	and	w8, w13, #0xfe
   1fd84: 9132bc21     	add	x1, x1, #0xcaf
   1fd88: 321c03e0     	orr	w0, wzr, #0x10
   1fd8c: 2a1803e2     	mov	w2, w24
   1fd90: 29007e78     	stp	w24, wzr, [x19]
   1fd94: 1a9f1139     	csel	w25, w9, wzr, ne
   1fd98: 1a9f1155     	csel	w21, w10, wzr, ne
   1fd9c: 1a9f117c     	csel	w28, w11, wzr, ne
   1fda0: 1a9f119b     	csel	w27, w12, wzr, ne
   1fda4: 3902fa68     	strb	w8, [x19, #0xbe]
   1fda8: 79017a7f     	strh	wzr, [x19, #0xbc]
   1fdac: 97ffd0dd     	bl	0x14120 <_Z12LogNumberIntjPKci@plt>
   1fdb0: 51000709     	sub	w9, w24, #0x1
   1fdb4: 7100253f     	cmp	w9, #0x9
   1fdb8: 54001dc8     	b.hi	0x20170 <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0x4ec>
   1fdbc: d000006a     	adrp	x10, 0x2d000 <AllHidDevProperties+0x1bf0>
   1fdc0: 911f914a     	add	x10, x10, #0x7e4
   1fdc4: b8a9794d     	ldrsw	x13, [x10, x9, lsl #2]
   1fdc8: 12000288     	and	w8, w20, #0x1
   1fdcc: 121f028c     	and	w12, w20, #0x2
   1fdd0: 53165509     	lsl	w9, w8, #10
   1fdd4: 8b0a01ad     	add	x13, x13, x10
   1fdd8: 5317590b     	lsl	w11, w8, #9
   1fddc: 5319618a     	lsl	w10, w12, #7
   1fde0: d61f01a0     	br	x13
   1fde4: b980066a     	ldrsw	x10, [x19, #0x4]
   1fde8: 7100011f     	cmp	w8, #0x0
   1fdec: 52804408     	mov	w8, #0x220              // =544
   1fdf0: 1a9f1108     	csel	w8, w8, wzr, ne
   1fdf4: 7100019f     	cmp	w12, #0x0
   1fdf8: 5280240b     	mov	w11, #0x120             // =288
   1fdfc: 1a9f116b     	csel	w11, w11, wzr, ne
   1fe00: 8b0a0a6a     	add	x10, x19, x10, lsl #2
   1fe04: 29012149     	stp	w9, w8, [x10, #0x8]
   1fe08: 2902654b     	stp	w11, w25, [x10, #0x10]
   1fe0c: b9400668     	ldr	w8, [x19, #0x4]
   1fe10: b9805a69     	ldrsw	x9, [x19, #0x58]
   1fe14: 321e07ea     	orr	w10, wzr, #0xc
   1fe18: 9101726b     	add	x11, x19, #0x5c
   1fe1c: 11001108     	add	w8, w8, #0x4
   1fe20: 9b0a7d29     	mul	x9, x9, x10
   1fe24: b9000668     	str	w8, [x19, #0x4]
   1fe28: 7829697f     	strh	wzr, [x11, x9]
   1fe2c: 7940e2c8     	ldrh	w8, [x22, #0x70]
   1fe30: b9805a69     	ldrsw	x9, [x19, #0x58]
   1fe34: 11000508     	add	w8, w8, #0x1
   1fe38: 9b0a2d29     	madd	x9, x9, x10, x11
   1fe3c: 79000528     	strh	w8, [x9, #0x2]
   1fe40: b9805a68     	ldrsw	x8, [x19, #0x58]
   1fe44: d503201f     	nop
   1fe48: 9b0a2d08     	madd	x8, x8, x10, x11
   1fe4c: 7900091f     	strh	wzr, [x8, #0x4]
   1fe50: 7940e2c8     	ldrh	w8, [x22, #0x70]
   1fe54: b9805a69     	ldrsw	x9, [x19, #0x58]
   1fe58: 11000508     	add	w8, w8, #0x1
   1fe5c: 9b0a2d29     	madd	x9, x9, x10, x11
   1fe60: 79000d28     	strh	w8, [x9, #0x6]
   1fe64: b9405a69     	ldr	w9, [x19, #0x58]
   1fe68: 79417a6a     	ldrh	w10, [x19, #0xbc]
   1fe6c: 11000529     	add	w9, w9, #0x1
   1fe70: 0b080148     	add	w8, w10, w8
   1fe74: b9005a69     	str	w9, [x19, #0x58]
   1fe78: 79017a68     	strh	w8, [x19, #0xbc]
   1fe7c: 140000bd     	b	0x20170 <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0x4ec>
   1fe80: b9800668     	ldrsw	x8, [x19, #0x4]
   1fe84: 8b080a68     	add	x8, x19, x8, lsl #2
   1fe88: 29012d09     	stp	w9, w11, [x8, #0x8]
   1fe8c: 2902650a     	stp	w10, w25, [x8, #0x10]
   1fe90: b9400668     	ldr	w8, [x19, #0x4]
   1fe94: b9805a69     	ldrsw	x9, [x19, #0x58]
   1fe98: 321e07ea     	orr	w10, wzr, #0xc
   1fe9c: 9101726b     	add	x11, x19, #0x5c
   1fea0: 11001108     	add	w8, w8, #0x4
   1fea4: 9b0a7d29     	mul	x9, x9, x10
   1fea8: b9000668     	str	w8, [x19, #0x4]
   1feac: 7829697f     	strh	wzr, [x11, x9]
   1feb0: 7940dac8     	ldrh	w8, [x22, #0x6c]
   1feb4: b9805a69     	ldrsw	x9, [x19, #0x58]
   1feb8: 11000508     	add	w8, w8, #0x1
   1febc: 9b0a2d29     	madd	x9, x9, x10, x11
   1fec0: 79000528     	strh	w8, [x9, #0x2]
   1fec4: b9805a68     	ldrsw	x8, [x19, #0x58]
   1fec8: d503201f     	nop
   1fecc: 9b0a2d08     	madd	x8, x8, x10, x11
   1fed0: 7900091f     	strh	wzr, [x8, #0x4]
   1fed4: 7940dac8     	ldrh	w8, [x22, #0x6c]
   1fed8: b9805a69     	ldrsw	x9, [x19, #0x58]
   1fedc: 11000508     	add	w8, w8, #0x1
   1fee0: 9b0a2d29     	madd	x9, x9, x10, x11
   1fee4: 79000d28     	strh	w8, [x9, #0x6]
   1fee8: b9805a69     	ldrsw	x9, [x19, #0x58]
   1feec: 79417a6c     	ldrh	w12, [x19, #0xbc]
   1fef0: 91000529     	add	x9, x9, #0x1
   1fef4: 0b080188     	add	w8, w12, w8
   1fef8: b9005a69     	str	w9, [x19, #0x58]
   1fefc: 79017a68     	strh	w8, [x19, #0xbc]
   1ff00: 9b0a7d28     	mul	x8, x9, x10
   1ff04: 7940e2c9     	ldrh	w9, [x22, #0x70]
   1ff08: b9400ecc     	ldr	w12, [x22, #0xc]
   1ff0c: 794022cd     	ldrh	w13, [x22, #0x10]
   1ff10: 7941f6ce     	ldrh	w14, [x22, #0xfa]
   1ff14: 78286969     	strh	w9, [x11, x8]
   1ff18: b9805a68     	ldrsw	x8, [x19, #0x58]
   1ff1c: 320003e9     	orr	w9, wzr, #0x1
   1ff20: 1b0d398c     	madd	w12, w12, w13, w14
   1ff24: 1100098c     	add	w12, w12, #0x2
   1ff28: 9b0a2d08     	madd	x8, x8, x10, x11
   1ff2c: 79000509     	strh	w9, [x8, #0x2]
   1ff30: b9805a68     	ldrsw	x8, [x19, #0x58]
   1ff34: d503201f     	nop
   1ff38: 9b0a2d08     	madd	x8, x8, x10, x11
   1ff3c: 7900090c     	strh	w12, [x8, #0x4]
   1ff40: b9805a68     	ldrsw	x8, [x19, #0x58]
   1ff44: d503201f     	nop
   1ff48: 9b0a2d08     	madd	x8, x8, x10, x11
   1ff4c: 14000082     	b	0x20154 <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0x4d0>
   1ff50: b9800668     	ldrsw	x8, [x19, #0x4]
   1ff54: 9100226c     	add	x12, x19, #0x8
   1ff58: 8b080988     	add	x8, x12, x8, lsl #2
   1ff5c: 29007115     	stp	w21, w28, [x8]
   1ff60: 29016d1a     	stp	w26, w27, [x8, #0x8]
   1ff64: b940066d     	ldr	w13, [x19, #0x4]
   1ff68: 321e07e8     	orr	w8, wzr, #0xc
   1ff6c: 110011ad     	add	w13, w13, #0x4
   1ff70: 8b2dc98c     	add	x12, x12, w13, sxtw #2
   1ff74: b900066d     	str	w13, [x19, #0x4]
   1ff78: 29002d89     	stp	w9, w11, [x12]
   1ff7c: 2901658a     	stp	w10, w25, [x12, #0x8]
   1ff80: b940066b     	ldr	w11, [x19, #0x4]
   1ff84: b9805a6c     	ldrsw	x12, [x19, #0x58]
   1ff88: 9101726a     	add	x10, x19, #0x5c
   1ff8c: 320003e9     	orr	w9, wzr, #0x1
   1ff90: 1100116b     	add	w11, w11, #0x4
   1ff94: 9b087d8c     	mul	x12, x12, x8
   1ff98: b900066b     	str	w11, [x19, #0x4]
   1ff9c: 782c6949     	strh	w9, [x10, x12]
   1ffa0: b9805a6b     	ldrsw	x11, [x19, #0x58]
   1ffa4: d503201f     	nop
   1ffa8: 9b08296b     	madd	x11, x11, x8, x10
   1ffac: 79000569     	strh	w9, [x11, #0x2]
   1ffb0: b9805a6b     	ldrsw	x11, [x19, #0x58]
   1ffb4: d503201f     	nop
   1ffb8: 9b08296b     	madd	x11, x11, x8, x10
   1ffbc: 79001169     	strh	w9, [x11, #0x8]
   1ffc0: b9805a6b     	ldrsw	x11, [x19, #0x58]
   1ffc4: d503201f     	nop
   1ffc8: 9b08296b     	madd	x11, x11, x8, x10
   1ffcc: 79001569     	strh	w9, [x11, #0xa]
   1ffd0: b9805a6b     	ldrsw	x11, [x19, #0x58]
   1ffd4: 79417a6c     	ldrh	w12, [x19, #0xbc]
   1ffd8: 9100056b     	add	x11, x11, #0x1
   1ffdc: 1100058c     	add	w12, w12, #0x1
   1ffe0: b9005a6b     	str	w11, [x19, #0x58]
   1ffe4: 79017a6c     	strh	w12, [x19, #0xbc]
   1ffe8: 7940d2cc     	ldrh	w12, [x22, #0x68]
   1ffec: 9b087d6b     	mul	x11, x11, x8
   1fff0: 782b694c     	strh	w12, [x10, x11]
   1fff4: 7940dacb     	ldrh	w11, [x22, #0x6c]
   1fff8: b9805a6d     	ldrsw	x13, [x19, #0x58]
   1fffc: 1100056b     	add	w11, w11, #0x1
   20000: 9b0829ad     	madd	x13, x13, x8, x10
   20004: 4b0c016b     	sub	w11, w11, w12
   20008: 790005ab     	strh	w11, [x13, #0x2]
   2000c: b9805a6b     	ldrsw	x11, [x19, #0x58]
   20010: 79419acc     	ldrh	w12, [x22, #0xcc]
   20014: d503201f     	nop
   20018: 9b08296b     	madd	x11, x11, x8, x10
   2001c: 7900116c     	strh	w12, [x11, #0x8]
   20020: 7940dacb     	ldrh	w11, [x22, #0x6c]
   20024: b9805a6c     	ldrsw	x12, [x19, #0x58]
   20028: 7940d2cd     	ldrh	w13, [x22, #0x68]
   2002c: 1100056b     	add	w11, w11, #0x1
   20030: 9b08298c     	madd	x12, x12, x8, x10
   20034: 4b0d016b     	sub	w11, w11, w13
   20038: 7900158b     	strh	w11, [x12, #0xa]
   2003c: b9805a6c     	ldrsw	x12, [x19, #0x58]
   20040: 79417a6d     	ldrh	w13, [x19, #0xbc]
   20044: 9100058c     	add	x12, x12, #0x1
   20048: 0b0d016b     	add	w11, w11, w13
   2004c: 79017a6b     	strh	w11, [x19, #0xbc]
   20050: 9b087d8b     	mul	x11, x12, x8
   20054: b9005a6c     	str	w12, [x19, #0x58]
   20058: 782b695f     	strh	wzr, [x10, x11]
   2005c: b9805a6b     	ldrsw	x11, [x19, #0x58]
   20060: d503201f     	nop
   20064: 9b08296b     	madd	x11, x11, x8, x10
   20068: 79000569     	strh	w9, [x11, #0x2]
   2006c: b9805a6b     	ldrsw	x11, [x19, #0x58]
   20070: d503201f     	nop
   20074: 9b08296b     	madd	x11, x11, x8, x10
   20078: 7900097f     	strh	wzr, [x11, #0x4]
   2007c: b9805a6b     	ldrsw	x11, [x19, #0x58]
   20080: d503201f     	nop
   20084: 9b08296b     	madd	x11, x11, x8, x10
   20088: 79000d69     	strh	w9, [x11, #0x6]
   2008c: b9805a6b     	ldrsw	x11, [x19, #0x58]
   20090: 79417a6c     	ldrh	w12, [x19, #0xbc]
   20094: 9100056b     	add	x11, x11, #0x1
   20098: 1100058c     	add	w12, w12, #0x1
   2009c: b9005a6b     	str	w11, [x19, #0x58]
   200a0: 79017a6c     	strh	w12, [x19, #0xbc]
   200a4: 7940d2cc     	ldrh	w12, [x22, #0x68]
   200a8: 9b087d6b     	mul	x11, x11, x8
   200ac: 782b694c     	strh	w12, [x10, x11]
   200b0: 7940dacb     	ldrh	w11, [x22, #0x6c]
   200b4: b9805a6d     	ldrsw	x13, [x19, #0x58]
   200b8: 1100056b     	add	w11, w11, #0x1
   200bc: 9b0829ad     	madd	x13, x13, x8, x10
   200c0: 4b0c016b     	sub	w11, w11, w12
   200c4: 790005ab     	strh	w11, [x13, #0x2]
   200c8: b9805a6b     	ldrsw	x11, [x19, #0x58]
   200cc: d503201f     	nop
   200d0: 9b08296b     	madd	x11, x11, x8, x10
   200d4: 7900096c     	strh	w12, [x11, #0x4]
   200d8: 7940dacb     	ldrh	w11, [x22, #0x6c]
   200dc: b9805a6c     	ldrsw	x12, [x19, #0x58]
   200e0: 7940d2cd     	ldrh	w13, [x22, #0x68]
   200e4: 1100056b     	add	w11, w11, #0x1
   200e8: 9b08298c     	madd	x12, x12, x8, x10
   200ec: 4b0d016b     	sub	w11, w11, w13
   200f0: 79000d8b     	strh	w11, [x12, #0x6]
   200f4: b9805a6c     	ldrsw	x12, [x19, #0x58]
   200f8: 79417a6d     	ldrh	w13, [x19, #0xbc]
   200fc: 9100058c     	add	x12, x12, #0x1
   20100: 0b0d016b     	add	w11, w11, w13
   20104: b9005a6c     	str	w12, [x19, #0x58]
   20108: 79017a6b     	strh	w11, [x19, #0xbc]
   2010c: 9b087d8b     	mul	x11, x12, x8
   20110: 7940e2cc     	ldrh	w12, [x22, #0x70]
   20114: b9400ecd     	ldr	w13, [x22, #0xc]
   20118: 794022ce     	ldrh	w14, [x22, #0x10]
   2011c: 7941f6cf     	ldrh	w15, [x22, #0xfa]
   20120: 782b694c     	strh	w12, [x10, x11]
   20124: b9805a6b     	ldrsw	x11, [x19, #0x58]
   20128: 1b0e3dac     	madd	w12, w13, w14, w15
   2012c: 1100098c     	add	w12, w12, #0x2
   20130: 9b08296b     	madd	x11, x11, x8, x10
   20134: 79000569     	strh	w9, [x11, #0x2]
   20138: b9805a6b     	ldrsw	x11, [x19, #0x58]
   2013c: d503201f     	nop
   20140: 9b08296b     	madd	x11, x11, x8, x10
   20144: 7900096c     	strh	w12, [x11, #0x4]
   20148: b9805a6b     	ldrsw	x11, [x19, #0x58]
   2014c: d503201f     	nop
   20150: 9b082968     	madd	x8, x11, x8, x10
   20154: 79000d09     	strh	w9, [x8, #0x6]
   20158: b9405a68     	ldr	w8, [x19, #0x58]
   2015c: 79417a69     	ldrh	w9, [x19, #0xbc]
   20160: 11000508     	add	w8, w8, #0x1
   20164: 11000529     	add	w9, w9, #0x1
   20168: b9005a68     	str	w8, [x19, #0x58]
   2016c: 79017a69     	strh	w9, [x19, #0xbc]
   20170: b9400fe0     	ldr	w0, [sp, #0xc]
   20174: 2a3403e8     	mvn	w8, w20
   20178: 12000508     	and	w8, w8, #0x3
   2017c: 35000088     	cbnz	w8, 0x2018c <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0x508>
   20180: 79417a68     	ldrh	w8, [x19, #0xbc]
   20184: 531f7908     	lsl	w8, w8, #1
   20188: 79017a68     	strh	w8, [x19, #0xbc]
   2018c: a9467bfd     	ldp	x29, x30, [sp, #0x60]
   20190: a9454ff4     	ldp	x20, x19, [sp, #0x50]
   20194: a94457f6     	ldp	x22, x21, [sp, #0x40]
   20198: a9435ff8     	ldp	x24, x23, [sp, #0x30]
   2019c: a94267fa     	ldp	x26, x25, [sp, #0x20]
   201a0: a9416ffc     	ldp	x28, x27, [sp, #0x10]
   201a4: 9101c3ff     	add	sp, sp, #0x70
   201a8: d65f03c0     	ret
   201ac: 34000068     	cbz	w8, 0x201b8 <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0x534>
   201b0: b94012ec     	ldr	w12, [x23, #0x10]
   201b4: 340000ec     	cbz	w12, 0x201d0 <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0x54c>
   201b8: 1200068c     	and	w12, w20, #0x3
   201bc: 7100099f     	cmp	w12, #0x2
   201c0: 54000801     	b.ne	0x202c0 <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0x63c>
   201c4: b94012ed     	ldr	w13, [x23, #0x10]
   201c8: 710005bf     	cmp	w13, #0x1
   201cc: 540007a1     	b.ne	0x202c0 <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0x63c>
   201d0: b9800669     	ldrsw	x9, [x19, #0x4]
   201d4: 8b090a69     	add	x9, x19, x9, lsl #2
   201d8: 29017135     	stp	w21, w28, [x9, #0x8]
   201dc: 29026d3a     	stp	w26, w27, [x9, #0x10]
   201e0: b9400669     	ldr	w9, [x19, #0x4]
   201e4: 11001129     	add	w9, w9, #0x4
   201e8: b9000669     	str	w9, [x19, #0x4]
   201ec: 340000e8     	cbz	w8, 0x20208 <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0x584>
   201f0: 8b29ca68     	add	x8, x19, w9, sxtw #2
   201f4: 321603e9     	orr	w9, wzr, #0x400
   201f8: b9000909     	str	w9, [x8, #0x8]
   201fc: b9400668     	ldr	w8, [x19, #0x4]
   20200: 11000508     	add	w8, w8, #0x1
   20204: b9000668     	str	w8, [x19, #0x4]
   20208: b9805a68     	ldrsw	x8, [x19, #0x58]
   2020c: 321e07e9     	orr	w9, wzr, #0xc
   20210: 9101726a     	add	x10, x19, #0x5c
   20214: 320003eb     	orr	w11, wzr, #0x1
   20218: 9b097d08     	mul	x8, x8, x9
   2021c: 7828694b     	strh	w11, [x10, x8]
   20220: b9805a68     	ldrsw	x8, [x19, #0x58]
   20224: d503201f     	nop
   20228: 9b092908     	madd	x8, x8, x9, x10
   2022c: 7900050b     	strh	w11, [x8, #0x2]
   20230: b9805a68     	ldrsw	x8, [x19, #0x58]
   20234: d503201f     	nop
   20238: 9b092908     	madd	x8, x8, x9, x10
   2023c: 7900110b     	strh	w11, [x8, #0x8]
   20240: b9805a68     	ldrsw	x8, [x19, #0x58]
   20244: d503201f     	nop
   20248: 9b092908     	madd	x8, x8, x9, x10
   2024c: 7900150b     	strh	w11, [x8, #0xa]
   20250: b9805a68     	ldrsw	x8, [x19, #0x58]
   20254: 79417a6b     	ldrh	w11, [x19, #0xbc]
   20258: 91000508     	add	x8, x8, #0x1
   2025c: 1100056b     	add	w11, w11, #0x1
   20260: b9005a68     	str	w8, [x19, #0x58]
   20264: 79017a6b     	strh	w11, [x19, #0xbc]
   20268: 7940d2cb     	ldrh	w11, [x22, #0x68]
   2026c: 9b097d08     	mul	x8, x8, x9
   20270: 7828694b     	strh	w11, [x10, x8]
   20274: 7940dac8     	ldrh	w8, [x22, #0x6c]
   20278: b9805a6c     	ldrsw	x12, [x19, #0x58]
   2027c: 11000508     	add	w8, w8, #0x1
   20280: 4b0b0108     	sub	w8, w8, w11
   20284: 9b09298b     	madd	x11, x12, x9, x10
   20288: 79000568     	strh	w8, [x11, #0x2]
   2028c: b9805a68     	ldrsw	x8, [x19, #0x58]
   20290: 79419acb     	ldrh	w11, [x22, #0xcc]
   20294: d503201f     	nop
   20298: 9b092908     	madd	x8, x8, x9, x10
   2029c: 7900110b     	strh	w11, [x8, #0x8]
   202a0: 7940dac8     	ldrh	w8, [x22, #0x6c]
   202a4: b9805a6b     	ldrsw	x11, [x19, #0x58]
   202a8: 7940d2cc     	ldrh	w12, [x22, #0x68]
   202ac: 11000508     	add	w8, w8, #0x1
   202b0: 9b092969     	madd	x9, x11, x9, x10
   202b4: 4b0c0108     	sub	w8, w8, w12
   202b8: 79001528     	strh	w8, [x9, #0xa]
   202bc: 14000043     	b	0x203c8 <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0x744>
   202c0: 34000088     	cbz	w8, 0x202d0 <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0x64c>
   202c4: b94012ed     	ldr	w13, [x23, #0x10]
   202c8: 710005bf     	cmp	w13, #0x1
   202cc: 540000a0     	b.eq	0x202e0 <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0x65c>
   202d0: 7100099f     	cmp	w12, #0x2
   202d4: 54000861     	b.ne	0x203e0 <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0x75c>
   202d8: b94012ec     	ldr	w12, [x23, #0x10]
   202dc: 3500082c     	cbnz	w12, 0x203e0 <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0x75c>
   202e0: b980066c     	ldrsw	x12, [x19, #0x4]
   202e4: 8b0c0a6c     	add	x12, x19, x12, lsl #2
   202e8: 29012d89     	stp	w9, w11, [x12, #0x8]
   202ec: 2902658a     	stp	w10, w25, [x12, #0x10]
   202f0: b9400669     	ldr	w9, [x19, #0x4]
   202f4: 11001129     	add	w9, w9, #0x4
   202f8: b9000669     	str	w9, [x19, #0x4]
   202fc: 340000e8     	cbz	w8, 0x20318 <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0x694>
   20300: 8b29ca68     	add	x8, x19, w9, sxtw #2
   20304: 52808209     	mov	w9, #0x410              // =1040
   20308: b9000909     	str	w9, [x8, #0x8]
   2030c: b9400668     	ldr	w8, [x19, #0x4]
   20310: 11000508     	add	w8, w8, #0x1
   20314: b9000668     	str	w8, [x19, #0x4]
   20318: b9805a68     	ldrsw	x8, [x19, #0x58]
   2031c: 321e07e9     	orr	w9, wzr, #0xc
   20320: 9101726a     	add	x10, x19, #0x5c
   20324: 320003eb     	orr	w11, wzr, #0x1
   20328: 9b097d08     	mul	x8, x8, x9
   2032c: 7828695f     	strh	wzr, [x10, x8]
   20330: b9805a68     	ldrsw	x8, [x19, #0x58]
   20334: d503201f     	nop
   20338: 9b092908     	madd	x8, x8, x9, x10
   2033c: 7900050b     	strh	w11, [x8, #0x2]
   20340: b9805a68     	ldrsw	x8, [x19, #0x58]
   20344: d503201f     	nop
   20348: 9b092908     	madd	x8, x8, x9, x10
   2034c: 7900091f     	strh	wzr, [x8, #0x4]
   20350: b9805a68     	ldrsw	x8, [x19, #0x58]
   20354: d503201f     	nop
   20358: 9b092908     	madd	x8, x8, x9, x10
   2035c: 79000d0b     	strh	w11, [x8, #0x6]
   20360: b9805a68     	ldrsw	x8, [x19, #0x58]
   20364: 79417a6b     	ldrh	w11, [x19, #0xbc]
   20368: 91000508     	add	x8, x8, #0x1
   2036c: 1100056b     	add	w11, w11, #0x1
   20370: b9005a68     	str	w8, [x19, #0x58]
   20374: 79017a6b     	strh	w11, [x19, #0xbc]
   20378: 7940d2cb     	ldrh	w11, [x22, #0x68]
   2037c: 9b097d08     	mul	x8, x8, x9
   20380: 7828694b     	strh	w11, [x10, x8]
   20384: 7940dac8     	ldrh	w8, [x22, #0x6c]
   20388: b9805a6c     	ldrsw	x12, [x19, #0x58]
   2038c: 11000508     	add	w8, w8, #0x1
   20390: 9b09298c     	madd	x12, x12, x9, x10
   20394: 4b0b0108     	sub	w8, w8, w11
   20398: 79000588     	strh	w8, [x12, #0x2]
   2039c: b9805a68     	ldrsw	x8, [x19, #0x58]
   203a0: d503201f     	nop
   203a4: 9b092908     	madd	x8, x8, x9, x10
   203a8: 7900090b     	strh	w11, [x8, #0x4]
   203ac: 7940dac8     	ldrh	w8, [x22, #0x6c]
   203b0: b9805a6b     	ldrsw	x11, [x19, #0x58]
   203b4: 7940d2cc     	ldrh	w12, [x22, #0x68]
   203b8: 11000508     	add	w8, w8, #0x1
   203bc: 9b092969     	madd	x9, x11, x9, x10
   203c0: 4b0c0108     	sub	w8, w8, w12
   203c4: 79000d28     	strh	w8, [x9, #0x6]
   203c8: b9405a69     	ldr	w9, [x19, #0x58]
   203cc: 79417a6a     	ldrh	w10, [x19, #0xbc]
   203d0: 11000529     	add	w9, w9, #0x1
   203d4: 0b0a0108     	add	w8, w8, w10
   203d8: b9005a69     	str	w9, [x19, #0x58]
   203dc: 79017a68     	strh	w8, [x19, #0xbc]
   203e0: 3942fa68     	ldrb	w8, [x19, #0xbe]
   203e4: 32000108     	orr	w8, w8, #0x1
   203e8: 3902fa68     	strb	w8, [x19, #0xbe]
   203ec: 17ffff61     	b	0x20170 <GenerateUpgradeInfo(unsigned int, sfs_info_s*, sfs_flash_info_s*, sfs_upgrade_info_s*)+0x4ec>
