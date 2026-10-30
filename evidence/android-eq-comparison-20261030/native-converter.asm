# Official library SHA256 702b5facf4f741b34cc4acee4e9ab5f5b7d803fcd13a0ed6717949b4d9a5f277
# Static AArch64 disassembly; addresses are ELF virtual addresses.


_Z21convertEQParamFromJniP7_JNIEnvP8_jobjectP17EQ_BAND_PARAM_TAG @ 0x2194, size 364
00002194: stp        x29, x30, [sp, #-0x40]!
00002198: str        x23, [sp, #0x10]
0000219c: stp        x22, x21, [sp, #0x20]
000021a0: stp        x20, x19, [sp, #0x30]
000021a4: mov        x29, sp
000021a8: adrp       x23, #0xa000
000021ac: mov        x19, x2
000021b0: mov        x20, x1
000021b4: ldr        x23, [x23, #0xf18]
000021b8: mov        x21, x0
000021bc: ldrb       w8, [x23, #0x28]
000021c0: tbnz       w8, #0, #0x227c
000021c4: ldr        x8, [x21]
000021c8: mov        x0, x21
000021cc: mov        x1, x20
000021d0: ldr        x8, [x8, #0xf8]
000021d4: blr        x8
000021d8: ldr        x8, [x21]
000021dc: adrp       x22, #0x1000
000021e0: add        x22, x22, #0x553
000021e4: mov        x1, x0
000021e8: str        x0, [x23]
000021ec: nop        
000021f0: adr        x2, #0x154d
000021f4: ldr        x8, [x8, #0x2f0]
000021f8: mov        x0, x21
000021fc: mov        x3, x22
00002200: blr        x8
00002204: ldr        x8, [x21]
00002208: ldr        x1, [x23]
0000220c: adrp       x2, #0x1000
00002210: add        x2, x2, #0x519
00002214: str        x0, [x23, #8]
00002218: mov        x0, x21
0000221c: ldr        x8, [x8, #0x2f0]
00002220: mov        x3, x22
00002224: blr        x8
00002228: ldr        x8, [x21]
0000222c: ldr        x1, [x23]
00002230: adrp       x2, #0x1000
00002234: add        x2, x2, #0x52d
00002238: str        x0, [x23, #0x10]
0000223c: mov        x0, x21
00002240: ldr        x8, [x8, #0x2f0]
00002244: mov        x3, x22
00002248: blr        x8
0000224c: ldr        x8, [x21]
00002250: ldr        x1, [x23]
00002254: adrp       x2, #0x1000
00002258: add        x2, x2, #0x538
0000225c: str        x0, [x23, #0x18]
00002260: mov        x0, x21
00002264: ldr        x8, [x8, #0x2f0]
00002268: mov        x3, x22
0000226c: blr        x8
00002270: mov        w8, #1
00002274: str        x0, [x23, #0x20]
00002278: strb       w8, [x23, #0x28]
0000227c: ldr        x8, [x21]
00002280: ldr        x2, [x23, #8]
00002284: mov        x0, x21
00002288: mov        x1, x20
0000228c: ldr        x8, [x8, #0x320]
00002290: blr        x8
00002294: ldr        x8, [x21]
00002298: ldr        x2, [x23, #0x10]
0000229c: mov        x1, x20
000022a0: strh       w0, [x19]
000022a4: mov        x0, x21
000022a8: ldr        x8, [x8, #0x320]
000022ac: blr        x8
000022b0: ldr        x8, [x21]
000022b4: ldr        x2, [x23, #0x18]
000022b8: mov        x1, x20
000022bc: strh       w0, [x19, #2]
000022c0: mov        x0, x21
000022c4: ldr        x8, [x8, #0x320]
000022c8: blr        x8
000022cc: ldr        x8, [x21]
000022d0: ldr        x2, [x23, #0x20]
000022d4: mov        x1, x20
000022d8: strh       w0, [x19, #4]
000022dc: mov        x0, x21
000022e0: ldr        x8, [x8, #0x320]
000022e4: blr        x8
000022e8: strh       w0, [x19, #6]
000022ec: ldp        x20, x19, [sp, #0x30]
000022f0: ldr        x23, [sp, #0x10]
000022f4: ldp        x22, x21, [sp, #0x20]
000022f8: ldp        x29, x30, [sp], #0x40
000022fc: ret        

_Z18convertCoeffsToJniP7_JNIEnvP23_CX207xx_BAND_EQ_COEFFSP8_jobject @ 0x255c, size 224
0000255c: stp        x29, x30, [sp, #-0x30]!
00002560: stp        x22, x21, [sp, #0x10]
00002564: stp        x20, x19, [sp, #0x20]
00002568: mov        x29, sp
0000256c: mov        x21, x1
00002570: mov        x1, x2
00002574: mov        x19, x2
00002578: mov        x20, x0
0000257c: bl         #0x6bb0
00002580: adrp       x22, #0xa000
00002584: mov        x0, x20
00002588: mov        x1, x19
0000258c: ldr        x22, [x22, #0xf20]
00002590: ldr        x8, [x20]
00002594: ldr        w3, [x21]
00002598: ldr        x2, [x22, #8]
0000259c: ldr        x8, [x8, #0x368]
000025a0: blr        x8
000025a4: ldr        x8, [x20]
000025a8: ldr        x2, [x22, #0x10]
000025ac: mov        x0, x20
000025b0: ldr        w3, [x21, #4]
000025b4: mov        x1, x19
000025b8: ldr        x8, [x8, #0x368]
000025bc: blr        x8
000025c0: ldr        x8, [x20]
000025c4: ldr        x2, [x22, #0x18]
000025c8: mov        x0, x20
000025cc: ldr        w3, [x21, #8]
000025d0: mov        x1, x19
000025d4: ldr        x8, [x8, #0x368]
000025d8: blr        x8
000025dc: ldr        x8, [x20]
000025e0: ldr        x2, [x22, #0x20]
000025e4: mov        x0, x20
000025e8: ldr        w3, [x21, #0xc]
000025ec: mov        x1, x19
000025f0: ldr        x8, [x8, #0x368]
000025f4: blr        x8
000025f8: ldr        x8, [x20]
000025fc: ldr        x2, [x22, #0x28]
00002600: mov        x0, x20
00002604: ldr        w3, [x21, #0x10]
00002608: mov        x1, x19
0000260c: ldr        x8, [x8, #0x368]
00002610: blr        x8
00002614: ldr        x8, [x20]
00002618: ldr        x2, [x22, #0x30]
0000261c: mov        x0, x20
00002620: ldrb       w3, [x21, #0x14]
00002624: ldr        x4, [x8, #0x350]
00002628: mov        x1, x19
0000262c: ldp        x20, x19, [sp, #0x20]
00002630: ldp        x22, x21, [sp, #0x10]
00002634: ldp        x29, x30, [sp], #0x30
00002638: br         x4

_Z29CxAudioConvertEqParams2CoeffsjP17EQ_BAND_PARAM_TAGP23_CX207xx_BAND_EQ_COEFFSi @ 0x2abc, size 516
00002abc: sub        sp, sp, #0xa0
00002ac0: stp        x29, x30, [sp, #0x60]
00002ac4: str        x23, [sp, #0x70]
00002ac8: stp        x22, x21, [sp, #0x80]
00002acc: stp        x20, x19, [sp, #0x90]
00002ad0: add        x29, sp, #0x60
00002ad4: mrs        x22, tpidr_el0
00002ad8: mov        w10, #2
00002adc: mov        w8, w0
00002ae0: ldr        x9, [x22, #0x28]
00002ae4: cmp        x2, #0
00002ae8: ccmp       x1, #0, #4, ne
00002aec: stur       x9, [x29, #-8]
00002af0: csel       w10, w10, wzr, eq
00002af4: ldrh       w9, [x1]
00002af8: orr        w11, w10, #4
00002afc: stp        xzr, xzr, [sp, #0x10]
00002b00: str        xzr, [sp, #0x20]
00002b04: and        w9, w9, #0xf
00002b08: cmp        w9, #5
00002b0c: mov        w9, #0xbb80
00002b10: csel       w0, w10, w11, lo
00002b14: cmp        w8, #0
00002b18: csel       w20, w9, w8, eq
00002b1c: cbz        w0, #0x2b48
00002b20: ldr        x8, [x22, #0x28]
00002b24: ldur       x9, [x29, #-8]
00002b28: cmp        x8, x9
00002b2c: b.ne       #0x2cbc
00002b30: ldp        x20, x19, [sp, #0x90]
00002b34: ldr        x23, [sp, #0x70]
00002b38: ldp        x22, x21, [sp, #0x80]
00002b3c: ldp        x29, x30, [sp, #0x60]
00002b40: add        sp, sp, #0xa0
00002b44: ret        
00002b48: mov        w21, w3
00002b4c: mov        x19, x1
00002b50: mov        x23, x2
00002b54: add        x3, sp, #0x10
00002b58: mov        x0, x1
00002b5c: mov        w1, #1
00002b60: mov        w2, w20
00002b64: mov        w4, w21
00002b68: bl         #0x6c10
00002b6c: add        x0, sp, #0x10
00002b70: sub        x1, x29, #0x20
00002b74: mov        w2, #1
00002b78: mov        w3, w21
00002b7c: bl         #0x6c20
00002b80: sub        x0, x29, #0x20
00002b84: add        x1, sp, #0x30
00002b88: add        x2, sp, #0x28
00002b8c: mov        x3, xzr
00002b90: bl         #0x6c30
00002b94: fmov       s0, #1.00000000
00002b98: ldr        s1, [sp, #0x28]
00002b9c: mov        w0, #0x100
00002ba0: fcmp       s1, s0
00002ba4: b.ge       #0x2b20
00002ba8: ldr        s1, [sp, #0x2c]
00002bac: fcmp       s1, s0
00002bb0: b.ge       #0x2b20
00002bb4: ldrb       w9, [sp, #0x10]
00002bb8: ldur       d0, [sp, #0x14]
00002bbc: ldur       d1, [sp, #0x1c]
00002bc0: ldr        w8, [sp, #0x24]
00002bc4: ldrh       w10, [x19, #6]
00002bc8: add        w9, w9, #2
00002bcc: stur       d0, [x23, #0xc]
00002bd0: str        d1, [x23]
00002bd4: str        w8, [x23, #8]
00002bd8: strb       w9, [x23, #0x14]
00002bdc: cbz        w10, #0x2cb4
00002be0: sub        x0, x29, #0x20
00002be4: add        x3, sp, #8
00002be8: mov        w1, #1
00002bec: mov        w2, w20
00002bf0: bl         #0x6c40
00002bf4: ldr        h0, [sp, #0xa]
00002bf8: mov        w8, #0xcccd
00002bfc: ldr        h1, [x19, #2]
00002c00: movk       w8, #0x3f8c, lsl #16
00002c04: ldrh       w9, [x19]
00002c08: ldrh       w10, [sp, #8]
00002c0c: ucvtf      s0, s0
00002c10: fmov       s2, w8
00002c14: mov        w8, #0x6666
00002c18: movk       w8, #0x3f66, lsl #16
00002c1c: ucvtf      s1, s1
00002c20: ldr        h3, [sp, #0xc]
00002c24: fmov       s4, w8
00002c28: cmp        w9, w10
00002c2c: mov        w9, #0x200
00002c30: csel       w8, wzr, w9, eq
00002c34: mov        w9, #0x999a
00002c38: ucvtf      s3, s3
00002c3c: fmul       s2, s0, s2
00002c40: movk       w9, #0x3f99, lsl #16
00002c44: ldrh       w10, [x19, #6]
00002c48: fmul       s0, s0, s4
00002c4c: fmov       s4, w9
00002c50: mov        w9, #0xcccd
00002c54: movk       w9, #0x3f4c, lsl #16
00002c58: sxth       w10, w10
00002c5c: fcmp       s2, s1
00002c60: ldr        h2, [x19, #4]
00002c64: fmul       s4, s3, s4
00002c68: ucvtf      s2, s2
00002c6c: fccmp      s0, s1, #0, pl
00002c70: fmov       s0, w9
00002c74: orr        w9, w8, #0x400
00002c78: fmul       s0, s3, s0
00002c7c: csel       w8, w9, w8, gt
00002c80: fcmp       s4, s2
00002c84: ldrh       w9, [sp, #0xe]
00002c88: orr        w11, w8, #0x800
00002c8c: sxth       w9, w9
00002c90: fccmp      s0, s2, #0, pl
00002c94: add        w12, w9, #0x100
00002c98: sub        w9, w9, #0x100
00002c9c: csel       w8, w11, w8, gt
00002ca0: cmp        w12, w10
00002ca4: ccmp       w9, w10, #0, ge
00002ca8: orr        w9, w8, #0x1000
00002cac: csel       w0, w9, w8, gt
00002cb0: b          #0x2b20
00002cb4: mov        w0, wzr
00002cb8: b          #0x2b20
00002cbc: bl         #0x6be0

internal_filter_design_core @ 0x31b0, size 864
000031b0: sub        sp, sp, #0x60
000031b4: stp        d11, d10, [sp, #0x10]
000031b8: stp        d9, d8, [sp, #0x20]
000031bc: stp        x29, x30, [sp, #0x30]
000031c0: stp        x22, x21, [sp, #0x40]
000031c4: stp        x20, x19, [sp, #0x50]
000031c8: add        x29, sp, #0x30
000031cc: movi       d10, #0000000000000000
000031d0: fmov       d11, #1.00000000
000031d4: mov        x19, x5
000031d8: mov        w20, w3
000031dc: mov        w21, w0
000031e0: cbz        w1, #0x3248
000031e4: mov        w22, w2
000031e8: tst        w2, #0xffff
000031ec: b.eq       #0x3248
000031f0: lsr        w8, w4, #1
000031f4: fmov       d9, #1.00000000
000031f8: cmp        w1, w8
000031fc: b.hs       #0x324c
00003200: ucvtf      d0, w1
00003204: ucvtf      s1, w4
00003208: adrp       x8, #0x1000
0000320c: ldr        d2, [x8, #0x5a8]
00003210: add        x0, sp, #8
00003214: mov        x1, sp
00003218: fmul       d0, d0, d2
0000321c: fcvt       d1, s1
00003220: fdiv       d8, d0, d1
00003224: fmov       d0, d8
00003228: bl         #0x6ca0
0000322c: ldp        d9, d10, [sp]
00003230: and        w8, w22, #0xffff
00003234: cbz        w21, #0x3330
00003238: ucvtf      s0, w8, #7
0000323c: fcvt       d0, s0
00003240: fdiv       d10, d10, d0
00003244: b          #0x324c
00003248: fmov       d9, #1.00000000
0000324c: sxth       w8, w20
00003250: fcmp       d9, d11
00003254: scvtf      d8, w8, #8
00003258: adrp       x8, #0x1000
0000325c: ldr        d0, [x8, #0x5c0]
00003260: cset       w20, mi
00003264: fmov       d1, d8
00003268: bl         #0x6cb0
0000326c: cmp        w21, #2
00003270: b.le       #0x32bc
00003274: cmp        w21, #3
00003278: b.eq       #0x33d8
0000327c: cmp        w21, #4
00003280: b.eq       #0x3404
00003284: cmp        w21, #5
00003288: b.ne       #0x33a0
0000328c: fmov       d1, #1.00000000
00003290: fcmp       d9, d1
00003294: b.pl       #0x34e4
00003298: fmov       d2, #-2.00000000
0000329c: fmul       d0, d0, d0
000032a0: fsub       d3, d1, d10
000032a4: fadd       d1, d10, d1
000032a8: fmul       d2, d9, d2
000032ac: fmul       d5, d0, d3
000032b0: fmul       d4, d0, d2
000032b4: fmul       d0, d0, d1
000032b8: b          #0x34a4
000032bc: cmp        w21, #1
000032c0: b.eq       #0x3440
000032c4: cmp        w21, #2
000032c8: b.ne       #0x33a0
000032cc: fcmp       d8, #0.0
000032d0: b.eq       #0x34e4
000032d4: fmov       d1, #1.00000000
000032d8: fcmp       d9, d1
000032dc: b.pl       #0x34e4
000032e0: fsqrt      d2, d0
000032e4: fmov       d3, #-1.00000000
000032e8: fadd       d1, d0, d1
000032ec: fmov       d4, #-2.00000000
000032f0: fadd       d3, d0, d3
000032f4: fmul       d4, d0, d4
000032f8: fmadd      d5, d1, d9, d3
000032fc: fmsub      d16, d3, d9, d1
00003300: fmul       d4, d4, d5
00003304: fadd       d2, d2, d2
00003308: fmul       d6, d2, d10
0000330c: fmadd      d2, d3, d9, d1
00003310: fmsub      d3, d1, d9, d3
00003314: fadd       d7, d2, d6
00003318: fsub       d2, d2, d6
0000331c: fadd       d1, d16, d6
00003320: fmul       d5, d0, d7
00003324: fmul       d0, d0, d2
00003328: fadd       d2, d3, d3
0000332c: b          #0x34a0
00003330: ucvtf      d0, w8
00003334: mov        x8, #0x4060000000000000
00003338: fmov       d1, x8
0000333c: fdiv       d0, d1, d0
00003340: fmadd      d1, d0, d0, d11
00003344: fsqrt      d1, d1
00003348: fadd       d0, d0, d1
0000334c: bl         #0x6c90
00003350: fdiv       d1, d8, d10
00003354: adrp       x8, #0x1000
00003358: ldr        d2, [x8, #0x580]
0000335c: adrp       x8, #0x1000
00003360: fmul       d0, d0, d2
00003364: ldr        d2, [x8, #0x578]
00003368: fcvt       s0, d0
0000336c: fcvt       d0, s0
00003370: fmul       d0, d0, d2
00003374: fmul       d0, d1, d0
00003378: bl         #0x6c80
0000337c: sxth       w8, w20
00003380: fcmp       d9, d11
00003384: fmul       d10, d10, d0
00003388: scvtf      d8, w8, #8
0000338c: adrp       x8, #0x1000
00003390: ldr        d0, [x8, #0x5c0]
00003394: cset       w20, mi
00003398: fmov       d1, d8
0000339c: bl         #0x6cb0
000033a0: fcmp       d8, #0.0
000033a4: b.eq       #0x34e4
000033a8: tbz        w20, #0, #0x34e4
000033ac: fdiv       d3, d10, d0
000033b0: fmov       d1, #-2.00000000
000033b4: fmul       d0, d0, d10
000033b8: fmov       d4, #1.00000000
000033bc: fmul       d2, d9, d1
000033c0: fadd       d5, d0, d4
000033c4: fsub       d0, d4, d0
000033c8: fadd       d1, d3, d4
000033cc: fsub       d3, d4, d3
000033d0: fmov       d4, d2
000033d4: b          #0x34a4
000033d8: fmov       d3, #1.00000000
000033dc: fcmp       d9, d3
000033e0: b.pl       #0x34e4
000033e4: fmul       d0, d0, d0
000033e8: fsub       d1, d3, d9
000033ec: fmov       d2, #-2.00000000
000033f0: fmul       d0, d0, d1
000033f4: fmov       d1, #0.50000000
000033f8: fmul       d0, d0, d1
000033fc: fadd       d4, d0, d0
00003400: b          #0x342c
00003404: fmov       d3, #1.00000000
00003408: fcmp       d9, d3
0000340c: b.pl       #0x34e4
00003410: fmul       d0, d0, d0
00003414: fadd       d1, d9, d3
00003418: fmov       d2, #-2.00000000
0000341c: fmul       d0, d0, d1
00003420: fmov       d1, #0.50000000
00003424: fmul       d0, d0, d1
00003428: fmul       d4, d0, d2
0000342c: fadd       d1, d10, d3
00003430: fmul       d2, d9, d2
00003434: fsub       d3, d3, d10
00003438: fmov       d5, d0
0000343c: b          #0x34a4
00003440: fcmp       d8, #0.0
00003444: b.eq       #0x34e4
00003448: fmov       d1, #1.00000000
0000344c: fcmp       d9, d1
00003450: b.pl       #0x34e4
00003454: fsqrt      d2, d0
00003458: fmov       d3, #-1.00000000
0000345c: fadd       d1, d0, d1
00003460: fadd       d4, d0, d0
00003464: fmov       d17, #-2.00000000
00003468: fadd       d3, d0, d3
0000346c: fmsub      d5, d1, d9, d3
00003470: fmadd      d16, d3, d9, d1
00003474: fmul       d4, d4, d5
00003478: fadd       d2, d2, d2
0000347c: fmul       d6, d2, d10
00003480: fmsub      d2, d3, d9, d1
00003484: fmadd      d3, d1, d9, d3
00003488: fadd       d7, d2, d6
0000348c: fsub       d2, d2, d6
00003490: fadd       d1, d16, d6
00003494: fmul       d5, d0, d7
00003498: fmul       d0, d0, d2
0000349c: fmul       d2, d3, d17
000034a0: fsub       d3, d16, d6
000034a4: fdiv       d5, d5, d1
000034a8: mov        w8, #0x3f800000
000034ac: str        w8, [x19]
000034b0: fdiv       d4, d4, d1
000034b4: fdiv       d0, d0, d1
000034b8: fcvt       s4, d4
000034bc: fdiv       d2, d2, d1
000034c0: fcvt       s0, d0
000034c4: str        s0, [x19, #0x14]
000034c8: fdiv       d1, d3, d1
000034cc: fcvt       s3, d5
000034d0: fcvt       s2, d2
000034d4: stp        s3, s4, [x19, #0xc]
000034d8: fcvt       s1, d1
000034dc: stp        s2, s1, [x19, #4]
000034e0: b          #0x34f4
000034e4: adrp       x8, #0x1000
000034e8: str        xzr, [x19, #0x10]
000034ec: ldr        q0, [x8, #0x5d0]
000034f0: str        q0, [x19]
000034f4: ldp        x20, x19, [sp, #0x50]
000034f8: ldp        x22, x21, [sp, #0x40]
000034fc: ldp        x29, x30, [sp, #0x30]
00003500: ldp        d9, d8, [sp, #0x20]
00003504: ldp        d11, d10, [sp, #0x10]
00003508: add        sp, sp, #0x60
0000350c: ret        

_Z10EqDesignFxPK17EQ_BAND_PARAM_TAGjjP15EQ_COEFF_FX_TAGi @ 0x3510, size 664
00003510: sub        sp, sp, #0xf0
00003514: stp        d13, d12, [sp, #0x60]
00003518: stp        d11, d10, [sp, #0x70]
0000351c: stp        d9, d8, [sp, #0x80]
00003520: stp        x29, x30, [sp, #0x90]
00003524: stp        x28, x27, [sp, #0xa0]
00003528: stp        x26, x25, [sp, #0xb0]
0000352c: stp        x24, x23, [sp, #0xc0]
00003530: stp        x22, x21, [sp, #0xd0]
00003534: stp        x20, x19, [sp, #0xe0]
00003538: add        x29, sp, #0x90
0000353c: mrs        x8, tpidr_el0
00003540: str        x8, [sp]
00003544: ldr        x8, [x8, #0x28]
00003548: stur       x8, [x29, #-0x38]
0000354c: cbz        w1, #0x3764
00003550: ucvtf      s0, w2
00003554: sub        w23, w4, #1
00003558: mov        x8, #-1
0000355c: sub        w9, w4, #2
00003560: mov        w11, #1
00003564: adrp       x10, #0x1000
00003568: lsl        x25, x8, x23
0000356c: lsl        x26, x11, x9
00003570: adrp       x8, #0x1000
00003574: adrp       x9, #0x1000
00003578: fmov       s10, #0.50000000
0000357c: ldr        d9, [x10, #0x588]
00003580: fcvt       d8, s0
00003584: ldr        d11, [x8, #0x5a8]
00003588: ldr        d12, [x9, #0x5b8]
0000358c: mov        w24, #0x999a
00003590: mov        w19, w2
00003594: mov        w27, w1
00003598: add        x28, x3, #0xc
0000359c: add        x22, x0, #4
000035a0: movk       w24, #0x3f99, lsl #16
000035a4: b          #0x35c4
000035a8: stp        wzr, wzr, [x28, #4]
000035ac: stur       d9, [x28, #-0xc]
000035b0: stp        wzr, w26, [x28, #-4]
000035b4: subs       x27, x27, #1
000035b8: add        x28, x28, #0x18
000035bc: add        x22, x22, #8
000035c0: b.eq       #0x3764
000035c4: ldrh       w2, [x22]
000035c8: cbz        w2, #0x35a8
000035cc: ldurh      w8, [x22, #-4]
000035d0: ldurh      w21, [x22, #-2]
000035d4: add        x5, sp, #0xc
000035d8: ldrh       w3, [x22, #2]
000035dc: mov        w4, w19
000035e0: and        w20, w8, #0xf
000035e4: mov        w1, w21
000035e8: mov        w0, w20
000035ec: bl         #0x31b0
000035f0: ldr        s1, [sp, #0x10]
000035f4: fcmp       s1, #0.0
000035f8: b.le       #0x3604
000035fc: fcvt       d0, s1
00003600: b          #0x3614
00003604: movi       d0, #0000000000000000
00003608: b.pl       #0x3614
0000360c: fneg       s0, s1
00003610: fcvt       d0, s0
00003614: ldr        s2, [sp, #0x14]
00003618: fcvt       d1, s2
0000361c: fcmp       d0, d1
00003620: b.mi       #0x363c
00003624: fneg       s1, s2
00003628: fcvt       d2, s1
0000362c: fmov       d1, d0
00003630: fcmp       d0, d2
00003634: b.pl       #0x363c
00003638: fmov       d1, d2
0000363c: ldr        s0, [sp, #0x18]
00003640: fcvt       d2, s0
00003644: fcmp       d1, d2
00003648: b.mi       #0x3664
0000364c: fneg       s0, s0
00003650: fmov       d2, d1
00003654: fcvt       d0, s0
00003658: fcmp       d1, d0
0000365c: b.pl       #0x3664
00003660: fmov       d2, d0
00003664: ldr        s1, [sp, #0x1c]
00003668: fcvt       d0, s1
0000366c: fcmp       d2, d0
00003670: b.mi       #0x368c
00003674: fneg       s0, s1
00003678: fcvt       d1, s0
0000367c: fmov       d0, d2
00003680: fcmp       d2, d1
00003684: b.pl       #0x368c
00003688: fmov       d0, d1
0000368c: ucvtf      d1, w21
00003690: ldr        s2, [sp, #0x20]
00003694: fneg       s3, s2
00003698: fcvt       d2, s2
0000369c: fmul       d1, d1, d11
000036a0: fcvt       d3, s3
000036a4: fdiv       d1, d1, d8
000036a8: fcmp       d0, d3
000036ac: fcsel      d3, d0, d3, pl
000036b0: fcmp       d0, d2
000036b4: fcsel      d0, d2, d3, mi
000036b8: fcvt       s13, d1
000036bc: bl         #0x6c90
000036c0: fmul       d0, d0, d12
000036c4: fmul       s2, s13, s10
000036c8: and        w9, w20, #0xfffffffd
000036cc: fcvtzs     w8, d0
000036d0: stp        s2, s13, [sp, #0x24]
000036d4: scvtf      d1, w8
000036d8: fcmp       d0, d1
000036dc: fmov       s0, w24
000036e0: fmul       s0, s13, s0
000036e4: cinc       w8, w8, ge
000036e8: cmp        w9, #1
000036ec: stur       w8, [x28, #-0xc]
000036f0: str        s0, [sp, #0x2c]
000036f4: b.ne       #0x3700
000036f8: str        wzr, [sp, #0x24]
000036fc: b          #0x371c
00003700: cmp        w20, #4
00003704: b.eq       #0x3710
00003708: cmp        w20, #2
0000370c: b.ne       #0x371c
00003710: mov        w9, #0xfdb
00003714: movk       w9, #0x4049, lsl #16
00003718: str        w9, [sp, #0x2c]
0000371c: sub        w8, w23, w8
00003720: mov        w9, #1
00003724: add        x0, sp, #0xc
00003728: lsl        x8, x9, x8
0000372c: add        x1, sp, #0x30
00003730: mvn        x2, x25
00003734: add        x3, sp, #0x24
00003738: scvtf      s0, x8
0000373c: fmov       s1, s0
00003740: bl         #0x63ac
00003744: ldp        q0, q1, [sp, #0x30]
00003748: ldr        x8, [sp, #0x50]
0000374c: str        w8, [x28, #8]
00003750: xtn        v0.2s, v0.2d
00003754: xtn        v1.2s, v1.2d
00003758: neg        v0.2s, v0.2s
0000375c: stp        d0, d1, [x28, #-8]
00003760: b          #0x35b4
00003764: ldr        x8, [sp]
00003768: ldr        x8, [x8, #0x28]
0000376c: ldur       x9, [x29, #-0x38]
00003770: cmp        x8, x9
00003774: b.ne       #0x37a4
00003778: ldp        x20, x19, [sp, #0xe0]
0000377c: ldp        x22, x21, [sp, #0xd0]
00003780: ldp        x24, x23, [sp, #0xc0]
00003784: ldp        x26, x25, [sp, #0xb0]
00003788: ldp        x28, x27, [sp, #0xa0]
0000378c: ldp        x29, x30, [sp, #0x90]
00003790: ldp        d9, d8, [sp, #0x80]
00003794: ldp        d11, d10, [sp, #0x70]
00003798: ldp        d13, d12, [sp, #0x60]
0000379c: add        sp, sp, #0xf0
000037a0: ret        
000037a4: bl         #0x6be0

_Z13BandFxToFloatPK15EQ_COEFF_FX_TAGPfi @ 0x37a8, size 88
000037a8: ldr        w8, [x0]
000037ac: mov        w9, #1
000037b0: fmov       s1, #1.00000000
000037b4: ldur       d2, [x0, #0xc]
000037b8: mvn        w8, w8
000037bc: add        w8, w2, w8
000037c0: lsl        x8, x9, x8
000037c4: scvtf      s0, x8
000037c8: mov        w8, #0x3f800000
000037cc: str        w8, [x1]
000037d0: fdiv       s0, s1, s0
000037d4: ldur       d1, [x0, #4]
000037d8: neg        v1.2s, v1.2s
000037dc: mov        v1.d[1], v2.d[0]
000037e0: scvtf      v1.4s, v1.4s
000037e4: fmul       v1.4s, v1.4s, v0.s[0]
000037e8: stur       q1, [x1, #4]
000037ec: ldr        s1, [x0, #0x14]
000037f0: scvtf      s1, s1
000037f4: fmul       s0, s0, s1
000037f8: str        s0, [x1, #0x14]
000037fc: ret        

_Z11EqFxToFloatPK15EQ_COEFF_FX_TAGPfji @ 0x3800, size 132
00003800: cbz        w2, #0x3880
00003804: mov        w9, #6
00003808: fmov       s0, #1.00000000
0000380c: mov        x8, xzr
00003810: umull      x9, w2, w9
00003814: add        x10, x0, #0x14
00003818: mov        w11, #1
0000381c: mov        w12, #0x3f800000
00003820: ldr        w13, [x0]
00003824: ldur       d2, [x0, #4]
00003828: ldur       d3, [x0, #0xc]
0000382c: add        x0, x0, #0x18
00003830: mvn        w13, w13
00003834: neg        v2.2s, v2.2s
00003838: add        w13, w3, w13
0000383c: lsl        x13, x11, x13
00003840: mov        v2.d[1], v3.d[0]
00003844: scvtf      s1, x13
00003848: and        x13, x8, #0xfffffffe
0000384c: add        x13, x1, x13, lsl #2
00003850: scvtf      v2.4s, v2.4s
00003854: str        w12, [x13]
00003858: fdiv       s1, s0, s1
0000385c: fmul       v2.4s, v2.4s, v1.s[0]
00003860: stur       q2, [x13, #4]
00003864: ldr        s2, [x10, x8, lsl #2]
00003868: add        x8, x8, #6
0000386c: cmp        x9, x8
00003870: scvtf      s2, s2
00003874: fmul       s1, s1, s2
00003878: str        s1, [x13, #0x14]
0000387c: b.ne       #0x3820
00003880: ret        
