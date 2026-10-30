Law0; c([B)I code_off=0x31607c
0000: const-string             v0, ""
0004: array-length             v1, v9
0006: const/16                 v2, 4096
000a: if-ge                    v1, v2, +004h
000e: goto/16                  +0bah
0012: iput-object              v9, v8, Law0;->a Ljava/io/Serializable;
0016: const/4                  v1, 4
0018: invoke-static            v1, v9, Lnr1;->j(I [B)I
001e: move-result              v9
0020: const                    v1, 1079398483
0026: if-eq                    v9, v1, +004h
002a: goto/16                  +0ach
002e: iget-object              v9, v8, Law0;->a Ljava/io/Serializable;
0032: check-cast               v9, [B
0036: const/16                 v1, 8
003a: invoke-static            v1, v9, Lnr1;->j(I [B)I
0040: iget-object              v9, v8, Law0;->a Ljava/io/Serializable;
0044: check-cast               v9, [B
0048: const/16                 v1, 12
004c: invoke-static            v1, v9, Lnr1;->j(I [B)I
0052: move-result              v9
0054: and-int/lit16            v9, v9, -256
0058: const                    v1, 1329679616
005e: if-eq                    v9, v1, +004h
0062: goto/16                  +090h
0066: iget-object              v9, v8, Law0;->a Ljava/io/Serializable;
006a: check-cast               v9, [B
006e: const/16                 v1, 16
0072: invoke-static            v1, v9, Lnr1;->j(I [B)I
0078: iget-object              v9, v8, Law0;->a Ljava/io/Serializable;
007c: check-cast               v9, [B
0080: const/16                 v1, 20
0084: invoke-static            v1, v9, Lnr1;->j(I [B)I
008a: move-result              v9
008c: iput                     v9, v8, Law0;->b I
0090: iget-object              v9, v8, Law0;->a Ljava/io/Serializable;
0094: check-cast               v9, [B
0098: const/16                 v1, 24
009c: invoke-static            v1, v9, Lnr1;->j(I [B)I
00a2: move-result              v9
00a4: iput                     v9, v8, Law0;->c I
00a8: iget-object              v9, v8, Law0;->a Ljava/io/Serializable;
00ac: check-cast               v9, [B
00b0: const/16                 v1, 28
00b4: invoke-static            v1, v9, Lnr1;->j(I [B)I
00ba: move-result              v9
00bc: iput                     v9, v8, Law0;->d I
00c0: new-array                v9, v9, [Lyv4;
00c4: iput-object              v9, v8, Law0;->e Ljava/io/Serializable;
00c8: const/4                  v9, 0
00ca: move                     v1, v9
00cc: iget                     v2, v8, Law0;->d I
00d0: const                    v3, 16777215
00d6: if-ge                    v1, v2, +058h
00da: new-instance             v2, Lyv4;
00de: invoke-direct            v2, Ljava/lang/Object;-><init>()V
00e4: mul-int/lit8             v4, v1, 16
00e8: add-int/lit8             v5, v4, 36
00ec: iget-object              v6, v8, Law0;->a Ljava/io/Serializable;
00f0: check-cast               v6, [B
00f4: add-int/lit8             v7, v4, 32
00f8: invoke-static            v6, v7, v5, Ljava/util/Arrays;->copyOfRange([B I I)[B
00fe: move-result-object       v6
0100: invoke-virtual           v6, Ljava/lang/Object;->toString()Ljava/lang/String;
0106: move-result-object       v6
0108: invoke-virtual           v6, v0, v0, Ljava/lang/String;->replaceAll(Ljava/lang/String; Ljava/lang/String;)Ljava/lang/String;
010e: iget-object              v6, v8, Law0;->a Ljava/io/Serializable;
0112: check-cast               v6, [B
0116: invoke-static            v5, v6, Lnr1;->j(I [B)I
011c: move-result              v5
011e: iput                     v5, v2, Lyv4;->a I
0122: iget-object              v5, v8, Law0;->a Ljava/io/Serializable;
0126: check-cast               v5, [B
012a: add-int/lit8             v6, v4, 40
012e: invoke-static            v6, v5, Lnr1;->j(I [B)I
0134: move-result              v5
0136: iput                     v5, v2, Lyv4;->b I
013a: iget-object              v5, v8, Law0;->a Ljava/io/Serializable;
013e: check-cast               v5, [B
0142: add-int/lit8             v4, v4, 44
0146: invoke-static            v4, v5, Lnr1;->j(I [B)I
014c: iget                     v4, v2, Lyv4;->b I
0150: if-lez                   v4, +010h
0154: iget-object              v5, v8, Law0;->a Ljava/io/Serializable;
0158: check-cast               v5, [B
015c: iget                     v6, v2, Lyv4;->a I
0160: and-int/2addr            v3, v6
0162: add-int/2addr            v4, v3
0164: invoke-static            v5, v3, v4, Ljava/util/Arrays;->copyOfRange([B I I)[B
016a: move-result-object       v3
016c: iput-object              v3, v2, Lyv4;->c [B
0170: iget-object              v3, v8, Law0;->e Ljava/io/Serializable;
0174: check-cast               v3, [Lyv4;
0178: aput-object              v2, v3, v1
017c: add-int/lit8             v1, v1, 1
0180: goto                     -5ah
0182: const/4                  v8, -1
0184: return                   v8
0186: new-instance             v0, Ljava/util/ArrayList;
018a: invoke-direct            v0, Ljava/util/ArrayList;-><init>()V
0190: iget                     v1, v8, Law0;->b I
0194: and-int/2addr            v1, v3
0196: iget-object              v2, v8, Law0;->a Ljava/io/Serializable;
019a: check-cast               v2, [B
019e: aget-byte                v2, v2, v1
01a2: if-nez                   v2, +029h
01a6: invoke-virtual           v0, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;
01ac: move-result-object       v1
01ae: invoke-static            v1, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;
01b4: invoke-virtual           v0, Ljava/util/ArrayList;->clear()V
01ba: iget                     v1, v8, Law0;->c I
01be: and-int/2addr            v1, v3
01c0: iget-object              v2, v8, Law0;->a Ljava/io/Serializable;
01c4: check-cast               v2, [B
01c8: aget-byte                v2, v2, v1
01cc: if-nez                   v2, +00ah
01d0: invoke-virtual           v0, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;
01d6: move-result-object       v8
01d8: invoke-static            v8, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;
01de: return                   v9
01e0: invoke-static            v2, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;
01e6: move-result-object       v2
01e8: invoke-virtual           v0, v2, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
01ee: add-int/lit8             v1, v1, 1
01f2: goto                     -19h
01f4: invoke-static            v2, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;
01fa: move-result-object       v2
01fc: invoke-virtual           v0, v2, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
0202: add-int/lit8             v1, v1, 1
0206: goto                     -38h
