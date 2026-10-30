Lns4; y(Ljava/lang/String;)I code_off=0x510360
0000: invoke-virtual           v11, Lns4;->A()V
0006: sget-object              v0, Ljava/lang/System;->out Ljava/io/PrintStream;
000a: new-instance             v1, Ljava/lang/StringBuilder;
000e: const-string/jumbo       v2, startSpvUpgrade uri = 
0014: invoke-direct            v1, v2, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
001a: invoke-virtual           v1, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0020: invoke-virtual           v1, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
0026: move-result-object       v1
0028: invoke-virtual           v0, v1, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
002e: new-instance             v0, Law0;
0032: invoke-direct            v0, Ljava/lang/Object;-><init>()V
0038: const/4                  v1, 0
003a: new-array                v2, v1, [B
003e: new-instance             v3, Lnr1;
0042: const/16                 v4, 12
0046: invoke-direct            v3, v4, Lnr1;-><init>(I)V
004c: new-instance             v5, Lnr1;
0050: invoke-direct            v5, v4, Lnr1;-><init>(I)V
0056: const/16                 v6, 272
005a: new-array                v7, v1, [B
005e: const/4                  v8, 1
0060: invoke-virtual           v3, v6, v8, v7, Lnr1;->K(S B [B)V
0066: const/16                 v6, 300
006a: iget-object              v11, v11, Lns4;->f Ly81;
006e: invoke-virtual           v11, v3, v5, v6, Ly81;->C(Lnr1; Lnr1; I)I
0074: move-result              v3
0076: if-eqz                   v3, +003h
007a: goto                     +bh
007c: iget-object              v3, v5, Lnr1;->b Ljava/lang/Object;
0080: check-cast               v3, Luv2;
0084: iget-short               v6, v3, Luv2;->b S
0088: const/16                 v7, 528
008c: if-eq                    v6, v7, +00ah
0090: sget-object              v11, Ljava/lang/System;->out Ljava/io/PrintStream;
0094: const-string             v12, "odtCmdHandshake failed"
0098: invoke-virtual           v11, v12, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
009e: return                   v8
00a0: iget-short               v3, v3, Luv2;->e S
00a4: if-lez                   v3, +01ah
00a8: iget-object              v6, v5, Lnr1;->c Ljava/lang/Object;
00ac: check-cast               v6, Lbu;
00b0: iget-object              v6, v6, Lbu;->b [B
00b4: array-length             v6, v6
00b6: invoke-static            v3, v6, Ljava/lang/Math;->min(I I)I
00bc: move-result              v3
00be: invoke-static            v1, v3, Ljava/lang/Math;->min(I I)I
00c4: move-result              v3
00c6: iget-object              v5, v5, Lnr1;->c Ljava/lang/Object;
00ca: check-cast               v5, Lbu;
00ce: iget-object              v5, v5, Lbu;->b [B
00d2: invoke-static            v5, v1, v2, v1, v3, Ljava/lang/System;->arraycopy(Ljava/lang/Object; I Ljava/lang/Object; I I)V
00d8: new-instance             v2, Ljava/io/FileInputStream;
00dc: invoke-direct            v2, v12, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
00e2: new-instance             v3, Ljava/io/File;
00e6: invoke-direct            v3, v12, Ljava/io/File;-><init>(Ljava/lang/String;)V
00ec: invoke-virtual           v3, Ljava/io/File;->length()J
00f2: move-result-wide         v5
00f4: long-to-int              v12, v5
00f6: new-array                v12, v12, [B
00fa: invoke-virtual           v2, v12, Ljava/io/FileInputStream;->read([B)I
0100: invoke-virtual           v0, v12, Law0;->c([B)I
0106: move-result              v12
0108: goto                     +2h
010a: const/4                  v12, -1
010c: if-eqz                   v12, +00dh
0110: sget-object              v11, Ljava/lang/System;->out Ljava/io/PrintStream;
0114: const-string/jumbo       v12, try_decode failed
011a: invoke-virtual           v11, v12, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
0120: const/4                  v1, 2
0122: goto/16                  +0c0h
0126: move                     v12, v1
0128: iget                     v2, v0, Law0;->d I
012c: const/16                 v3, 1000
0130: const/4                  v5, 4
0132: if-ge                    v12, v2, +08eh
0136: iget-object              v2, v0, Law0;->e Ljava/io/Serializable;
013a: check-cast               v2, [Lyv4;
013e: aget-object              v2, v2, v12
0142: iget                     v6, v2, Lyv4;->b I
0146: if-lez                   v6, +080h
014a: iget                     v6, v2, Lyv4;->a I
014e: iget-object              v2, v2, Lyv4;->c [B
0152: invoke-virtual           v11, v1, Ly81;->A(I)V
0158: array-length             v7, v2
015a: new-instance             v8, Lnr1;
015e: invoke-direct            v8, v4, Lnr1;-><init>(I)V
0164: new-instance             v9, Lnr1;
0168: invoke-direct            v9, v4, Lnr1;-><init>(I)V
016e: new-array                v10, v4, [B
0172: invoke-static            v10, v1, v6, Lcom/moondroplab/communication/usb/util/SpvCodecNative;->writeU32LE([B I I)V
0178: invoke-static            v10, v5, v7, Lcom/moondroplab/communication/usb/util/SpvCodecNative;->writeU32LE([B I I)V
017e: const/16                 v5, 8
0182: const/16                 v6, 256
0186: invoke-static            v10, v5, v6, Lcom/moondroplab/communication/usb/util/SpvCodecNative;->writeU32LE([B I I)V
018c: const/16                 v5, 288
0190: invoke-virtual           v8, v5, v1, v10, Lnr1;->K(S B [B)V
0196: invoke-virtual           v11, v8, v9, v3, Ly81;->C(Lnr1; Lnr1; I)I
019c: move-result              v5
019e: if-eqz                   v5, +003h
01a2: goto                     +40h
01a4: iget-object              v5, v9, Lnr1;->b Ljava/lang/Object;
01a8: check-cast               v5, Luv2;
01ac: iget-short               v5, v5, Luv2;->b S
01b0: const/16                 v7, 544
01b4: if-eq                    v5, v7, +003h
01b8: goto                     +35h
01ba: move                     v5, v1
01bc: array-length             v7, v2
01be: if-ge                    v5, v7, +044h
01c2: array-length             v7, v2
01c4: sub-int/2addr            v7, v5
01c6: if-lt                    v7, v6, +009h
01ca: add-int/lit16            v7, v5, 256
01ce: invoke-static            v2, v5, v7, Ljava/util/Arrays;->copyOfRange([B I I)[B
01d4: move-result-object       v5
01d6: goto                     +6h
01d8: add-int/2addr            v7, v5
01da: invoke-static            v2, v5, v7, Ljava/util/Arrays;->copyOfRange([B I I)[B
01e0: move-result-object       v5
01e2: new-instance             v8, Lnr1;
01e6: invoke-direct            v8, v4, Lnr1;-><init>(I)V
01ec: new-instance             v9, Lnr1;
01f0: invoke-direct            v9, v4, Lnr1;-><init>(I)V
01f6: const/16                 v10, 289
01fa: invoke-virtual           v8, v10, v1, v5, Lnr1;->K(S B [B)V
0200: invoke-virtual           v11, v8, v9, v3, Ly81;->C(Lnr1; Lnr1; I)I
0206: move-result              v5
0208: if-eqz                   v5, +003h
020c: goto                     +bh
020e: iget-object              v5, v9, Lnr1;->b Ljava/lang/Object;
0212: check-cast               v5, Luv2;
0216: iget-short               v5, v5, Luv2;->b S
021a: const/16                 v8, 545
021e: if-eq                    v5, v8, +00bh
0222: sget-object              v11, Ljava/lang/System;->out Ljava/io/PrintStream;
0226: const-string             v12, "odtWriteFlash failed"
022a: invoke-virtual           v11, v12, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
0230: const/4                  v1, 3
0232: goto                     +38h
0234: mul-int/lit8             v5, v7, 100
0238: array-length             v8, v2
023a: div-int/2addr            v5, v8
023c: invoke-virtual           v11, v5, Ly81;->A(I)V
0242: move                     v5, v7
0244: goto                     -44h
0246: add-int/lit8             v12, v12, 1
024a: goto/16                  -091h
024e: new-instance             v12, Lnr1;
0252: invoke-direct            v12, v4, Lnr1;-><init>(I)V
0258: new-instance             v0, Lnr1;
025c: invoke-direct            v0, v4, Lnr1;-><init>(I)V
0262: const/16                 v2, 292
0266: new-array                v4, v1, [B
026a: invoke-virtual           v12, v2, v1, v4, Lnr1;->K(S B [B)V
0270: invoke-virtual           v11, v12, v0, v3, Ly81;->C(Lnr1; Lnr1; I)I
0276: move-result              v11
0278: if-eqz                   v11, +003h
027c: goto                     +bh
027e: iget-object              v11, v0, Lnr1;->b Ljava/lang/Object;
0282: check-cast               v11, Luv2;
0286: iget-short               v11, v11, Luv2;->b S
028a: const/16                 v12, 548
028e: if-eq                    v11, v12, +00ah
0292: sget-object              v11, Ljava/lang/System;->out Ljava/io/PrintStream;
0296: const-string             v12, "odtCmdEndAndReboot failed"
029a: invoke-virtual           v11, v12, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
02a0: move                     v1, v5
02a2: return                   v1
