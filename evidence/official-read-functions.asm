
evidence/android-arm64/libCxAudioHidLib.so:	file format elf64-littleaarch64

Disassembly of section .text:

0000000000018ea0 <_ZN18CxAudioHidDev2080511SfsFileReadEjPhjPj>:
   18ea0: d10183ff     	sub	sp, sp, #0x60
   18ea4: f90023f3     	str	x19, [sp, #0x40]
   18ea8: a9057bfd     	stp	x29, x30, [sp, #0x50]
   18eac: 910143fd     	add	x29, sp, #0x50
   18eb0: d53bd053     	mrs	x19, TPIDR_EL0
   18eb4: f9401668     	ldr	x8, [x19, #0x28]
   18eb8: 90000189     	adrp	x9, 0x48000
   18ebc: 9100a129     	add	x9, x9, #0x28
   18ec0: 321e0bea     	orr	w10, wzr, #0x1c
   18ec4: f81e83a8     	stur	x8, [x29, #-0x18]
   18ec8: b9451008     	ldr	w8, [x0, #0x510]
   18ecc: d503201f     	nop
   18ed0: 9baa2429     	umaddl	x9, w1, w10, x9
   18ed4: b9400929     	ldr	w9, [x9, #0x8]
   18ed8: 5280016a     	mov	w10, #0xb               // =11
   18edc: 7100011f     	cmp	w8, #0x0
   18ee0: 1a9f17e8     	cset	w8, eq
   18ee4: 71001c3f     	cmp	w1, #0x7
   18ee8: 5280072b     	mov	w11, #0x39              // =57
   18eec: 29012be8     	stp	w8, w10, [sp, #0x8]
   18ef0: 1a9f97ea     	cset	w10, hi
   18ef4: 7100013f     	cmp	w9, #0x0
   18ef8: 29022fea     	stp	w10, w11, [sp, #0x10]
   18efc: 1a9f17ea     	cset	w10, eq
   18f00: f100005f     	cmp	x2, #0x0
   18f04: 52800228     	mov	w8, #0x11               // =17
   18f08: 29032fea     	stp	w10, w11, [sp, #0x18]
   18f0c: 1a9f17ea     	cset	w10, eq
   18f10: 7100007f     	cmp	w3, #0x0
   18f14: 52800249     	mov	w9, #0x12               // =18
   18f18: 290423ea     	stp	w10, w8, [sp, #0x20]
   18f1c: 1a9f17e8     	cset	w8, eq
   18f20: f100009f     	cmp	x4, #0x0
   18f24: 321e07ec     	orr	w12, wzr, #0xc
   18f28: 290527e8     	stp	w8, w9, [sp, #0x28]
   18f2c: 1a9f17e8     	cset	w8, eq
   18f30: 910023e0     	add	x0, sp, #0x8
   18f34: 321f07e1     	orr	w1, wzr, #0x6
   18f38: 290633e8     	stp	w8, w12, [sp, #0x30]
   18f3c: 97ffeb19     	bl	0x13ba0 <_Z25CxUtilsCheckPreConditionsP19_CXHID_PRECONDITIONj@plt>
   18f40: f9401668     	ldr	x8, [x19, #0x28]
   18f44: f85e83a9     	ldur	x9, [x29, #-0x18]
   18f48: eb09011f     	cmp	x8, x9
   18f4c: 540000a1     	b.ne	0x18f60 <_ZN18CxAudioHidDev2080511SfsFileReadEjPhjPj+0xc0>
   18f50: a9457bfd     	ldp	x29, x30, [sp, #0x50]
   18f54: f94023f3     	ldr	x19, [sp, #0x40]
   18f58: 910183ff     	add	sp, sp, #0x60
   18f5c: d65f03c0     	ret
   18f60: 97ffeb64     	bl	0x13cf0 <__stack_chk_fail@plt>

00000000000258a8 <_ZN18CxAudioHidDev2080510EepromReadEjjPhjP15_MEMOP_FEEDBACK>:
   258a8: f9400008     	ldr	x8, [x0]
   258ac: f9418d06     	ldr	x6, [x8, #0x318]
   258b0: d61f00c0     	br	x6

0000000000026ee8 <_ZN18CxAudioHidDev2080515SpimemReadBlockEjPhjP15_MEMOP_FEEDBACK>:
   26ee8: b945100b     	ldr	w11, [x0, #0x510]
   26eec: aa0403e8     	mov	x8, x4
   26ef0: 2a0303e9     	mov	w9, w3
   26ef4: aa0203ea     	mov	x10, x2
   26ef8: 3400012b     	cbz	w11, 0x26f1c <_ZN18CxAudioHidDev2080515SpimemReadBlockEjPhjP15_MEMOP_FEEDBACK+0x34>
   26efc: f940000b     	ldr	x11, [x0]
   26f00: 53144c21     	lsl	w1, w1, #12
   26f04: 321403e2     	orr	w2, wzr, #0x1000
   26f08: aa0a03e3     	mov	x3, x10
   26f0c: f9418d66     	ldr	x6, [x11, #0x318]
   26f10: 2a0903e4     	mov	w4, w9
   26f14: aa0803e5     	mov	x5, x8
   26f18: d61f00c0     	br	x6
   26f1c: 52800160     	mov	w0, #0xb                // =11
   26f20: d65f03c0     	ret

0000000000027414 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s>:
   27414: d10483ff     	sub	sp, sp, #0x120
   27418: a90c6ffc     	stp	x28, x27, [sp, #0xc0]
   2741c: a90d67fa     	stp	x26, x25, [sp, #0xd0]
   27420: a90e5ff8     	stp	x24, x23, [sp, #0xe0]
   27424: a90f57f6     	stp	x22, x21, [sp, #0xf0]
   27428: a9104ff4     	stp	x20, x19, [sp, #0x100]
   2742c: a9117bfd     	stp	x29, x30, [sp, #0x110]
   27430: 910443fd     	add	x29, sp, #0x110
   27434: d53bd057     	mrs	x23, TPIDR_EL0
   27438: f94016e8     	ldr	x8, [x23, #0x28]
   2743c: aa0003f3     	mov	x19, x0
   27440: aa0103f4     	mov	x20, x1
   27444: f81a83a8     	stur	x8, [x29, #-0x58]
   27448: b9451268     	ldr	w8, [x19, #0x510]
   2744c: 340000c8     	cbz	w8, 0x27464 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x50>
   27450: b9450a68     	ldr	w8, [x19, #0x508]
   27454: 340000c8     	cbz	w8, 0x2746c <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x58>
   27458: 2a1f03f5     	mov	w21, wzr
   2745c: b5001774     	cbnz	x20, 0x27748 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x334>
   27460: 140000c1     	b	0x27764 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x350>
   27464: 52800175     	mov	w21, #0xb               // =11
   27468: 140000bf     	b	0x27764 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x350>
   2746c: 9100e3e0     	add	x0, sp, #0x38
   27470: 321903e2     	orr	w2, wzr, #0x80
   27474: 2a1f03e1     	mov	w1, wzr
   27478: 9100e3f6     	add	x22, sp, #0x38
   2747c: 97ffb335     	bl	0x14150 <memset@plt>
   27480: f9400268     	ldr	x8, [x19]
   27484: 321a03e2     	orr	w2, wzr, #0x40
   27488: 9100e3e3     	add	x3, sp, #0x38
   2748c: 321a03e4     	orr	w4, wzr, #0x40
   27490: f9418d08     	ldr	x8, [x8, #0x318]
   27494: aa1303e0     	mov	x0, x19
   27498: 2a1f03e1     	mov	w1, wzr
   2749c: aa1f03e5     	mov	x5, xzr
   274a0: d63f0100     	blr	x8
   274a4: 2a0003f5     	mov	w21, w0
   274a8: 710002bf     	cmp	w21, #0x0
   274ac: 1a9f17e8     	cset	w8, eq
   274b0: 34000155     	cbz	w21, 0x274d8 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0xc4>
   274b4: 340002c8     	cbz	w8, 0x2750c <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0xf8>
   274b8: b9403be9     	ldr	w9, [sp, #0x38]
   274bc: 5288ca68     	mov	w8, #0x4653             // =18003
   274c0: 72a8aa68     	movk	w8, #0x4553, lsl #16
   274c4: 6b08013f     	cmp	w9, w8
   274c8: 54000261     	b.ne	0x27514 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x100>
   274cc: 2a1f03f8     	mov	w24, wzr
   274d0: 2a1f03f5     	mov	w21, wzr
   274d4: 14000015     	b	0x27528 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x114>
   274d8: f9400268     	ldr	x8, [x19]
   274dc: 910102c3     	add	x3, x22, #0x40
   274e0: 321403e1     	orr	w1, wzr, #0x1000
   274e4: 321a03e2     	orr	w2, wzr, #0x40
   274e8: f9418d08     	ldr	x8, [x8, #0x318]
   274ec: 321a03e4     	orr	w4, wzr, #0x40
   274f0: aa1303e0     	mov	x0, x19
   274f4: aa1f03e5     	mov	x5, xzr
   274f8: d63f0100     	blr	x8
   274fc: 2a0003f5     	mov	w21, w0
   27500: 710002bf     	cmp	w21, #0x0
   27504: 1a9f17e8     	cset	w8, eq
   27508: 35fffd88     	cbnz	w8, 0x274b8 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0xa4>
   2750c: 2a1f03f8     	mov	w24, wzr
   27510: 14000006     	b	0x27528 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x114>
   27514: b9407be9     	ldr	w9, [sp, #0x78]
   27518: 528006ca     	mov	w10, #0x36              // =54
   2751c: 6b08013f     	cmp	w9, w8
   27520: 1a9f17f8     	cset	w24, eq
   27524: 1a8a03f5     	csel	w21, wzr, w10, eq
   27528: f9400268     	ldr	x8, [x19]
   2752c: aa1303e0     	mov	x0, x19
   27530: f9418908     	ldr	x8, [x8, #0x310]
   27534: d63f0100     	blr	x8
   27538: b90033ff     	str	wzr, [sp, #0x30]
   2753c: a9027fff     	stp	xzr, xzr, [sp, #0x20]
   27540: f9000fff     	str	xzr, [sp, #0x18]
   27544: 35001015     	cbnz	w21, 0x27744 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x330>
   27548: 9100e3e8     	add	x8, sp, #0x38
   2754c: 8b181916     	add	x22, x8, x24, lsl #6
   27550: 910063e1     	add	x1, sp, #0x18
   27554: aa1603e0     	mov	x0, x22
   27558: 97ffb27a     	bl	0x13f40 <_Z23GenerateCombinedSfsInfoP12sfs_header_uP21sfs_header_combined_s@plt>
   2755c: 2a0003f5     	mov	w21, w0
   27560: 35000f35     	cbnz	w21, 0x27744 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x330>
   27564: b9401bfb     	ldr	w27, [sp, #0x18]
   27568: 79400ed9     	ldrh	w25, [x22, #0x6]
   2756c: 7140c37f     	cmp	w27, #0x30, lsl #12     // =0x30000
   27570: 54000203     	b.lo	0x275b0 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x19c>
   27574: 9100e3e8     	add	x8, sp, #0x38
   27578: 8b181908     	add	x8, x8, x24, lsl #6
   2757c: 79405d0d     	ldrh	w13, [x8, #0x2e]
   27580: 7940590e     	ldrh	w14, [x8, #0x2c]
   27584: 32003fe8     	orr	w8, wzr, #0xffff
   27588: 0b080328     	add	w8, w25, w8
   2758c: 4b0d010a     	sub	w10, w8, w13
   27590: 4b0e01a9     	sub	w9, w13, w14
   27594: 11000528     	add	w8, w9, #0x1
   27598: 7100031f     	cmp	w24, #0x0
   2759c: 53013d08     	ubfx	w8, w8, #1, #15
   275a0: 321f03fa     	orr	w26, wzr, #0x2
   275a4: 1a890511     	csinc	w17, w8, w9, eq
   275a8: 321f03f6     	orr	w22, wzr, #0x2
   275ac: 1400000a     	b	0x275d4 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x1c0>
   275b0: 794083e8     	ldrh	w8, [sp, #0x40]
   275b4: 320003e9     	orr	w9, wzr, #0x1
   275b8: 2a1f03f6     	mov	w22, wzr
   275bc: 2a1f03ea     	mov	w10, wzr
   275c0: 7100051f     	cmp	w8, #0x1
   275c4: 32003fed     	orr	w13, wzr, #0xffff
   275c8: 1a89153a     	cinc	w26, w9, eq
   275cc: 321f03ee     	orr	w14, wzr, #0x2
   275d0: 2a1903f1     	mov	w17, w25
   275d4: 79404be8     	ldrh	w8, [sp, #0x24]
   275d8: 2a0e03fc     	mov	w28, w14
   275dc: 340000e8     	cbz	w8, 0x275f8 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x1e4>
   275e0: 32003fe9     	orr	w9, wzr, #0xffff
   275e4: 6b09011f     	cmp	w8, w9
   275e8: 2a0e03fc     	mov	w28, w14
   275ec: 54000060     	b.eq	0x275f8 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x1e4>
   275f0: 6b0e011f     	cmp	w8, w14
   275f4: 1a8e811c     	csel	w28, w8, w14, hi
   275f8: 79404fe8     	ldrh	w8, [sp, #0x26]
   275fc: 340000c8     	cbz	w8, 0x27614 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x200>
   27600: 32003fe9     	orr	w9, wzr, #0xffff
   27604: 6b09011f     	cmp	w8, w9
   27608: 54000060     	b.eq	0x27614 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x200>
   2760c: 6b1c011f     	cmp	w8, w28
   27610: 1a9c811c     	csel	w28, w8, w28, hi
   27614: 794053e8     	ldrh	w8, [sp, #0x28]
   27618: 340000c8     	cbz	w8, 0x27630 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x21c>
   2761c: 32003fe9     	orr	w9, wzr, #0xffff
   27620: 6b09011f     	cmp	w8, w9
   27624: 54000060     	b.eq	0x27630 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x21c>
   27628: 6b1c011f     	cmp	w8, w28
   2762c: 1a9c811c     	csel	w28, w8, w28, hi
   27630: 794057e8     	ldrh	w8, [sp, #0x2a]
   27634: 340000c8     	cbz	w8, 0x2764c <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x238>
   27638: 32003fe9     	orr	w9, wzr, #0xffff
   2763c: 6b09011f     	cmp	w8, w9
   27640: 54000060     	b.eq	0x2764c <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x238>
   27644: 6b1c011f     	cmp	w8, w28
   27648: 1a9c811c     	csel	w28, w8, w28, hi
   2764c: 79405be8     	ldrh	w8, [sp, #0x2c]
   27650: 340000c8     	cbz	w8, 0x27668 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x254>
   27654: 32003fe9     	orr	w9, wzr, #0xffff
   27658: 6b09011f     	cmp	w8, w9
   2765c: 54000060     	b.eq	0x27668 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x254>
   27660: 6b1c011f     	cmp	w8, w28
   27664: 1a9c811c     	csel	w28, w8, w28, hi
   27668: 79405fe8     	ldrh	w8, [sp, #0x2e]
   2766c: 340000c8     	cbz	w8, 0x27684 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x270>
   27670: 32003fe9     	orr	w9, wzr, #0xffff
   27674: 6b09011f     	cmp	w8, w9
   27678: 54000060     	b.eq	0x27684 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x270>
   2767c: 6b1c011f     	cmp	w8, w28
   27680: 1a9c811c     	csel	w28, w8, w28, hi
   27684: 794063e8     	ldrh	w8, [sp, #0x30]
   27688: 340000c8     	cbz	w8, 0x276a0 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x28c>
   2768c: 32003fe9     	orr	w9, wzr, #0xffff
   27690: 6b09011f     	cmp	w8, w9
   27694: 54000060     	b.eq	0x276a0 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x28c>
   27698: 6b1c011f     	cmp	w8, w28
   2769c: 1a9c811c     	csel	w28, w8, w28, hi
   276a0: 794067e8     	ldrh	w8, [sp, #0x32]
   276a4: 29022bed     	stp	w13, w10, [sp, #0x10]
   276a8: 29013bf1     	stp	w17, w14, [sp, #0x8]
   276ac: 340000c8     	cbz	w8, 0x276c4 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x2b0>
   276b0: 32003fe9     	orr	w9, wzr, #0xffff
   276b4: 6b09011f     	cmp	w8, w9
   276b8: 54000060     	b.eq	0x276c4 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x2b0>
   276bc: 6b1c011f     	cmp	w8, w28
   276c0: 1a9c811c     	csel	w28, w8, w28, hi
   276c4: f9400268     	ldr	x8, [x19]
   276c8: 53144f81     	lsl	w1, w28, #12
   276cc: 321d03e2     	orr	w2, wzr, #0x8
   276d0: 9100e3e3     	add	x3, sp, #0x38
   276d4: f9418d08     	ldr	x8, [x8, #0x318]
   276d8: 321a03e4     	orr	w4, wzr, #0x40
   276dc: aa1303e0     	mov	x0, x19
   276e0: aa1f03e5     	mov	x5, xzr
   276e4: d63f0100     	blr	x8
   276e8: 2a0003f5     	mov	w21, w0
   276ec: 350002d5     	cbnz	w21, 0x27744 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x330>
   276f0: 79407be8     	ldrh	w8, [sp, #0x3c]
   276f4: b904ea7b     	str	w27, [x19, #0x4e8]
   276f8: b904ee76     	str	w22, [x19, #0x4ec]
   276fc: b904f27a     	str	w26, [x19, #0x4f0]
   27700: b9400be9     	ldr	w9, [sp, #0x8]
   27704: 7909ee79     	strh	w25, [x19, #0x4f6]
   27708: b904fa78     	str	w24, [x19, #0x4f8]
   2770c: 0b1c0108     	add	w8, w8, w28
   27710: 7909ea69     	strh	w9, [x19, #0x4f4]
   27714: b9400fe9     	ldr	w9, [sp, #0xc]
   27718: 7909fa69     	strh	w9, [x19, #0x4fc]
   2771c: b94013ea     	ldr	w10, [sp, #0x10]
   27720: 32003fe9     	orr	w9, wzr, #0xffff
   27724: 790a0a6a     	strh	w10, [x19, #0x504]
   27728: b94017ea     	ldr	w10, [sp, #0x14]
   2772c: 7909fe69     	strh	w9, [x19, #0x4fe]
   27730: 790a0669     	strh	w9, [x19, #0x502]
   27734: 790a0268     	strh	w8, [x19, #0x500]
   27738: 790a0e6a     	strh	w10, [x19, #0x506]
   2773c: 320003ea     	orr	w10, wzr, #0x1
   27740: b9050a6a     	str	w10, [x19, #0x508]
   27744: b4000114     	cbz	x20, 0x27764 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x350>
   27748: 350000f5     	cbnz	w21, 0x27764 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x350>
   2774c: 9113e268     	add	x8, x19, #0x4f8
   27750: 3dc00100     	ldr	q0, [x8]
   27754: 9113a268     	add	x8, x19, #0x4e8
   27758: 3d800680     	str	q0, [x20, #0x10]
   2775c: 3dc00100     	ldr	q0, [x8]
   27760: 3d800280     	str	q0, [x20]
   27764: b944ea62     	ldr	w2, [x19, #0x4e8]
   27768: f0000021     	adrp	x1, 0x2e000 <AllHidDevProperties+0x2bf0>
   2776c: 913a9421     	add	x1, x1, #0xea5
   27770: 321a03e0     	orr	w0, wzr, #0x40
   27774: 97ffb14f     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   27778: 7949ee62     	ldrh	w2, [x19, #0x4f6]
   2777c: f0000021     	adrp	x1, 0x2e000 <AllHidDevProperties+0x2bf0>
   27780: 913ae421     	add	x1, x1, #0xeb9
   27784: 321a03e0     	orr	w0, wzr, #0x40
   27788: 97ffb14a     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   2778c: b944f262     	ldr	w2, [x19, #0x4f0]
   27790: f0000021     	adrp	x1, 0x2e000 <AllHidDevProperties+0x2bf0>
   27794: 913b3821     	add	x1, x1, #0xece
   27798: 321a03e0     	orr	w0, wzr, #0x40
   2779c: 97ffb145     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   277a0: b944fa62     	ldr	w2, [x19, #0x4f8]
   277a4: f0000021     	adrp	x1, 0x2e000 <AllHidDevProperties+0x2bf0>
   277a8: 913ba821     	add	x1, x1, #0xeea
   277ac: 321a03e0     	orr	w0, wzr, #0x40
   277b0: 97ffb140     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   277b4: 7949ea62     	ldrh	w2, [x19, #0x4f4]
   277b8: f0000021     	adrp	x1, 0x2e000 <AllHidDevProperties+0x2bf0>
   277bc: 913c1c21     	add	x1, x1, #0xf07
   277c0: 321a03e0     	orr	w0, wzr, #0x40
   277c4: 97ffb13b     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   277c8: 7949fa62     	ldrh	w2, [x19, #0x4fc]
   277cc: f0000021     	adrp	x1, 0x2e000 <AllHidDevProperties+0x2bf0>
   277d0: 913c8821     	add	x1, x1, #0xf22
   277d4: 321a03e0     	orr	w0, wzr, #0x40
   277d8: 97ffb136     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   277dc: 7949fe62     	ldrh	w2, [x19, #0x4fe]
   277e0: f0000021     	adrp	x1, 0x2e000 <AllHidDevProperties+0x2bf0>
   277e4: 913cf821     	add	x1, x1, #0xf3e
   277e8: 321a03e0     	orr	w0, wzr, #0x40
   277ec: 97ffb131     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   277f0: 794a0262     	ldrh	w2, [x19, #0x500]
   277f4: f0000021     	adrp	x1, 0x2e000 <AllHidDevProperties+0x2bf0>
   277f8: 913d6421     	add	x1, x1, #0xf59
   277fc: 321a03e0     	orr	w0, wzr, #0x40
   27800: 97ffb12c     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   27804: 794a0662     	ldrh	w2, [x19, #0x502]
   27808: f0000021     	adrp	x1, 0x2e000 <AllHidDevProperties+0x2bf0>
   2780c: 913dc421     	add	x1, x1, #0xf71
   27810: 321a03e0     	orr	w0, wzr, #0x40
   27814: 97ffb127     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   27818: 794a0a62     	ldrh	w2, [x19, #0x504]
   2781c: f0000021     	adrp	x1, 0x2e000 <AllHidDevProperties+0x2bf0>
   27820: 913e2021     	add	x1, x1, #0xf88
   27824: 321a03e0     	orr	w0, wzr, #0x40
   27828: 97ffb122     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   2782c: 794a0e62     	ldrh	w2, [x19, #0x506]
   27830: f0000021     	adrp	x1, 0x2e000 <AllHidDevProperties+0x2bf0>
   27834: 913e8821     	add	x1, x1, #0xfa2
   27838: 321a03e0     	orr	w0, wzr, #0x40
   2783c: 97ffb11d     	bl	0x13cb0 <_Z9LogNumberjPKcj@plt>
   27840: f94016e8     	ldr	x8, [x23, #0x28]
   27844: f85a83a9     	ldur	x9, [x29, #-0x58]
   27848: eb09011f     	cmp	x8, x9
   2784c: 54000141     	b.ne	0x27874 <_ZN18CxAudioHidDev2080510SpimemInfoEP16sfs_flash_info_s+0x460>
   27850: 2a1503e0     	mov	w0, w21
   27854: a9517bfd     	ldp	x29, x30, [sp, #0x110]
   27858: a9504ff4     	ldp	x20, x19, [sp, #0x100]
   2785c: a94f57f6     	ldp	x22, x21, [sp, #0xf0]
   27860: a94e5ff8     	ldp	x24, x23, [sp, #0xe0]
   27864: a94d67fa     	ldp	x26, x25, [sp, #0xd0]
   27868: a94c6ffc     	ldp	x28, x27, [sp, #0xc0]
   2786c: 910483ff     	add	sp, sp, #0x120
   27870: d65f03c0     	ret
   27874: 97ffb11f     	bl	0x13cf0 <__stack_chk_fail@plt>
