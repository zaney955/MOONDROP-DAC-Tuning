
classes.dex: Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice; getEQMode()I code_off=0x59b2c8
0000: const/16                 v4, 13
0004: new-array                v4, v4, [J
0008: const/4                  v0, 0
000a: const-wide/16            v1, 90
000e: aput-wide                v1, v4, v0
0012: const-string             v0, "CTRL"
0016: invoke-static            v0, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCafId(Ljava/lang/String;)I
001c: move-result              v0
001e: sget-object              v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
0022: const/4                  v2, 1
0024: const/16                 v3, 346
0028: invoke-static            v3, v0, v4, v1, v2, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->readDataFromDevice(I I [J Landroid/hardware/usb/UsbDeviceConnection; I)[B
002e: move-result-object       v4
0030: invoke-static            v4, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->isExecuteSuccess([B)Z
0036: move-result              v0
0038: if-nez                   v0, +00ch
003c: sget-object              v4, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
0040: const-string             v0, "getEQMode: execute failure!!"
0044: invoke-static            v4, v0, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
004a: const/16                 v4, -1001
004e: return                   v4
0050: const/16                 v0, 14
0054: invoke-static            v4, v0, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
005a: move-result              v4
005c: sget-object              v0, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
0060: const-string             v1, "getEQMode: saved EQ Mode: "
0064: invoke-static            v4, v1, v0, Lgf3;->A(I Ljava/lang/String; Ljava/lang/String;)V
006a: return                   v4

classes.dex: Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice; getEQParamList()Ljava/util/List; code_off=0x59bfac
0000: iget-object              v9, v9, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mDeviceName Ljava/lang/String;
0004: const-string             v0, "Freeman3"
0008: invoke-virtual           v9, v0, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
000e: move-result              v9
0010: const/4                  v0, 0
0012: if-nez                   v9, +00ah
0016: sget-object              v9, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
001a: const-string             v1, "getEQParamList: not Freeman3 device"
001e: invoke-static            v9, v1, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0024: return-object            v0
0026: new-instance             v9, Ljava/util/ArrayList;
002a: invoke-direct            v9, Ljava/util/ArrayList;-><init>()V
0030: const/4                  v1, 0
0032: move                     v2, v1
0034: const/16                 v3, 9
0038: if-ge                    v2, v3, +0a9h
003c: const/16                 v3, 13
0040: new-array                v3, v3, [J
0044: add-int/lit8             v4, v2, 1
0048: int-to-long              v5, v4
004a: aput-wide                v5, v3, v1
004e: const-string             v5, "CTRL"
0052: invoke-static            v5, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCafId(Ljava/lang/String;)I
0058: move-result              v5
005a: sget-object              v6, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
005e: const/16                 v7, 477
0062: const/4                  v8, 1
0064: invoke-static            v7, v5, v3, v6, v8, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getMsgByCmd(I I [J Landroid/hardware/usb/UsbDeviceConnection; I)[B
006a: move-result-object       v3
006c: invoke-static            v3, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->isExecuteSuccess([B)Z
0072: move-result              v5
0074: if-nez                   v5, +00ah
0078: sget-object              v9, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
007c: const-string             v1, "getEQParamList: execute failure, band index is: "
0080: invoke-static            v2, v1, v9, Ln50;->D(I Ljava/lang/String; Ljava/lang/String;)V
0086: return-object            v0
0088: new-instance             v2, Lcom/conexant/genericfeature/EQParam;
008c: invoke-direct            v2, Lcom/conexant/genericfeature/EQParam;-><init>()V
0092: const/16                 v5, 10
0096: invoke-static            v3, v5, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
009c: move-result              v5
009e: iput                     v5, v2, Lcom/conexant/genericfeature/EQParam;->sampleRate I
00a2: const/16                 v5, 14
00a6: invoke-static            v3, v5, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
00ac: move-result              v5
00ae: iput                     v5, v2, Lcom/conexant/genericfeature/EQParam;->band I
00b2: const/16                 v5, 18
00b6: invoke-static            v3, v5, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
00bc: move-result              v5
00be: iput                     v5, v2, Lcom/conexant/genericfeature/EQParam;->frequency I
00c2: const/16                 v5, 22
00c6: invoke-static            v3, v5, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
00cc: move-result              v5
00ce: int-to-float             v5, v5
00d0: const/high16             v6, 1132462080
00d4: div-float/2addr          v5, v6
00d6: invoke-static            v5, Lcom/conexant/universalfunction/CommonUtil;->formatDecimal(F)D
00dc: move-result-wide         v5
00de: iput-wide                v5, v2, Lcom/conexant/genericfeature/EQParam;->qFactor D
00e2: const/16                 v5, 26
00e6: invoke-static            v3, v5, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
00ec: move-result              v5
00ee: iput                     v5, v2, Lcom/conexant/genericfeature/EQParam;->filterType I
00f2: const/16                 v5, 30
00f6: invoke-static            v3, v5, Lcom/conexant/universalfunction/CommonUtil;->formatByteToSingedInt([B I)I
00fc: move-result              v3
00fe: int-to-double            v5, v3
0100: iput-wide                v5, v2, Lcom/conexant/genericfeature/EQParam;->gain D
0104: sget-object              v3, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
0108: new-instance             v5, Ljava/lang/StringBuilder;
010c: const-string             v6, "getEQParamList: band = "
0110: invoke-direct            v5, v6, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
0116: iget                     v6, v2, Lcom/conexant/genericfeature/EQParam;->band I
011a: invoke-virtual           v5, v6, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0120: const-string             v6, " & frequency = "
0124: invoke-virtual           v5, v6, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
012a: iget                     v6, v2, Lcom/conexant/genericfeature/EQParam;->frequency I
012e: invoke-virtual           v5, v6, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0134: const-string             v6, " & qFactor = "
0138: invoke-virtual           v5, v6, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
013e: iget-wide                v6, v2, Lcom/conexant/genericfeature/EQParam;->qFactor D
0142: invoke-virtual           v5, v6, v7, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;
0148: const-string             v6, " & filterType = "
014c: invoke-virtual           v5, v6, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0152: iget                     v6, v2, Lcom/conexant/genericfeature/EQParam;->filterType I
0156: invoke-virtual           v5, v6, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
015c: const-string             v6, " & gain = "
0160: invoke-virtual           v5, v6, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0166: iget-wide                v6, v2, Lcom/conexant/genericfeature/EQParam;->gain D
016a: invoke-virtual           v5, v6, v7, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;
0170: invoke-virtual           v5, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
0176: move-result-object       v5
0178: invoke-static            v3, v5, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
017e: invoke-virtual           v9, v2, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
0184: move                     v2, v4
0186: goto/16                  -0a9h
018a: return-object            v9

classes.dex: Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice; getEQParamsFromFlash(Lcom/conexant/genericfeature/PersistEQParams;)I code_off=0x59b344
0000: invoke-direct            v2, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->claimInterfaceByBaseClass()V
0006: invoke-virtual           v2, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->getEQMode()I
000c: move-result              v0
000e: const/16                 v1, -1001
0012: if-ne                    v0, v1, +00ah
0016: sget-object              v2, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
001a: const-string             v3, "getEQParamsFromFlash: can't get EQ mode!"
001e: invoke-static            v2, v3, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0024: return                   v1
0026: iput                     v0, v3, Lcom/conexant/genericfeature/PersistEQParams;->eqModeIndex I
002a: invoke-virtual           v2, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->getEQParamList()Ljava/util/List;
0030: move-result-object       v0
0032: if-nez                   v0, +00ch
0036: sget-object              v2, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
003a: const-string             v3, "getEQParamsFromFlash: read custom EQ fail"
003e: invoke-static            v2, v3, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0044: const/16                 v2, -1006
0048: return                   v2
004a: iput-object              v0, v3, Lcom/conexant/genericfeature/PersistEQParams;->eqParams Ljava/util/List;
004e: invoke-direct            v2, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->releaseInterfaceByBaseClass()V
0054: const/4                  v2, 0
0056: return                   v2

classes.dex: Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice; saveEQParamsToFlash(Lcom/conexant/genericfeature/PersistEQParams;)I code_off=0x59b8cc
0000: move-object/from16       v0, v21
0004: iget                     v1, v0, Lcom/conexant/genericfeature/PersistEQParams;->eqModeIndex I
0008: iget-object              v0, v0, Lcom/conexant/genericfeature/PersistEQParams;->eqParams Ljava/util/List;
000c: if-nez                   v1, +015h
0010: if-eqz                   v0, +009h
0014: invoke-interface         v0, Ljava/util/List;->isEmpty()Z
001a: move-result              v2
001c: if-nez                   v2, +003h
0020: goto                     +bh
0022: sget-object              v0, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
0026: const-string             v1, "saveEQParamsToFlash: EQ param list is null"
002a: invoke-static            v0, v1, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0030: const/16                 v0, -1005
0034: return                   v0
0036: invoke-direct/range      v20, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->claimInterfaceByBaseClass()V
003c: const-string             v3, "CTRL"
0040: const/16                 v4, 220
0044: const/16                 v5, 13
0048: const/4                  v6, 0
004a: const/4                  v7, 1
004c: if-nez                   v1, +1d6h
0050: sget-object              v1, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
0054: const-string             v8, "saveEQParamsToFlash: save custom EQ!"
0058: invoke-static            v1, v8, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
005e: invoke-interface         v0, Ljava/util/List;->iterator()Ljava/util/Iterator;
0064: move-result-object       v1
0066: invoke-interface         v1, Ljava/util/Iterator;->hasNext()Z
006c: move-result              v8
006e: const/4                  v11, 2
0070: const/4                  v12, 4
0072: const-wide/high16        v13, 4643211215818981376
0076: if-eqz                   v8, +05ah
007a: invoke-interface         v1, Ljava/util/Iterator;->next()Ljava/lang/Object;
0080: move-result-object       v8
0082: check-cast               v8, Lcom/conexant/genericfeature/EQParam;
0086: move-object              v15, v3
0088: const/16                 v21, -1001
008c: iget-wide                v2, v8, Lcom/conexant/genericfeature/EQParam;->qFactor D
0090: mul-double/2addr         v2, v13
0092: double-to-long           v2, v2
0094: new-array                v13, v5, [J
0098: const-wide/16            v16, 0
009c: aput-wide                v16, v13, v6
00a0: iget                     v14, v8, Lcom/conexant/genericfeature/EQParam;->band I
00a4: const/16                 v16, 5
00a8: const/16                 v17, 3
00ac: int-to-long              v9, v14
00ae: aput-wide                v9, v13, v7
00b2: iget                     v9, v8, Lcom/conexant/genericfeature/EQParam;->frequency I
00b6: int-to-long              v9, v9
00b8: aput-wide                v9, v13, v11
00bc: aput-wide                v2, v13, v17
00c0: iget                     v2, v8, Lcom/conexant/genericfeature/EQParam;->filterType I
00c4: int-to-long              v2, v2
00c6: aput-wide                v2, v13, v12
00ca: iget-wide                v2, v8, Lcom/conexant/genericfeature/EQParam;->gain D
00ce: double-to-long           v2, v2
00d0: aput-wide                v2, v13, v16
00d4: invoke-static            v15, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCafId(Ljava/lang/String;)I
00da: move-result              v2
00dc: invoke-static            v4, v2, v13, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCmd(I I [J)Lcom/conexant/universalfunction/CnxtUsbCommand;
00e2: move-result-object       v2
00e4: sget-object              v3, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
00e8: invoke-static            v3, v2, v7, v7, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->writeGolemCmdToDevice(Landroid/hardware/usb/UsbDeviceConnection; Lcom/conexant/universalfunction/CnxtUsbCommand; I Z)Z
00ee: move-result              v2
00f0: sget-object              v3, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
00f4: new-instance             v8, Ljava/lang/StringBuilder;
00f8: const-string             v9, "saveEQParamsToFlash: save eq parameter ->  res: "
00fc: invoke-direct            v8, v9, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
0102: invoke-virtual           v8, v2, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
0108: invoke-virtual           v8, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
010e: move-result-object       v8
0110: invoke-static            v3, v8, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0116: if-nez                   v2, +008h
011a: const-string             v0, "saveEQParamsToFlash: save eq parameter fail!"
011e: invoke-static            v3, v0, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0124: return                   v21
0126: move-object              v3, v15
0128: goto                     -61h
012a: move-object              v15, v3
012c: const/16                 v21, -1001
0130: const/16                 v16, 5
0134: const/16                 v17, 3
0138: invoke-interface         v0, Ljava/util/List;->iterator()Ljava/util/Iterator;
013e: move-result-object       v0
0140: invoke-interface         v0, Ljava/util/Iterator;->hasNext()Z
0146: move-result              v1
0148: if-eqz                   v1, +15bh
014c: invoke-interface         v0, Ljava/util/Iterator;->next()Ljava/lang/Object;
0152: move-result-object       v1
0154: check-cast               v1, Lcom/conexant/genericfeature/EQParam;
0158: sget-object              v2, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
015c: new-instance             v3, Ljava/lang/StringBuilder;
0160: const-string             v8, "saveEQParamsToFlash: save coefficient -> band index: "
0164: invoke-direct            v3, v8, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
016a: iget                     v8, v1, Lcom/conexant/genericfeature/EQParam;->band I
016e: invoke-virtual           v3, v8, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0174: invoke-virtual           v3, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
017a: move-result-object       v3
017c: invoke-static            v2, v3, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0182: new-instance             v2, Lcom/conexant/cnxtusbcheadset/EQBandParam;
0186: invoke-direct            v2, Lcom/conexant/cnxtusbcheadset/EQBandParam;-><init>()V
018c: iget                     v3, v1, Lcom/conexant/genericfeature/EQParam;->filterType I
0190: iput                     v3, v2, Lcom/conexant/cnxtusbcheadset/EQBandParam;->flags I
0194: iget                     v3, v1, Lcom/conexant/genericfeature/EQParam;->frequency I
0198: iput                     v3, v2, Lcom/conexant/cnxtusbcheadset/EQBandParam;->Freq_Hz I
019c: iget-wide                v8, v1, Lcom/conexant/genericfeature/EQParam;->gain D
01a0: mul-double/2addr         v8, v13
01a2: double-to-int            v3, v8
01a4: iput                     v3, v2, Lcom/conexant/cnxtusbcheadset/EQBandParam;->Gain_dB I
01a8: iget-wide                v8, v1, Lcom/conexant/genericfeature/EQParam;->qFactor D
01ac: mul-double/2addr         v8, v13
01ae: double-to-int            v3, v8
01b0: iput                     v3, v2, Lcom/conexant/cnxtusbcheadset/EQBandParam;->Qfactor I
01b4: move                     v3, v12
01b6: const/16                 v8, 8
01ba: if-gt                    v3, v8, -03dh
01be: sget-object              v9, Lcom/conexant/universalfunction/CnxtUsbConstants;->FREQ_SAMPLE_RATE [I
01c2: aget                     v9, v9, v3
01c6: sget-object              v10, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
01ca: move/from16              v18, v11
01ce: const-string             v11, " -> "
01d2: move/from16              v19, v12
01d6: const-string             v12, " & bandIndex: "
01da: const-string             v13, "saveEQParamsToFlash: save coefficient -> sampleRateIndex: "
01de: invoke-static            v13, v3, v11, v9, v12, Ln50;->q(Ljava/lang/String; I Ljava/lang/String; I Ljava/lang/String;)Ljava/lang/StringBuilder;
01e4: move-result-object       v11
01e6: iget                     v12, v1, Lcom/conexant/genericfeature/EQParam;->band I
01ea: invoke-virtual           v11, v12, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
01f0: const-string             v12, " & gain:"
01f4: invoke-virtual           v11, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
01fa: iget-wide                v12, v1, Lcom/conexant/genericfeature/EQParam;->gain D
01fe: invoke-virtual           v11, v12, v13, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;
0204: invoke-virtual           v11, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
020a: move-result-object       v11
020c: invoke-static            v10, v11, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0212: new-instance             v11, Lcom/conexant/cnxtusbcheadset/Eq2Coeff;
0216: invoke-direct            v11, Lcom/conexant/cnxtusbcheadset/Eq2Coeff;-><init>()V
021c: const/16                 v12, 24
0220: invoke-virtual           v11, v9, v2, v12, Lcom/conexant/cnxtusbcheadset/Eq2Coeff;->CxAudioConvertEqParams2Coeffs(I Lcom/conexant/cnxtusbcheadset/EQBandParam; I)Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;
0226: move-result-object       v9
0228: if-nez                   v9, +008h
022c: const-string             v0, "saveEQParamsToFlash: save coefficient -> eqCoeff == null"
0230: invoke-static            v10, v0, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0236: return                   v21
0238: new-instance             v11, Ljava/lang/StringBuilder;
023c: const-string             v12, "saveEQParamsToFlash: save coefficient -> convert eq to coefficient: band:"
0240: invoke-direct            v11, v12, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
0246: iget                     v12, v1, Lcom/conexant/genericfeature/EQParam;->band I
024a: invoke-virtual           v11, v12, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0250: const-string             v12, " & param.gain:"
0254: invoke-virtual           v11, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
025a: iget-wide                v12, v1, Lcom/conexant/genericfeature/EQParam;->gain D
025e: invoke-virtual           v11, v12, v13, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;
0264: const-string             v12, " & pEQCoeff.Gain:"
0268: invoke-virtual           v11, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
026e: iget-byte                v12, v9, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->Gain B
0272: invoke-virtual           v11, v12, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0278: const-string             v12, " & B0:"
027c: invoke-virtual           v11, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0282: iget                     v12, v9, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B0 I
0286: invoke-static            v12, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;
028c: move-result-object       v12
028e: invoke-virtual           v11, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0294: const-string             v12, " & B1:"
0298: invoke-virtual           v11, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
029e: iget                     v12, v9, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B1 I
02a2: invoke-static            v12, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;
02a8: move-result-object       v12
02aa: invoke-virtual           v11, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
02b0: const-string             v12, " & B2:"
02b4: invoke-virtual           v11, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
02ba: iget                     v12, v9, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B2 I
02be: invoke-static            v12, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;
02c4: move-result-object       v12
02c6: invoke-virtual           v11, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
02cc: const-string             v12, " & A0:"
02d0: invoke-virtual           v11, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
02d6: iget                     v12, v9, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A0 I
02da: invoke-static            v12, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;
02e0: move-result-object       v12
02e2: invoke-virtual           v11, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
02e8: const-string             v12, " & A1:"
02ec: invoke-virtual           v11, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
02f2: iget                     v12, v9, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A1 I
02f6: invoke-static            v12, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;
02fc: move-result-object       v12
02fe: invoke-virtual           v11, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0304: invoke-virtual           v11, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
030a: move-result-object       v11
030c: invoke-static            v10, v11, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0312: new-array                v11, v5, [J
0316: int-to-long              v12, v3
0318: aput-wide                v12, v11, v6
031c: iget                     v12, v1, Lcom/conexant/genericfeature/EQParam;->band I
0320: int-to-long              v12, v12
0322: aput-wide                v12, v11, v7
0326: iget-byte                v12, v9, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->Gain B
032a: int-to-long              v12, v12
032c: aput-wide                v12, v11, v18
0330: iget                     v12, v9, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B0 I
0334: int-to-long              v12, v12
0336: aput-wide                v12, v11, v17
033a: iget                     v12, v9, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B1 I
033e: int-to-long              v12, v12
0340: aput-wide                v12, v11, v19
0344: iget                     v12, v9, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B2 I
0348: int-to-long              v12, v12
034a: aput-wide                v12, v11, v16
034e: iget                     v12, v9, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A0 I
0352: int-to-long              v12, v12
0354: const/4                  v14, 6
0356: aput-wide                v12, v11, v14
035a: iget                     v9, v9, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A1 I
035e: int-to-long              v12, v9
0360: const/4                  v9, 7
0362: aput-wide                v12, v11, v9
0366: invoke-static            v15, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCafId(Ljava/lang/String;)I
036c: move-result              v9
036e: invoke-static            v4, v9, v11, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCmd(I I [J)Lcom/conexant/universalfunction/CnxtUsbCommand;
0374: move-result-object       v9
0376: iget                     v11, v1, Lcom/conexant/genericfeature/EQParam;->band I
037a: const/16                 v12, 9
037e: if-ne                    v11, v12, +01ch
0382: if-ne                    v3, v8, +01ah
0386: sget-object              v8, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
038a: invoke-static            v8, v9, v7, v7, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->writeGolemCmdToDevice(Landroid/hardware/usb/UsbDeviceConnection; Lcom/conexant/universalfunction/CnxtUsbCommand; I Z)Z
0390: move-result              v8
0392: new-instance             v9, Ljava/lang/StringBuilder;
0396: const-string             v11, "saveEQParamsToFlash: send save coefficient list -> last eq result is: "
039a: invoke-direct            v9, v11, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
03a0: invoke-virtual           v9, v8, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
03a6: invoke-virtual           v9, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
03ac: move-result-object       v8
03ae: invoke-static            v10, v8, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
03b4: goto                     +18h
03b6: sget-object              v8, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
03ba: invoke-static            v8, v9, v7, v6, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->writeGolemCmdToDevice(Landroid/hardware/usb/UsbDeviceConnection; Lcom/conexant/universalfunction/CnxtUsbCommand; I Z)Z
03c0: move-result              v8
03c2: new-instance             v9, Ljava/lang/StringBuilder;
03c6: const-string             v11, "saveEQParamsToFlash: send save coefficient list -> cmd 0~43:res: "
03ca: invoke-direct            v9, v11, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
03d0: invoke-virtual           v9, v8, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
03d6: invoke-virtual           v9, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
03dc: move-result-object       v8
03de: invoke-static            v10, v8, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
03e4: add-int/lit8             v3, v3, 1
03e8: move/from16              v11, v18
03ec: move/from16              v12, v19
03f0: const-wide/high16        v13, 4643211215818981376
03f4: goto/16                  -11fh
03f8: move-object              v15, v3
03fa: const/16                 v21, -1001
03fe: new-array                v0, v5, [J
0402: const-wide/16            v1, 255
0406: aput-wide                v1, v0, v6
040a: invoke-static            v15, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCafId(Ljava/lang/String;)I
0410: move-result              v1
0412: invoke-static            v4, v1, v0, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCmd(I I [J)Lcom/conexant/universalfunction/CnxtUsbCommand;
0418: move-result-object       v0
041a: sget-object              v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
041e: invoke-static            v1, v0, v7, v7, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->writeGolemCmdToDevice(Landroid/hardware/usb/UsbDeviceConnection; Lcom/conexant/universalfunction/CnxtUsbCommand; I Z)Z
0424: move-result              v0
0426: sget-object              v1, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
042a: new-instance             v2, Ljava/lang/StringBuilder;
042e: const-string             v3, "saveEQParamsToFlash: do save option result: "
0432: invoke-direct            v2, v3, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
0438: invoke-virtual           v2, v0, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
043e: invoke-virtual           v2, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
0444: move-result-object       v2
0446: invoke-static            v1, v2, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
044c: invoke-direct/range      v20, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->releaseInterfaceByBaseClass()V
0452: if-eqz                   v0, +003h
0456: return                   v6
0458: return                   v21

classes.dex: Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice; switchEQMode(I)I code_off=0x59bf34
0000: sget-object              v4, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
0004: const-string/jumbo       v0, switchEQMode: set index: 
000a: invoke-static            v5, v0, v4, Lgf3;->A(I Ljava/lang/String; Ljava/lang/String;)V
0010: const/16                 v0, 13
0014: new-array                v0, v0, [J
0018: const-wide/16            v1, 90
001c: const/4                  v3, 0
001e: aput-wide                v1, v0, v3
0022: int-to-long              v1, v5
0024: const/4                  v5, 1
0026: aput-wide                v1, v0, v5
002a: const-string             v1, "CTRL"
002e: invoke-static            v1, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCafId(Ljava/lang/String;)I
0034: move-result              v1
0036: const/16                 v2, 90
003a: invoke-static            v2, v1, v0, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCmd(I I [J)Lcom/conexant/universalfunction/CnxtUsbCommand;
0040: move-result-object       v0
0042: sget-object              v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
0046: invoke-static            v1, v0, v5, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->sendCmd(Landroid/hardware/usb/UsbDeviceConnection; Lcom/conexant/universalfunction/CnxtUsbCommand; I)Z
004c: move-result              v5
004e: if-eqz                   v5, +003h
0052: goto                     +3h
0054: const/16                 v3, -1001
0058: const-string/jumbo       v5, switchEQMode: sendcmd reg: 
005e: invoke-static            v3, v5, v4, Lgf3;->A(I Ljava/lang/String; Ljava/lang/String;)V
0064: return                   v3

classes.dex: Lcom/conexant/conexantusbtypec/common/ApplicationData$CommonEQParams; <init>()V code_off=0x59d534
0000: invoke-direct            v0, Ljava/lang/Object;-><init>()V
0006: return-void              

classes.dex: Lcom/conexant/conexantusbtypec/common/ApplicationData$CommonEQParams; getPresetList()Ljava/util/List; code_off=0x59d4dc
0000: new-instance             v0, Ljava/util/ArrayList;
0004: invoke-direct            v0, Ljava/util/ArrayList;-><init>()V
000a: const-string             v1, "Custom"
000e: invoke-virtual           v0, v1, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
0014: const-string             v1, "Default"
0018: invoke-virtual           v0, v1, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
001e: const-string             v1, "Dance"
0022: invoke-virtual           v0, v1, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
0028: const-string             v1, "Rock"
002c: invoke-virtual           v0, v1, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
0032: const-string             v1, "Jazz"
0036: invoke-virtual           v0, v1, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
003c: const-string             v1, "Rap"
0040: invoke-virtual           v0, v1, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
0046: return-object            v0

classes.dex: Lcom/conexant/genericfeature/PersistEQParams; <clinit>()V code_off=0x5a0fe8
0000: new-instance             v0, Lcom/conexant/genericfeature/PersistEQParams$1;
0004: invoke-direct            v0, Lcom/conexant/genericfeature/PersistEQParams$1;-><init>()V
000a: sput-object              v0, Lcom/conexant/genericfeature/PersistEQParams;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void              

classes.dex: Lcom/conexant/genericfeature/PersistEQParams; <init>()V code_off=0x5a1008
0000: invoke-direct            v0, Ljava/lang/Object;-><init>()V
0006: return-void              

classes.dex: Lcom/conexant/genericfeature/PersistEQParams; <init>(Landroid/os/Parcel;)V code_off=0x5a1020
0000: invoke-direct            v1, Ljava/lang/Object;-><init>()V
0006: sget-object              v0, Lcom/conexant/genericfeature/EQParam;->CREATOR Landroid/os/Parcelable$Creator;
000a: invoke-virtual           v2, v0, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;
0010: move-result-object       v0
0012: iput-object              v0, v1, Lcom/conexant/genericfeature/PersistEQParams;->eqParams Ljava/util/List;
0016: invoke-virtual           v2, Landroid/os/Parcel;->readInt()I
001c: move-result              v2
001e: iput                     v2, v1, Lcom/conexant/genericfeature/PersistEQParams;->eqModeIndex I
0022: return-void              

classes.dex: Lcom/conexant/genericfeature/PersistEQParams; <init>(Ljava/util/List;)V code_off=0x5a1054
0000: invoke-direct            v0, Ljava/lang/Object;-><init>()V
0006: iput-object              v1, v0, Lcom/conexant/genericfeature/PersistEQParams;->eqParams Ljava/util/List;
000a: return-void              

classes.dex: Lcom/conexant/genericfeature/PersistEQParams; describeContents()I code_off=0x5a0fd4
0000: const/4                  v0, 0
0002: return                   v0

classes.dex: Lcom/conexant/genericfeature/PersistEQParams; writeToParcel(Landroid/os/Parcel; I)V code_off=0x5a1070
0000: iget-object              v2, v0, Lcom/conexant/genericfeature/PersistEQParams;->eqParams Ljava/util/List;
0004: invoke-virtual           v1, v2, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V
000a: iget                     v0, v0, Lcom/conexant/genericfeature/PersistEQParams;->eqModeIndex I
000e: invoke-virtual           v1, v0, Landroid/os/Parcel;->writeInt(I)V
0014: return-void              
