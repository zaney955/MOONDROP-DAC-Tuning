
Lcom/conexant/cnxtusbcheadset/CafCmdHelper; getCafId(B B B B)I
0000: add-int/lit8              v0, v0, -32
0004: shl-int/lit8              v0, v0, 8
0008: add-int/lit8              v1, v1, -32
000c: shl-int/lit8              v1, v1, 14
0010: or-int/2addr              v0, v1
0012: add-int/lit8              v2, v2, -32
0016: shl-int/lit8              v1, v2, 20
001a: or-int/2addr              v0, v1
001c: add-int/lit8              v3, v3, -32
0020: shl-int/lit8              v1, v3, 26
0024: or-int/2addr              v0, v1
0026: return                    v0

Lcom/conexant/cnxtusbcheadset/CafCmdHelper; getCafId(Ljava/lang/String;)I
0000: invoke-static             v4, Lcom/conexant/universalfunction/CommonUtil;->stringToByteArray(Ljava/lang/String;)[B
0006: move-result-object        v4
0008: const/4                   v0, 0
000a: aget-byte                 v0, v4, v0
000e: const/4                   v1, 1
0010: aget-byte                 v1, v4, v1
0014: const/4                   v2, 2
0016: aget-byte                 v2, v4, v2
001a: const/4                   v3, 3
001c: aget-byte                 v4, v4, v3
0020: invoke-static             v0, v1, v2, v4, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCafId(B B B B)I
0026: move-result               v4
0028: return                    v4

Lcom/conexant/cnxtusbcheadset/CafCmdHelper; getCmd(I I [J)Lcom/conexant/universalfunction/CnxtUsbCommand;
0000: new-instance              v0, Lcom/conexant/universalfunction/CnxtUsbCommand;
0004: invoke-direct             v0, Lcom/conexant/universalfunction/CnxtUsbCommand;-><init>()V
000a: const/4                   v1, 0
000c: if-nez                    v5, +004h
0010: move                      v2, v1
0012: goto                      +2h
0014: array-length              v2, v5
0016: iput                      v2, v0, Lcom/conexant/universalfunction/CnxtUsbCommand;->num_32b_words I
001a: iput                      v3, v0, Lcom/conexant/universalfunction/CnxtUsbCommand;->command_id I
001e: iput                      v1, v0, Lcom/conexant/universalfunction/CnxtUsbCommand;->reply I
0022: iput                      v4, v0, Lcom/conexant/universalfunction/CnxtUsbCommand;->app_module_id I
0026: iput-object               v5, v0, Lcom/conexant/universalfunction/CnxtUsbCommand;->data [J
002a: return-object             v0

Lcom/conexant/cnxtusbcheadset/CafCmdHelper; getMsgByCmd(I I [J Landroid/hardware/usb/UsbDeviceConnection; I)[B
0000: if-nez                    v16, +004h
0004: const/4                   v13, 0
0006: return-object             v13
0008: invoke-static             Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->claimInterfaceListener()V
000e: invoke-static/range       v13 ... v15, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCmd(I I [J)Lcom/conexant/universalfunction/CnxtUsbCommand;
0014: move-result-object        v13
0016: move/from16               v14, v17
001a: invoke-virtual            v13, v14, Lcom/conexant/universalfunction/CnxtUsbCommand;->getUSBMessage(I)[B
0020: move-result-object        v6
0022: const/16                  v4, 513
0026: const/4                   v5, 3
0028: const/16                  v2, 33
002c: const/16                  v3, 9
0030: move-object/from16        v1, v16
0034: invoke-static/range       v1 ... v6, Lcom/conexant/cnxtusbcheadset/UsbHelper;->sendHIDReport(Landroid/hardware/usb/UsbDeviceConnection; I I I I [B)I
003a: invoke-static             Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->startTimer()V
0040: array-length              v13, v6
0042: new-array                 v12, v13, [B
0046: const/16                  v10, 257
004a: const/4                   v11, 3
004c: const/16                  v8, 161
0050: const/4                   v9, 1
0052: move-object/from16        v7, v16
0056: invoke-static/range       v7 ... v12, Lcom/conexant/cnxtusbcheadset/UsbHelper;->receiveHIDReport(Landroid/hardware/usb/UsbDeviceConnection; I I I I [B)[B
005c: invoke-static             Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->startTimer()V
0062: new-instance              v13, Ljava/util/Date;
0066: invoke-static             Ljava/lang/System;->currentTimeMillis()J
006c: move-result-wide          v14
006e: invoke-direct             v13, v14, v15, Ljava/util/Date;-><init>(J)V
0074: const-wide/16             v14, 0
0078: const/4                   v0, 5
007a: aget-byte                 v0, v12, v0
007e: and-int/lit16             v0, v0, 128
0082: shr-int/lit8              v0, v0, 7
0086: const/4                   v1, 1
0088: if-eq                     v1, v0, +03bh
008c: const-wide/16             v0, 1000
0090: cmp-long                  v14, v14, v0
0094: if-gez                    v14, +035h
0098: const/16                  v10, 257
009c: const/4                   v11, 3
009e: const/16                  v8, 161
00a2: const/4                   v9, 1
00a4: move-object/from16        v7, v16
00a8: invoke-static/range       v7 ... v12, Lcom/conexant/cnxtusbcheadset/UsbHelper;->receiveHIDReport(Landroid/hardware/usb/UsbDeviceConnection; I I I I [B)[B
00ae: sget-object               v14, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->TAG Ljava/lang/String;
00b2: const-string              v15, "getMsgByCmd: receiveHIDReport"
00b6: invoke-static             v14, v15, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
00bc: invoke-static             Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->startTimer()V
00c2: const-wide/16             v14, 5
00c6: invoke-static             v14, v15, Ljava/lang/Thread;->sleep(J)V
00cc: goto                      +6h
00ce: move-exception            v0
00d0: move-object               v14, v0
00d2: invoke-virtual            v14, Ljava/lang/Throwable;->printStackTrace()V
00d8: new-instance              v14, Ljava/util/Date;
00dc: invoke-static             Ljava/lang/System;->currentTimeMillis()J
00e2: move-result-wide          v0
00e4: invoke-direct             v14, v0, v1, Ljava/util/Date;-><init>(J)V
00ea: invoke-virtual            v14, Ljava/util/Date;->getTime()J
00f0: move-result-wide          v14
00f2: invoke-virtual            v13, Ljava/util/Date;->getTime()J
00f8: move-result-wide          v0
00fa: sub-long/2addr            v14, v0
00fc: goto                      -42h
00fe: return-object             v12

Lcom/conexant/cnxtusbcheadset/CafCmdHelper; readDataFromDevice(I I [J Landroid/hardware/usb/UsbDeviceConnection; I)[B
0000: if-nez                    v16, +004h
0004: const/4                   v13, 0
0006: return-object             v13
0008: invoke-static/range       v13 ... v15, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCmd(I I [J)Lcom/conexant/universalfunction/CnxtUsbCommand;
000e: move-result-object        v13
0010: move/from16               v14, v17
0014: invoke-virtual            v13, v14, Lcom/conexant/universalfunction/CnxtUsbCommand;->getUSBMessage(I)[B
001a: move-result-object        v6
001c: const/16                  v4, 513
0020: const/4                   v5, 3
0022: const/16                  v2, 33
0026: const/16                  v3, 9
002a: move-object/from16        v1, v16
002e: invoke-static/range       v1 ... v6, Lcom/conexant/cnxtusbcheadset/UsbHelper;->sendHIDReport(Landroid/hardware/usb/UsbDeviceConnection; I I I I [B)I
0034: array-length              v13, v6
0036: new-array                 v12, v13, [B
003a: const/16                  v10, 257
003e: const/4                   v11, 3
0040: const/16                  v8, 161
0044: const/4                   v9, 1
0046: move-object/from16        v7, v16
004a: invoke-static/range       v7 ... v12, Lcom/conexant/cnxtusbcheadset/UsbHelper;->receiveHIDReport(Landroid/hardware/usb/UsbDeviceConnection; I I I I [B)[B
0050: new-instance              v13, Ljava/util/Date;
0054: invoke-static             Ljava/lang/System;->currentTimeMillis()J
005a: move-result-wide          v14
005c: invoke-direct             v13, v14, v15, Ljava/util/Date;-><init>(J)V
0062: const-wide/16             v14, 0
0066: const/4                   v0, 5
0068: aget-byte                 v0, v12, v0
006c: and-int/lit16             v0, v0, 128
0070: shr-int/lit8              v0, v0, 7
0074: const/4                   v1, 1
0076: if-eq                     v1, v0, +038h
007a: const-wide/16             v0, 1000
007e: cmp-long                  v14, v14, v0
0082: if-gez                    v14, +032h
0086: const/16                  v10, 257
008a: const/4                   v11, 3
008c: const/16                  v8, 161
0090: const/4                   v9, 1
0092: move-object/from16        v7, v16
0096: invoke-static/range       v7 ... v12, Lcom/conexant/cnxtusbcheadset/UsbHelper;->receiveHIDReport(Landroid/hardware/usb/UsbDeviceConnection; I I I I [B)[B
009c: sget-object               v14, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->TAG Ljava/lang/String;
00a0: const-string              v15, "readDataFromDevice: receiveHIDReport"
00a4: invoke-static             v14, v15, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
00aa: const-wide/16             v14, 5
00ae: invoke-static             v14, v15, Ljava/lang/Thread;->sleep(J)V
00b4: goto                      +6h
00b6: move-exception            v0
00b8: move-object               v14, v0
00ba: invoke-virtual            v14, Ljava/lang/Throwable;->printStackTrace()V
00c0: new-instance              v14, Ljava/util/Date;
00c4: invoke-static             Ljava/lang/System;->currentTimeMillis()J
00ca: move-result-wide          v0
00cc: invoke-direct             v14, v0, v1, Ljava/util/Date;-><init>(J)V
00d2: invoke-virtual            v14, Ljava/util/Date;->getTime()J
00d8: move-result-wide          v14
00da: invoke-virtual            v13, Ljava/util/Date;->getTime()J
00e0: move-result-wide          v0
00e2: sub-long/2addr            v14, v0
00e4: goto                      -3fh
00e6: return-object             v12

Lcom/conexant/cnxtusbcheadset/CafCmdHelper; sendCmd(Landroid/hardware/usb/UsbDeviceConnection; Lcom/conexant/universalfunction/CnxtUsbCommand; I)Z
0000: if-nez                    v13, +004h
0004: const/4                   v13, 0
0006: return                    v13
0008: invoke-static             Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->claimInterfaceListener()V
000e: invoke-virtual            v14, v15, Lcom/conexant/universalfunction/CnxtUsbCommand;->getUSBMessage(I)[B
0014: move-result-object        v6
0016: const/16                  v4, 513
001a: const/4                   v5, 3
001c: const/16                  v2, 33
0020: const/16                  v3, 9
0024: move-object               v1, v13
0026: invoke-static/range       v1 ... v6, Lcom/conexant/cnxtusbcheadset/UsbHelper;->sendHIDReport(Landroid/hardware/usb/UsbDeviceConnection; I I I I [B)I
002c: invoke-static             Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->startTimer()V
0032: array-length              v13, v6
0034: new-array                 v12, v13, [B
0038: new-instance              v13, Ljava/util/Date;
003c: invoke-static             Ljava/lang/System;->currentTimeMillis()J
0042: move-result-wide          v14
0044: invoke-direct             v13, v14, v15, Ljava/util/Date;-><init>(J)V
004a: const-wide/16             v14, 0
004e: const/4                   v0, 5
0050: aget-byte                 v0, v12, v0
0054: and-int/lit16             v0, v0, 128
0058: shr-int/lit8              v0, v0, 7
005c: const/4                   v2, 1
005e: if-eq                     v2, v0, +033h
0062: const-wide/16             v2, 1000
0066: cmp-long                  v14, v14, v2
006a: if-gez                    v14, +02dh
006e: const/16                  v10, 257
0072: const/4                   v11, 3
0074: const/16                  v8, 161
0078: const/4                   v9, 1
007a: move-object               v7, v1
007c: invoke-static/range       v7 ... v12, Lcom/conexant/cnxtusbcheadset/UsbHelper;->receiveHIDReport(Landroid/hardware/usb/UsbDeviceConnection; I I I I [B)[B
0082: invoke-static             Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->startTimer()V
0088: const-wide/16             v14, 5
008c: invoke-static             v14, v15, Ljava/lang/Thread;->sleep(J)V
0092: goto                      +6h
0094: move-exception            v0
0096: move-object               v14, v0
0098: invoke-virtual            v14, Ljava/lang/Throwable;->printStackTrace()V
009e: new-instance              v14, Ljava/util/Date;
00a2: invoke-static             Ljava/lang/System;->currentTimeMillis()J
00a8: move-result-wide          v2
00aa: invoke-direct             v14, v2, v3, Ljava/util/Date;-><init>(J)V
00b0: invoke-virtual            v14, Ljava/util/Date;->getTime()J
00b6: move-result-wide          v14
00b8: invoke-virtual            v13, Ljava/util/Date;->getTime()J
00be: move-result-wide          v2
00c0: sub-long/2addr            v14, v2
00c2: goto                      -3ah
00c4: invoke-static             v12, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->isExecuteSuccess([B)Z
00ca: move-result               v13
00cc: sget-object               v14, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->TAG Ljava/lang/String;
00d0: new-instance              v15, Ljava/lang/StringBuilder;
00d4: const-string              v0, "sendCmd: isSuccess: "
00d8: invoke-direct             v15, v0, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
00de: invoke-virtual            v15, v13, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
00e4: invoke-virtual            v15, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
00ea: move-result-object        v15
00ec: invoke-static             v14, v15, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
00f2: return                    v13

Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice; setFreeman3EQ(Lcom/conexant/genericfeature/EQParam;)Z
0000: new-instance              v0, Lcom/conexant/cnxtusbcheadset/EQBandParam;
0004: invoke-direct             v0, Lcom/conexant/cnxtusbcheadset/EQBandParam;-><init>()V
000a: iget                      v1, v7, Lcom/conexant/genericfeature/EQParam;->filterType I
000e: iput                      v1, v0, Lcom/conexant/cnxtusbcheadset/EQBandParam;->flags I
0012: iget                      v1, v7, Lcom/conexant/genericfeature/EQParam;->frequency I
0016: iput                      v1, v0, Lcom/conexant/cnxtusbcheadset/EQBandParam;->Freq_Hz I
001a: iget-wide                 v1, v7, Lcom/conexant/genericfeature/EQParam;->gain D
001e: const-wide/high16         v3, 4643211215818981376
0022: mul-double/2addr          v1, v3
0024: double-to-int             v1, v1
0026: iput                      v1, v0, Lcom/conexant/cnxtusbcheadset/EQBandParam;->Gain_dB I
002a: iget-wide                 v1, v7, Lcom/conexant/genericfeature/EQParam;->qFactor D
002e: mul-double/2addr          v1, v3
0030: double-to-int             v1, v1
0032: iput                      v1, v0, Lcom/conexant/cnxtusbcheadset/EQBandParam;->Qfactor I
0036: iget                      v1, v7, Lcom/conexant/genericfeature/EQParam;->sampleRate I
003a: invoke-virtual            v6, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->getCurSampleRate()I
0040: move-result               v2
0042: const/4                   v3, 4
0044: if-lt                     v2, v3, +011h
0048: const/16                  v4, 8
004c: if-gt                     v2, v4, +00dh
0050: sget-object               v1, Lcom/conexant/universalfunction/CnxtUsbConstants;->FREQ_SAMPLE_RATE [I
0054: aget                      v1, v1, v2
0058: sget-object               v2, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
005c: const-string              v4, "setFreeman3EQ: sampleRate: "
0060: invoke-static             v1, v4, v2, Lgf3;->A(I Ljava/lang/String; Ljava/lang/String;)V
0066: new-instance              v2, Lcom/conexant/cnxtusbcheadset/Eq2Coeff;
006a: invoke-direct             v2, Lcom/conexant/cnxtusbcheadset/Eq2Coeff;-><init>()V
0070: new-instance              v4, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;
0074: invoke-direct             v4, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;-><init>()V
007a: iput-object               v4, v6, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->eqCoeff Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;
007e: const/16                  v4, 24
0082: invoke-virtual            v2, v1, v0, v4, Lcom/conexant/cnxtusbcheadset/Eq2Coeff;->CxAudioConvertEqParams2Coeffs(I Lcom/conexant/cnxtusbcheadset/EQBandParam; I)Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;
0088: move-result-object        v0
008a: iput-object               v0, v6, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->eqCoeff Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;
008e: const/4                   v1, 0
0090: if-nez                    v0, +00ah
0094: sget-object               v6, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
0098: const-string              v7, "setFreeman3EQ: eqCoeff == null"
009c: invoke-static             v6, v7, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
00a2: return                    v1
00a4: const/16                  v0, 13
00a8: new-array                 v0, v0, [J
00ac: const-wide/16             v4, 0
00b0: aput-wide                 v4, v0, v1
00b4: iget                      v7, v7, Lcom/conexant/genericfeature/EQParam;->band I
00b8: invoke-static             v7, Lcom/conexant/universalfunction/CommonUtil;->shiftEQBandForFreeman3(I)I
00be: move-result               v7
00c0: int-to-long               v1, v7
00c2: const/4                   v7, 1
00c4: aput-wide                 v1, v0, v7
00c8: iget-object               v6, v6, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->eqCoeff Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;
00cc: iget-byte                 v1, v6, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->Gain B
00d0: int-to-long               v1, v1
00d2: const/4                   v4, 2
00d4: aput-wide                 v1, v0, v4
00d8: iget                      v1, v6, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B0 I
00dc: int-to-long               v1, v1
00de: const/4                   v4, 3
00e0: aput-wide                 v1, v0, v4
00e4: iget                      v1, v6, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B1 I
00e8: int-to-long               v1, v1
00ea: aput-wide                 v1, v0, v3
00ee: iget                      v1, v6, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B2 I
00f2: int-to-long               v1, v1
00f4: const/4                   v3, 5
00f6: aput-wide                 v1, v0, v3
00fa: iget                      v1, v6, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A0 I
00fe: int-to-long               v1, v1
0100: const/4                   v3, 6
0102: aput-wide                 v1, v0, v3
0106: iget                      v6, v6, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A1 I
010a: int-to-long               v1, v6
010c: const/4                   v6, 7
010e: aput-wide                 v1, v0, v6
0112: const-string              v6, "CTRL"
0116: invoke-static             v6, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCafId(Ljava/lang/String;)I
011c: move-result               v6
011e: const/16                  v1, 190
0122: invoke-static             v1, v6, v0, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCmd(I I [J)Lcom/conexant/universalfunction/CnxtUsbCommand;
0128: move-result-object        v6
012a: sget-object               v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
012e: invoke-static             v0, v6, v7, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->sendCmd(Landroid/hardware/usb/UsbDeviceConnection; Lcom/conexant/universalfunction/CnxtUsbCommand; I)Z
0134: move-result               v6
0136: return                    v6

Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice; setFreemanEQ(I I I D F I)Z
0000: move-object/from16        v0, v20
0004: move/from16               v1, v21
0008: invoke-direct             v0, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->canUpdate()Z
000e: move-result               v2
0010: const/4                   v3, 0
0012: if-eqz                    v2, +0f1h
0016: new-instance              v2, Lcom/conexant/cnxtusbcheadset/EQBandParam;
001a: invoke-direct             v2, Lcom/conexant/cnxtusbcheadset/EQBandParam;-><init>()V
0020: move/from16               v4, v27
0024: iput                      v4, v2, Lcom/conexant/cnxtusbcheadset/EQBandParam;->flags I
0028: move/from16               v4, v23
002c: iput                      v4, v2, Lcom/conexant/cnxtusbcheadset/EQBandParam;->Freq_Hz I
0030: const/high16              v4, 1132462080
0034: mul-float                 v4, v4, v26
0038: float-to-int              v4, v4
003a: iput                      v4, v2, Lcom/conexant/cnxtusbcheadset/EQBandParam;->Gain_dB I
003e: const-wide/high16         v4, 4643211215818981376
0042: mul-double                v4, v4, v24
0046: double-to-int             v4, v4
0048: iput                      v4, v2, Lcom/conexant/cnxtusbcheadset/EQBandParam;->Qfactor I
004c: iget-object               v4, v0, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->eq2Coeff Lcom/conexant/cnxtusbcheadset/Eq2Coeff;
0050: const/16                  v5, 16
0054: invoke-virtual            v4, v1, v2, v5, Lcom/conexant/cnxtusbcheadset/Eq2Coeff;->CxAudioConvertEqParams2Coeffs(I Lcom/conexant/cnxtusbcheadset/EQBandParam; I)Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;
005a: move-result-object        v2
005c: iput-object               v2, v0, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->eqCoeff Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;
0060: if-nez                    v2, +003h
0064: return                    v3
0066: const/16                  v0, 8000
006a: const/16                  v4, 4120
006e: const/16                  v6, 11
0072: if-eq                     v1, v0, +034h
0076: const/16                  v0, 16000
007a: if-eq                     v1, v0, +02bh
007e: const/16                  v0, 32000
0082: if-eq                     v1, v0, +022h
0086: const                     v0, 44100
008c: if-eq                     v1, v0, +018h
0090: const                     v0, 48000
0096: if-eq                     v1, v0, +00eh
009a: const                     v0, 96000
00a0: if-eq                     v1, v0, +003h
00a4: goto                      +1fh
00a6: mul-int/lit8              v0, v22, 11
00aa: add-int/lit16             v0, v0, 4554
00ae: int-to-short              v4, v0
00b0: goto                      +19h
00b2: mul-int/lit8              v0, v22, 11
00b6: add-int/lit16             v0, v0, 4340
00ba: goto                      -6h
00bc: mul-int/lit8              v0, v22, 11
00c0: add-int/lit16             v0, v0, 4285
00c4: goto                      -bh
00c6: mul-int/lit8              v0, v22, 11
00ca: add-int/lit16             v0, v0, 4230
00ce: goto                      -10h
00d0: mul-int/lit8              v0, v22, 11
00d4: add-int/lit16             v0, v0, 4175
00d8: goto                      -15h
00da: mul-int/lit8              v0, v22, 11
00de: add-int/2addr             v0, v4
00e0: goto                      -19h
00e2: shr-int/lit8              v0, v4, 8
00e6: int-to-byte               v0, v0
00e8: and-int/lit16             v1, v4, 255
00ec: int-to-byte               v1, v1
00ee: iget                      v4, v2, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B0 I
00f2: and-int/lit16             v7, v4, 255
00f6: int-to-byte               v7, v7
00f8: const/16                  v8, 8
00fc: shr-int/2addr             v4, v8
00fe: int-to-byte               v4, v4
0100: iget                      v9, v2, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B1 I
0104: and-int/lit16             v10, v9, 255
0108: int-to-byte               v10, v10
010a: shr-int/2addr             v9, v8
010c: int-to-byte               v9, v9
010e: iget                      v11, v2, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B2 I
0112: and-int/lit16             v12, v11, 255
0116: int-to-byte               v12, v12
0118: shr-int/2addr             v11, v8
011a: int-to-byte               v11, v11
011c: iget                      v13, v2, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A0 I
0120: and-int/lit16             v14, v13, 255
0124: int-to-byte               v14, v14
0126: shr-int/2addr             v13, v8
0128: int-to-byte               v13, v13
012a: iget                      v15, v2, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A1 I
012e: move/from16               v16, v3
0132: and-int/lit16             v3, v15, 255
0136: int-to-byte               v3, v3
0138: shr-int/2addr             v15, v8
013a: int-to-byte               v15, v15
013c: iget-byte                 v2, v2, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->Gain B
0140: move/from16               v20, v6
0144: new-array                 v6, v5, [B
0148: const/16                  v17, 4
014c: aput-byte                 v17, v6, v16
0150: const/16                  v18, 64
0154: const/16                  v19, 1
0158: aput-byte                 v18, v6, v19
015c: const/16                  v18, 2
0160: aput-byte                 v20, v6, v18
0164: const/16                  v18, 3
0168: aput-byte                 v0, v6, v18
016c: aput-byte                 v1, v6, v17
0170: const/4                   v0, 5
0172: aput-byte                 v7, v6, v0
0176: const/4                   v0, 6
0178: aput-byte                 v4, v6, v0
017c: const/4                   v0, 7
017e: aput-byte                 v10, v6, v0
0182: aput-byte                 v9, v6, v8
0186: const/16                  v0, 9
018a: aput-byte                 v12, v6, v0
018e: const/16                  v0, 10
0192: aput-byte                 v11, v6, v0
0196: aput-byte                 v14, v6, v20
019a: const/16                  v0, 12
019e: aput-byte                 v13, v6, v0
01a2: const/16                  v0, 13
01a6: aput-byte                 v3, v6, v0
01aa: const/16                  v0, 14
01ae: aput-byte                 v15, v6, v0
01b2: const/16                  v0, 15
01b6: aput-byte                 v2, v6, v0
01ba: sget-object               v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
01be: const/16                  v1, 516
01c2: const/4                   v2, 3
01c4: const/16                  v3, 33
01c8: const/16                  v4, 9
01cc: move-object/from16        v20, v0
01d0: move/from16               v23, v1
01d4: move/from16               v24, v2
01d8: move/from16               v21, v3
01dc: move/from16               v22, v4
01e0: move-object/from16        v25, v6
01e4: invoke-static/range       v20 ... v25, Lcom/conexant/cnxtusbcheadset/UsbHelper;->sendHIDReport(Landroid/hardware/usb/UsbDeviceConnection; I I I I [B)I
01ea: move-result               v0
01ec: if-ne                     v0, v5, +003h
01f0: return                    v19
01f2: return                    v16
01f4: move/from16               v16, v3
01f8: return                    v16

Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice; getEQParamList()Ljava/util/List;
0000: iget-object               v9, v9, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mDeviceName Ljava/lang/String;
0004: const-string              v0, "Freeman3"
0008: invoke-virtual            v9, v0, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
000e: move-result               v9
0010: const/4                   v0, 0
0012: if-nez                    v9, +00ah
0016: sget-object               v9, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
001a: const-string              v1, "getEQParamList: not Freeman3 device"
001e: invoke-static             v9, v1, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0024: return-object             v0
0026: new-instance              v9, Ljava/util/ArrayList;
002a: invoke-direct             v9, Ljava/util/ArrayList;-><init>()V
0030: const/4                   v1, 0
0032: move                      v2, v1
0034: const/16                  v3, 9
0038: if-ge                     v2, v3, +0a9h
003c: const/16                  v3, 13
0040: new-array                 v3, v3, [J
0044: add-int/lit8              v4, v2, 1
0048: int-to-long               v5, v4
004a: aput-wide                 v5, v3, v1
004e: const-string              v5, "CTRL"
0052: invoke-static             v5, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCafId(Ljava/lang/String;)I
0058: move-result               v5
005a: sget-object               v6, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
005e: const/16                  v7, 477
0062: const/4                   v8, 1
0064: invoke-static             v7, v5, v3, v6, v8, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getMsgByCmd(I I [J Landroid/hardware/usb/UsbDeviceConnection; I)[B
006a: move-result-object        v3
006c: invoke-static             v3, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->isExecuteSuccess([B)Z
0072: move-result               v5
0074: if-nez                    v5, +00ah
0078: sget-object               v9, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
007c: const-string              v1, "getEQParamList: execute failure, band index is: "
0080: invoke-static             v2, v1, v9, Ln50;->D(I Ljava/lang/String; Ljava/lang/String;)V
0086: return-object             v0
0088: new-instance              v2, Lcom/conexant/genericfeature/EQParam;
008c: invoke-direct             v2, Lcom/conexant/genericfeature/EQParam;-><init>()V
0092: const/16                  v5, 10
0096: invoke-static             v3, v5, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
009c: move-result               v5
009e: iput                      v5, v2, Lcom/conexant/genericfeature/EQParam;->sampleRate I
00a2: const/16                  v5, 14
00a6: invoke-static             v3, v5, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
00ac: move-result               v5
00ae: iput                      v5, v2, Lcom/conexant/genericfeature/EQParam;->band I
00b2: const/16                  v5, 18
00b6: invoke-static             v3, v5, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
00bc: move-result               v5
00be: iput                      v5, v2, Lcom/conexant/genericfeature/EQParam;->frequency I
00c2: const/16                  v5, 22
00c6: invoke-static             v3, v5, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
00cc: move-result               v5
00ce: int-to-float              v5, v5
00d0: const/high16              v6, 1132462080
00d4: div-float/2addr           v5, v6
00d6: invoke-static             v5, Lcom/conexant/universalfunction/CommonUtil;->formatDecimal(F)D
00dc: move-result-wide          v5
00de: iput-wide                 v5, v2, Lcom/conexant/genericfeature/EQParam;->qFactor D
00e2: const/16                  v5, 26
00e6: invoke-static             v3, v5, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
00ec: move-result               v5
00ee: iput                      v5, v2, Lcom/conexant/genericfeature/EQParam;->filterType I
00f2: const/16                  v5, 30
00f6: invoke-static             v3, v5, Lcom/conexant/universalfunction/CommonUtil;->formatByteToSingedInt([B I)I
00fc: move-result               v3
00fe: int-to-double             v5, v3
0100: iput-wide                 v5, v2, Lcom/conexant/genericfeature/EQParam;->gain D
0104: sget-object               v3, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
0108: new-instance              v5, Ljava/lang/StringBuilder;
010c: const-string              v6, "getEQParamList: band = "
0110: invoke-direct             v5, v6, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
0116: iget                      v6, v2, Lcom/conexant/genericfeature/EQParam;->band I
011a: invoke-virtual            v5, v6, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0120: const-string              v6, " & frequency = "
0124: invoke-virtual            v5, v6, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
012a: iget                      v6, v2, Lcom/conexant/genericfeature/EQParam;->frequency I
012e: invoke-virtual            v5, v6, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0134: const-string              v6, " & qFactor = "
0138: invoke-virtual            v5, v6, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
013e: iget-wide                 v6, v2, Lcom/conexant/genericfeature/EQParam;->qFactor D
0142: invoke-virtual            v5, v6, v7, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;
0148: const-string              v6, " & filterType = "
014c: invoke-virtual            v5, v6, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0152: iget                      v6, v2, Lcom/conexant/genericfeature/EQParam;->filterType I
0156: invoke-virtual            v5, v6, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
015c: const-string              v6, " & gain = "
0160: invoke-virtual            v5, v6, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0166: iget-wide                 v6, v2, Lcom/conexant/genericfeature/EQParam;->gain D
016a: invoke-virtual            v5, v6, v7, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;
0170: invoke-virtual            v5, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
0176: move-result-object        v5
0178: invoke-static             v3, v5, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
017e: invoke-virtual            v9, v2, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
0184: move                      v2, v4
0186: goto/16                   -0a9h
018a: return-object             v9

Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice; getEQParamsFromFlash(Lcom/conexant/genericfeature/PersistEQParams;)I
0000: invoke-direct             v2, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->claimInterfaceByBaseClass()V
0006: invoke-virtual            v2, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->getEQMode()I
000c: move-result               v0
000e: const/16                  v1, -1001
0012: if-ne                     v0, v1, +00ah
0016: sget-object               v2, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
001a: const-string              v3, "getEQParamsFromFlash: can't get EQ mode!"
001e: invoke-static             v2, v3, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0024: return                    v1
0026: iput                      v0, v3, Lcom/conexant/genericfeature/PersistEQParams;->eqModeIndex I
002a: invoke-virtual            v2, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->getEQParamList()Ljava/util/List;
0030: move-result-object        v0
0032: if-nez                    v0, +00ch
0036: sget-object               v2, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
003a: const-string              v3, "getEQParamsFromFlash: read custom EQ fail"
003e: invoke-static             v2, v3, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0044: const/16                  v2, -1006
0048: return                    v2
004a: iput-object               v0, v3, Lcom/conexant/genericfeature/PersistEQParams;->eqParams Ljava/util/List;
004e: invoke-direct             v2, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->releaseInterfaceByBaseClass()V
0054: const/4                   v2, 0
0056: return                    v2

Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice; getF3EQCoefficientList()Ljava/util/List;
0000: move-object/from16        v0, v16
0004: sget-object               v1, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
0008: const-string              v2, "getF3EQCoefficientList: MAX_BAND_INDEX = 9"
000c: invoke-static             v1, v2, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0012: iget-object               v2, v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mDeviceName Ljava/lang/String;
0016: const-string              v3, "Freeman3"
001a: invoke-virtual            v2, v3, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0020: move-result               v2
0022: const/4                   v3, 0
0024: if-nez                    v2, +008h
0028: const-string              v0, "getF3EQCoefficientList: not Freeman3 device"
002c: invoke-static             v1, v0, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0032: return-object             v3
0034: invoke-direct             v0, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->claimInterfaceByBaseClass()V
003a: iget-object               v2, v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mContext Landroid/content/Context;
003e: const-string              v4, "audio"
0042: invoke-virtual            v2, v4, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
0048: move-result-object        v2
004a: check-cast                v2, Landroid/media/AudioManager;
004e: const-string              v4, "android.media.property.OUTPUT_SAMPLE_RATE"
0052: invoke-virtual            v2, v4, Landroid/media/AudioManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;
0058: move-result-object        v2
005a: if-eqz                    v2, +006h
005e: invoke-virtual            v2, Ljava/lang/String;->isEmpty()Z
0064: move-result               v4
0066: invoke-static             v2, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
006c: move-result               v2
006e: new-instance              v4, Ljava/lang/StringBuilder;
0072: const-string              v5, "getF3EQCoefficientList: os supported SampleRate: "
0076: invoke-direct             v4, v5, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
007c: invoke-virtual            v4, v2, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0082: invoke-virtual            v4, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
0088: move-result-object        v4
008a: invoke-static             v1, v4, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0090: invoke-virtual            v0, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->getFwVersion()V
0096: new-instance              v1, Ljava/util/ArrayList;
009a: invoke-direct             v1, Ljava/util/ArrayList;-><init>()V
00a0: const/4                   v4, 1
00a2: move                      v5, v4
00a4: const/16                  v6, 9
00a8: if-gt                     v5, v6, +12dh
00ac: const/16                  v6, 13
00b0: new-array                 v6, v6, [J
00b4: const/4                   v7, 0
00b6: const-wide/16             v8, 0
00ba: aput-wide                 v8, v6, v7
00be: int-to-long               v7, v5
00c0: aput-wide                 v7, v6, v4
00c4: const-string              v7, "CTRL"
00c8: invoke-static             v7, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCafId(Ljava/lang/String;)I
00ce: move-result               v7
00d0: sget-object               v8, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
00d4: const/16                  v9, 446
00d8: invoke-static             v9, v7, v6, v8, v4, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->readDataFromDevice(I I [J Landroid/hardware/usb/UsbDeviceConnection; I)[B
00de: move-result-object        v6
00e0: invoke-static             v6, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->isExecuteSuccess([B)Z
00e6: move-result               v7
00e8: if-nez                    v7, +00bh
00ec: sget-object               v1, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
00f0: const-string              v2, "getF3EQCoefficientList: execute failure, band index is: "
00f4: invoke-static             v5, v2, v1, Ln50;->D(I Ljava/lang/String; Ljava/lang/String;)V
00fa: goto/16                   +105h
00fe: new-instance              v7, Lcom/conexant/genericfeature/BandEQCoefficient;
0102: invoke-direct             v7, Lcom/conexant/genericfeature/BandEQCoefficient;-><init>()V
0108: iput                      v2, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->sampleRate I
010c: iput                      v5, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->band I
0110: const/16                  v8, 18
0114: aget-byte                 v9, v6, v8
0118: iput-byte                 v9, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->Gain B
011c: const/16                  v9, 22
0120: invoke-static             v6, v9, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
0126: move-result               v9
0128: iput                      v9, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->B0 I
012c: const/16                  v9, 26
0130: invoke-static             v6, v9, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
0136: move-result               v9
0138: iput                      v9, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->B1 I
013c: const/16                  v9, 30
0140: invoke-static             v6, v9, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
0146: move-result               v9
0148: iput                      v9, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->B2 I
014c: const/16                  v9, 34
0150: invoke-static             v6, v9, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
0156: move-result               v9
0158: iput                      v9, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->A0 I
015c: const/16                  v9, 38
0160: invoke-static             v6, v9, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
0166: move-result               v9
0168: iput                      v9, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->A1 I
016c: sget-object               v9, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
0170: const-string              v10, "getF3EQCoefficientList 32 bits => EQ Coefficient list: band = "
0174: const-string              v11, " & gain= "
0178: invoke-static             v5, v10, v11, Ln50;->o(I Ljava/lang/String; Ljava/lang/String;)Ljava/lang/StringBuilder;
017e: move-result-object        v10
0180: iget-byte                 v12, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->Gain B
0184: invoke-virtual            v10, v12, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
018a: const-string              v12, " & B0 = "
018e: invoke-virtual            v10, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0194: iget                      v13, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->B0 I
0198: invoke-static             v13, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;
019e: move-result-object        v13
01a0: invoke-virtual            v10, v13, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
01a6: const-string              v13, " & B1= "
01aa: invoke-virtual            v10, v13, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
01b0: iget                      v14, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->B1 I
01b4: invoke-static             v14, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;
01ba: move-result-object        v14
01bc: invoke-virtual            v10, v14, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
01c2: const-string              v14, " & B2= "
01c6: invoke-virtual            v10, v14, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
01cc: iget                      v15, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->B2 I
01d0: invoke-static             v15, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;
01d6: move-result-object        v15
01d8: invoke-virtual            v10, v15, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
01de: const-string              v15, " & A0= "
01e2: invoke-virtual            v10, v15, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
01e8: iget                      v3, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->A0 I
01ec: invoke-static             v3, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;
01f2: move-result-object        v3
01f4: invoke-virtual            v10, v3, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
01fa: const-string              v3, " & A1= "
01fe: invoke-virtual            v10, v3, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0204: iget                      v4, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->A1 I
0208: invoke-static             v4, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;
020e: move-result-object        v4
0210: invoke-virtual            v10, v4, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0216: invoke-virtual            v10, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
021c: move-result-object        v4
021e: invoke-static             v9, v4, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0224: aget-byte                 v4, v6, v8
0228: iput-byte                 v4, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->Gain B
022c: iget                      v4, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->B0 I
0230: shl-int/lit8              v4, v4, 8
0234: shr-int/lit8              v4, v4, 8
0238: iput                      v4, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->B0 I
023c: iget                      v4, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->B1 I
0240: shl-int/lit8              v4, v4, 8
0244: shr-int/lit8              v4, v4, 8
0248: iput                      v4, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->B1 I
024c: iget                      v4, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->B2 I
0250: shl-int/lit8              v4, v4, 8
0254: shr-int/lit8              v4, v4, 8
0258: iput                      v4, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->B2 I
025c: iget                      v4, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->A0 I
0260: shl-int/lit8              v4, v4, 8
0264: shr-int/lit8              v4, v4, 8
0268: iput                      v4, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->A0 I
026c: iget                      v4, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->A1 I
0270: shl-int/lit8              v4, v4, 8
0274: shr-int/lit8              v4, v4, 8
0278: iput                      v4, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->A1 I
027c: const-string              v4, "getF3EQCoefficientList 24bits => EQ Coefficient list: band = "
0280: invoke-static             v5, v4, v11, Ln50;->o(I Ljava/lang/String; Ljava/lang/String;)Ljava/lang/StringBuilder;
0286: move-result-object        v4
0288: iget-byte                 v6, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->Gain B
028c: invoke-virtual            v4, v6, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0292: invoke-virtual            v4, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0298: iget                      v6, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->B0 I
029c: invoke-virtual            v4, v6, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
02a2: invoke-virtual            v4, v13, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
02a8: iget                      v6, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->B1 I
02ac: invoke-virtual            v4, v6, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
02b2: invoke-virtual            v4, v14, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
02b8: iget                      v6, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->B2 I
02bc: invoke-virtual            v4, v6, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
02c2: invoke-virtual            v4, v15, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
02c8: iget                      v6, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->A0 I
02cc: invoke-virtual            v4, v6, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
02d2: invoke-virtual            v4, v3, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
02d8: iget                      v3, v7, Lcom/conexant/genericfeature/BandEQCoefficient;->A1 I
02dc: invoke-virtual            v4, v3, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
02e2: invoke-virtual            v4, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
02e8: move-result-object        v3
02ea: invoke-static             v9, v3, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
02f0: invoke-virtual            v1, v7, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
02f6: add-int/lit8              v5, v5, 1
02fa: const/4                   v3, 0
02fc: const/4                   v4, 1
02fe: goto/16                   -12dh
0302: move-object               v3, v1
0304: invoke-direct             v0, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->releaseInterfaceByBaseClass()V
030a: sget-object               v0, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
030e: new-instance              v1, Ljava/lang/StringBuilder;
0312: const-string              v2, "getF3EQCoefficientList: size = "
0316: invoke-direct             v1, v2, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
031c: invoke-interface          v3, Ljava/util/List;->size()I
0322: move-result               v2
0324: invoke-virtual            v1, v2, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
032a: invoke-virtual            v1, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
0330: move-result-object        v1
0332: invoke-static             v0, v1, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0338: return-object             v3

Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice; getFreeman3EQParam(Lcom/conexant/genericfeature/EQParam;)I
0000: const/16                  v0, 13
0004: new-array                 v0, v0, [J
0008: const-wide/16             v1, 0
000c: const/4                   v3, 0
000e: aput-wide                 v1, v0, v3
0012: iget                      v1, v9, Lcom/conexant/genericfeature/EQParam;->band I
0016: invoke-static             v1, Lcom/conexant/universalfunction/CommonUtil;->shiftEQBandForFreeman3(I)I
001c: move-result               v1
001e: int-to-long               v1, v1
0020: const/4                   v4, 1
0022: aput-wide                 v1, v0, v4
0026: const-string              v1, "CTRL"
002a: invoke-static             v1, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCafId(Ljava/lang/String;)I
0030: move-result               v1
0032: sget-object               v2, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
0036: const/16                  v5, 446
003a: invoke-static             v5, v1, v0, v2, v4, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getMsgByCmd(I I [J Landroid/hardware/usb/UsbDeviceConnection; I)[B
0040: move-result-object        v0
0042: invoke-static             v0, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->isExecuteSuccess([B)Z
0048: move-result               v1
004a: const/16                  v2, -1001
004e: if-nez                    v1, +00ah
0052: sget-object               v8, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
0056: const-string              v9, "getFreeman3EQParam: execute failure"
005a: invoke-static             v8, v9, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0060: return                    v2
0062: new-instance              v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;
0066: invoke-direct             v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;-><init>()V
006c: const/16                  v4, 22
0070: invoke-static             v0, v4, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
0076: move-result               v4
0078: iput                      v4, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B0 I
007c: const/16                  v4, 26
0080: invoke-static             v0, v4, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
0086: move-result               v4
0088: iput                      v4, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B1 I
008c: const/16                  v4, 30
0090: invoke-static             v0, v4, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
0096: move-result               v4
0098: iput                      v4, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B2 I
009c: const/16                  v4, 34
00a0: invoke-static             v0, v4, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
00a6: move-result               v4
00a8: iput                      v4, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A0 I
00ac: const/16                  v4, 38
00b0: invoke-static             v0, v4, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
00b6: move-result               v4
00b8: iput                      v4, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A1 I
00bc: const/16                  v5, 18
00c0: aget-byte                 v0, v0, v5
00c4: iput-byte                 v0, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->Gain B
00c8: iget                      v0, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B0 I
00cc: shl-int/lit8              v0, v0, 8
00d0: shr-int/lit8              v0, v0, 8
00d4: iput                      v0, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B0 I
00d8: iget                      v0, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B1 I
00dc: shl-int/lit8              v0, v0, 8
00e0: shr-int/lit8              v0, v0, 8
00e4: iput                      v0, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B1 I
00e8: iget                      v0, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B2 I
00ec: shl-int/lit8              v0, v0, 8
00f0: shr-int/lit8              v0, v0, 8
00f4: iput                      v0, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B2 I
00f8: iget                      v0, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A0 I
00fc: shl-int/lit8              v0, v0, 8
0100: shr-int/lit8              v0, v0, 8
0104: iput                      v0, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A0 I
0108: shl-int/lit8              v0, v4, 8
010c: shr-int/lit8              v0, v0, 8
0110: iput                      v0, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A1 I
0114: sget-object               v0, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
0118: new-instance              v4, Ljava/lang/StringBuilder;
011c: const-string              v5, "getFreeman3EQParam: band = "
0120: invoke-direct             v4, v5, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
0126: iget                      v6, v9, Lcom/conexant/genericfeature/EQParam;->band I
012a: invoke-virtual            v4, v6, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0130: const-string              v6, " & B0 = "
0134: invoke-virtual            v4, v6, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
013a: iget                      v6, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B0 I
013e: invoke-virtual            v4, v6, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0144: const-string              v6, " & B1= "
0148: invoke-virtual            v4, v6, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
014e: iget                      v6, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B1 I
0152: invoke-virtual            v4, v6, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0158: const-string              v6, " & B2= "
015c: invoke-virtual            v4, v6, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0162: iget                      v6, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B2 I
0166: invoke-virtual            v4, v6, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
016c: const-string              v6, " & A0= "
0170: invoke-virtual            v4, v6, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0176: iget                      v6, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A0 I
017a: invoke-virtual            v4, v6, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0180: const-string              v6, " & A1= "
0184: invoke-virtual            v4, v6, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
018a: iget                      v6, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A1 I
018e: invoke-virtual            v4, v6, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0194: const-string              v6, " & gain= "
0198: invoke-virtual            v4, v6, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
019e: iget-byte                 v6, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->Gain B
01a2: invoke-virtual            v4, v6, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
01a8: invoke-virtual            v4, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
01ae: move-result-object        v4
01b0: invoke-static             v0, v4, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
01b6: new-instance              v4, Lcom/conexant/cnxtusbcheadset/Eq2Coeff;
01ba: invoke-direct             v4, Lcom/conexant/cnxtusbcheadset/Eq2Coeff;-><init>()V
01c0: iget                      v6, v8, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->DEFAULT_FREEMAN3_SAMPLERATE I
01c4: const/16                  v7, 24
01c8: invoke-virtual            v4, v6, v1, v7, Lcom/conexant/cnxtusbcheadset/Eq2Coeff;->CxAudioConvertCoeffs2EqParams(I Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs; I)Lcom/conexant/cnxtusbcheadset/EQBandParam;
01ce: move-result-object        v1
01d0: if-nez                    v1, +008h
01d4: const-string              v8, "getFreeman3EQParam: eqParam is null"
01d8: invoke-static             v0, v8, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
01de: return                    v2
01e0: iget                      v2, v1, Lcom/conexant/cnxtusbcheadset/EQBandParam;->flags I
01e4: and-int/lit8              v2, v2, 15
01e8: iput                      v2, v9, Lcom/conexant/genericfeature/EQParam;->filterType I
01ec: iget                      v2, v1, Lcom/conexant/cnxtusbcheadset/EQBandParam;->Freq_Hz I
01f0: iput                      v2, v9, Lcom/conexant/genericfeature/EQParam;->frequency I
01f4: iget                      v2, v1, Lcom/conexant/cnxtusbcheadset/EQBandParam;->Qfactor I
01f8: int-to-float              v2, v2
01fa: const/high16              v4, 1132462080
01fe: div-float/2addr           v2, v4
0200: invoke-static             v2, Lcom/conexant/universalfunction/CommonUtil;->formatDecimal(F)D
0206: move-result-wide          v6
0208: iput-wide                 v6, v9, Lcom/conexant/genericfeature/EQParam;->qFactor D
020c: iget                      v1, v1, Lcom/conexant/cnxtusbcheadset/EQBandParam;->Gain_dB I
0210: int-to-float              v1, v1
0212: div-float/2addr           v1, v4
0214: float-to-int              v1, v1
0216: int-to-double             v1, v1
0218: iput-wide                 v1, v9, Lcom/conexant/genericfeature/EQParam;->gain D
021c: iget                      v8, v8, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->DEFAULT_FREEMAN3_SAMPLERATE I
0220: iput                      v8, v9, Lcom/conexant/genericfeature/EQParam;->sampleRate I
0224: new-instance              v8, Ljava/lang/StringBuilder;
0228: invoke-direct             v8, v5, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
022e: iget                      v1, v9, Lcom/conexant/genericfeature/EQParam;->band I
0232: invoke-virtual            v8, v1, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0238: const-string              v1, " & filterType = "
023c: invoke-virtual            v8, v1, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0242: iget                      v1, v9, Lcom/conexant/genericfeature/EQParam;->filterType I
0246: invoke-virtual            v8, v1, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
024c: const-string              v1, " & frequency = "
0250: invoke-virtual            v8, v1, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0256: iget                      v1, v9, Lcom/conexant/genericfeature/EQParam;->frequency I
025a: invoke-virtual            v8, v1, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0260: const-string              v1, " & qFactor = "
0264: invoke-virtual            v8, v1, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
026a: iget-wide                 v1, v9, Lcom/conexant/genericfeature/EQParam;->qFactor D
026e: invoke-virtual            v8, v1, v2, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;
0274: const-string              v1, " & gain = "
0278: invoke-virtual            v8, v1, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
027e: iget-wide                 v1, v9, Lcom/conexant/genericfeature/EQParam;->gain D
0282: invoke-virtual            v8, v1, v2, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;
0288: invoke-virtual            v8, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
028e: move-result-object        v8
0290: invoke-static             v0, v8, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0296: return                    v3

Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice; saveEQParamsToFlash(Lcom/conexant/genericfeature/PersistEQParams;)I
0000: move-object/from16        v0, v21
0004: iget                      v1, v0, Lcom/conexant/genericfeature/PersistEQParams;->eqModeIndex I
0008: iget-object               v0, v0, Lcom/conexant/genericfeature/PersistEQParams;->eqParams Ljava/util/List;
000c: if-nez                    v1, +015h
0010: if-eqz                    v0, +009h
0014: invoke-interface          v0, Ljava/util/List;->isEmpty()Z
001a: move-result               v2
001c: if-nez                    v2, +003h
0020: goto                      +bh
0022: sget-object               v0, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
0026: const-string              v1, "saveEQParamsToFlash: EQ param list is null"
002a: invoke-static             v0, v1, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0030: const/16                  v0, -1005
0034: return                    v0
0036: invoke-direct/range       v20, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->claimInterfaceByBaseClass()V
003c: const-string              v3, "CTRL"
0040: const/16                  v4, 220
0044: const/16                  v5, 13
0048: const/4                   v6, 0
004a: const/4                   v7, 1
004c: if-nez                    v1, +1d6h
0050: sget-object               v1, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
0054: const-string              v8, "saveEQParamsToFlash: save custom EQ!"
0058: invoke-static             v1, v8, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
005e: invoke-interface          v0, Ljava/util/List;->iterator()Ljava/util/Iterator;
0064: move-result-object        v1
0066: invoke-interface          v1, Ljava/util/Iterator;->hasNext()Z
006c: move-result               v8
006e: const/4                   v11, 2
0070: const/4                   v12, 4
0072: const-wide/high16         v13, 4643211215818981376
0076: if-eqz                    v8, +05ah
007a: invoke-interface          v1, Ljava/util/Iterator;->next()Ljava/lang/Object;
0080: move-result-object        v8
0082: check-cast                v8, Lcom/conexant/genericfeature/EQParam;
0086: move-object               v15, v3
0088: const/16                  v21, -1001
008c: iget-wide                 v2, v8, Lcom/conexant/genericfeature/EQParam;->qFactor D
0090: mul-double/2addr          v2, v13
0092: double-to-long            v2, v2
0094: new-array                 v13, v5, [J
0098: const-wide/16             v16, 0
009c: aput-wide                 v16, v13, v6
00a0: iget                      v14, v8, Lcom/conexant/genericfeature/EQParam;->band I
00a4: const/16                  v16, 5
00a8: const/16                  v17, 3
00ac: int-to-long               v9, v14
00ae: aput-wide                 v9, v13, v7
00b2: iget                      v9, v8, Lcom/conexant/genericfeature/EQParam;->frequency I
00b6: int-to-long               v9, v9
00b8: aput-wide                 v9, v13, v11
00bc: aput-wide                 v2, v13, v17
00c0: iget                      v2, v8, Lcom/conexant/genericfeature/EQParam;->filterType I
00c4: int-to-long               v2, v2
00c6: aput-wide                 v2, v13, v12
00ca: iget-wide                 v2, v8, Lcom/conexant/genericfeature/EQParam;->gain D
00ce: double-to-long            v2, v2
00d0: aput-wide                 v2, v13, v16
00d4: invoke-static             v15, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCafId(Ljava/lang/String;)I
00da: move-result               v2
00dc: invoke-static             v4, v2, v13, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCmd(I I [J)Lcom/conexant/universalfunction/CnxtUsbCommand;
00e2: move-result-object        v2
00e4: sget-object               v3, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
00e8: invoke-static             v3, v2, v7, v7, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->writeGolemCmdToDevice(Landroid/hardware/usb/UsbDeviceConnection; Lcom/conexant/universalfunction/CnxtUsbCommand; I Z)Z
00ee: move-result               v2
00f0: sget-object               v3, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
00f4: new-instance              v8, Ljava/lang/StringBuilder;
00f8: const-string              v9, "saveEQParamsToFlash: save eq parameter ->  res: "
00fc: invoke-direct             v8, v9, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
0102: invoke-virtual            v8, v2, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
0108: invoke-virtual            v8, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
010e: move-result-object        v8
0110: invoke-static             v3, v8, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0116: if-nez                    v2, +008h
011a: const-string              v0, "saveEQParamsToFlash: save eq parameter fail!"
011e: invoke-static             v3, v0, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0124: return                    v21
0126: move-object               v3, v15
0128: goto                      -61h
012a: move-object               v15, v3
012c: const/16                  v21, -1001
0130: const/16                  v16, 5
0134: const/16                  v17, 3
0138: invoke-interface          v0, Ljava/util/List;->iterator()Ljava/util/Iterator;
013e: move-result-object        v0
0140: invoke-interface          v0, Ljava/util/Iterator;->hasNext()Z
0146: move-result               v1
0148: if-eqz                    v1, +15bh
014c: invoke-interface          v0, Ljava/util/Iterator;->next()Ljava/lang/Object;
0152: move-result-object        v1
0154: check-cast                v1, Lcom/conexant/genericfeature/EQParam;
0158: sget-object               v2, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
015c: new-instance              v3, Ljava/lang/StringBuilder;
0160: const-string              v8, "saveEQParamsToFlash: save coefficient -> band index: "
0164: invoke-direct             v3, v8, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
016a: iget                      v8, v1, Lcom/conexant/genericfeature/EQParam;->band I
016e: invoke-virtual            v3, v8, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0174: invoke-virtual            v3, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
017a: move-result-object        v3
017c: invoke-static             v2, v3, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0182: new-instance              v2, Lcom/conexant/cnxtusbcheadset/EQBandParam;
0186: invoke-direct             v2, Lcom/conexant/cnxtusbcheadset/EQBandParam;-><init>()V
018c: iget                      v3, v1, Lcom/conexant/genericfeature/EQParam;->filterType I
0190: iput                      v3, v2, Lcom/conexant/cnxtusbcheadset/EQBandParam;->flags I
0194: iget                      v3, v1, Lcom/conexant/genericfeature/EQParam;->frequency I
0198: iput                      v3, v2, Lcom/conexant/cnxtusbcheadset/EQBandParam;->Freq_Hz I
019c: iget-wide                 v8, v1, Lcom/conexant/genericfeature/EQParam;->gain D
01a0: mul-double/2addr          v8, v13
01a2: double-to-int             v3, v8
01a4: iput                      v3, v2, Lcom/conexant/cnxtusbcheadset/EQBandParam;->Gain_dB I
01a8: iget-wide                 v8, v1, Lcom/conexant/genericfeature/EQParam;->qFactor D
01ac: mul-double/2addr          v8, v13
01ae: double-to-int             v3, v8
01b0: iput                      v3, v2, Lcom/conexant/cnxtusbcheadset/EQBandParam;->Qfactor I
01b4: move                      v3, v12
01b6: const/16                  v8, 8
01ba: if-gt                     v3, v8, -03dh
01be: sget-object               v9, Lcom/conexant/universalfunction/CnxtUsbConstants;->FREQ_SAMPLE_RATE [I
01c2: aget                      v9, v9, v3
01c6: sget-object               v10, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
01ca: move/from16               v18, v11
01ce: const-string              v11, " -> "
01d2: move/from16               v19, v12
01d6: const-string              v12, " & bandIndex: "
01da: const-string              v13, "saveEQParamsToFlash: save coefficient -> sampleRateIndex: "
01de: invoke-static             v13, v3, v11, v9, v12, Ln50;->q(Ljava/lang/String; I Ljava/lang/String; I Ljava/lang/String;)Ljava/lang/StringBuilder;
01e4: move-result-object        v11
01e6: iget                      v12, v1, Lcom/conexant/genericfeature/EQParam;->band I
01ea: invoke-virtual            v11, v12, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
01f0: const-string              v12, " & gain:"
01f4: invoke-virtual            v11, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
01fa: iget-wide                 v12, v1, Lcom/conexant/genericfeature/EQParam;->gain D
01fe: invoke-virtual            v11, v12, v13, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;
0204: invoke-virtual            v11, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
020a: move-result-object        v11
020c: invoke-static             v10, v11, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0212: new-instance              v11, Lcom/conexant/cnxtusbcheadset/Eq2Coeff;
0216: invoke-direct             v11, Lcom/conexant/cnxtusbcheadset/Eq2Coeff;-><init>()V
021c: const/16                  v12, 24
0220: invoke-virtual            v11, v9, v2, v12, Lcom/conexant/cnxtusbcheadset/Eq2Coeff;->CxAudioConvertEqParams2Coeffs(I Lcom/conexant/cnxtusbcheadset/EQBandParam; I)Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;
0226: move-result-object        v9
0228: if-nez                    v9, +008h
022c: const-string              v0, "saveEQParamsToFlash: save coefficient -> eqCoeff == null"
0230: invoke-static             v10, v0, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0236: return                    v21
0238: new-instance              v11, Ljava/lang/StringBuilder;
023c: const-string              v12, "saveEQParamsToFlash: save coefficient -> convert eq to coefficient: band:"
0240: invoke-direct             v11, v12, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
0246: iget                      v12, v1, Lcom/conexant/genericfeature/EQParam;->band I
024a: invoke-virtual            v11, v12, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0250: const-string              v12, " & param.gain:"
0254: invoke-virtual            v11, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
025a: iget-wide                 v12, v1, Lcom/conexant/genericfeature/EQParam;->gain D
025e: invoke-virtual            v11, v12, v13, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;
0264: const-string              v12, " & pEQCoeff.Gain:"
0268: invoke-virtual            v11, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
026e: iget-byte                 v12, v9, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->Gain B
0272: invoke-virtual            v11, v12, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0278: const-string              v12, " & B0:"
027c: invoke-virtual            v11, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0282: iget                      v12, v9, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B0 I
0286: invoke-static             v12, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;
028c: move-result-object        v12
028e: invoke-virtual            v11, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0294: const-string              v12, " & B1:"
0298: invoke-virtual            v11, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
029e: iget                      v12, v9, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B1 I
02a2: invoke-static             v12, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;
02a8: move-result-object        v12
02aa: invoke-virtual            v11, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
02b0: const-string              v12, " & B2:"
02b4: invoke-virtual            v11, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
02ba: iget                      v12, v9, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B2 I
02be: invoke-static             v12, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;
02c4: move-result-object        v12
02c6: invoke-virtual            v11, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
02cc: const-string              v12, " & A0:"
02d0: invoke-virtual            v11, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
02d6: iget                      v12, v9, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A0 I
02da: invoke-static             v12, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;
02e0: move-result-object        v12
02e2: invoke-virtual            v11, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
02e8: const-string              v12, " & A1:"
02ec: invoke-virtual            v11, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
02f2: iget                      v12, v9, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A1 I
02f6: invoke-static             v12, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;
02fc: move-result-object        v12
02fe: invoke-virtual            v11, v12, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0304: invoke-virtual            v11, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
030a: move-result-object        v11
030c: invoke-static             v10, v11, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0312: new-array                 v11, v5, [J
0316: int-to-long               v12, v3
0318: aput-wide                 v12, v11, v6
031c: iget                      v12, v1, Lcom/conexant/genericfeature/EQParam;->band I
0320: int-to-long               v12, v12
0322: aput-wide                 v12, v11, v7
0326: iget-byte                 v12, v9, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->Gain B
032a: int-to-long               v12, v12
032c: aput-wide                 v12, v11, v18
0330: iget                      v12, v9, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B0 I
0334: int-to-long               v12, v12
0336: aput-wide                 v12, v11, v17
033a: iget                      v12, v9, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B1 I
033e: int-to-long               v12, v12
0340: aput-wide                 v12, v11, v19
0344: iget                      v12, v9, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B2 I
0348: int-to-long               v12, v12
034a: aput-wide                 v12, v11, v16
034e: iget                      v12, v9, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A0 I
0352: int-to-long               v12, v12
0354: const/4                   v14, 6
0356: aput-wide                 v12, v11, v14
035a: iget                      v9, v9, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A1 I
035e: int-to-long               v12, v9
0360: const/4                   v9, 7
0362: aput-wide                 v12, v11, v9
0366: invoke-static             v15, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCafId(Ljava/lang/String;)I
036c: move-result               v9
036e: invoke-static             v4, v9, v11, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCmd(I I [J)Lcom/conexant/universalfunction/CnxtUsbCommand;
0374: move-result-object        v9
0376: iget                      v11, v1, Lcom/conexant/genericfeature/EQParam;->band I
037a: const/16                  v12, 9
037e: if-ne                     v11, v12, +01ch
0382: if-ne                     v3, v8, +01ah
0386: sget-object               v8, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
038a: invoke-static             v8, v9, v7, v7, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->writeGolemCmdToDevice(Landroid/hardware/usb/UsbDeviceConnection; Lcom/conexant/universalfunction/CnxtUsbCommand; I Z)Z
0390: move-result               v8
0392: new-instance              v9, Ljava/lang/StringBuilder;
0396: const-string              v11, "saveEQParamsToFlash: send save coefficient list -> last eq result is: "
039a: invoke-direct             v9, v11, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
03a0: invoke-virtual            v9, v8, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
03a6: invoke-virtual            v9, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
03ac: move-result-object        v8
03ae: invoke-static             v10, v8, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
03b4: goto                      +18h
03b6: sget-object               v8, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
03ba: invoke-static             v8, v9, v7, v6, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->writeGolemCmdToDevice(Landroid/hardware/usb/UsbDeviceConnection; Lcom/conexant/universalfunction/CnxtUsbCommand; I Z)Z
03c0: move-result               v8
03c2: new-instance              v9, Ljava/lang/StringBuilder;
03c6: const-string              v11, "saveEQParamsToFlash: send save coefficient list -> cmd 0~43:res: "
03ca: invoke-direct             v9, v11, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
03d0: invoke-virtual            v9, v8, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
03d6: invoke-virtual            v9, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
03dc: move-result-object        v8
03de: invoke-static             v10, v8, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
03e4: add-int/lit8              v3, v3, 1
03e8: move/from16               v11, v18
03ec: move/from16               v12, v19
03f0: const-wide/high16         v13, 4643211215818981376
03f4: goto/16                   -11fh
03f8: move-object               v15, v3
03fa: const/16                  v21, -1001
03fe: new-array                 v0, v5, [J
0402: const-wide/16             v1, 255
0406: aput-wide                 v1, v0, v6
040a: invoke-static             v15, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCafId(Ljava/lang/String;)I
0410: move-result               v1
0412: invoke-static             v4, v1, v0, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCmd(I I [J)Lcom/conexant/universalfunction/CnxtUsbCommand;
0418: move-result-object        v0
041a: sget-object               v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
041e: invoke-static             v1, v0, v7, v7, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->writeGolemCmdToDevice(Landroid/hardware/usb/UsbDeviceConnection; Lcom/conexant/universalfunction/CnxtUsbCommand; I Z)Z
0424: move-result               v0
0426: sget-object               v1, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
042a: new-instance              v2, Ljava/lang/StringBuilder;
042e: const-string              v3, "saveEQParamsToFlash: do save option result: "
0432: invoke-direct             v2, v3, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
0438: invoke-virtual            v2, v0, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
043e: invoke-virtual            v2, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
0444: move-result-object        v2
0446: invoke-static             v1, v2, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
044c: invoke-direct/range       v20, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->releaseInterfaceByBaseClass()V
0452: if-eqz                    v0, +003h
0456: return                    v6
0458: return                    v21

Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice; setEQParam(Lcom/conexant/genericfeature/EQParam;)I
0000: if-eqz                    v15, +0d4h
0004: iget                      v0, v15, Lcom/conexant/genericfeature/EQParam;->band I
0008: if-ltz                    v0, +0d0h
000c: const/4                   v1, 4
000e: const-string              v2, "Freeman3"
0012: if-le                     v0, v1, +00ah
0016: iget-object               v0, v14, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mDeviceName Ljava/lang/String;
001a: invoke-virtual            v0, v2, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0020: move-result               v0
0022: if-nez                    v0, +0c3h
0026: iget-object               v0, v14, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mDeviceName Ljava/lang/String;
002a: invoke-virtual            v0, Ljava/lang/Object;->getClass()Ljava/lang/Class;
0030: invoke-virtual            v0, Ljava/lang/String;->hashCode()I
0036: move-result               v1
0038: const/4                   v3, 1
003a: const/4                   v4, 0
003c: const/4                   v5, -1
003e: sparse-switch             v1, +00000bfh
0044: goto                      +1fh
0046: const-string              v1, "Freeman"
004a: invoke-virtual            v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0050: move-result               v0
0052: if-nez                    v0, +003h
0056: goto                      +16h
0058: const/4                   v5, 2
005a: goto                      +14h
005c: invoke-virtual            v0, v2, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0062: move-result               v0
0064: if-nez                    v0, +003h
0068: goto                      +dh
006a: move                      v5, v3
006c: goto                      +bh
006e: const-string              v1, "Freeman2"
0072: invoke-virtual            v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0078: move-result               v0
007a: if-nez                    v0, +003h
007e: goto                      +2h
0080: move                      v5, v4
0082: packed-switch             v5, +00000abh
0088: move-object               v5, v14
008a: move                      v14, v4
008c: goto/16                   +079h
0090: iget                      v7, v15, Lcom/conexant/genericfeature/EQParam;->sampleRate I
0094: iget                      v8, v15, Lcom/conexant/genericfeature/EQParam;->band I
0098: iget                      v9, v15, Lcom/conexant/genericfeature/EQParam;->frequency I
009c: iget-wide                 v10, v15, Lcom/conexant/genericfeature/EQParam;->qFactor D
00a0: iget-wide                 v0, v15, Lcom/conexant/genericfeature/EQParam;->gain D
00a4: double-to-float           v12, v0
00a6: iget                      v13, v15, Lcom/conexant/genericfeature/EQParam;->filterType I
00aa: move-object               v6, v14
00ac: invoke-direct/range       v6 ... v13, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->setFreemanEQ(I I I D F I)Z
00b2: move-result               v14
00b4: move-object               v5, v6
00b6: goto                      +64h
00b8: move-object               v5, v14
00ba: sget-object               v14, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
00be: new-instance              v0, Ljava/lang/StringBuilder;
00c2: const-string              v1, "setEQParam: mFreeman3EQEnabled = "
00c6: invoke-direct             v0, v1, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
00cc: iget-boolean              v1, v5, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->mFreeman3EQEnabled Z
00d0: invoke-virtual            v0, v1, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
00d6: invoke-virtual            v0, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
00dc: move-result-object        v0
00de: invoke-static             v14, v0, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
00e4: iget-boolean              v14, v5, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->mFreeman3EQEnabled Z
00e8: if-nez                    v14, +008h
00ec: invoke-direct             v5, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->setFreeman3EQEnabled()V
00f2: invoke-direct             v5, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->setEQCFGIsBypass()V
00f8: invoke-direct             v5, v15, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->setFreeman3EQ(Lcom/conexant/genericfeature/EQParam;)Z
00fe: move-result               v14
0100: goto                      +3fh
0102: move-object               v5, v14
0104: iget                      v7, v15, Lcom/conexant/genericfeature/EQParam;->band I
0108: iget                      v8, v15, Lcom/conexant/genericfeature/EQParam;->frequency I
010c: iget-wide                 v9, v15, Lcom/conexant/genericfeature/EQParam;->qFactor D
0110: iget-wide                 v0, v15, Lcom/conexant/genericfeature/EQParam;->gain D
0114: double-to-float           v11, v0
0116: iget                      v12, v15, Lcom/conexant/genericfeature/EQParam;->filterType I
011a: const                     v6, 96000
0120: invoke-direct/range       v5 ... v12, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->setFreemanEQ(I I I D F I)Z
0126: move-result               v14
0128: iget                      v7, v15, Lcom/conexant/genericfeature/EQParam;->band I
012c: iget                      v8, v15, Lcom/conexant/genericfeature/EQParam;->frequency I
0130: iget-wide                 v9, v15, Lcom/conexant/genericfeature/EQParam;->qFactor D
0134: iget-wide                 v0, v15, Lcom/conexant/genericfeature/EQParam;->gain D
0138: double-to-float           v11, v0
013a: iget                      v12, v15, Lcom/conexant/genericfeature/EQParam;->filterType I
013e: const                     v6, 44100
0144: invoke-direct/range       v5 ... v12, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->setFreemanEQ(I I I D F I)Z
014a: move-result               v0
014c: iget                      v7, v15, Lcom/conexant/genericfeature/EQParam;->band I
0150: iget                      v8, v15, Lcom/conexant/genericfeature/EQParam;->frequency I
0154: iget-wide                 v9, v15, Lcom/conexant/genericfeature/EQParam;->qFactor D
0158: iget-wide                 v11, v15, Lcom/conexant/genericfeature/EQParam;->gain D
015c: double-to-float           v11, v11
015e: iget                      v12, v15, Lcom/conexant/genericfeature/EQParam;->filterType I
0162: const                     v6, 48000
0168: invoke-direct/range       v5 ... v12, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->setFreemanEQ(I I I D F I)Z
016e: move-result               v15
0170: if-eqz                    v14, -073h
0174: if-eqz                    v0, -075h
0178: if-eqz                    v15, -077h
017c: move                      v14, v3
017e: iget-boolean              v15, v5, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->mEQEnabled Z
0182: if-nez                    v15, +00dh
0186: iget-object               v15, v5, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mDeviceName Ljava/lang/String;
018a: invoke-virtual            v15, v2, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0190: move-result               v15
0192: if-nez                    v15, +005h
0196: invoke-virtual            v5, v3, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->setEQEnabled(Z)V
019c: if-eqz                    v14, +003h
01a0: return                    v4
01a2: const/16                  v14, -1001
01a6: return                    v14
01a8: sget-object               v14, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
01ac: const-string              v15, "setEQParam: RC_INVALID_PARAMETER"
01b0: invoke-static             v14, v15, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
01b6: const/16                  v14, -1005
01ba: return                    v14
01bc: sparse-switch-payload     -57cb955c -57cb955b 3f3b7f4e
01d8: packed-switch-payload     0 1 2
