
Lcom/conexant/cnxtusbcheadset/ANCTuningParam; <clinit>()V code_off=0x598e20
0000: new-instance               v0, Lcom/conexant/cnxtusbcheadset/ANCTuningParam$1;
0004: invoke-direct              v0, Lcom/conexant/cnxtusbcheadset/ANCTuningParam$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/cnxtusbcheadset/ANCTuningParam;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/cnxtusbcheadset/AvailableMode; <clinit>()V code_off=0x59902c
0000: new-instance               v0, Lcom/conexant/cnxtusbcheadset/AvailableMode$1;
0004: invoke-direct              v0, Lcom/conexant/cnxtusbcheadset/AvailableMode$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/cnxtusbcheadset/AvailableMode;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/cnxtusbcheadset/AvailableModeList; <clinit>()V code_off=0x598fb4
0000: new-instance               v0, Lcom/conexant/cnxtusbcheadset/AvailableModeList$1;
0004: invoke-direct              v0, Lcom/conexant/cnxtusbcheadset/AvailableModeList$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/cnxtusbcheadset/AvailableModeList;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/cnxtusbcheadset/CafCmdHelper; <clinit>()V code_off=0x5996dc
0000: new-instance               v0, Ljava/util/ArrayList;
0004: invoke-direct              v0, Ljava/util/ArrayList;-><init>()V
000a: sput-object                v0, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->mInterfaceStateListeners Ljava/util/List;
000e: const/4                    v0, 0
0010: sput-object                v0, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->mTimer Ljava/util/Timer;
0014: sput-object                v0, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->mTimerTask Ljava/util/TimerTask;
0018: return-void                

Lcom/conexant/cnxtusbcheadset/CafCmdHelper; readDataFromDevice(I I [J Landroid/hardware/usb/UsbDeviceConnection; I)[B code_off=0x5994b4
0000: if-nez                     v16, +004h
0004: const/4                    v13, 0
0006: return-object              v13
0008: invoke-static/range        v13 ... v15, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCmd(I I [J)Lcom/conexant/universalfunction/CnxtUsbCommand;
000e: move-result-object         v13
0010: move/from16                v14, v17
0014: invoke-virtual             v13, v14, Lcom/conexant/universalfunction/CnxtUsbCommand;->getUSBMessage(I)[B
001a: move-result-object         v6
001c: const/16                   v4, 513
0020: const/4                    v5, 3
0022: const/16                   v2, 33
0026: const/16                   v3, 9
002a: move-object/from16         v1, v16
002e: invoke-static/range        v1 ... v6, Lcom/conexant/cnxtusbcheadset/UsbHelper;->sendHIDReport(Landroid/hardware/usb/UsbDeviceConnection; I I I I [B)I
0034: array-length               v13, v6
0036: new-array                  v12, v13, [B
003a: const/16                   v10, 257
003e: const/4                    v11, 3
0040: const/16                   v8, 161
0044: const/4                    v9, 1
0046: move-object/from16         v7, v16
004a: invoke-static/range        v7 ... v12, Lcom/conexant/cnxtusbcheadset/UsbHelper;->receiveHIDReport(Landroid/hardware/usb/UsbDeviceConnection; I I I I [B)[B
0050: new-instance               v13, Ljava/util/Date;
0054: invoke-static              Ljava/lang/System;->currentTimeMillis()J
005a: move-result-wide           v14
005c: invoke-direct              v13, v14, v15, Ljava/util/Date;-><init>(J)V
0062: const-wide/16              v14, 0
0066: const/4                    v0, 5
0068: aget-byte                  v0, v12, v0
006c: and-int/lit16              v0, v0, 128
0070: shr-int/lit8               v0, v0, 7
0074: const/4                    v1, 1
0076: if-eq                      v1, v0, +038h
007a: const-wide/16              v0, 1000
007e: cmp-long                   v14, v14, v0
0082: if-gez                     v14, +032h
0086: const/16                   v10, 257
008a: const/4                    v11, 3
008c: const/16                   v8, 161
0090: const/4                    v9, 1
0092: move-object/from16         v7, v16
0096: invoke-static/range        v7 ... v12, Lcom/conexant/cnxtusbcheadset/UsbHelper;->receiveHIDReport(Landroid/hardware/usb/UsbDeviceConnection; I I I I [B)[B
009c: sget-object                v14, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->TAG Ljava/lang/String;
00a0: const-string               v15, "readDataFromDevice: receiveHIDReport"
00a4: invoke-static              v14, v15, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
00aa: const-wide/16              v14, 5
00ae: invoke-static              v14, v15, Ljava/lang/Thread;->sleep(J)V
00b4: goto                       +6h
00b6: move-exception             v0
00b8: move-object                v14, v0
00ba: invoke-virtual             v14, Ljava/lang/Throwable;->printStackTrace()V
00c0: new-instance               v14, Ljava/util/Date;
00c4: invoke-static              Ljava/lang/System;->currentTimeMillis()J
00ca: move-result-wide           v0
00cc: invoke-direct              v14, v0, v1, Ljava/util/Date;-><init>(J)V
00d2: invoke-virtual             v14, Ljava/util/Date;->getTime()J
00d8: move-result-wide           v14
00da: invoke-virtual             v13, Ljava/util/Date;->getTime()J
00e0: move-result-wide           v0
00e2: sub-long/2addr             v14, v0
00e4: goto                       -3fh
00e6: return-object              v12

Lcom/conexant/cnxtusbcheadset/CafCmdHelper; writeGolemCmdToDevice(Landroid/hardware/usb/UsbDeviceConnection; Lcom/conexant/universalfunction/CnxtUsbCommand; I Z)Z code_off=0x599240
0000: if-nez                     v14, +004h
0004: const/4                    v14, 0
0006: return                     v14
0008: const/4                    v1, 1
000a: invoke-virtual/range       v15 ... v16, Lcom/conexant/universalfunction/CnxtUsbCommand;->getUSBMessage(I)[B
0010: move-result-object         v7
0012: const/16                   v5, 513
0016: const/4                    v6, 3
0018: const/16                   v3, 33
001c: const/16                   v4, 9
0020: move-object                v2, v14
0022: invoke-static/range        v2 ... v7, Lcom/conexant/cnxtusbcheadset/UsbHelper;->sendHIDReport(Landroid/hardware/usb/UsbDeviceConnection; I I I I [B)I
0028: array-length               v15, v7
002a: new-array                  v13, v15, [B
002e: const/16                   v11, 257
0032: const/4                    v12, 3
0034: const/16                   v9, 161
0038: const/4                    v10, 1
003a: move-object                v8, v14
003c: invoke-static/range        v8 ... v13, Lcom/conexant/cnxtusbcheadset/UsbHelper;->receiveHIDReport(Landroid/hardware/usb/UsbDeviceConnection; I I I I [B)[B
0042: if-eqz                     v17, +06dh
0046: new-instance               v15, Ljava/util/Date;
004a: invoke-static              Ljava/lang/System;->currentTimeMillis()J
0050: move-result-wide           v2
0052: invoke-direct              v15, v2, v3, Ljava/util/Date;-><init>(J)V
0058: const-wide/16              v2, 0
005c: const/4                    v0, 5
005e: aget-byte                  v0, v13, v0
0062: and-int/lit16              v0, v0, 128
0066: shr-int/lit8               v0, v0, 7
006a: if-eq                      v1, v0, +032h
006e: const-wide/16              v4, 1000
0072: cmp-long                   v0, v2, v4
0076: if-gez                     v0, +02ch
007a: const/16                   v11, 257
007e: const/4                    v12, 3
0080: const/16                   v9, 161
0084: const/4                    v10, 1
0086: move-object                v8, v14
0088: invoke-static/range        v8 ... v13, Lcom/conexant/cnxtusbcheadset/UsbHelper;->receiveHIDReport(Landroid/hardware/usb/UsbDeviceConnection; I I I I [B)[B
008e: const-wide/16              v2, 5
0092: invoke-static              v2, v3, Ljava/lang/Thread;->sleep(J)V
0098: goto                       +8h
009a: move-exception             v0
009c: move-object                v14, v0
009e: goto                       +34h
00a0: move-exception             v0
00a2: invoke-virtual             v0, Ljava/lang/Throwable;->printStackTrace()V
00a8: new-instance               v0, Ljava/util/Date;
00ac: invoke-static              Ljava/lang/System;->currentTimeMillis()J
00b2: move-result-wide           v2
00b4: invoke-direct              v0, v2, v3, Ljava/util/Date;-><init>(J)V
00ba: invoke-virtual             v0, Ljava/util/Date;->getTime()J
00c0: move-result-wide           v2
00c2: invoke-virtual             v15, Ljava/util/Date;->getTime()J
00c8: move-result-wide           v4
00ca: sub-long/2addr             v2, v4
00cc: goto                       -38h
00ce: invoke-static              v13, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->isExecuteSuccess([B)Z
00d4: move-result                v14
00d6: sget-object                v15, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->TAG Ljava/lang/String;
00da: new-instance               v0, Ljava/lang/StringBuilder;
00de: invoke-direct              v0, Ljava/lang/StringBuilder;-><init>()V
00e4: const-string/jumbo         v2, writeGolemCmdToDevice: isSuccess: 
00ea: invoke-virtual             v0, v2, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
00f0: invoke-virtual             v0, v14, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
00f6: invoke-virtual             v0, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
00fc: move-result-object         v0
00fe: invoke-static              v15, v0, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0104: return                     v14
0106: invoke-virtual             v14, Ljava/lang/Throwable;->printStackTrace()V
010c: sget-object                v15, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->TAG Ljava/lang/String;
0110: const-string/jumbo         v0, writeGolemCmdToDevice ClaimInterface: 
0116: invoke-static              v15, v0, v14, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String; Ljava/lang/Throwable;)I
011c: return                     v1

Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase; checkIsCnxtUsbDevice()Z code_off=0x59999c
0000: sget-object                v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->TAG Ljava/lang/String;
0004: const-string               v1, "checkIsCnxtUsbDevice: "
0008: invoke-static              v0, v1, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
000e: iget-boolean               v1, v3, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mHasConnectedByNative Z
0012: if-nez                     v1, +013h
0016: const-string               v1, "checkIsCnxtUsbDevice: disConnectUsbDeviceByApplication"
001a: invoke-static              v0, v1, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0020: sget-object                v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mHidInterface Landroid/hardware/usb/UsbInterface;
0024: if-eqz                     v1, +005h
0028: invoke-virtual             v3, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->disConnectUsbDeviceByApplication()I
002e: const-string               v1, "checkIsCnxtUsbDevice: disConnectUsbDeviceByApplication finished"
0032: invoke-static              v0, v1, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0038: new-instance               v1, Lcom/syna/FirmwareUpdate;
003c: invoke-direct              v1, Lcom/syna/FirmwareUpdate;-><init>()V
0042: iput-object                v1, v3, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mUpdateFirmware Lcom/syna/FirmwareUpdate;
0046: sget-object                v2, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
004a: invoke-virtual             v2, Landroid/hardware/usb/UsbDeviceConnection;->getFileDescriptor()I
0050: move-result                v2
0052: invoke-virtual             v1, v2, Lcom/syna/FirmwareUpdate;->connectSynaDevice(I)Z
0058: move-result                v1
005a: if-eqz                     v1, +00bh
005e: const-string               v1, "checkIsCnxtUsbDevice: mHasConnectedByNative is true"
0062: invoke-static              v0, v1, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0068: const/4                    v0, 1
006a: iput-boolean               v0, v3, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mHasConnectedByNative Z
006e: return                     v0
0070: const/4                    v3, 0
0072: return                     v3

Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase; connectUsbDeviceByApplication()Z code_off=0x599a20
0000: const/4                    v0, 0
0002: const/4                    v1, 0
0004: move                       v2, v1
0006: iget-object                v3, v7, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mUsbDevice Landroid/hardware/usb/UsbDevice;
000a: invoke-virtual             v3, Landroid/hardware/usb/UsbDevice;->getInterfaceCount()I
0010: move-result                v3
0012: const/4                    v4, 1
0014: if-ge                      v2, v3, +03eh
0018: iget-object                v3, v7, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mUsbDevice Landroid/hardware/usb/UsbDevice;
001c: invoke-virtual             v3, v2, Landroid/hardware/usb/UsbDevice;->getInterface(I)Landroid/hardware/usb/UsbInterface;
0022: move-result-object         v3
0024: invoke-virtual             v3, Landroid/hardware/usb/UsbInterface;->getInterfaceClass()I
002a: move-result                v5
002c: const/4                    v6, 3
002e: if-ne                      v5, v6, +02eh
0032: invoke-virtual             v3, Landroid/hardware/usb/UsbInterface;->getInterfaceSubclass()I
0038: move-result                v5
003a: if-nez                     v5, +028h
003e: invoke-virtual             v3, Landroid/hardware/usb/UsbInterface;->getInterfaceProtocol()I
0044: move-result                v5
0046: if-nez                     v5, +022h
004a: invoke-virtual             v3, Landroid/hardware/usb/UsbInterface;->getId()I
0050: move-result                v5
0052: if-ne                      v5, v6, +00ch
0056: invoke-virtual             v3, Landroid/hardware/usb/UsbInterface;->getEndpointCount()I
005c: move-result                v0
005e: if-eqz                     v0, +005h
0062: invoke-virtual             v3, v1, Landroid/hardware/usb/UsbInterface;->getEndpoint(I)Landroid/hardware/usb/UsbEndpoint;
0068: move-object                v0, v3
006a: invoke-virtual             v3, Landroid/hardware/usb/UsbInterface;->getId()I
0070: move-result                v3
0072: const/4                    v5, 4
0074: if-ne                      v3, v5, +00bh
0078: sget-object                v3, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->TAG Ljava/lang/String;
007c: const-string               v5, "connectUsbDeviceByApplication: is dual interface"
0080: invoke-static              v3, v5, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0086: iput-boolean               v4, v7, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mIsDualInterface Z
008a: add-int/lit8               v2, v2, 1
008e: goto                       -44h
0090: if-eqz                     v0, +013h
0094: sget-object                v7, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
0098: invoke-virtual             v7, v0, v4, Landroid/hardware/usb/UsbDeviceConnection;->claimInterface(Landroid/hardware/usb/UsbInterface; Z)Z
009e: move-result                v7
00a0: if-eqz                     v7, +00bh
00a4: sget-object                v7, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->TAG Ljava/lang/String;
00a8: const-string               v1, "connectUsbDeviceByApplication: claim Interface"
00ac: invoke-static              v7, v1, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
00b2: sput-object                v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mHidInterface Landroid/hardware/usb/UsbInterface;
00b6: return                     v4

Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase; disConnectUsbDeviceByApplication()I code_off=0x599c24
0000: sget-object                v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mHidInterface Landroid/hardware/usb/UsbInterface;
0004: if-eqz                     v0, +009h
0008: sget-object                v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
000c: invoke-virtual             v1, v0, Landroid/hardware/usb/UsbDeviceConnection;->releaseInterface(Landroid/hardware/usb/UsbInterface;)Z
0012: move-result                v0
0014: goto                       +2h
0016: const/4                    v0, 1
0018: iget-boolean               v1, v3, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mIsDualInterface Z
001c: const/4                    v2, 0
001e: if-nez                     v1, +00bh
0022: iget-object                v1, v3, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mHidReader Lcom/conexant/cnxtusbcheadset/HidInterruptReader;
0026: if-eqz                     v1, +007h
002a: invoke-virtual             v1, Lcom/conexant/cnxtusbcheadset/HidInterruptReader;->stopHidReport()V
0030: iput-object                v2, v3, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mHidEndpoint Landroid/hardware/usb/UsbEndpoint;
0034: sput-object                v2, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mHidInterface Landroid/hardware/usb/UsbInterface;
0038: if-eqz                     v0, +004h
003c: const/4                    v3, 0
003e: return                     v3
0040: const/16                   v3, -1003
0044: return                     v3

Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase; getDeviceChipCode()I code_off=0x0

Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase; getDeviceName()Ljava/lang/String; code_off=0x599cf8
0000: iget-object                v0, v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mDeviceName Ljava/lang/String;
0004: return-object              v0

Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase; getFirmwareParam(Lcom/syna/FirmwareParam;)V code_off=0x599d8c
0000: invoke-direct              v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->checkIsCnxtUsbDevice()Z
0006: move-result                v0
0008: if-eqz                     v0, +06ch
000c: iget-object                v0, v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mUpdateFirmware Lcom/syna/FirmwareUpdate;
0010: invoke-virtual             v0, Lcom/syna/FirmwareUpdate;->claimSynaDeviceInterface()Z
0016: move-result                v0
0018: if-nez                     v0, +00ah
001c: sget-object                v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->TAG Ljava/lang/String;
0020: const-string               v5, "getFirmwareParam: claim Hid interface failed"
0024: invoke-static              v4, v5, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
002a: return-void                
002c: iget-object                v0, v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mUpdateFirmware Lcom/syna/FirmwareUpdate;
0030: invoke-virtual             v0, Lcom/syna/FirmwareUpdate;->getSynaDeviceInfo()Lcom/syna/FirmwareParam;
0036: move-result-object         v0
0038: sget-object                v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->TAG Ljava/lang/String;
003c: new-instance               v2, Ljava/lang/StringBuilder;
0040: const-string               v3, "getFirmwareParam: "
0044: invoke-direct              v2, v3, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
004a: invoke-virtual             v5, Lcom/syna/FirmwareParam;->getManufacture()Ljava/lang/String;
0050: move-result-object         v3
0052: invoke-virtual             v2, v3, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0058: const-string               v3, " # "
005c: invoke-virtual             v2, v3, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0062: invoke-virtual             v5, Lcom/syna/FirmwareParam;->getProduct()Ljava/lang/String;
0068: move-result-object         v3
006a: invoke-virtual             v2, v3, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0070: invoke-virtual             v2, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
0076: move-result-object         v2
0078: invoke-static              v1, v2, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
007e: invoke-virtual             v0, Lcom/syna/FirmwareParam;->getManufacture()Ljava/lang/String;
0084: move-result-object         v1
0086: invoke-virtual             v5, v1, Lcom/syna/FirmwareParam;->setManufacture(Ljava/lang/String;)V
008c: invoke-virtual             v0, Lcom/syna/FirmwareParam;->getProduct()Ljava/lang/String;
0092: move-result-object         v1
0094: invoke-virtual             v5, v1, Lcom/syna/FirmwareParam;->setProduct(Ljava/lang/String;)V
009a: invoke-virtual             v0, Lcom/syna/FirmwareParam;->getSerial()Ljava/lang/String;
00a0: move-result-object         v1
00a2: invoke-virtual             v5, v1, Lcom/syna/FirmwareParam;->setSerial(Ljava/lang/String;)V
00a8: invoke-virtual             v0, Lcom/syna/FirmwareParam;->getFirmware_version()Ljava/lang/String;
00ae: move-result-object         v1
00b0: invoke-virtual             v5, v1, Lcom/syna/FirmwareParam;->setFirmware_version(Ljava/lang/String;)V
00b6: invoke-virtual             v0, Lcom/syna/FirmwareParam;->getUsb_product_id()I
00bc: move-result                v1
00be: invoke-virtual             v5, v1, Lcom/syna/FirmwareParam;->setUsb_product_id(I)V
00c4: invoke-virtual             v0, Lcom/syna/FirmwareParam;->getUsb_vendor_id()I
00ca: move-result                v1
00cc: invoke-virtual             v5, v1, Lcom/syna/FirmwareParam;->setUsb_vendor_id(I)V
00d2: invoke-virtual             v0, Lcom/syna/FirmwareParam;->getDevice()I
00d8: move-result                v0
00da: invoke-virtual             v5, v0, Lcom/syna/FirmwareParam;->setDevice(I)V
00e0: iget-boolean               v5, v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mHasConnectedByNative Z
00e4: if-eqz                     v5, +019h
00e8: iget-object                v5, v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mUpdateFirmware Lcom/syna/FirmwareUpdate;
00ec: invoke-virtual             v5, Lcom/syna/FirmwareUpdate;->disconnectSynaDevice()V
00f2: const/4                    v5, 0
00f4: iput-boolean               v5, v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mHasConnectedByNative Z
00f8: sget-object                v5, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->TAG Ljava/lang/String;
00fc: const-string               v0, "getFirmwareParam: start to reconnect"
0100: invoke-static              v5, v0, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0106: invoke-virtual             v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->reConnectUsbDeviceByApplication()I
010c: const-string               v0, "getFirmwareParam: finish to reconnect"
0110: invoke-static              v5, v0, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0116: iget-object                v4, v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mUpdateFirmware Lcom/syna/FirmwareUpdate;
011a: invoke-virtual             v4, Lcom/syna/FirmwareUpdate;->releaseSynaDeviceHidInterface()Z
0120: return-void                

Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase; getUpdateFwProgress()I code_off=0x599c7c
0000: iget-object                v0, v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mUpdateFirmware Lcom/syna/FirmwareUpdate;
0004: if-nez                     v0, +009h
0008: new-instance               v0, Lcom/syna/FirmwareUpdate;
000c: invoke-direct              v0, Lcom/syna/FirmwareUpdate;-><init>()V
0012: iput-object                v0, v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mUpdateFirmware Lcom/syna/FirmwareUpdate;
0016: invoke-virtual             v0, Lcom/syna/FirmwareUpdate;->getUpdateFirmwareProgress()I
001c: move-result                v1
001e: return                     v1

Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase; getUsbDevice()Landroid/hardware/usb/UsbDevice; code_off=0x59996c
0000: iget-object                v0, v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mUsbDevice Landroid/hardware/usb/UsbDevice;
0004: return-object              v0

Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase; getUsbDeviceConnection()Landroid/hardware/usb/UsbDeviceConnection; code_off=0x599984
0000: sget-object                v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
0004: return-object              v0

Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase; prepareUsbDevice()Z code_off=0x599ae8
0000: sget-object                v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
0004: if-nez                     v0, +03bh
0008: sget-object                v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->TAG Ljava/lang/String;
000c: const-string               v1, "prepareUsbDevice"
0010: invoke-static              v0, v1, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0016: iget-object                v1, v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mContext Landroid/content/Context;
001a: const-string/jumbo         v2, usb
0020: invoke-virtual             v1, v2, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
0026: move-result-object         v1
0028: check-cast                 v1, Landroid/hardware/usb/UsbManager;
002c: const/4                    v2, 0
002e: if-nez                     v1, +008h
0032: const-string               v4, "prepareUsbDevice UsbManager is not OK"
0036: invoke-static              v0, v4, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
003c: return                     v2
003e: iget-object                v3, v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mUsbDevice Landroid/hardware/usb/UsbDevice;
0042: invoke-virtual             v1, v3, Landroid/hardware/usb/UsbManager;->hasPermission(Landroid/hardware/usb/UsbDevice;)Z
0048: move-result                v3
004a: if-nez                     v3, +008h
004e: const-string               v4, "prepareUsbDevice: UsbDevice has not permission"
0052: invoke-static              v0, v4, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0058: return                     v2
005a: iget-object                v4, v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mUsbDevice Landroid/hardware/usb/UsbDevice;
005e: invoke-virtual             v1, v4, Landroid/hardware/usb/UsbManager;->openDevice(Landroid/hardware/usb/UsbDevice;)Landroid/hardware/usb/UsbDeviceConnection;
0064: move-result-object         v4
0066: sput-object                v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
006a: if-nez                     v4, +008h
006e: const-string               v4, "prepareUsbDevice UsbDeviceConnection is not OK"
0072: invoke-static              v0, v4, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0078: return                     v2
007a: const/4                    v4, 1
007c: return                     v4

Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase; reConnectUsbDeviceByApplication()I code_off=0x599cac
0000: invoke-virtual             v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->connectUsbDeviceByApplication()Z
0006: move-result                v1
0008: if-eqz                     v1, +004h
000c: const/4                    v1, 0
000e: return                     v1
0010: sget-object                v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->TAG Ljava/lang/String;
0014: const-string               v0, "reConnectUsbDeviceByApplication: connect Usb Device error"
0018: invoke-static              v1, v0, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
001e: const/16                   v1, -1003
0022: return                     v1

Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase; releaseUsbDevice()V code_off=0x599f1c
0000: iget-boolean               v0, v2, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mIsDualInterface Z
0004: const/4                    v1, 0
0006: if-nez                     v0, +00bh
000a: iget-object                v0, v2, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mHidReader Lcom/conexant/cnxtusbcheadset/HidInterruptReader;
000e: if-eqz                     v0, +007h
0012: invoke-virtual             v0, Lcom/conexant/cnxtusbcheadset/HidInterruptReader;->release()V
0018: iput-object                v1, v2, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mHidReader Lcom/conexant/cnxtusbcheadset/HidInterruptReader;
001c: sget-object                v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
0020: if-eqz                     v0, +00dh
0024: iget-boolean               v0, v2, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mHasConnectedByNative Z
0028: if-eqz                     v0, +007h
002c: iget-object                v0, v2, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mUpdateFirmware Lcom/syna/FirmwareUpdate;
0030: invoke-virtual             v0, Lcom/syna/FirmwareUpdate;->disconnectSynaDevice()V
0036: sput-object                v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
003a: iget-boolean               v0, v2, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mIsDualInterface Z
003e: if-nez                     v0, +004h
0042: iput-object                v1, v2, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mHidEndpoint Landroid/hardware/usb/UsbEndpoint;
0046: sget-object                v0, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->mInterfaceStateListeners Ljava/util/List;
004a: if-eqz                     v0, +005h
004e: invoke-interface           v0, Ljava/util/List;->clear()V
0054: invoke-static              Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->stopTimer()V
005a: sput-object                v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mHidInterface Landroid/hardware/usb/UsbInterface;
005e: const/4                    v0, 0
0060: iput-boolean               v0, v2, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mIsDualInterface Z
0064: iput-object                v1, v2, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mUsbDevice Landroid/hardware/usb/UsbDevice;
0068: iput-object                v1, v2, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mContext Landroid/content/Context;
006c: return-void                

Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase; resetDevice()V code_off=0x599f9c
0000: iget-object                v0, v2, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mUpdateFirmware Lcom/syna/FirmwareUpdate;
0004: if-eqz                     v0, +012h
0008: iget-boolean               v0, v2, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mHasConnectedByNative Z
000c: if-eqz                     v0, +00eh
0010: sget-object                v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->TAG Ljava/lang/String;
0014: const-string               v1, "resetDevice: "
0018: invoke-static              v0, v1, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
001e: iget-object                v2, v2, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mUpdateFirmware Lcom/syna/FirmwareUpdate;
0022: invoke-virtual             v2, Lcom/syna/FirmwareUpdate;->deviceReset()Z
0028: return-void                

Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase; setDeviceName(Ljava/lang/String;)V code_off=0x599fd8
0000: iput-object                v1, v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mDeviceName Ljava/lang/String;
0004: return-void                

Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase; updateFirmware(Ljava/lang/String;)Lcom/conexant/cnxtusbcheadset/GenericReturnValue; code_off=0x599b78
0000: sget-object                v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->TAG Ljava/lang/String;
0004: new-instance               v1, Ljava/lang/StringBuilder;
0008: const-string/jumbo         v2, updateFirmware: CnxtUsbDeviceBase firmwareUrl = 
000e: invoke-direct              v1, v2, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
0014: invoke-virtual             v1, v5, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
001a: invoke-virtual             v1, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
0020: move-result-object         v1
0022: invoke-static              v0, v1, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0028: new-instance               v1, Lcom/conexant/cnxtusbcheadset/GenericReturnValue;
002c: invoke-direct              v1, Lcom/conexant/cnxtusbcheadset/GenericReturnValue;-><init>()V
0032: invoke-direct              v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->checkIsCnxtUsbDevice()Z
0038: move-result                v2
003a: if-nez                     v2, +007h
003e: const/16                   v4, -1001
0042: iput                       v4, v1, Lcom/conexant/cnxtusbcheadset/GenericReturnValue;->resValue I
0046: return-object              v1
0048: iget-object                v2, v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mUpdateFirmware Lcom/syna/FirmwareUpdate;
004c: const/4                    v3, 1
004e: invoke-virtual             v2, v5, v3, Lcom/syna/FirmwareUpdate;->downloadFirmware(Ljava/lang/String; I)I
0054: move-result                v5
0056: const-string/jumbo         v2, updateFirmware result is : 
005c: invoke-static              v5, v2, v0, Lgf3;->A(I Ljava/lang/String; Ljava/lang/String;)V
0062: iput                       v5, v1, Lcom/conexant/cnxtusbcheadset/GenericReturnValue;->resValue I
0066: iget-boolean               v5, v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mHasConnectedByNative Z
006a: if-eqz                     v5, +018h
006e: const-string/jumbo         v5, updateFirmware: do the device reset!
0074: invoke-static              v0, v5, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
007a: iget-object                v5, v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mUpdateFirmware Lcom/syna/FirmwareUpdate;
007e: invoke-virtual             v5, Lcom/syna/FirmwareUpdate;->deviceReset()Z
0084: iget-object                v5, v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mUpdateFirmware Lcom/syna/FirmwareUpdate;
0088: invoke-virtual             v5, Lcom/syna/FirmwareUpdate;->disconnectSynaDevice()V
008e: const/4                    v5, 0
0090: iput-boolean               v5, v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mHasConnectedByNative Z
0094: invoke-virtual             v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->reConnectUsbDeviceByApplication()I
009a: return-object              v1

Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory; <clinit>()V code_off=0x59a610
0000: new-instance               v0, Ljava/lang/Object;
0004: invoke-direct              v0, Ljava/lang/Object;-><init>()V
000a: sput-object                v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->mSyncObj Ljava/lang/Object;
000e: return-void                

Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory; identifyDeviceById(Ljava/util/Map; Ljava/lang/String; Landroid/hardware/usb/UsbDevice;)Z code_off=0x599ff0
0000: sget-object                v3, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->TAG Ljava/lang/String;
0004: const-string               v0, "identifyDeviceById: for each usbDevice name = "
0008: const-string               v1, " & vId = "
000c: invoke-static              v0, v5, v1, Lgf3;->k(Ljava/lang/String; Ljava/lang/String; Ljava/lang/String;)Ljava/lang/StringBuilder;
0012: move-result-object         v0
0014: invoke-virtual             v6, Landroid/hardware/usb/UsbDevice;->getVendorId()I
001a: move-result                v1
001c: invoke-virtual             v0, v1, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0022: const-string               v1, " & pId = "
0026: invoke-virtual             v0, v1, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
002c: invoke-virtual             v6, Landroid/hardware/usb/UsbDevice;->getProductId()I
0032: move-result                v1
0034: invoke-virtual             v0, v1, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
003a: invoke-virtual             v0, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
0040: move-result-object         v0
0042: invoke-static              v3, v0, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0048: invoke-interface           v4, v5, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
004e: move-result-object         v4
0050: check-cast                 v4, Ljava/util/List;
0054: const/4                    v0, 0
0056: if-nez                     v4, +014h
005a: new-instance               v4, Ljava/lang/StringBuilder;
005e: const-string               v6, "identifyDeviceById: no device config for name = "
0062: invoke-direct              v4, v6, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
0068: invoke-virtual             v4, v5, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
006e: invoke-virtual             v4, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
0074: move-result-object         v4
0076: invoke-static              v3, v4, Landroid/util/Log;->w(Ljava/lang/String; Ljava/lang/String;)I
007c: return                     v0
007e: invoke-interface           v4, Ljava/util/List;->iterator()Ljava/util/Iterator;
0084: move-result-object         v3
0086: invoke-interface           v3, Ljava/util/Iterator;->hasNext()Z
008c: move-result                v4
008e: if-eqz                     v4, +02dh
0092: invoke-interface           v3, Ljava/util/Iterator;->next()Ljava/lang/Object;
0098: move-result-object         v4
009a: check-cast                 v4, Lcom/conexant/universalfunction/DeviceId;
009e: invoke-virtual             v4, Lcom/conexant/universalfunction/DeviceId;->getVendorId()Ljava/lang/String;
00a4: move-result-object         v1
00a6: invoke-virtual             v6, Landroid/hardware/usb/UsbDevice;->getVendorId()I
00ac: move-result                v2
00ae: invoke-static              v2, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
00b4: move-result-object         v2
00b6: invoke-virtual             v1, v2, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
00bc: move-result                v1
00be: if-eqz                     v1, -01ch
00c2: invoke-virtual             v4, Lcom/conexant/universalfunction/DeviceId;->getProductId()Ljava/lang/String;
00c8: move-result-object         v4
00ca: invoke-virtual             v6, Landroid/hardware/usb/UsbDevice;->getProductId()I
00d0: move-result                v1
00d2: invoke-static              v1, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
00d8: move-result-object         v1
00da: invoke-virtual             v4, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
00e0: move-result                v4
00e2: if-eqz                     v4, -02eh
00e6: const/4                    v0, 1
00e8: sget-object                v3, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->TAG Ljava/lang/String;
00ec: new-instance               v4, Ljava/lang/StringBuilder;
00f0: const-string               v6, "identifyDeviceById: name = "
00f4: invoke-direct              v4, v6, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
00fa: invoke-virtual             v4, v5, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0100: const-string               v5, " & isCorrectDevice: "
0104: invoke-virtual             v4, v5, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
010a: invoke-virtual             v4, v0, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
0110: invoke-virtual             v4, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
0116: move-result-object         v4
0118: invoke-static              v3, v4, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
011e: return                     v0

Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory; createUsbDeviceBase(Landroid/content/Context; Landroid/hardware/usb/UsbDevice;)Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase; code_off=0x59a120
0000: const-string               v0, "Freeman3"
0004: const-string               v1, "createUsbDeviceBase: unknown idStr in class map: "
0008: iget-boolean               v2, v8, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->mInitialized Z
000c: const/4                    v3, 0
000e: if-nez                     v2, +00ah
0012: sget-object                v8, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->TAG Ljava/lang/String;
0016: const-string               v9, "createUsbDeviceBase: before create usb device, call init first"
001a: invoke-static              v8, v9, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0020: return-object              v3
0022: if-nez                     v10, +00ah
0026: sget-object                v8, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->TAG Ljava/lang/String;
002a: const-string               v9, "createUsbDeviceBase: UsbDevice is null"
002e: invoke-static              v8, v9, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0034: return-object              v3
0036: const-string/jumbo         v2, usb
003c: invoke-virtual             v9, v2, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
0042: move-result-object         v2
0044: check-cast                 v2, Landroid/hardware/usb/UsbManager;
0048: if-nez                     v2, +00ah
004c: sget-object                v8, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->TAG Ljava/lang/String;
0050: const-string               v9, "createUsbDeviceBase: UsbManager is not OK"
0054: invoke-static              v8, v9, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
005a: return-object              v3
005c: invoke-virtual             v2, v10, Landroid/hardware/usb/UsbManager;->hasPermission(Landroid/hardware/usb/UsbDevice;)Z
0062: move-result                v4
0064: if-nez                     v4, +00ah
0068: sget-object                v8, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->TAG Ljava/lang/String;
006c: const-string               v9, "createUsbDeviceBase: UsbDevice has not permission"
0070: invoke-static              v8, v9, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0076: return-object              v3
0078: invoke-virtual             v2, v10, Landroid/hardware/usb/UsbManager;->openDevice(Landroid/hardware/usb/UsbDevice;)Landroid/hardware/usb/UsbDeviceConnection;
007e: move-result-object         v2
0080: if-nez                     v2, +00ah
0084: sget-object                v8, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->TAG Ljava/lang/String;
0088: const-string               v9, "createUsbDeviceBase: UsbDeviceConnection is not OK"
008c: invoke-static              v8, v9, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0092: return-object              v3
0094: const/16                   v4, 41
0098: invoke-static              v2, v4, Lcom/conexant/cnxtusbcheadset/UsbHelper;->getDeviceString(Landroid/hardware/usb/UsbDeviceConnection; I)Ljava/lang/String;
009e: move-result-object         v2
00a0: invoke-virtual             v2, Ljava/lang/String;->trim()Ljava/lang/String;
00a6: move-result-object         v2
00a8: sget-object                v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->TAG Ljava/lang/String;
00ac: new-instance               v5, Ljava/lang/StringBuilder;
00b0: const-string               v6, "createUsbDeviceBase: idStr = "
00b4: invoke-direct              v5, v6, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
00ba: invoke-virtual             v5, v2, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
00c0: invoke-virtual             v5, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
00c6: move-result-object         v5
00c8: invoke-static              v4, v5, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
00ce: invoke-virtual             v2, Ljava/lang/String;->isEmpty()Z
00d4: move-result                v5
00d6: if-nez                     v5, +184h
00da: sget                       v5, Lcom/conexant/libcnxtservice/R$xml;->devicelist I
00de: invoke-static              v9, v5, Lcom/conexant/universalfunction/CommonUtil;->getDeviceIdFromXMLConfig(Landroid/content/Context; I)Ljava/util/Map;
00e4: move-result-object         v5
00e6: iget-object                v6, v8, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->mClassMap Ljava/util/Map;
00ea: invoke-interface           v6, v2, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
00f0: move-result-object         v6
00f2: check-cast                 v6, Ljava/lang/Class;
00f6: if-eqz                     v6, +031h
00fa: const-class                v1, Landroid/content/Context;
00fe: const-class                v7, Landroid/hardware/usb/UsbDevice;
0102: filled-new-array           v1, v7, [Ljava/lang/Class;
0108: move-result-object         v1
010a: invoke-virtual             v6, v1, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
0110: move-result-object         v1
0112: filled-new-array           v9, v10, [Ljava/lang/Object;
0118: move-result-object         v6
011a: invoke-virtual             v1, v6, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
0120: move-result-object         v1
0122: check-cast                 v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;
0126: goto                       +41h
0128: move-exception             v8
012a: move-object                v1, v3
012c: goto/16                    +0bbh
0130: move-exception             v8
0132: move-object                v1, v3
0134: goto/16                    +0ceh
0138: move-exception             v8
013a: move-object                v1, v3
013c: goto/16                    +0e1h
0140: move-exception             v8
0142: move-object                v1, v3
0144: goto/16                    +0f4h
0148: move-exception             v8
014a: move-object                v1, v3
014c: goto/16                    +107h
0150: move-exception             v8
0152: move-object                v1, v3
0154: goto/16                    +11ah
0158: new-instance               v6, Ljava/lang/StringBuilder;
015c: invoke-direct              v6, v1, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
0162: invoke-virtual             v6, v2, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0168: const-string               v1, ", vid="
016c: invoke-virtual             v6, v1, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0172: invoke-virtual             v10, Landroid/hardware/usb/UsbDevice;->getVendorId()I
0178: move-result                v1
017a: invoke-virtual             v6, v1, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0180: const-string               v1, ", pid="
0184: invoke-virtual             v6, v1, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
018a: invoke-virtual             v10, Landroid/hardware/usb/UsbDevice;->getProductId()I
0190: move-result                v1
0192: invoke-virtual             v6, v1, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0198: invoke-virtual             v6, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
019e: move-result-object         v1
01a0: invoke-static              v4, v1, Landroid/util/Log;->w(Ljava/lang/String; Ljava/lang/String;)I
01a6: move-object                v1, v3
01a8: invoke-direct              v8, v5, v0, v10, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->identifyDeviceById(Ljava/util/Map; Ljava/lang/String; Landroid/hardware/usb/UsbDevice;)Z
01ae: move-result                v6
01b0: if-eqz                     v6, +03fh
01b4: const-string               v8, "createUsbDeviceBase: new Freeman3 device"
01b8: invoke-static              v4, v8, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
01be: new-instance               v8, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;
01c2: invoke-direct              v8, v9, v10, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;-><init>(Landroid/content/Context; Landroid/hardware/usb/UsbDevice;)V
01c8: invoke-virtual             v8, v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->setDeviceName(Ljava/lang/String;)V
01ce: move-object                v1, v8
01d0: goto                       +4bh
01d2: move-exception             v9
01d4: move-object                v1, v8
01d6: move-object                v8, v9
01d8: goto/16                    +065h
01dc: move-exception             v9
01de: move-object                v1, v8
01e0: move-object                v8, v9
01e2: goto/16                    +077h
01e6: move-exception             v9
01e8: move-object                v1, v8
01ea: move-object                v8, v9
01ec: goto/16                    +089h
01f0: move-exception             v9
01f2: move-object                v1, v8
01f4: move-object                v8, v9
01f6: goto/16                    +09bh
01fa: move-exception             v9
01fc: move-object                v1, v8
01fe: move-object                v8, v9
0200: goto/16                    +0adh
0204: move-exception             v9
0206: move-object                v1, v8
0208: move-object                v8, v9
020a: goto/16                    +0bfh
020e: move-exception             v8
0210: goto                       +49h
0212: move-exception             v8
0214: goto                       +5eh
0216: move-exception             v8
0218: goto/16                    +073h
021c: move-exception             v8
021e: goto/16                    +087h
0222: move-exception             v8
0224: goto/16                    +09bh
0228: move-exception             v8
022a: goto/16                    +0afh
022e: const-string               v6, "CAPE"
0232: invoke-virtual             v2, v6, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
0238: move-result                v6
023a: if-eqz                     v6, +02eh
023e: invoke-direct              v8, v5, v0, v10, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->identifyDeviceById(Ljava/util/Map; Ljava/lang/String; Landroid/hardware/usb/UsbDevice;)Z
0244: move-result                v8
0246: if-eqz                     v8, +022h
024a: const-string               v8, "createUsbDeviceBase: new Freeman3 (CAPE) device"
024e: invoke-static              v4, v8, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0254: new-instance               v8, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;
0258: invoke-direct              v8, v9, v10, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;-><init>(Landroid/content/Context; Landroid/hardware/usb/UsbDevice;)V
025e: invoke-virtual             v8, v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->setDeviceName(Ljava/lang/String;)V
0264: goto                       -4bh
0266: invoke-virtual             v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->prepareUsbDevice()Z
026c: move-result                v8
026e: if-eqz                     v8, +008h
0272: invoke-virtual             v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->connectUsbDeviceByApplication()Z
0278: move-result                v8
027a: if-nez                     v8, +09dh
027e: const-string               v8, "createUsbDeviceBase: prepareUsbDevice failed"
0282: invoke-static              v4, v8, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0288: return-object              v3
028a: const-string               v8, "createUsbDeviceBase: unknown CAPE device"
028e: invoke-static              v4, v8, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0294: return-object              v3
0296: const-string               v8, "createUsbDeviceBase: the usbDevice is not from Conexant"
029a: invoke-static              v4, v8, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
02a0: return-object              v3
02a2: sget-object                v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->TAG Ljava/lang/String;
02a6: new-instance               v9, Ljava/lang/StringBuilder;
02aa: const-string               v10, "createUsbDeviceBase: Exception : "
02ae: invoke-direct              v9, v10, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
02b4: invoke-virtual             v9, v8, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
02ba: invoke-virtual             v9, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
02c0: move-result-object         v9
02c2: invoke-static              v4, v9, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
02c8: invoke-virtual             v8, Ljava/lang/Throwable;->printStackTrace()V
02ce: goto                       +73h
02d0: sget-object                v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->TAG Ljava/lang/String;
02d4: new-instance               v9, Ljava/lang/StringBuilder;
02d8: const-string               v10, "createUsbDeviceBase: ExceptionInInitializerError : "
02dc: invoke-direct              v9, v10, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
02e2: invoke-virtual             v9, v8, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
02e8: invoke-virtual             v9, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
02ee: move-result-object         v9
02f0: invoke-static              v4, v9, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
02f6: invoke-virtual             v8, Ljava/lang/Throwable;->printStackTrace()V
02fc: goto                       +5ch
02fe: sget-object                v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->TAG Ljava/lang/String;
0302: new-instance               v9, Ljava/lang/StringBuilder;
0306: const-string               v10, "createUsbDeviceBase: InvocationTargetException : "
030a: invoke-direct              v9, v10, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
0310: invoke-virtual             v9, v8, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
0316: invoke-virtual             v9, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
031c: move-result-object         v9
031e: invoke-static              v4, v9, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0324: invoke-virtual             v8, Ljava/lang/Throwable;->printStackTrace()V
032a: goto                       +45h
032c: sget-object                v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->TAG Ljava/lang/String;
0330: new-instance               v9, Ljava/lang/StringBuilder;
0334: const-string               v10, "createUsbDeviceBase: InstantiationException : "
0338: invoke-direct              v9, v10, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
033e: invoke-virtual             v9, v8, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
0344: invoke-virtual             v9, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
034a: move-result-object         v9
034c: invoke-static              v4, v9, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0352: invoke-virtual             v8, Ljava/lang/Throwable;->printStackTrace()V
0358: goto                       +2eh
035a: sget-object                v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->TAG Ljava/lang/String;
035e: new-instance               v9, Ljava/lang/StringBuilder;
0362: const-string               v10, "createUsbDeviceBase: IllegalAccessException : "
0366: invoke-direct              v9, v10, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
036c: invoke-virtual             v9, v8, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
0372: invoke-virtual             v9, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
0378: move-result-object         v9
037a: invoke-static              v4, v9, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0380: invoke-virtual             v8, Ljava/lang/Throwable;->printStackTrace()V
0386: goto                       +17h
0388: sget-object                v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->TAG Ljava/lang/String;
038c: new-instance               v9, Ljava/lang/StringBuilder;
0390: const-string               v10, "createUsbDeviceBase: NoSuchMethodException : "
0394: invoke-direct              v9, v10, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
039a: invoke-virtual             v9, v8, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
03a0: invoke-virtual             v9, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
03a6: move-result-object         v9
03a8: invoke-static              v4, v9, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
03ae: invoke-virtual             v8, Ljava/lang/Throwable;->printStackTrace()V
03b4: if-nez                     v1, +00ch
03b8: const-string               v8, "createUsbDeviceBase: failed to create known cnxt usb device for idStr = "
03bc: invoke-virtual             v8, v2, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
03c2: move-result-object         v8
03c4: invoke-static              v4, v8, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
03ca: return-object              v3
03cc: invoke-virtual             v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->getFwVersion()V
03d2: iget-object                v8, v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mInterfaceStateListener Lcom/conexant/cnxtusbcheadset/CafCmdHelper$onInterfaceStateListener;
03d6: invoke-static              v8, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->addInterfaceStateListener(Lcom/conexant/cnxtusbcheadset/CafCmdHelper$onInterfaceStateListener;)V
03dc: return-object              v1
03de: const-string               v8, "createUsbDeviceBase: idString is null"
03e2: invoke-static              v4, v8, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
03e8: return-object              v3

Lcom/conexant/cnxtusbcheadset/EQCoeffsList; <clinit>()V code_off=0x59a740
0000: new-instance               v0, Lcom/conexant/cnxtusbcheadset/EQCoeffsList$1;
0004: invoke-direct              v0, Lcom/conexant/cnxtusbcheadset/EQCoeffsList$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/cnxtusbcheadset/EQCoeffsList;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/cnxtusbcheadset/EQParamList; <clinit>()V code_off=0x59a858
0000: new-instance               v0, Lcom/conexant/cnxtusbcheadset/EQParamList$1;
0004: invoke-direct              v0, Lcom/conexant/cnxtusbcheadset/EQParamList$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/cnxtusbcheadset/EQParamList;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/cnxtusbcheadset/Eq2Coeff; <clinit>()V code_off=0x59a92c
0000: const-string               v0, "cxaudiodsplib_embca_jni"
0004: invoke-static              v0, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
000a: invoke-static              Lcom/conexant/cnxtusbcheadset/Eq2Coeff;->native_init()V
0010: return-void                

Lcom/conexant/cnxtusbcheadset/FeatureConfiguration; <clinit>()V code_off=0x59aa00
0000: new-instance               v0, Lcom/conexant/cnxtusbcheadset/FeatureConfiguration$1;
0004: invoke-direct              v0, Lcom/conexant/cnxtusbcheadset/FeatureConfiguration$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/cnxtusbcheadset/FeatureConfiguration;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice; canUpdate()Z code_off=0x59ad5c
0000: invoke-virtual             v10, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->prepareUsbDevice()Z
0006: move-result                v10
0008: const/4                    v1, 0
000a: if-eqz                     v10, +03ch
000e: const/4                    v10, 3
0010: move                       v0, v10
0012: add-int/lit8               v2, v0, -1
0016: if-lez                     v0, +036h
001a: const/4                    v0, 6
001c: new-array                  v8, v0, [B
0020: const/4                    v0, 4
0022: aput-byte                  v0, v8, v1
0026: const/4                    v9, 1
0028: aput-byte                  v1, v8, v9
002c: const/4                    v3, 2
002e: aput-byte                  v9, v8, v3
0032: const/16                   v3, 17
0036: aput-byte                  v3, v8, v10
003a: const/16                   v3, -56
003e: aput-byte                  v3, v8, v0
0042: sget-object                v3, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
0046: const/16                   v6, 261
004a: const/4                    v7, 3
004c: const/16                   v4, 161
0050: const/4                    v5, 1
0052: invoke-static/range        v3 ... v8, Lcom/conexant/cnxtusbcheadset/UsbHelper;->receiveHIDReport(Landroid/hardware/usb/UsbDeviceConnection; I I I I [B)[B
0058: move-result-object         v0
005a: if-eqz                     v0, +008h
005e: aget-byte                  v0, v0, v9
0062: and-int/2addr              v0, v9
0064: if-eq                      v0, v9, +003h
0068: return                     v9
006a: const-wide/16              v3, 50
006e: invoke-static              v3, v4, Ljava/lang/Thread;->sleep(J)V
0074: goto                       +5h
0076: move-exception             v0
0078: invoke-virtual             v0, Ljava/lang/Throwable;->printStackTrace()V
007e: move                       v0, v2
0080: goto                       -37h
0082: return                     v1

Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice; setFreeman3EQ(Lcom/conexant/genericfeature/EQParam;)Z code_off=0x59ae7c
0000: new-instance               v0, Lcom/conexant/cnxtusbcheadset/EQBandParam;
0004: invoke-direct              v0, Lcom/conexant/cnxtusbcheadset/EQBandParam;-><init>()V
000a: iget                       v1, v7, Lcom/conexant/genericfeature/EQParam;->filterType I
000e: iput                       v1, v0, Lcom/conexant/cnxtusbcheadset/EQBandParam;->flags I
0012: iget                       v1, v7, Lcom/conexant/genericfeature/EQParam;->frequency I
0016: iput                       v1, v0, Lcom/conexant/cnxtusbcheadset/EQBandParam;->Freq_Hz I
001a: iget-wide                  v1, v7, Lcom/conexant/genericfeature/EQParam;->gain D
001e: const-wide/high16          v3, 4643211215818981376
0022: mul-double/2addr           v1, v3
0024: double-to-int              v1, v1
0026: iput                       v1, v0, Lcom/conexant/cnxtusbcheadset/EQBandParam;->Gain_dB I
002a: iget-wide                  v1, v7, Lcom/conexant/genericfeature/EQParam;->qFactor D
002e: mul-double/2addr           v1, v3
0030: double-to-int              v1, v1
0032: iput                       v1, v0, Lcom/conexant/cnxtusbcheadset/EQBandParam;->Qfactor I
0036: iget                       v1, v7, Lcom/conexant/genericfeature/EQParam;->sampleRate I
003a: invoke-virtual             v6, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->getCurSampleRate()I
0040: move-result                v2
0042: const/4                    v3, 4
0044: if-lt                      v2, v3, +011h
0048: const/16                   v4, 8
004c: if-gt                      v2, v4, +00dh
0050: sget-object                v1, Lcom/conexant/universalfunction/CnxtUsbConstants;->FREQ_SAMPLE_RATE [I
0054: aget                       v1, v1, v2
0058: sget-object                v2, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
005c: const-string               v4, "setFreeman3EQ: sampleRate: "
0060: invoke-static              v1, v4, v2, Lgf3;->A(I Ljava/lang/String; Ljava/lang/String;)V
0066: new-instance               v2, Lcom/conexant/cnxtusbcheadset/Eq2Coeff;
006a: invoke-direct              v2, Lcom/conexant/cnxtusbcheadset/Eq2Coeff;-><init>()V
0070: new-instance               v4, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;
0074: invoke-direct              v4, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;-><init>()V
007a: iput-object                v4, v6, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->eqCoeff Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;
007e: const/16                   v4, 24
0082: invoke-virtual             v2, v1, v0, v4, Lcom/conexant/cnxtusbcheadset/Eq2Coeff;->CxAudioConvertEqParams2Coeffs(I Lcom/conexant/cnxtusbcheadset/EQBandParam; I)Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;
0088: move-result-object         v0
008a: iput-object                v0, v6, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->eqCoeff Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;
008e: const/4                    v1, 0
0090: if-nez                     v0, +00ah
0094: sget-object                v6, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
0098: const-string               v7, "setFreeman3EQ: eqCoeff == null"
009c: invoke-static              v6, v7, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
00a2: return                     v1
00a4: const/16                   v0, 13
00a8: new-array                  v0, v0, [J
00ac: const-wide/16              v4, 0
00b0: aput-wide                  v4, v0, v1
00b4: iget                       v7, v7, Lcom/conexant/genericfeature/EQParam;->band I
00b8: invoke-static              v7, Lcom/conexant/universalfunction/CommonUtil;->shiftEQBandForFreeman3(I)I
00be: move-result                v7
00c0: int-to-long                v1, v7
00c2: const/4                    v7, 1
00c4: aput-wide                  v1, v0, v7
00c8: iget-object                v6, v6, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->eqCoeff Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;
00cc: iget-byte                  v1, v6, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->Gain B
00d0: int-to-long                v1, v1
00d2: const/4                    v4, 2
00d4: aput-wide                  v1, v0, v4
00d8: iget                       v1, v6, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B0 I
00dc: int-to-long                v1, v1
00de: const/4                    v4, 3
00e0: aput-wide                  v1, v0, v4
00e4: iget                       v1, v6, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B1 I
00e8: int-to-long                v1, v1
00ea: aput-wide                  v1, v0, v3
00ee: iget                       v1, v6, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B2 I
00f2: int-to-long                v1, v1
00f4: const/4                    v3, 5
00f6: aput-wide                  v1, v0, v3
00fa: iget                       v1, v6, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A0 I
00fe: int-to-long                v1, v1
0100: const/4                    v3, 6
0102: aput-wide                  v1, v0, v3
0106: iget                       v6, v6, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A1 I
010a: int-to-long                v1, v6
010c: const/4                    v6, 7
010e: aput-wide                  v1, v0, v6
0112: const-string               v6, "CTRL"
0116: invoke-static              v6, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCafId(Ljava/lang/String;)I
011c: move-result                v6
011e: const/16                   v1, 190
0122: invoke-static              v1, v6, v0, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCmd(I I [J)Lcom/conexant/universalfunction/CnxtUsbCommand;
0128: move-result-object         v6
012a: sget-object                v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
012e: invoke-static              v0, v6, v7, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->sendCmd(Landroid/hardware/usb/UsbDeviceConnection; Lcom/conexant/universalfunction/CnxtUsbCommand; I)Z
0134: move-result                v6
0136: return                     v6

Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice; setFreeman3EQEnabled()V code_off=0x59cd30
0000: const/16                   v0, 13
0004: new-array                  v0, v0, [J
0008: const/4                    v1, 0
000a: const-wide/16              v2, 1
000e: aput-wide                  v2, v0, v1
0012: const-string               v1, "CTRL"
0016: invoke-static              v1, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCafId(Ljava/lang/String;)I
001c: move-result                v1
001e: const/16                   v2, 188
0022: invoke-static              v2, v1, v0, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCmd(I I [J)Lcom/conexant/universalfunction/CnxtUsbCommand;
0028: move-result-object         v0
002a: sget-object                v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
002e: const/4                    v2, 1
0030: invoke-static              v1, v0, v2, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->sendCmd(Landroid/hardware/usb/UsbDeviceConnection; Lcom/conexant/universalfunction/CnxtUsbCommand; I)Z
0036: move-result                v0
0038: iput-boolean               v0, v4, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->mFreeman3EQEnabled Z
003c: sget-object                v0, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
0040: new-instance               v1, Ljava/lang/StringBuilder;
0044: const-string               v2, "setFreeman3EQEnabled: mFreeman3EQEnabled = "
0048: invoke-direct              v1, v2, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
004e: iget-boolean               v4, v4, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->mFreeman3EQEnabled Z
0052: invoke-virtual             v1, v4, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
0058: invoke-virtual             v1, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
005e: move-result-object         v4
0060: invoke-static              v0, v4, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0066: return-void                

Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice; setFreemanEQ(I I I D F I)Z code_off=0x59afc4
0000: move-object/from16         v0, v20
0004: move/from16                v1, v21
0008: invoke-direct              v0, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->canUpdate()Z
000e: move-result                v2
0010: const/4                    v3, 0
0012: if-eqz                     v2, +0f1h
0016: new-instance               v2, Lcom/conexant/cnxtusbcheadset/EQBandParam;
001a: invoke-direct              v2, Lcom/conexant/cnxtusbcheadset/EQBandParam;-><init>()V
0020: move/from16                v4, v27
0024: iput                       v4, v2, Lcom/conexant/cnxtusbcheadset/EQBandParam;->flags I
0028: move/from16                v4, v23
002c: iput                       v4, v2, Lcom/conexant/cnxtusbcheadset/EQBandParam;->Freq_Hz I
0030: const/high16               v4, 1132462080
0034: mul-float                  v4, v4, v26
0038: float-to-int               v4, v4
003a: iput                       v4, v2, Lcom/conexant/cnxtusbcheadset/EQBandParam;->Gain_dB I
003e: const-wide/high16          v4, 4643211215818981376
0042: mul-double                 v4, v4, v24
0046: double-to-int              v4, v4
0048: iput                       v4, v2, Lcom/conexant/cnxtusbcheadset/EQBandParam;->Qfactor I
004c: iget-object                v4, v0, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->eq2Coeff Lcom/conexant/cnxtusbcheadset/Eq2Coeff;
0050: const/16                   v5, 16
0054: invoke-virtual             v4, v1, v2, v5, Lcom/conexant/cnxtusbcheadset/Eq2Coeff;->CxAudioConvertEqParams2Coeffs(I Lcom/conexant/cnxtusbcheadset/EQBandParam; I)Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;
005a: move-result-object         v2
005c: iput-object                v2, v0, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->eqCoeff Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;
0060: if-nez                     v2, +003h
0064: return                     v3
0066: const/16                   v0, 8000
006a: const/16                   v4, 4120
006e: const/16                   v6, 11
0072: if-eq                      v1, v0, +034h
0076: const/16                   v0, 16000
007a: if-eq                      v1, v0, +02bh
007e: const/16                   v0, 32000
0082: if-eq                      v1, v0, +022h
0086: const                      v0, 44100
008c: if-eq                      v1, v0, +018h
0090: const                      v0, 48000
0096: if-eq                      v1, v0, +00eh
009a: const                      v0, 96000
00a0: if-eq                      v1, v0, +003h
00a4: goto                       +1fh
00a6: mul-int/lit8               v0, v22, 11
00aa: add-int/lit16              v0, v0, 4554
00ae: int-to-short               v4, v0
00b0: goto                       +19h
00b2: mul-int/lit8               v0, v22, 11
00b6: add-int/lit16              v0, v0, 4340
00ba: goto                       -6h
00bc: mul-int/lit8               v0, v22, 11
00c0: add-int/lit16              v0, v0, 4285
00c4: goto                       -bh
00c6: mul-int/lit8               v0, v22, 11
00ca: add-int/lit16              v0, v0, 4230
00ce: goto                       -10h
00d0: mul-int/lit8               v0, v22, 11
00d4: add-int/lit16              v0, v0, 4175
00d8: goto                       -15h
00da: mul-int/lit8               v0, v22, 11
00de: add-int/2addr              v0, v4
00e0: goto                       -19h
00e2: shr-int/lit8               v0, v4, 8
00e6: int-to-byte                v0, v0
00e8: and-int/lit16              v1, v4, 255
00ec: int-to-byte                v1, v1
00ee: iget                       v4, v2, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B0 I
00f2: and-int/lit16              v7, v4, 255
00f6: int-to-byte                v7, v7
00f8: const/16                   v8, 8
00fc: shr-int/2addr              v4, v8
00fe: int-to-byte                v4, v4
0100: iget                       v9, v2, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B1 I
0104: and-int/lit16              v10, v9, 255
0108: int-to-byte                v10, v10
010a: shr-int/2addr              v9, v8
010c: int-to-byte                v9, v9
010e: iget                       v11, v2, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B2 I
0112: and-int/lit16              v12, v11, 255
0116: int-to-byte                v12, v12
0118: shr-int/2addr              v11, v8
011a: int-to-byte                v11, v11
011c: iget                       v13, v2, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A0 I
0120: and-int/lit16              v14, v13, 255
0124: int-to-byte                v14, v14
0126: shr-int/2addr              v13, v8
0128: int-to-byte                v13, v13
012a: iget                       v15, v2, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A1 I
012e: move/from16                v16, v3
0132: and-int/lit16              v3, v15, 255
0136: int-to-byte                v3, v3
0138: shr-int/2addr              v15, v8
013a: int-to-byte                v15, v15
013c: iget-byte                  v2, v2, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->Gain B
0140: move/from16                v20, v6
0144: new-array                  v6, v5, [B
0148: const/16                   v17, 4
014c: aput-byte                  v17, v6, v16
0150: const/16                   v18, 64
0154: const/16                   v19, 1
0158: aput-byte                  v18, v6, v19
015c: const/16                   v18, 2
0160: aput-byte                  v20, v6, v18
0164: const/16                   v18, 3
0168: aput-byte                  v0, v6, v18
016c: aput-byte                  v1, v6, v17
0170: const/4                    v0, 5
0172: aput-byte                  v7, v6, v0
0176: const/4                    v0, 6
0178: aput-byte                  v4, v6, v0
017c: const/4                    v0, 7
017e: aput-byte                  v10, v6, v0
0182: aput-byte                  v9, v6, v8
0186: const/16                   v0, 9
018a: aput-byte                  v12, v6, v0
018e: const/16                   v0, 10
0192: aput-byte                  v11, v6, v0
0196: aput-byte                  v14, v6, v20
019a: const/16                   v0, 12
019e: aput-byte                  v13, v6, v0
01a2: const/16                   v0, 13
01a6: aput-byte                  v3, v6, v0
01aa: const/16                   v0, 14
01ae: aput-byte                  v15, v6, v0
01b2: const/16                   v0, 15
01b6: aput-byte                  v2, v6, v0
01ba: sget-object                v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
01be: const/16                   v1, 516
01c2: const/4                    v2, 3
01c4: const/16                   v3, 33
01c8: const/16                   v4, 9
01cc: move-object/from16         v20, v0
01d0: move/from16                v23, v1
01d4: move/from16                v24, v2
01d8: move/from16                v21, v3
01dc: move/from16                v22, v4
01e0: move-object/from16         v25, v6
01e4: invoke-static/range        v20 ... v25, Lcom/conexant/cnxtusbcheadset/UsbHelper;->sendHIDReport(Landroid/hardware/usb/UsbDeviceConnection; I I I I [B)I
01ea: move-result                v0
01ec: if-ne                      v0, v5, +003h
01f0: return                     v19
01f2: return                     v16
01f4: move/from16                v16, v3
01f8: return                     v16

Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice; getDeviceChipCode()I code_off=0x59b24c
0000: const/4                    v4, 4
0002: new-array                  v4, v4, [J
0006: const/4                    v0, 0
0008: const-wide/16              v1, 1
000c: aput-wide                  v1, v4, v0
0010: const-string               v0, "CTRL"
0014: invoke-static              v0, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCafId(Ljava/lang/String;)I
001a: move-result                v0
001c: sget-object                v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
0020: const/4                    v2, 1
0022: const/16                   v3, 259
0026: invoke-static              v3, v0, v4, v1, v2, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getMsgByCmd(I I [J Landroid/hardware/usb/UsbDeviceConnection; I)[B
002c: move-result-object         v4
002e: invoke-static              v4, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->isExecuteSuccess([B)Z
0034: move-result                v0
0036: if-nez                     v0, +00ch
003a: sget-object                v4, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
003e: const-string               v0, "getDeviceChipCode: execute failure"
0042: invoke-static              v4, v0, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0048: const/16                   v4, -1001
004c: return                     v4
004e: const/16                   v0, 10
0052: invoke-static              v4, v0, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
0058: move-result                v4
005a: sget-object                v0, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
005e: const-string               v1, "getDeviceChipCode: deviceNumber = "
0062: invoke-static              v4, v1, v0, Lgf3;->A(I Ljava/lang/String; Ljava/lang/String;)V
0068: return                     v4

Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice; getFreeman3EQConfig()V code_off=0x59c788
0000: const/16                   v0, 13
0004: new-array                  v0, v0, [J
0008: const-string               v1, "CTRL"
000c: invoke-static              v1, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCafId(Ljava/lang/String;)I
0012: move-result                v1
0014: sget-object                v2, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
0018: const/16                   v3, 442
001c: const/4                    v4, 1
001e: invoke-static              v3, v1, v0, v2, v4, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getMsgByCmd(I I [J Landroid/hardware/usb/UsbDeviceConnection; I)[B
0024: move-result-object         v0
0026: invoke-static              v0, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->isExecuteSuccess([B)Z
002c: move-result                v1
002e: if-nez                     v1, +00ah
0032: sget-object                v6, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
0036: const-string               v0, "getFreeman3EQConfig: execute failure"
003a: invoke-static              v6, v0, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0040: return-void                
0042: const/16                   v1, 10
0046: invoke-static              v0, v1, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
004c: move-result                v0
004e: const/4                    v1, 0
0050: move                       v2, v1
0052: sget-object                v3, Lcom/conexant/universalfunction/CnxtUsbConstants;->SAMPLE_RATE_ARRAY [[I
0056: array-length               v5, v3
0058: if-ge                      v2, v5, +00fh
005c: aget-object                v3, v3, v2
0060: aget                       v5, v3, v1
0064: if-ne                      v0, v5, +006h
0068: aget                       v3, v3, v4
006c: iput                       v3, v6, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->DEFAULT_FREEMAN3_SAMPLERATE I
0070: add-int/lit8               v2, v2, 1
0074: goto                       -11h
0076: sget-object                v1, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
007a: const-string               v2, "getFreeman3EQConfig: index= "
007e: const-string               v3, " & sampleRate = "
0082: invoke-static              v0, v2, v3, Ln50;->o(I Ljava/lang/String; Ljava/lang/String;)Ljava/lang/StringBuilder;
0088: move-result-object         v0
008a: iget                       v6, v6, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->DEFAULT_FREEMAN3_SAMPLERATE I
008e: invoke-virtual             v0, v6, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0094: invoke-virtual             v0, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
009a: move-result-object         v6
009c: invoke-static              v1, v6, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
00a2: return-void                

Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice; getFreeman3EQParam(Lcom/conexant/genericfeature/EQParam;)I code_off=0x59b624
0000: const/16                   v0, 13
0004: new-array                  v0, v0, [J
0008: const-wide/16              v1, 0
000c: const/4                    v3, 0
000e: aput-wide                  v1, v0, v3
0012: iget                       v1, v9, Lcom/conexant/genericfeature/EQParam;->band I
0016: invoke-static              v1, Lcom/conexant/universalfunction/CommonUtil;->shiftEQBandForFreeman3(I)I
001c: move-result                v1
001e: int-to-long                v1, v1
0020: const/4                    v4, 1
0022: aput-wide                  v1, v0, v4
0026: const-string               v1, "CTRL"
002a: invoke-static              v1, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getCafId(Ljava/lang/String;)I
0030: move-result                v1
0032: sget-object                v2, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
0036: const/16                   v5, 446
003a: invoke-static              v5, v1, v0, v2, v4, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->getMsgByCmd(I I [J Landroid/hardware/usb/UsbDeviceConnection; I)[B
0040: move-result-object         v0
0042: invoke-static              v0, Lcom/conexant/cnxtusbcheadset/CafCmdHelper;->isExecuteSuccess([B)Z
0048: move-result                v1
004a: const/16                   v2, -1001
004e: if-nez                     v1, +00ah
0052: sget-object                v8, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
0056: const-string               v9, "getFreeman3EQParam: execute failure"
005a: invoke-static              v8, v9, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
0060: return                     v2
0062: new-instance               v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;
0066: invoke-direct              v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;-><init>()V
006c: const/16                   v4, 22
0070: invoke-static              v0, v4, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
0076: move-result                v4
0078: iput                       v4, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B0 I
007c: const/16                   v4, 26
0080: invoke-static              v0, v4, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
0086: move-result                v4
0088: iput                       v4, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B1 I
008c: const/16                   v4, 30
0090: invoke-static              v0, v4, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
0096: move-result                v4
0098: iput                       v4, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B2 I
009c: const/16                   v4, 34
00a0: invoke-static              v0, v4, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
00a6: move-result                v4
00a8: iput                       v4, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A0 I
00ac: const/16                   v4, 38
00b0: invoke-static              v0, v4, Lcom/conexant/universalfunction/CommonUtil;->formatByteToInt([B I)I
00b6: move-result                v4
00b8: iput                       v4, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A1 I
00bc: const/16                   v5, 18
00c0: aget-byte                  v0, v0, v5
00c4: iput-byte                  v0, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->Gain B
00c8: iget                       v0, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B0 I
00cc: shl-int/lit8               v0, v0, 8
00d0: shr-int/lit8               v0, v0, 8
00d4: iput                       v0, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B0 I
00d8: iget                       v0, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B1 I
00dc: shl-int/lit8               v0, v0, 8
00e0: shr-int/lit8               v0, v0, 8
00e4: iput                       v0, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B1 I
00e8: iget                       v0, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B2 I
00ec: shl-int/lit8               v0, v0, 8
00f0: shr-int/lit8               v0, v0, 8
00f4: iput                       v0, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B2 I
00f8: iget                       v0, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A0 I
00fc: shl-int/lit8               v0, v0, 8
0100: shr-int/lit8               v0, v0, 8
0104: iput                       v0, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A0 I
0108: shl-int/lit8               v0, v4, 8
010c: shr-int/lit8               v0, v0, 8
0110: iput                       v0, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A1 I
0114: sget-object                v0, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
0118: new-instance               v4, Ljava/lang/StringBuilder;
011c: const-string               v5, "getFreeman3EQParam: band = "
0120: invoke-direct              v4, v5, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
0126: iget                       v6, v9, Lcom/conexant/genericfeature/EQParam;->band I
012a: invoke-virtual             v4, v6, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0130: const-string               v6, " & B0 = "
0134: invoke-virtual             v4, v6, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
013a: iget                       v6, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B0 I
013e: invoke-virtual             v4, v6, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0144: const-string               v6, " & B1= "
0148: invoke-virtual             v4, v6, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
014e: iget                       v6, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B1 I
0152: invoke-virtual             v4, v6, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0158: const-string               v6, " & B2= "
015c: invoke-virtual             v4, v6, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0162: iget                       v6, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->B2 I
0166: invoke-virtual             v4, v6, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
016c: const-string               v6, " & A0= "
0170: invoke-virtual             v4, v6, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0176: iget                       v6, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A0 I
017a: invoke-virtual             v4, v6, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0180: const-string               v6, " & A1= "
0184: invoke-virtual             v4, v6, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
018a: iget                       v6, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->A1 I
018e: invoke-virtual             v4, v6, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0194: const-string               v6, " & gain= "
0198: invoke-virtual             v4, v6, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
019e: iget-byte                  v6, v1, Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs;->Gain B
01a2: invoke-virtual             v4, v6, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
01a8: invoke-virtual             v4, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
01ae: move-result-object         v4
01b0: invoke-static              v0, v4, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
01b6: new-instance               v4, Lcom/conexant/cnxtusbcheadset/Eq2Coeff;
01ba: invoke-direct              v4, Lcom/conexant/cnxtusbcheadset/Eq2Coeff;-><init>()V
01c0: iget                       v6, v8, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->DEFAULT_FREEMAN3_SAMPLERATE I
01c4: const/16                   v7, 24
01c8: invoke-virtual             v4, v6, v1, v7, Lcom/conexant/cnxtusbcheadset/Eq2Coeff;->CxAudioConvertCoeffs2EqParams(I Lcom/conexant/cnxtusbcheadset/CX2070xBandEQCoeffs; I)Lcom/conexant/cnxtusbcheadset/EQBandParam;
01ce: move-result-object         v1
01d0: if-nez                     v1, +008h
01d4: const-string               v8, "getFreeman3EQParam: eqParam is null"
01d8: invoke-static              v0, v8, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
01de: return                     v2
01e0: iget                       v2, v1, Lcom/conexant/cnxtusbcheadset/EQBandParam;->flags I
01e4: and-int/lit8               v2, v2, 15
01e8: iput                       v2, v9, Lcom/conexant/genericfeature/EQParam;->filterType I
01ec: iget                       v2, v1, Lcom/conexant/cnxtusbcheadset/EQBandParam;->Freq_Hz I
01f0: iput                       v2, v9, Lcom/conexant/genericfeature/EQParam;->frequency I
01f4: iget                       v2, v1, Lcom/conexant/cnxtusbcheadset/EQBandParam;->Qfactor I
01f8: int-to-float               v2, v2
01fa: const/high16               v4, 1132462080
01fe: div-float/2addr            v2, v4
0200: invoke-static              v2, Lcom/conexant/universalfunction/CommonUtil;->formatDecimal(F)D
0206: move-result-wide           v6
0208: iput-wide                  v6, v9, Lcom/conexant/genericfeature/EQParam;->qFactor D
020c: iget                       v1, v1, Lcom/conexant/cnxtusbcheadset/EQBandParam;->Gain_dB I
0210: int-to-float               v1, v1
0212: div-float/2addr            v1, v4
0214: float-to-int               v1, v1
0216: int-to-double              v1, v1
0218: iput-wide                  v1, v9, Lcom/conexant/genericfeature/EQParam;->gain D
021c: iget                       v8, v8, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->DEFAULT_FREEMAN3_SAMPLERATE I
0220: iput                       v8, v9, Lcom/conexant/genericfeature/EQParam;->sampleRate I
0224: new-instance               v8, Ljava/lang/StringBuilder;
0228: invoke-direct              v8, v5, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
022e: iget                       v1, v9, Lcom/conexant/genericfeature/EQParam;->band I
0232: invoke-virtual             v8, v1, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0238: const-string               v1, " & filterType = "
023c: invoke-virtual             v8, v1, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0242: iget                       v1, v9, Lcom/conexant/genericfeature/EQParam;->filterType I
0246: invoke-virtual             v8, v1, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
024c: const-string               v1, " & frequency = "
0250: invoke-virtual             v8, v1, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0256: iget                       v1, v9, Lcom/conexant/genericfeature/EQParam;->frequency I
025a: invoke-virtual             v8, v1, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0260: const-string               v1, " & qFactor = "
0264: invoke-virtual             v8, v1, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
026a: iget-wide                  v1, v9, Lcom/conexant/genericfeature/EQParam;->qFactor D
026e: invoke-virtual             v8, v1, v2, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;
0274: const-string               v1, " & gain = "
0278: invoke-virtual             v8, v1, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
027e: iget-wide                  v1, v9, Lcom/conexant/genericfeature/EQParam;->gain D
0282: invoke-virtual             v8, v1, v2, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;
0288: invoke-virtual             v8, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
028e: move-result-object         v8
0290: invoke-static              v0, v8, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0296: return                     v3

Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice; releaseUsbDevice()V code_off=0x59cb14
0000: sget-object                v0, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
0004: const-string               v1, "release"
0008: invoke-static              v0, v1, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
000e: iget-object                v0, v2, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->mHidReader Lcom/conexant/cnxtusbcheadset/HidInterruptReader;
0012: const/4                    v1, 0
0014: if-eqz                     v0, +007h
0018: invoke-virtual             v0, Lcom/conexant/cnxtusbcheadset/HidInterruptReader;->release()V
001e: iput-object                v1, v2, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->mHidReader Lcom/conexant/cnxtusbcheadset/HidInterruptReader;
0022: iput-object                v1, v2, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->mHidEndpoint Landroid/hardware/usb/UsbEndpoint;
0026: iput-object                v1, v2, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->mHidInterface Landroid/hardware/usb/UsbInterface;
002a: iget-object                v0, v2, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->mKeyEventListeners Ljava/util/List;
002e: invoke-interface           v0, Ljava/util/List;->clear()V
0034: invoke-super               v2, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->releaseUsbDevice()V
003a: return-void                

Lcom/conexant/cnxtusbcheadset/GenericReturnValue; <clinit>()V code_off=0x59ce40
0000: new-instance               v0, Lcom/conexant/cnxtusbcheadset/GenericReturnValue$1;
0004: invoke-direct              v0, Lcom/conexant/cnxtusbcheadset/GenericReturnValue$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/cnxtusbcheadset/GenericReturnValue;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/cnxtusbcheadset/UsbHelper; getDeviceString(Landroid/hardware/usb/UsbDeviceConnection; I)Ljava/lang/String; code_off=0x59d19c
0000: const/16                   v6, 255
0004: new-array                  v5, v6, [B
0008: or-int/lit16               v3, v9, 768
000c: const/16                   v4, 1033
0010: const/16                   v7, 1000
0014: const/16                   v1, 128
0018: const/4                    v2, 6
001a: move-object                v0, v8
001c: invoke-virtual/range       v0 ... v7, Landroid/hardware/usb/UsbDeviceConnection;->controlTransfer(I I I I [B I I)I
0022: move-result                v8
0024: const/4                    v9, 2
0026: if-le                      v8, v9, +011h
002a: sub-int/2addr              v8, v9
002c: new-array                  v0, v8, [B
0030: const/4                    v1, 0
0032: invoke-static              v5, v9, v0, v1, v8, Ljava/lang/System;->arraycopy(Ljava/lang/Object; I Ljava/lang/Object; I I)V
0038: new-instance               v8, Ljava/lang/String;
003c: sget-object                v9, Ljava/nio/charset/StandardCharsets;->UTF_16LE Ljava/nio/charset/Charset;
0040: invoke-direct              v8, v0, v9, Ljava/lang/String;-><init>([B Ljava/nio/charset/Charset;)V
0046: return-object              v8
0048: const-string               v8, ""
004c: return-object              v8

Lcom/conexant/conexantusbtypec/adapter/DetectUsbDeviceAttachReceiver; getUsbDeviceSafely(Landroid/content/Intent;)Landroid/hardware/usb/UsbDevice; code_off=0x59d214
0000: const-string               v2, "device"
0004: sget                       v0, Landroid/os/Build$VERSION;->SDK_INT I
0008: const/16                   v1, 33
000c: if-lt                      v0, v1, +009h
0010: invoke-static              v3, Lx31;->k(Landroid/content/Intent;)Ljava/lang/Object;
0016: move-result-object         v2
0018: check-cast                 v2, Landroid/hardware/usb/UsbDevice;
001c: return-object              v2
001e: invoke-virtual             v3, v2, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;
0024: move-result-object         v2
0026: check-cast                 v2, Landroid/hardware/usb/UsbDevice;
002a: return-object              v2
002c: move-exception             v2
002e: sget-object                v3, Lcom/conexant/conexantusbtypec/adapter/DetectUsbDeviceAttachReceiver;->TAG Ljava/lang/String;
0032: new-instance               v0, Ljava/lang/StringBuilder;
0036: const-string               v1, "getUsbDeviceSafely failed: "
003a: invoke-direct              v0, v1, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
0040: invoke-virtual             v2, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;
0046: move-result-object         v2
0048: invoke-virtual             v0, v2, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
004e: invoke-virtual             v0, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
0054: move-result-object         v2
0056: invoke-static              v3, v2, Lcom/conexant/libcnxtservice/SmartLog;->e(Ljava/lang/String; Ljava/lang/String;)I
005c: const/4                    v2, 0
005e: return-object              v2

Lcom/conexant/conexantusbtypec/common/ApplicationData$CommonEQParams; getPresetList()Ljava/util/List; code_off=0x59d4dc
0000: new-instance               v0, Ljava/util/ArrayList;
0004: invoke-direct              v0, Ljava/util/ArrayList;-><init>()V
000a: const-string               v1, "Custom"
000e: invoke-virtual             v0, v1, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
0014: const-string               v1, "Default"
0018: invoke-virtual             v0, v1, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
001e: const-string               v1, "Dance"
0022: invoke-virtual             v0, v1, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
0028: const-string               v1, "Rock"
002c: invoke-virtual             v0, v1, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
0032: const-string               v1, "Jazz"
0036: invoke-virtual             v0, v1, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
003c: const-string               v1, "Rap"
0040: invoke-virtual             v0, v1, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
0046: return-object              v0

Lcom/conexant/conexantusbtypec/common/ApplicationData$freeman3EQParams; <clinit>()V code_off=0x59d54c
0000: const/16                   v0, 10
0004: new-array                  v1, v0, [D
0008: fill-array-data            v1, +0000038h
000e: sput-object                v1, Lcom/conexant/conexantusbtypec/common/ApplicationData$freeman3EQParams;->Q_FACTOR [D
0012: new-array                  v1, v0, [I
0016: fill-array-data            v1, +000005dh
001c: sput-object                v1, Lcom/conexant/conexantusbtypec/common/ApplicationData$freeman3EQParams;->FREQUENCY_ARRAY [I
0020: new-array                  v1, v0, [I
0024: fill-array-data            v1, +000006eh
002a: sput-object                v1, Lcom/conexant/conexantusbtypec/common/ApplicationData$freeman3EQParams;->FILTER_TYPE [I
002e: new-array                  v2, v0, [F
0032: fill-array-data            v2, +000007fh
0038: new-array                  v3, v0, [F
003c: fill-array-data            v3, +0000092h
0042: new-array                  v4, v0, [F
0046: fill-array-data            v4, +00000a5h
004c: new-array                  v5, v0, [F
0050: fill-array-data            v5, +00000b8h
0056: new-array                  v6, v0, [F
005a: fill-array-data            v6, +00000cbh
0060: new-array                  v7, v0, [F
0064: fill-array-data            v7, +00000deh
006a: filled-new-array/range     v2 ... v7, [[F
0070: move-result-object         v0
0072: sput-object                v0, Lcom/conexant/conexantusbtypec/common/ApplicationData$freeman3EQParams;->PresetBandGainArray [[F
0076: return-void                
0078: fill-array-data-payload    b'\x00\x00\x00\x00\x00\x00\xf0?\x00\x00\x00\x00\x00\x00\xf0?\x00\x00\x00\x00\x00\x00\xf0?\x00\x00\x00\x00\x00\x00\xf0?\x00\x00\x00\x00\x00\x00\xf0?\x00\x00\x00\x00\x00\x00\xf0?\x00\x00\x00\x00\x00\x00\xf0?\x00\x00\x00\x00\x00\x00\xf0?\x00\x00\x00\x00\x00\x00\xf0?\x00\x00\x00\x00\x00\x00\xf0?' | \x00\x00\x00\x00\x00\x00\xf0\x3f\x00\x00\x00\x00\x00\x00\xf0\x3f\x00\x00\x00\x00\x00\x00\xf0\x3f\x00\x00\x00\x00\x00\x00\xf0\x3f\x00\x00\x00\x00\x00\x00\xf0\x3f\x00\x00\x00\x00\x00\x00\xf0\x3f\x00\x00\x00\x00\x00\x00\xf0\x3f\x00\x00\x00\x00\x00\x00\xf0\x3f\x00\x00\x00\x00\x00\x00\xf0\x3f\x00\x00\x00\x00\x00\x00\xf0\x3f
00d0: fill-array-data-payload    b"d\x00\x00\x00,\x01\x00\x00\xb0\x04\x00\x00\xd0\x07\x00\x00\x88\x13\x00\x00@\x1f\x00\x00\x10'\x00\x00\xb06\x00\x00PF\x00\x00 N\x00\x00" | \x64\x00\x00\x00\x2c\x01\x00\x00\xb0\x04\x00\x00\xd0\x07\x00\x00\x88\x13\x00\x00\x40\x1f\x00\x00\x10\x27\x00\x00\xb0\x36\x00\x00\x50\x46\x00\x00\x20\x4e\x00\x00
0100: fill-array-data-payload    b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' | \x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00
0130: fill-array-data-payload    b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' | \x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00
0160: fill-array-data-payload    b'\x00\x00\xa0@\x00\x00\x00@\x00\x00\x00\x00\x00\x00 \xc1\x00\x00\xa0\xc0\x00\x00\x00\x00\x00\x00\xa0@\x00\x00\x10A\x00\x000A\x00\x000A' | \x00\x00\xa0\x40\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x20\xc1\x00\x00\xa0\xc0\x00\x00\x00\x00\x00\x00\xa0\x40\x00\x00\x10\x41\x00\x00\x30\x41\x00\x00\x30\x41
0190: fill-array-data-payload    b'\x00\x00\xc0@\x00\x00@@\x00\x00\x00\xc1\x00\x00@\xc1\x00\x00\x80\xc0\x00\x00@@\x00\x00\x00A\x00\x00 A\x00\x00 A\x00\x00\xe0@' | \x00\x00\xc0\x40\x00\x00\x40\x40\x00\x00\x00\xc1\x00\x00\x40\xc1\x00\x00\x80\xc0\x00\x00\x40\x40\x00\x00\x00\x41\x00\x00\x20\x41\x00\x00\x20\x41\x00\x00\xe0\x40
01c0: fill-array-data-payload    b'\x00\x00\x00\xc1\x00\x00\xc0@\x00\x00\x00\x00\x00\x00\x00A\x00\x00\x00\xc1\x00\x00 A\x00\x00\x00\xc0\x00\x00@A\x00\x00\x00A\x00\x00\x80?' | \x00\x00\x00\xc1\x00\x00\xc0\x40\x00\x00\x00\x00\x00\x00\x00\x41\x00\x00\x00\xc1\x00\x00\x20\x41\x00\x00\x00\xc0\x00\x00\x40\x41\x00\x00\x00\x41\x00\x00\x80\x3f
01f0: fill-array-data-payload    b'\x00\x00@\xc1\x00\x00\x10\xc1\x00\x00\x80\xc0\x00\x00\x00@\x00\x00\x00A\x00\x00@A\x00\x00\x00@\x00\x000\xc1\x00\x00\x00\xc0\x00\x00\x00A' | \x00\x00\x40\xc1\x00\x00\x10\xc1\x00\x00\x80\xc0\x00\x00\x00\x40\x00\x00\x00\x41\x00\x00\x40\x41\x00\x00\x00\x40\x00\x00\x30\xc1\x00\x00\x00\xc0\x00\x00\x00\x41
0220: fill-array-data-payload    b'\x00\x00\x00\x00\x00\x00\xe0@\x00\x00\x80\xbf\x00\x00\xe0\xc0\x00\x00@\xc1\x00\x00\x00\xc1\x00\x00\x00\x00\x00\x00 A\x00\x00\x80@\x00\x00\xa0\xc0' | \x00\x00\x00\x00\x00\x00\xe0\x40\x00\x00\x80\xbf\x00\x00\xe0\xc0\x00\x00\x40\xc1\x00\x00\x00\xc1\x00\x00\x00\x00\x00\x00\x20\x41\x00\x00\x80\x40\x00\x00\xa0\xc0

Lcom/conexant/conexantusbtypec/common/ApplicationData$freemanEQParams; <clinit>()V code_off=0x59d7c4
0000: const/16                   v0, 3000
0004: const/16                   v1, 9000
0008: const/16                   v2, 100
000c: const/16                   v3, 300
0010: const/16                   v4, 1000
0014: filled-new-array           v2, v3, v4, v0, v1, [I
001a: move-result-object         v0
001c: sput-object                v0, Lcom/conexant/conexantusbtypec/common/ApplicationData$freemanEQParams;->FREQUENCY_ARRAY [I
0020: const/4                    v0, 0
0022: const/4                    v1, 2
0024: const/4                    v2, 1
0026: filled-new-array           v2, v0, v0, v0, v1, [I
002c: move-result-object         v0
002e: sput-object                v0, Lcom/conexant/conexantusbtypec/common/ApplicationData$freemanEQParams;->FILTER_TYPE [I
0032: const/4                    v0, 5
0034: new-array                  v1, v0, [F
0038: fill-array-data            v1, +0000024h
003e: new-array                  v2, v0, [F
0042: fill-array-data            v2, +000002dh
0048: new-array                  v3, v0, [F
004c: fill-array-data            v3, +0000036h
0052: new-array                  v4, v0, [F
0056: fill-array-data            v4, +000003fh
005c: new-array                  v5, v0, [F
0060: fill-array-data            v5, +0000048h
0066: new-array                  v6, v0, [F
006a: fill-array-data            v6, +0000051h
0070: filled-new-array/range     v1 ... v6, [[F
0076: move-result-object         v0
0078: sput-object                v0, Lcom/conexant/conexantusbtypec/common/ApplicationData$freemanEQParams;->PresetBandGainArray [[F
007c: return-void                
007e: nop                        
0080: fill-array-data-payload    b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' | \x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00
009c: fill-array-data-payload    b'\x00\x00\x00@\x00\x00 \xc1\x00\x00\x00\x00\x00\x00\x10A\x00\x000A' | \x00\x00\x00\x40\x00\x00\x20\xc1\x00\x00\x00\x00\x00\x00\x10\x41\x00\x00\x30\x41
00b8: fill-array-data-payload    b'\x00\x00@@\x00\x00@\xc1\x00\x00@@\x00\x00 A\x00\x00\xe0@' | \x00\x00\x40\x40\x00\x00\x40\xc1\x00\x00\x40\x40\x00\x00\x20\x41\x00\x00\xe0\x40
00d4: fill-array-data-payload    b'\x00\x00\xc0@\x00\x00\x00A\x00\x00 A\x00\x00@A\x00\x00\x80?' | \x00\x00\xc0\x40\x00\x00\x00\x41\x00\x00\x20\x41\x00\x00\x40\x41\x00\x00\x80\x3f
00f0: fill-array-data-payload    b'\x00\x00\x10\xc1\x00\x00\x00@\x00\x00@A\x00\x000\xc1\x00\x00\x00A' | \x00\x00\x10\xc1\x00\x00\x00\x40\x00\x00\x40\x41\x00\x00\x30\xc1\x00\x00\x00\x41
010c: fill-array-data-payload    b'\x00\x00\xe0@\x00\x00\xe0\xc0\x00\x00\x00\xc1\x00\x00 A\x00\x00\xa0\xc0' | \x00\x00\xe0\x40\x00\x00\xe0\xc0\x00\x00\x00\xc1\x00\x00\x20\x41\x00\x00\xa0\xc0

Lcom/conexant/conexantusbtypec/common/ApplicationData$wheelerEQParams; <clinit>()V code_off=0x59d914
0000: const/16                   v0, 10
0004: new-array                  v1, v0, [I
0008: fill-array-data            v1, +0000032h
000e: sput-object                v1, Lcom/conexant/conexantusbtypec/common/ApplicationData$wheelerEQParams;->FREQUENCY_ARRAY [I
0012: new-array                  v1, v0, [I
0016: fill-array-data            v1, +0000043h
001c: sput-object                v1, Lcom/conexant/conexantusbtypec/common/ApplicationData$wheelerEQParams;->FILTER_TYPE [I
0020: new-array                  v2, v0, [F
0024: fill-array-data            v2, +0000054h
002a: new-array                  v3, v0, [F
002e: fill-array-data            v3, +0000067h
0034: new-array                  v4, v0, [F
0038: fill-array-data            v4, +000007ah
003e: new-array                  v5, v0, [F
0042: fill-array-data            v5, +000008dh
0048: new-array                  v6, v0, [F
004c: fill-array-data            v6, +00000a0h
0052: new-array                  v7, v0, [F
0056: fill-array-data            v7, +00000b3h
005c: filled-new-array/range     v2 ... v7, [[F
0062: move-result-object         v0
0064: sput-object                v0, Lcom/conexant/conexantusbtypec/common/ApplicationData$wheelerEQParams;->PresetBandGainArray [[F
0068: return-void                
006a: nop                        
006c: fill-array-data-payload    b'd\x00\x00\x00N\x00\x00\x00}\x00\x00\x00\xfa\x00\x00\x00\xf4\x01\x00\x00\xe8\x03\x00\x00\xd0\x07\x00\x00\xa0\x0f\x00\x00@\x1f\x00\x00\xe0.\x00\x00' | \x64\x00\x00\x00\x4e\x00\x00\x00\x7d\x00\x00\x00\xfa\x00\x00\x00\xf4\x01\x00\x00\xe8\x03\x00\x00\xd0\x07\x00\x00\xa0\x0f\x00\x00\x40\x1f\x00\x00\xe0\x2e\x00\x00
009c: fill-array-data-payload    b'\x01\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00' | \x01\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00
00cc: fill-array-data-payload    b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' | \x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00
00fc: fill-array-data-payload    b'\x00\x00\xa0@\x00\x00\x00@\x00\x00\x00\x00\x00\x00 \xc1\x00\x00\xa0\xc0\x00\x00\x00\x00\x00\x00\xa0@\x00\x00\x10A\x00\x000A\x00\x000A' | \x00\x00\xa0\x40\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x20\xc1\x00\x00\xa0\xc0\x00\x00\x00\x00\x00\x00\xa0\x40\x00\x00\x10\x41\x00\x00\x30\x41\x00\x00\x30\x41
012c: fill-array-data-payload    b'\x00\x00\xc0@\x00\x00@@\x00\x00\x00\xc1\x00\x00@\xc1\x00\x00\x80\xc0\x00\x00@@\x00\x00\x00A\x00\x00 A\x00\x00 A\x00\x00\xe0@' | \x00\x00\xc0\x40\x00\x00\x40\x40\x00\x00\x00\xc1\x00\x00\x40\xc1\x00\x00\x80\xc0\x00\x00\x40\x40\x00\x00\x00\x41\x00\x00\x20\x41\x00\x00\x20\x41\x00\x00\xe0\x40
015c: fill-array-data-payload    b'\x00\x00\x00\xc1\x00\x00\xc0@\x00\x00\x00\x00\x00\x00\x00A\x00\x00\x00\xc1\x00\x00 A\x00\x00\x00\xc0\x00\x00@A\x00\x00\x00A\x00\x00\x80?' | \x00\x00\x00\xc1\x00\x00\xc0\x40\x00\x00\x00\x00\x00\x00\x00\x41\x00\x00\x00\xc1\x00\x00\x20\x41\x00\x00\x00\xc0\x00\x00\x40\x41\x00\x00\x00\x41\x00\x00\x80\x3f
018c: fill-array-data-payload    b'\x00\x00@\xc1\x00\x00\x10\xc1\x00\x00\x80\xc0\x00\x00\x00@\x00\x00\x00A\x00\x00@A\x00\x00\x00@\x00\x000\xc1\x00\x00\x00\xc0\x00\x00\x00A' | \x00\x00\x40\xc1\x00\x00\x10\xc1\x00\x00\x80\xc0\x00\x00\x00\x40\x00\x00\x00\x41\x00\x00\x40\x41\x00\x00\x00\x40\x00\x00\x30\xc1\x00\x00\x00\xc0\x00\x00\x00\x41
01bc: fill-array-data-payload    b'\x00\x00\x00\x00\x00\x00\xe0@\x00\x00\x80\xbf\x00\x00\xe0\xc0\x00\x00@\xc1\x00\x00\x00\xc1\x00\x00\x00\x00\x00\x00 A\x00\x00\x80@\x00\x00\xa0\xc0' | \x00\x00\x00\x00\x00\x00\xe0\x40\x00\x00\x80\xbf\x00\x00\xe0\xc0\x00\x00\x40\xc1\x00\x00\x00\xc1\x00\x00\x00\x00\x00\x00\x20\x41\x00\x00\x80\x40\x00\x00\xa0\xc0

Lcom/conexant/conexantusbtypec/common/ApplicationData; <clinit>()V code_off=0x59db28
0000: const-string               v0, "android.permission.READ_EXTERNAL_STORAGE"
0004: const-string               v1, "android.permission.WRITE_EXTERNAL_STORAGE"
0008: filled-new-array           v0, v1, [Ljava/lang/String;
000e: move-result-object         v0
0010: sput-object                v0, Lcom/conexant/conexantusbtypec/common/ApplicationData;->PERMISSIONS [Ljava/lang/String;
0014: const-string               v0, "About Synaptics"
0018: const-string               v1, "Device Information"
001c: filled-new-array           v0, v1, [Ljava/lang/String;
0022: move-result-object         v0
0024: sput-object                v0, Lcom/conexant/conexantusbtypec/common/ApplicationData;->MENU_DATA_LIST [Ljava/lang/String;
0028: const-string               v6, "Device"
002c: const-string               v7, "Firmware Version"
0030: const-string               v1, "Manufacturer"
0034: const-string               v2, "Product"
0038: const-string               v3, "Serial Number"
003c: const-string               v4, "USB Vendor ID"
0040: const-string               v5, "USB Product ID"
0044: filled-new-array/range     v1 ... v7, [Ljava/lang/String;
004a: move-result-object         v0
004c: sput-object                v0, Lcom/conexant/conexantusbtypec/common/ApplicationData;->DEVICE_INFO_ARRAY [Ljava/lang/String;
0050: const/4                    v0, 0
0052: sput-boolean               v0, Lcom/conexant/conexantusbtypec/common/ApplicationData;->isAdaptiveHybridType Z
0056: sput-boolean               v0, Lcom/conexant/conexantusbtypec/common/ApplicationData;->isANCEnabled Z
005a: sput-boolean               v0, Lcom/conexant/conexantusbtypec/common/ApplicationData;->isAIEnabled Z
005e: sput-boolean               v0, Lcom/conexant/conexantusbtypec/common/ApplicationData;->isWVPEnabled Z
0062: const/4                    v1, 1
0064: sput-boolean               v1, Lcom/conexant/conexantusbtypec/common/ApplicationData;->isSVPEnabled Z
0068: sput-boolean               v0, Lcom/conexant/conexantusbtypec/common/ApplicationData;->isBinauralRecordingEnabled Z
006c: sput                       v0, Lcom/conexant/conexantusbtypec/common/ApplicationData;->ANCLevel I
0070: sput                       v0, Lcom/conexant/conexantusbtypec/common/ApplicationData;->AIProfile I
0074: sput-boolean               v0, Lcom/conexant/conexantusbtypec/common/ApplicationData;->isFeatureCtrEnabled Z
0078: sput-boolean               v1, Lcom/conexant/conexantusbtypec/common/ApplicationData;->isANCDisplayed Z
007c: sput-boolean               v1, Lcom/conexant/conexantusbtypec/common/ApplicationData;->isAIDisplayed Z
0080: sput-boolean               v1, Lcom/conexant/conexantusbtypec/common/ApplicationData;->isTriggerDisplayed Z
0084: sput-boolean               v0, Lcom/conexant/conexantusbtypec/common/ApplicationData;->isWVPDisplayed Z
0088: sput-boolean               v1, Lcom/conexant/conexantusbtypec/common/ApplicationData;->isSVPDisplayed Z
008c: sput-boolean               v1, Lcom/conexant/conexantusbtypec/common/ApplicationData;->isEQDisplayed Z
0090: sput-boolean               v1, Lcom/conexant/conexantusbtypec/common/ApplicationData;->isBinauralRecordingDisplayed Z
0094: sput-boolean               v1, Lcom/conexant/conexantusbtypec/common/ApplicationData;->isFwUpdateAvailable Z
0098: sput-boolean               v0, Lcom/conexant/conexantusbtypec/common/ApplicationData;->isWhisperTuningAvailable Z
009c: sput-boolean               v0, Lcom/conexant/conexantusbtypec/common/ApplicationData;->isAdaptiveOrFixedAvailable Z
00a0: const/4                    v1, 3
00a2: sput                       v1, Lcom/conexant/conexantusbtypec/common/ApplicationData;->ANCAvailableLevels I
00a6: sput                       v1, Lcom/conexant/conexantusbtypec/common/ApplicationData;->AIAvailableLevels I
00aa: sput-boolean               v0, Lcom/conexant/conexantusbtypec/common/ApplicationData;->IS_FM3_FEATURE_CTRL_ENABLED Z
00ae: sput-boolean               v0, Lcom/conexant/conexantusbtypec/common/ApplicationData;->IS_DIAGNOSE_AVAILABLE Z
00b2: sput-boolean               v0, Lcom/conexant/conexantusbtypec/common/ApplicationData;->IS_HIFI_FM_AVAILABLE Z
00b6: sput-boolean               v0, Lcom/conexant/conexantusbtypec/common/ApplicationData;->IS_DONGLE_LR_DETECT_AVAILABLE Z
00ba: sput-boolean               v0, Lcom/conexant/conexantusbtypec/common/ApplicationData;->IS_LPM_AVAILABLE Z
00be: sput-boolean               v0, Lcom/conexant/conexantusbtypec/common/ApplicationData;->IS_EQ_IN_FW_AVAILABLE Z
00c2: sput-boolean               v0, Lcom/conexant/conexantusbtypec/common/ApplicationData;->IS_DIAGNOSE_ENABLED Z
00c6: sput-boolean               v0, Lcom/conexant/conexantusbtypec/common/ApplicationData;->IS_HIFI_FM_ENABLED Z
00ca: sput-boolean               v0, Lcom/conexant/conexantusbtypec/common/ApplicationData;->IS_DONGLE_LR_DETECT_ENABLED Z
00ce: sput-boolean               v0, Lcom/conexant/conexantusbtypec/common/ApplicationData;->IS_LPM_ENABLED Z
00d2: sput-boolean               v0, Lcom/conexant/conexantusbtypec/common/ApplicationData;->IS_EQ_IN_FW_ENABLED Z
00d6: const-string               v0, "Low"
00da: const-string               v1, "Unk"
00de: const-string               v2, "High"
00e2: const-string               v3, "Med"
00e6: filled-new-array           v2, v3, v0, v1, [Ljava/lang/String;
00ec: move-result-object         v0
00ee: sput-object                v0, Lcom/conexant/conexantusbtypec/common/ApplicationData;->ANC_LEVEL_LABLES [Ljava/lang/String;
00f2: return-void                

Lcom/conexant/conexantusbtypec/crash/ActivityCollector; <clinit>()V code_off=0x59dc70
0000: new-instance               v0, Ljava/util/ArrayList;
0004: invoke-direct              v0, Ljava/util/ArrayList;-><init>()V
000a: sput-object                v0, Lcom/conexant/conexantusbtypec/crash/ActivityCollector;->activities Ljava/util/List;
000e: new-instance               v0, Ljava/lang/ref/WeakReference;
0012: sget-object                v1, Lcom/conexant/conexantusbtypec/crash/ActivityCollector;->activities Ljava/util/List;
0016: invoke-direct              v0, v1, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
001c: sput-object                v0, Lcom/conexant/conexantusbtypec/crash/ActivityCollector;->listWeakReference Ljava/lang/ref/WeakReference;
0020: return-void                

Lcom/conexant/conexantusbtypec/entity/FirmwareFileBean; <init>()V code_off=0x59ddd8
0000: invoke-direct              v0, Ljava/lang/Object;-><init>()V
0006: return-void                

Lcom/conexant/conexantusbtypec/entity/FirmwareFileBean; getId()Ljava/lang/String; code_off=0x59dd78
0000: iget-object                v0, v0, Lcom/conexant/conexantusbtypec/entity/FirmwareFileBean;->id Ljava/lang/String;
0004: return-object              v0

Lcom/conexant/conexantusbtypec/entity/FirmwareFileBean; getName()Ljava/lang/String; code_off=0x59dd90
0000: iget-object                v0, v0, Lcom/conexant/conexantusbtypec/entity/FirmwareFileBean;->name Ljava/lang/String;
0004: return-object              v0

Lcom/conexant/conexantusbtypec/entity/FirmwareFileBean; getPath()Ljava/lang/String; code_off=0x59dda8
0000: iget-object                v0, v0, Lcom/conexant/conexantusbtypec/entity/FirmwareFileBean;->path Ljava/lang/String;
0004: return-object              v0

Lcom/conexant/conexantusbtypec/entity/FirmwareFileBean; getSize()Ljava/lang/String; code_off=0x59ddc0
0000: iget-object                v0, v0, Lcom/conexant/conexantusbtypec/entity/FirmwareFileBean;->size Ljava/lang/String;
0004: return-object              v0

Lcom/conexant/conexantusbtypec/entity/FirmwareFileBean; setId(Ljava/lang/String;)V code_off=0x59ddf0
0000: iput-object                v1, v0, Lcom/conexant/conexantusbtypec/entity/FirmwareFileBean;->id Ljava/lang/String;
0004: return-void                

Lcom/conexant/conexantusbtypec/entity/FirmwareFileBean; setName(Ljava/lang/String;)V code_off=0x59de08
0000: iput-object                v1, v0, Lcom/conexant/conexantusbtypec/entity/FirmwareFileBean;->name Ljava/lang/String;
0004: return-void                

Lcom/conexant/conexantusbtypec/entity/FirmwareFileBean; setPath(Ljava/lang/String;)V code_off=0x59de20
0000: iput-object                v1, v0, Lcom/conexant/conexantusbtypec/entity/FirmwareFileBean;->path Ljava/lang/String;
0004: return-void                

Lcom/conexant/conexantusbtypec/entity/FirmwareFileBean; setSize(Ljava/lang/String;)V code_off=0x59de38
0000: iput-object                v1, v0, Lcom/conexant/conexantusbtypec/entity/FirmwareFileBean;->size Ljava/lang/String;
0004: return-void                

Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase; getDeviceChipCode()I code_off=0x0

Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase; getDeviceType()I code_off=0x59eeb4
0000: iget                       v0, v0, Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;->mDeviceType I
0004: return                     v0

Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase; getFirmwareParam(Lcom/syna/FirmwareParam;)I code_off=0x0

Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase; getUpdateFirmwareProgress()I code_off=0x0

Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase; resetDevice()I code_off=0x0

Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase; updateFirmware(Ljava/lang/String;)Lcom/conexant/cnxtusbcheadset/GenericReturnValue; code_off=0x0

Lcom/conexant/debugfeature/ICmdSender; sendCmdToDevice(Lcom/conexant/universalfunction/CnxtUsbCommand;)Lcom/conexant/universalfunction/CnxtUsbCommand; code_off=0x0

Lcom/conexant/conexantusbtypec/svcimpl/FreemanController; getDeviceChipCode()I code_off=0x59df1c
0000: iget-object                v0, v2, Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;->mUsbSession Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;
0004: invoke-virtual             v0, Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;->getSessionId()I
000a: move-result                v0
000c: invoke-static              v0, Lcom/conexant/libcnxtservice/service/FreemanSession;->bldCmdGetDeviceChipCode(I)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0012: move-result-object         v0
0014: iget-object                v2, v2, Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;->mModuleId Ljava/lang/String;
0018: invoke-static              v2, v0, Lcom/conexant/libcnxtservice/ServiceUtils;->svcModuleCmd(Ljava/lang/String; Lcom/conexant/libcnxtservice/ServiceModuleCommand;)Z
001e: invoke-virtual             v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->getArg()J
0024: move-result-wide           v0
0026: long-to-int                v2, v0
0028: return                     v2

Lcom/conexant/conexantusbtypec/svcimpl/FreemanController; getFirmwareParam(Lcom/syna/FirmwareParam;)I code_off=0x59e000
0000: iget-object                v0, v1, Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;->mModuleId Ljava/lang/String;
0004: iget-object                v1, v1, Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;->mUsbSession Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;
0008: invoke-virtual             v1, Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;->getSessionId()I
000e: move-result                v1
0010: invoke-static              v1, v2, Lcom/conexant/libcnxtservice/service/FreemanSession;->bldCmdGetFirmwareParam(I Lcom/syna/FirmwareParam;)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0016: move-result-object         v1
0018: invoke-static              v0, v1, Lcom/conexant/libcnxtservice/ServiceUtils;->svcModuleCmd(Ljava/lang/String; Lcom/conexant/libcnxtservice/ServiceModuleCommand;)Z
001e: move-result                v1
0020: if-eqz                     v1, +004h
0024: const/4                    v1, 0
0026: return                     v1
0028: const/16                   v1, -1001
002c: return                     v1

Lcom/conexant/conexantusbtypec/svcimpl/FreemanController; getUpdateFirmwareProgress()I code_off=0x59e100
0000: iget-object                v0, v2, Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;->mUsbSession Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;
0004: invoke-virtual             v0, Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;->getSessionId()I
000a: move-result                v0
000c: invoke-static              v0, Lcom/conexant/libcnxtservice/service/FreemanSession;->bldCmdGetUpdateFirmwareProgress(I)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0012: move-result-object         v0
0014: iget-object                v2, v2, Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;->mModuleId Ljava/lang/String;
0018: invoke-static              v2, v0, Lcom/conexant/libcnxtservice/ServiceUtils;->svcModuleCmd(Ljava/lang/String; Lcom/conexant/libcnxtservice/ServiceModuleCommand;)Z
001e: invoke-virtual             v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->getArg()J
0024: move-result-wide           v0
0026: long-to-int                v2, v0
0028: return                     v2

Lcom/conexant/conexantusbtypec/svcimpl/FreemanController; resetDevice()I code_off=0x59e17c
0000: iget-object                v0, v1, Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;->mModuleId Ljava/lang/String;
0004: iget-object                v1, v1, Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;->mUsbSession Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;
0008: invoke-virtual             v1, Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;->getSessionId()I
000e: move-result                v1
0010: invoke-static              v1, Lcom/conexant/libcnxtservice/service/FreemanSession;->bldCmdResetDevice(I)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0016: move-result-object         v1
0018: invoke-static              v0, v1, Lcom/conexant/libcnxtservice/ServiceUtils;->svcModuleCmd(Ljava/lang/String; Lcom/conexant/libcnxtservice/ServiceModuleCommand;)Z
001e: move-result                v1
0020: if-eqz                     v1, +004h
0024: const/4                    v1, 0
0026: return                     v1
0028: const/16                   v1, -1001
002c: return                     v1

Lcom/conexant/conexantusbtypec/svcimpl/FreemanController; sendCmdToDevice(Lcom/conexant/universalfunction/CnxtUsbCommand;)Lcom/conexant/universalfunction/CnxtUsbCommand; code_off=0x59de8c
0000: iget-object                v0, v1, Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;->mUsbSession Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;
0004: invoke-virtual             v0, Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;->getSessionId()I
000a: move-result                v0
000c: invoke-static              v0, v2, Lcom/conexant/libcnxtservice/service/FreemanSession;->bldCmdSendCmdToDevice(I Lcom/conexant/universalfunction/CnxtUsbCommand;)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0012: move-result-object         v2
0014: iget-object                v1, v1, Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;->mModuleId Ljava/lang/String;
0018: invoke-static              v1, v2, Lcom/conexant/libcnxtservice/ServiceUtils;->svcModuleCmd(Ljava/lang/String; Lcom/conexant/libcnxtservice/ServiceModuleCommand;)Z
001e: invoke-virtual             v2, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->getOutputParam()Ljava/lang/Object;
0024: move-result-object         v1
0026: check-cast                 v1, Lcom/conexant/universalfunction/CnxtUsbCommand;
002a: return-object              v1

Lcom/conexant/conexantusbtypec/svcimpl/FreemanController; updateFirmware(Ljava/lang/String;)Lcom/conexant/cnxtusbcheadset/GenericReturnValue; code_off=0x59de50
0000: iget-object                v0, v1, Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;->mUsbSession Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;
0004: invoke-virtual             v0, Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;->getSessionId()I
000a: move-result                v0
000c: invoke-static              v0, v2, Lcom/conexant/libcnxtservice/service/FreemanSession;->bldCmdUpdateFirmware(I Ljava/lang/String;)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0012: move-result-object         v2
0014: iget-object                v1, v1, Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;->mModuleId Ljava/lang/String;
0018: invoke-static              v1, v2, Lcom/conexant/libcnxtservice/ServiceUtils;->svcModuleCmd(Ljava/lang/String; Lcom/conexant/libcnxtservice/ServiceModuleCommand;)Z
001e: invoke-virtual             v2, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->getOutputParam()Ljava/lang/Object;
0024: move-result-object         v1
0026: check-cast                 v1, Lcom/conexant/cnxtusbcheadset/GenericReturnValue;
002a: return-object              v1

Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient; <clinit>()V code_off=0x59e984
0000: new-instance               v0, Ljava/lang/Object;
0004: invoke-direct              v0, Ljava/lang/Object;-><init>()V
000a: sput-object                v0, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->mSyncObj Ljava/lang/Object;
000e: return-void                

Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient; getUSBFreeman()Lcom/conexant/genericfeature/IFreeman; code_off=0x59e8d0
0000: invoke-static              Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->getUsb()Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;
0006: move-result-object         v0
0008: check-cast                 v0, Lcom/conexant/genericfeature/IFreeman;
000c: return-object              v0
000e: move-exception             v0
0010: invoke-virtual             v0, Ljava/lang/Throwable;->printStackTrace()V
0016: const/4                    v0, 0
0018: return-object              v0

Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient; onDeviceAttach(Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;)V code_off=0x59eb90
0000: if-eqz                     v6, +044h
0004: invoke-virtual             v6, Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;->getUsbDevice()Landroid/hardware/usb/UsbDevice;
000a: move-result-object         v0
000c: if-nez                     v0, +003h
0010: goto                       +3ch
0012: iget-object                v0, v5, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->mUsbSession Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;
0016: if-eqz                     v0, +00ah
001a: sget-object                v5, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->TAG Ljava/lang/String;
001e: const-string               v6, "onDeviceAttach: already attached a usb device!!!"
0022: invoke-static              v5, v6, Lcom/conexant/libcnxtservice/SmartLog;->e(Ljava/lang/String; Ljava/lang/String;)I
0028: return-void                
002a: iput-object                v6, v5, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->mUsbSession Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;
002e: invoke-direct              v5, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->tryCreateController()Z
0034: new-instance               v6, Ljava/util/ArrayList;
0038: iget-object                v0, v5, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->devicePlugListeners Ljava/util/List;
003c: invoke-direct              v6, v0, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
0042: invoke-virtual             v6, Ljava/util/ArrayList;->size()I
0048: move-result                v0
004a: const/4                    v1, 0
004c: if-ge                      v1, v0, +01dh
0050: invoke-virtual             v6, v1, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
0056: move-result-object         v2
0058: add-int/lit8               v1, v1, 1
005c: check-cast                 v2, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient$DevicePlugListener;
0060: if-nez                     v2, +003h
0064: goto                       -ch
0066: iget-object                v3, v5, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->mUsbSession Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;
006a: const/4                    v4, 1
006c: invoke-interface           v2, v3, v4, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient$DevicePlugListener;->onStateChange(Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor; Z)V
0072: goto                       -13h
0074: move-exception             v2
0076: sget-object                v3, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->TAG Ljava/lang/String;
007a: const-string               v4, "onDeviceAttach: listener failed"
007e: invoke-static              v3, v4, v2, Lcom/conexant/libcnxtservice/SmartLog;->e(Ljava/lang/String; Ljava/lang/String; Ljava/lang/Throwable;)I
0084: goto                       -1ch
0086: return-void                
0088: sget-object                v5, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->TAG Ljava/lang/String;
008c: const-string               v6, "onDeviceAttach: descriptor or usb device is null"
0090: invoke-static              v5, v6, Lcom/conexant/libcnxtservice/SmartLog;->e(Ljava/lang/String; Ljava/lang/String;)I
0096: return-void                

Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient; onDeviceDetach(I)V code_off=0x59ec44
0000: iget-object                v0, v6, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->mUsbSession Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;
0004: if-eqz                     v0, +042h
0008: invoke-virtual             v0, Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;->getSessionId()I
000e: move-result                v0
0010: if-eq                      v0, v7, +003h
0014: goto                       +3ah
0016: new-instance               v7, Ljava/util/ArrayList;
001a: iget-object                v0, v6, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->devicePlugListeners Ljava/util/List;
001e: invoke-direct              v7, v0, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
0024: invoke-virtual             v7, Ljava/util/ArrayList;->size()I
002a: move-result                v0
002c: const/4                    v1, 0
002e: move                       v2, v1
0030: if-ge                      v2, v0, +01ch
0034: invoke-virtual             v7, v2, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
003a: move-result-object         v3
003c: add-int/lit8               v2, v2, 1
0040: check-cast                 v3, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient$DevicePlugListener;
0044: if-nez                     v3, +003h
0048: goto                       -ch
004a: iget-object                v4, v6, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->mUsbSession Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;
004e: invoke-interface           v3, v4, v1, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient$DevicePlugListener;->onStateChange(Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor; Z)V
0054: goto                       -12h
0056: move-exception             v3
0058: sget-object                v4, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->TAG Ljava/lang/String;
005c: const-string               v5, "onDeviceDetach: listener failed"
0060: invoke-static              v4, v5, v3, Lcom/conexant/libcnxtservice/SmartLog;->e(Ljava/lang/String; Ljava/lang/String; Ljava/lang/Throwable;)I
0066: goto                       -1bh
0068: iget-object                v7, v6, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->mUsbCtrl Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;
006c: const/4                    v0, 0
006e: if-eqz                     v7, +007h
0072: invoke-virtual             v7, Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;->release()V
0078: iput-object                v0, v6, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->mUsbCtrl Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;
007c: iput-object                v0, v6, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->mUsbSession Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;
0080: invoke-static              Lcom/conexant/conexantusbtypec/common/ApplicationData;->release()V
0086: return-void                
0088: sget-object                v6, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->TAG Ljava/lang/String;
008c: const-string               v7, "onDeviceDetach: no device when detach or sessionId not match!!!"
0090: invoke-static              v6, v7, Lcom/conexant/libcnxtservice/SmartLog;->e(Ljava/lang/String; Ljava/lang/String;)I
0096: return-void                

Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient; onDevicePermissionChanged(I Z)V code_off=0x59ecf8
0000: iget-object                v6, v5, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->mUsbSession Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;
0004: if-nez                     v6, +00ah
0008: sget-object                v5, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->TAG Ljava/lang/String;
000c: const-string               v6, "onDevicePermissionChanged: no device!!!"
0010: invoke-static              v5, v6, Lcom/conexant/libcnxtservice/SmartLog;->e(Ljava/lang/String; Ljava/lang/String;)I
0016: return-void                
0018: invoke-virtual             v6, v7, Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;->setHasPermission(Z)V
001e: invoke-direct              v5, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->tryCreateController()Z
0024: new-instance               v6, Ljava/util/ArrayList;
0028: iget-object                v0, v5, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->devicePermissionListeners Ljava/util/List;
002c: invoke-direct              v6, v0, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
0032: invoke-virtual             v6, Ljava/util/ArrayList;->size()I
0038: move-result                v0
003a: const/4                    v1, 0
003c: if-ge                      v1, v0, +01ch
0040: invoke-virtual             v6, v1, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
0046: move-result-object         v2
0048: add-int/lit8               v1, v1, 1
004c: check-cast                 v2, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient$DevicePermissionListener;
0050: if-nez                     v2, +003h
0054: goto                       -ch
0056: iget-object                v3, v5, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->mUsbSession Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;
005a: invoke-interface           v2, v3, v7, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient$DevicePermissionListener;->onStateChange(Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor; Z)V
0060: goto                       -12h
0062: move-exception             v2
0064: sget-object                v3, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->TAG Ljava/lang/String;
0068: const-string               v4, "onDevicePermissionChanged: listener failed"
006c: invoke-static              v3, v4, v2, Lcom/conexant/libcnxtservice/SmartLog;->e(Ljava/lang/String; Ljava/lang/String; Ljava/lang/Throwable;)I
0072: goto                       -1bh
0074: return-void                

Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient; addDevicePermissionListener(Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient$DevicePermissionListener;)V code_off=0x59ea08
0000: if-eqz                     v2, +00fh
0004: iget-object                v0, v1, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->devicePermissionListeners Ljava/util/List;
0008: invoke-interface           v0, v2, Ljava/util/List;->contains(Ljava/lang/Object;)Z
000e: move-result                v0
0010: if-nez                     v0, +007h
0014: iget-object                v1, v1, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->devicePermissionListeners Ljava/util/List;
0018: invoke-interface           v1, v2, Ljava/util/List;->add(Ljava/lang/Object;)Z
001e: return-void                

Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient; addDevicePlugListener(Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient$DevicePlugListener;)V code_off=0x59ea38
0000: if-eqz                     v2, +00fh
0004: iget-object                v0, v1, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->devicePlugListeners Ljava/util/List;
0008: invoke-interface           v0, v2, Ljava/util/List;->contains(Ljava/lang/Object;)Z
000e: move-result                v0
0010: if-nez                     v0, +007h
0014: iget-object                v1, v1, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->devicePlugListeners Ljava/util/List;
0018: invoke-interface           v1, v2, Ljava/util/List;->add(Ljava/lang/Object;)Z
001e: return-void                

Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient; addFirmwareUpdatedListener(Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient$FirmwareUpdatedListener;)V code_off=0x59ea68
0000: iget-object                v0, v0, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->mFirmwareUpdatedListener Ljava/util/List;
0004: invoke-interface           v0, v1, Ljava/util/List;->add(Ljava/lang/Object;)Z
000a: return-void                

Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient; checkIsSupportedDevice()Z code_off=0x59e61c
0000: const/4                    v0, 1
0002: invoke-virtual             v6, v0, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->checkUsbSession(Z)Z
0008: move-result                v1
000a: if-eqz                     v1, +032h
000e: iget-object                v1, v6, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->mUsbSession Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;
0012: invoke-virtual             v1, Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;->getSessionId()I
0018: move-result                v1
001a: invoke-static              v1, Lcom/conexant/conexantusbtypec/svcimpl/UsbModImpl;->bldCmdTryCreateCnxtSession(I)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0020: move-result-object         v1
0022: const-string               v2, "SYNAUSBModule"
0026: invoke-static              v2, v1, Lcom/conexant/libcnxtservice/ServiceUtils;->svcModuleCmd(Ljava/lang/String; Lcom/conexant/libcnxtservice/ServiceModuleCommand;)Z
002c: move-result                v2
002e: if-eqz                     v2, +020h
0032: if-eqz                     v1, +01eh
0036: invoke-virtual             v1, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->getReply()J
003c: move-result-wide           v2
003e: const-wide/16              v4, 1
0042: cmp-long                   v2, v2, v4
0046: if-nez                     v2, +014h
004a: invoke-virtual             v1, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->getOutputParam()Ljava/lang/Object;
0050: move-result-object         v1
0052: check-cast                 v1, Lcom/conexant/libcnxtservice/service/USBSessionMsgArg;
0056: invoke-virtual             v1, Lcom/conexant/libcnxtservice/service/USBSessionMsgArg;->getSession()Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;
005c: move-result-object         v1
005e: if-eqz                     v1, +008h
0062: iput-object                v1, v6, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->mUsbSession Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;
0066: invoke-direct              v6, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->tryCreateController()Z
006c: return                     v0
006e: const/4                    v6, 0
0070: return                     v6

Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient; forceDetectUSBDevice()V code_off=0x59ea84
0000: const-string               v1, "SYNAUSBModule"
0004: invoke-static              Lcom/conexant/conexantusbtypec/svcimpl/UsbModImpl;->bldCmdForceDetectUSBDevice()Lcom/conexant/libcnxtservice/ServiceModuleCommand;
000a: move-result-object         v0
000c: invoke-static              v1, v0, Lcom/conexant/libcnxtservice/ServiceUtils;->svcModuleCmd(Ljava/lang/String; Lcom/conexant/libcnxtservice/ServiceModuleCommand;)Z
0012: return-void                

Lcom/conexant/libcnxtservice/service/USBModuleBase; onUsbDeviceAttached(Landroid/hardware/usb/UsbDevice;)V code_off=0x0

Lcom/conexant/libcnxtservice/service/USBModuleBase; onUsbDeviceDetached(Landroid/hardware/usb/UsbDevice;)V code_off=0x0

Lcom/conexant/conexantusbtypec/svcimpl/UsbModImpl; bldCmdForceDetectUSBDevice()Lcom/conexant/libcnxtservice/ServiceModuleCommand; code_off=0x59f18c
0000: new-instance               v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0004: invoke-direct              v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand;-><init>()V
000a: const/16                   v1, 101
000e: invoke-virtual             v0, v1, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->setCommandId(I)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0014: move-result-object         v0
0016: return-object              v0

Lcom/conexant/conexantusbtypec/svcimpl/UsbModImpl; findSessionByDevice(Landroid/hardware/usb/UsbDevice;)Lcom/conexant/libcnxtservice/service/USBSessionBase; code_off=0x59f2ec
0000: const/4                    v0, 0
0002: if-nez                     v7, +003h
0006: return-object              v0
0008: iget-object                v1, v6, Lcom/conexant/conexantusbtypec/svcimpl/UsbModImpl;->sessionsLock Ljava/lang/Object;
000c: monitor-enter              v1
000e: iget-object                v2, v6, Lcom/conexant/conexantusbtypec/svcimpl/UsbModImpl;->mSessions Ljava/util/List;
0012: invoke-interface           v2, Ljava/util/List;->iterator()Ljava/util/Iterator;
0018: move-result-object         v2
001a: invoke-interface           v2, Ljava/util/Iterator;->hasNext()Z
0020: move-result                v3
0022: if-eqz                     v3, +01ch
0026: invoke-interface           v2, Ljava/util/Iterator;->next()Ljava/lang/Object;
002c: move-result-object         v3
002e: check-cast                 v3, Lcom/conexant/libcnxtservice/service/USBSessionBase;
0032: invoke-virtual             v3, Lcom/conexant/libcnxtservice/service/USBSessionBase;->getUsbDevice()Landroid/hardware/usb/UsbDevice;
0038: move-result-object         v4
003a: if-eqz                     v4, -010h
003e: invoke-virtual             v4, Landroid/hardware/usb/UsbDevice;->getDeviceId()I
0044: move-result                v4
0046: invoke-virtual             v7, Landroid/hardware/usb/UsbDevice;->getDeviceId()I
004c: move-result                v5
004e: if-ne                      v4, v5, -01ah
0052: monitor-exit               v1
0054: return-object              v3
0056: move-exception             v6
0058: goto                       +31h
005a: iget-object                v6, v6, Lcom/conexant/conexantusbtypec/svcimpl/UsbModImpl;->mSessions Ljava/util/List;
005e: invoke-interface           v6, Ljava/util/List;->iterator()Ljava/util/Iterator;
0064: move-result-object         v6
0066: invoke-interface           v6, Ljava/util/Iterator;->hasNext()Z
006c: move-result                v2
006e: if-eqz                     v2, +024h
0072: invoke-interface           v6, Ljava/util/Iterator;->next()Ljava/lang/Object;
0078: move-result-object         v2
007a: check-cast                 v2, Lcom/conexant/libcnxtservice/service/USBSessionBase;
007e: invoke-virtual             v2, Lcom/conexant/libcnxtservice/service/USBSessionBase;->getUsbDevice()Landroid/hardware/usb/UsbDevice;
0084: move-result-object         v3
0086: if-eqz                     v3, -010h
008a: invoke-virtual             v3, Landroid/hardware/usb/UsbDevice;->getVendorId()I
0090: move-result                v4
0092: invoke-virtual             v7, Landroid/hardware/usb/UsbDevice;->getVendorId()I
0098: move-result                v5
009a: if-ne                      v4, v5, -01ah
009e: invoke-virtual             v3, Landroid/hardware/usb/UsbDevice;->getProductId()I
00a4: move-result                v3
00a6: invoke-virtual             v7, Landroid/hardware/usb/UsbDevice;->getProductId()I
00ac: move-result                v4
00ae: if-ne                      v3, v4, -024h
00b2: monitor-exit               v1
00b4: return-object              v2
00b6: monitor-exit               v1
00b8: return-object              v0
00ba: monitor-exit               v1
00bc: throw                      v6

Lcom/conexant/conexantusbtypec/svcimpl/UsbModImpl; forceDetectUSBDevice()V code_off=0x59f5e0
0000: sget-object                v0, Lcom/conexant/conexantusbtypec/svcimpl/UsbModImpl;->TAG Ljava/lang/String;
0004: const-string               v1, "forceDetectUSBDevice"
0008: invoke-static              v0, v1, Lcom/conexant/libcnxtservice/SmartLog;->d(Ljava/lang/String; Ljava/lang/String;)I
000e: iget-object                v0, v6, Lcom/conexant/conexantusbtypec/svcimpl/UsbModImpl;->sessionsLock Ljava/lang/Object;
0012: monitor-enter              v0
0014: new-instance               v1, Ljava/util/ArrayList;
0018: iget-object                v2, v6, Lcom/conexant/conexantusbtypec/svcimpl/UsbModImpl;->mSessions Ljava/util/List;
001c: invoke-direct              v1, v2, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
0022: monitor-exit               v0
0024: invoke-virtual             v1, Ljava/util/ArrayList;->size()I
002a: move-result                v0
002c: const/4                    v2, 0
002e: if-ge                      v2, v0, +016h
0032: invoke-virtual             v1, v2, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
0038: move-result-object         v3
003a: add-int/lit8               v2, v2, 1
003e: check-cast                 v3, Lcom/conexant/libcnxtservice/service/USBSessionBase;
0042: new-instance               v4, Lcom/conexant/libcnxtservice/service/USBSessionMsgArg;
0046: invoke-direct              v4, v3, Lcom/conexant/libcnxtservice/service/USBSessionMsgArg;-><init>(Lcom/conexant/libcnxtservice/service/USBSessionBase;)V
004c: const/4                    v3, 1
004e: const/16                   v5, 1000
0052: invoke-virtual             v6, v3, v3, v5, v4, Lcom/conexant/libcnxtservice/ServiceModuleBase;->notifyMessageListener(I I I Lcom/conexant/libcnxtservice/ServiceModuleArg;)V
0058: goto                       -15h
005a: return-void                
005c: move-exception             v6
005e: monitor-exit               v0
0060: throw                      v6

Lcom/conexant/conexantusbtypec/svcimpl/UsbModImpl; onUsbDeviceAttached(Landroid/hardware/usb/UsbDevice;)V code_off=0x59f754
0000: sget-object                v0, Lcom/conexant/conexantusbtypec/svcimpl/UsbModImpl;->TAG Ljava/lang/String;
0004: new-instance               v1, Ljava/lang/StringBuilder;
0008: const-string               v2, "onUsbDeviceAttached: devId="
000c: invoke-direct              v1, v2, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
0012: if-eqz                     v4, +007h
0016: invoke-virtual             v4, Landroid/hardware/usb/UsbDevice;->getDeviceId()I
001c: move-result                v2
001e: goto                       +2h
0020: const/4                    v2, -1
0022: invoke-virtual             v1, v2, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0028: invoke-virtual             v1, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
002e: move-result-object         v1
0030: invoke-static              v0, v1, Lcom/conexant/libcnxtservice/SmartLog;->d(Ljava/lang/String; Ljava/lang/String;)I
0036: invoke-direct              v3, v4, Lcom/conexant/conexantusbtypec/svcimpl/UsbModImpl;->createUSBSession(Landroid/hardware/usb/UsbDevice;)Lcom/conexant/libcnxtservice/service/USBSessionBase;
003c: move-result-object         v4
003e: new-instance               v0, Lcom/conexant/libcnxtservice/service/USBSessionMsgArg;
0042: invoke-direct              v0, v4, Lcom/conexant/libcnxtservice/service/USBSessionMsgArg;-><init>(Lcom/conexant/libcnxtservice/service/USBSessionBase;)V
0048: const/4                    v4, 1
004a: const/4                    v1, 0
004c: invoke-virtual             v3, v4, v4, v1, v0, Lcom/conexant/libcnxtservice/ServiceModuleBase;->notifyMessageListener(I I I Lcom/conexant/libcnxtservice/ServiceModuleArg;)V
0052: return-void                

Lcom/conexant/conexantusbtypec/svcimpl/UsbModImpl; onUsbDeviceDetached(Landroid/hardware/usb/UsbDevice;)V code_off=0x59f7b8
0000: sget-object                v0, Lcom/conexant/conexantusbtypec/svcimpl/UsbModImpl;->TAG Ljava/lang/String;
0004: new-instance               v1, Ljava/lang/StringBuilder;
0008: const-string               v2, "onUsbDeviceDetached: devId="
000c: invoke-direct              v1, v2, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
0012: const/4                    v2, -1
0014: if-eqz                     v5, +007h
0018: invoke-virtual             v5, Landroid/hardware/usb/UsbDevice;->getDeviceId()I
001e: move-result                v3
0020: goto                       +2h
0022: move                       v3, v2
0024: invoke-virtual             v1, v3, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
002a: invoke-virtual             v1, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
0030: move-result-object         v1
0032: invoke-static              v0, v1, Lcom/conexant/libcnxtservice/SmartLog;->d(Ljava/lang/String; Ljava/lang/String;)I
0038: invoke-direct              v4, v5, Lcom/conexant/conexantusbtypec/svcimpl/UsbModImpl;->destroyUSBSession(Landroid/hardware/usb/UsbDevice;)I
003e: move-result                v5
0040: if-eq                      v5, v2, +009h
0044: const/4                    v0, 3
0046: const/4                    v1, 0
0048: const/4                    v2, 1
004a: invoke-virtual             v4, v2, v0, v5, v1, Lcom/conexant/libcnxtservice/ServiceModuleBase;->notifyMessageListener(I I I Lcom/conexant/libcnxtservice/ServiceModuleArg;)V
0050: return-void                
0052: const-string               v4, "onUsbDeviceDetached: session not found for detached device"
0056: invoke-static              v0, v4, Lcom/conexant/libcnxtservice/SmartLog;->d(Ljava/lang/String; Ljava/lang/String;)I
005c: return-void                

Lcom/conexant/conexantusbtypec/util/CommonUtil; <clinit>()V code_off=0x5a0098
0000: invoke-static              Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;
0006: move-result-object         v0
0008: invoke-virtual             v0, Ljava/io/File;->toString()Ljava/lang/String;
000e: move-result-object         v0
0010: sput-object                v0, Lcom/conexant/conexantusbtypec/util/CommonUtil;->SD_PATH Ljava/lang/String;
0014: new-instance               v0, Landroid/util/TypedValue;
0018: invoke-direct              v0, Landroid/util/TypedValue;-><init>()V
001e: sput-object                v0, Lcom/conexant/conexantusbtypec/util/CommonUtil;->mTmpValue Landroid/util/TypedValue;
0022: return-void                

Lcom/conexant/conexantusbtypec/util/CommonUtil; canUpdateApkVersion(I I)Z code_off=0x59f828
0000: if-ge                      v0, v1, +00bh
0004: sget-object                v0, Lcom/conexant/conexantusbtypec/util/CommonUtil;->TAG Ljava/lang/String;
0008: const-string               v1, "canUpdateApkVersion: need to update app version"
000c: invoke-static              v0, v1, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0012: const/4                    v0, 1
0014: return                     v0
0016: sget-object                v0, Lcom/conexant/conexantusbtypec/util/CommonUtil;->TAG Ljava/lang/String;
001a: const-string               v1, "canUpdateApkVersion: current app version is the latest version"
001e: invoke-static              v0, v1, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0024: const/4                    v0, 0
0026: return                     v0

Lcom/conexant/conexantusbtypec/util/CommonUtil; getFirmwareDirPath()Ljava/lang/String; code_off=0x59fd50
0000: new-instance               v0, Ljava/io/File;
0004: invoke-static              Lcom/conexant/conexantusbtypec/util/CommonUtil;->getAppDirPath()Ljava/lang/String;
000a: move-result-object         v1
000c: const-string               v2, "FirmwareUpdate"
0010: invoke-direct              v0, v1, v2, Ljava/io/File;-><init>(Ljava/lang/String; Ljava/lang/String;)V
0016: invoke-virtual             v0, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
001c: move-result-object         v0
001e: return-object              v0

Lcom/conexant/conexantusbtypec/util/CommonUtil; getFirmwareFilePath()Ljava/lang/String; code_off=0x59fd80
0000: new-instance               v0, Ljava/io/File;
0004: invoke-static              Lcom/conexant/conexantusbtypec/util/CommonUtil;->getFirmwareDirPath()Ljava/lang/String;
000a: move-result-object         v1
000c: invoke-direct              v0, v1, Ljava/io/File;-><init>(Ljava/lang/String;)V
0012: invoke-virtual             v0, Ljava/io/File;->listFiles()[Ljava/io/File;
0018: move-result-object         v0
001a: array-length               v1, v0
001c: const-string               v2, ""
0020: const/4                    v3, 0
0022: if-ge                      v3, v1, +011h
0026: aget-object                v4, v0, v3
002a: invoke-virtual             v4, Ljava/io/File;->isDirectory()Z
0030: move-result                v5
0032: if-nez                     v5, +006h
0036: invoke-virtual             v4, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
003c: move-result-object         v2
003e: add-int/lit8               v3, v3, 1
0042: goto                       -10h
0044: return-object              v2

Lcom/conexant/genericfeature/ANCTuningParam; <clinit>()V code_off=0x5a05e0
0000: new-instance               v0, Lcom/conexant/genericfeature/ANCTuningParam$1;
0004: invoke-direct              v0, Lcom/conexant/genericfeature/ANCTuningParam$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/genericfeature/ANCTuningParam;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/genericfeature/AvailableMode; <clinit>()V code_off=0x5a0814
0000: new-instance               v0, Lcom/conexant/genericfeature/AvailableMode$1;
0004: invoke-direct              v0, Lcom/conexant/genericfeature/AvailableMode$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/genericfeature/AvailableMode;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/genericfeature/AvailableModeList; <clinit>()V code_off=0x5a0780
0000: new-instance               v0, Lcom/conexant/genericfeature/AvailableModeList$1;
0004: invoke-direct              v0, Lcom/conexant/genericfeature/AvailableModeList$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/genericfeature/AvailableModeList;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/genericfeature/BandEQCoefficient; <clinit>()V code_off=0x5a093c
0000: new-instance               v0, Lcom/conexant/genericfeature/BandEQCoefficient$1;
0004: invoke-direct              v0, Lcom/conexant/genericfeature/BandEQCoefficient$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/genericfeature/BandEQCoefficient;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/genericfeature/EQParam; <clinit>()V code_off=0x5a0b40
0000: new-instance               v0, Lcom/conexant/genericfeature/EQParam$1;
0004: invoke-direct              v0, Lcom/conexant/genericfeature/EQParam$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/genericfeature/EQParam;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/genericfeature/FeatureConfigFM3; <clinit>()V code_off=0x5a0d08
0000: new-instance               v0, Lcom/conexant/genericfeature/FeatureConfigFM3$1;
0004: invoke-direct              v0, Lcom/conexant/genericfeature/FeatureConfigFM3$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/genericfeature/FeatureConfigFM3;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/genericfeature/PersistEQParams; <clinit>()V code_off=0x5a0fe8
0000: new-instance               v0, Lcom/conexant/genericfeature/PersistEQParams$1;
0004: invoke-direct              v0, Lcom/conexant/genericfeature/PersistEQParams$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/genericfeature/PersistEQParams;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/libcnxtservice/ServiceModuleArg; <clinit>()V code_off=0x5a2e68
0000: new-instance               v0, Lcom/conexant/libcnxtservice/ServiceModuleArg$1;
0004: invoke-direct              v0, Lcom/conexant/libcnxtservice/ServiceModuleArg$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/libcnxtservice/ServiceModuleArg;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/libcnxtservice/BooleanMsgArg; <clinit>()V code_off=0x5a1138
0000: new-instance               v0, Lcom/conexant/libcnxtservice/BooleanMsgArg$1;
0004: invoke-direct              v0, Lcom/conexant/libcnxtservice/BooleanMsgArg$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/libcnxtservice/BooleanMsgArg;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/libcnxtservice/ByteArrayMsgArg; <clinit>()V code_off=0x5a1284
0000: new-instance               v0, Lcom/conexant/libcnxtservice/ByteArrayMsgArg$1;
0004: invoke-direct              v0, Lcom/conexant/libcnxtservice/ByteArrayMsgArg$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/libcnxtservice/ByteArrayMsgArg;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/libcnxtservice/Command; <clinit>()V code_off=0x5a1380
0000: new-instance               v0, Lcom/conexant/libcnxtservice/Command$1;
0004: invoke-direct              v0, Lcom/conexant/libcnxtservice/Command$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/libcnxtservice/Command;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/libcnxtservice/FloatParcelable; <clinit>()V code_off=0x5a1a90
0000: new-instance               v0, Lcom/conexant/libcnxtservice/FloatParcelable$1;
0004: invoke-direct              v0, Lcom/conexant/libcnxtservice/FloatParcelable$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/libcnxtservice/FloatParcelable;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/libcnxtservice/LongMsgArg; <clinit>()V code_off=0x5a1bac
0000: new-instance               v0, Lcom/conexant/libcnxtservice/LongMsgArg$1;
0004: invoke-direct              v0, Lcom/conexant/libcnxtservice/LongMsgArg$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/libcnxtservice/LongMsgArg;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/libcnxtservice/R$styleable; <clinit>()V code_off=0x5a1d70
0000: const/16                   v0, 29
0004: new-array                  v0, v0, [I
0008: fill-array-data            v0, +00001fah
000e: sput-object                v0, Lcom/conexant/libcnxtservice/R$styleable;->ActionBar [I
0012: const                      v0, 16842931
0018: filled-new-array           v0, [I
001e: move-result-object         v1
0020: sput-object                v1, Lcom/conexant/libcnxtservice/R$styleable;->ActionBarLayout [I
0024: const                      v1, 16843071
002a: filled-new-array           v1, [I
0030: move-result-object         v1
0032: sput-object                v1, Lcom/conexant/libcnxtservice/R$styleable;->ActionMenuItemView [I
0036: const/4                    v1, 0
0038: new-array                  v2, v1, [I
003c: sput-object                v2, Lcom/conexant/libcnxtservice/R$styleable;->ActionMenuView [I
0040: const/4                    v2, 6
0042: new-array                  v3, v2, [I
0046: fill-array-data            v3, +0000219h
004c: sput-object                v3, Lcom/conexant/libcnxtservice/R$styleable;->ActionMode [I
0050: const                      v3, 2130903554
0056: const                      v4, 2130903745
005c: filled-new-array           v3, v4, [I
0062: move-result-object         v3
0064: sput-object                v3, Lcom/conexant/libcnxtservice/R$styleable;->ActivityChooserView [I
0068: const/16                   v3, 8
006c: new-array                  v4, v3, [I
0070: fill-array-data            v4, +0000214h
0076: sput-object                v4, Lcom/conexant/libcnxtservice/R$styleable;->AlertDialog [I
007a: new-array                  v4, v2, [I
007e: fill-array-data            v4, +0000221h
0084: sput-object                v4, Lcom/conexant/libcnxtservice/R$styleable;->AnimatedStateListDrawableCompat [I
0088: const                      v4, 16842960
008e: const                      v5, 16843161
0094: filled-new-array           v4, v5, [I
009a: move-result-object         v6
009c: sput-object                v6, Lcom/conexant/libcnxtservice/R$styleable;->AnimatedStateListDrawableItem [I
00a0: const                      v6, 16843850
00a6: const                      v7, 16843851
00ac: const                      v8, 16843849
00b2: filled-new-array           v5, v8, v6, v7, [I
00b8: move-result-object         v6
00ba: sput-object                v6, Lcom/conexant/libcnxtservice/R$styleable;->AnimatedStateListDrawableTransition [I
00be: new-array                  v1, v1, [I
00c2: sput-object                v1, Lcom/conexant/libcnxtservice/R$styleable;->AppCompatEmojiHelper [I
00c6: const                      v1, 2130904488
00cc: const                      v6, 2130904489
00d2: const                      v7, 16843033
00d8: const                      v8, 2130904284
00de: filled-new-array           v7, v8, v1, v6, [I
00e4: move-result-object         v1
00e6: sput-object                v1, Lcom/conexant/libcnxtservice/R$styleable;->AppCompatImageView [I
00ea: const                      v1, 2130904482
00f0: const                      v6, 2130904483
00f6: const                      v7, 16843074
00fc: const                      v8, 2130904481
0102: filled-new-array           v7, v8, v1, v6, [I
0108: move-result-object         v1
010a: sput-object                v1, Lcom/conexant/libcnxtservice/R$styleable;->AppCompatSeekBar [I
010e: const/4                    v1, 7
0110: new-array                  v1, v1, [I
0114: fill-array-data            v1, +00001e6h
011a: sput-object                v1, Lcom/conexant/libcnxtservice/R$styleable;->AppCompatTextHelper [I
011e: const/16                   v1, 22
0122: new-array                  v1, v1, [I
0126: fill-array-data            v1, +00001efh
012c: sput-object                v1, Lcom/conexant/libcnxtservice/R$styleable;->AppCompatTextView [I
0130: const/16                   v1, 127
0134: new-array                  v1, v1, [I
0138: fill-array-data            v1, +0000216h
013e: sput-object                v1, Lcom/conexant/libcnxtservice/R$styleable;->AppCompatTheme [I
0142: const                      v1, 2130903093
0148: filled-new-array           v1, [I
014e: move-result-object         v1
0150: sput-object                v1, Lcom/conexant/libcnxtservice/R$styleable;->ButtonBarLayout [I
0154: const                      v1, 2130904162
015a: const                      v6, 2130904237
0160: filled-new-array           v1, v6, [I
0166: move-result-object         v1
0168: sput-object                v1, Lcom/conexant/libcnxtservice/R$styleable;->Capability [I
016c: const                      v1, 2130903235
0172: const                      v6, 2130903236
0178: const                      v7, 16843016
017e: const                      v8, 2130903234
0184: filled-new-array           v7, v8, v1, v6, [I
018a: move-result-object         v1
018c: sput-object                v1, Lcom/conexant/libcnxtservice/R$styleable;->CheckedTextView [I
0190: const                      v1, 2130903094
0196: const                      v6, 2130903790
019c: const                      v7, 16843173
01a2: const                      v8, 16843551
01a8: const                      v9, 16844359
01ae: filled-new-array           v7, v8, v9, v1, v6, [I
01b4: move-result-object         v1
01b6: sput-object                v1, Lcom/conexant/libcnxtservice/R$styleable;->ColorStateListItem [I
01ba: const                      v1, 2130903209
01c0: const                      v6, 2130903210
01c6: const                      v8, 16843015
01cc: const                      v9, 2130903198
01d2: filled-new-array           v8, v9, v1, v6, [I
01d8: move-result-object         v1
01da: sput-object                v1, Lcom/conexant/libcnxtservice/R$styleable;->CompoundButton [I
01de: new-array                  v1, v3, [I
01e2: fill-array-data            v1, +00002c3h
01e8: sput-object                v1, Lcom/conexant/libcnxtservice/R$styleable;->DrawerArrowToggle [I
01ec: new-array                  v1, v3, [I
01f0: fill-array-data            v1, +00002d0h
01f6: sput-object                v1, Lcom/conexant/libcnxtservice/R$styleable;->FontFamily [I
01fa: const/16                   v1, 10
01fe: new-array                  v1, v1, [I
0202: fill-array-data            v1, +00002dbh
0208: sput-object                v1, Lcom/conexant/libcnxtservice/R$styleable;->FontFamilyFont [I
020c: const                      v1, 16842755
0212: const                      v3, 16842961
0218: filled-new-array           v1, v4, v3, [I
021e: move-result-object         v6
0220: sput-object                v6, Lcom/conexant/libcnxtservice/R$styleable;->Fragment [I
0224: filled-new-array           v1, v3, [I
022a: move-result-object         v1
022c: sput-object                v1, Lcom/conexant/libcnxtservice/R$styleable;->FragmentContainerView [I
0230: const/16                   v1, 12
0234: new-array                  v1, v1, [I
0238: fill-array-data            v1, +00002d8h
023e: sput-object                v1, Lcom/conexant/libcnxtservice/R$styleable;->GradientColor [I
0242: const                      v1, 16844052
0248: filled-new-array           v7, v1, [I
024e: move-result-object         v1
0250: sput-object                v1, Lcom/conexant/libcnxtservice/R$styleable;->GradientColorItem [I
0254: const/16                   v1, 9
0258: new-array                  v1, v1, [I
025c: fill-array-data            v1, +00002e2h
0262: sput-object                v1, Lcom/conexant/libcnxtservice/R$styleable;->LinearLayoutCompat [I
0266: const                      v1, 16842997
026c: const                      v3, 16843137
0272: const                      v6, 16842996
0278: filled-new-array           v0, v6, v1, v3, [I
027e: move-result-object         v0
0280: sput-object                v0, Lcom/conexant/libcnxtservice/R$styleable;->LinearLayoutCompat_Layout [I
0284: const                      v0, 16843436
028a: const                      v1, 16843437
0290: filled-new-array           v0, v1, [I
0296: move-result-object         v0
0298: sput-object                v0, Lcom/conexant/libcnxtservice/R$styleable;->ListPopupWindow [I
029c: new-array                  v0, v2, [I
02a0: fill-array-data            v0, +00002d6h
02a6: sput-object                v0, Lcom/conexant/libcnxtservice/R$styleable;->MenuGroup [I
02aa: const/16                   v0, 23
02ae: new-array                  v0, v0, [I
02b2: fill-array-data            v0, +00002ddh
02b8: sput-object                v0, Lcom/conexant/libcnxtservice/R$styleable;->MenuItem [I
02bc: const/16                   v0, 9
02c0: new-array                  v0, v0, [I
02c4: fill-array-data            v0, +0000306h
02ca: sput-object                v0, Lcom/conexant/libcnxtservice/R$styleable;->MenuView [I
02ce: const                      v0, 16843465
02d4: const                      v1, 2130904094
02da: const                      v3, 16843126
02e0: filled-new-array           v3, v0, v1, [I
02e6: move-result-object         v0
02e8: sput-object                v0, Lcom/conexant/libcnxtservice/R$styleable;->PopupWindow [I
02ec: const                      v0, 2130904298
02f2: filled-new-array           v0, [I
02f8: move-result-object         v0
02fa: sput-object                v0, Lcom/conexant/libcnxtservice/R$styleable;->PopupWindowBackgroundState [I
02fe: const                      v0, 2130904096
0304: const                      v1, 2130904103
030a: filled-new-array           v0, v1, [I
0310: move-result-object         v0
0312: sput-object                v0, Lcom/conexant/libcnxtservice/R$styleable;->RecycleListView [I
0316: const/16                   v0, 31
031a: new-array                  v0, v0, [I
031e: fill-array-data            v0, +00002efh
0324: sput-object                v0, Lcom/conexant/libcnxtservice/R$styleable;->SearchView [I
0328: const                      v0, 16843131
032e: const                      v1, 16843362
0334: const                      v6, 16842930
033a: const                      v7, 2130904135
0340: filled-new-array           v6, v3, v0, v1, v7, [I
0346: move-result-object         v0
0348: sput-object                v0, Lcom/conexant/libcnxtservice/R$styleable;->Spinner [I
034c: new-array                  v0, v2, [I
0350: fill-array-data            v0, +0000318h
0356: sput-object                v0, Lcom/conexant/libcnxtservice/R$styleable;->StateListDrawable [I
035a: filled-new-array           v5, [I
0360: move-result-object         v0
0362: sput-object                v0, Lcom/conexant/libcnxtservice/R$styleable;->StateListDrawableItem [I
0366: const/16                   v0, 14
036a: new-array                  v0, v0, [I
036e: fill-array-data            v0, +0000319h
0374: sput-object                v0, Lcom/conexant/libcnxtservice/R$styleable;->SwitchCompat [I
0378: const/16                   v0, 16
037c: new-array                  v0, v0, [I
0380: fill-array-data            v0, +0000330h
0386: sput-object                v0, Lcom/conexant/libcnxtservice/R$styleable;->TextAppearance [I
038a: const/16                   v0, 30
038e: new-array                  v0, v0, [I
0392: fill-array-data            v0, +000034bh
0398: sput-object                v0, Lcom/conexant/libcnxtservice/R$styleable;->Toolbar [I
039c: const                      v0, 2130904101
03a2: const                      v1, 2130904461
03a8: const/high16               v2, 16842752
03ac: const                      v3, 16842970
03b2: const                      v5, 2130904098
03b8: filled-new-array           v2, v3, v5, v0, v1, [I
03be: move-result-object         v0
03c0: sput-object                v0, Lcom/conexant/libcnxtservice/R$styleable;->View [I
03c4: const                      v0, 2130903131
03ca: const                      v1, 2130903132
03d0: const                      v2, 16842964
03d6: filled-new-array           v2, v0, v1, [I
03dc: move-result-object         v0
03de: sput-object                v0, Lcom/conexant/libcnxtservice/R$styleable;->ViewBackgroundHelper [I
03e2: const                      v0, 16842994
03e8: const                      v1, 16842995
03ee: filled-new-array           v4, v0, v1, [I
03f4: move-result-object         v0
03f6: sput-object                v0, Lcom/conexant/libcnxtservice/R$styleable;->ViewStubCompat [I
03fa: return-void                
03fc: fill-array-data-payload    b'R\x00\x03\x7fY\x00\x03\x7fZ\x00\x03\x7fi\x01\x03\x7fj\x01\x03\x7fk\x01\x03\x7fl\x01\x03\x7fm\x01\x03\x7fn\x01\x03\x7f\x99\x01\x03\x7f\xb9\x01\x03\x7f\xba\x01\x03\x7f\xdf\x01\x03\x7f\x8b\x02\x03\x7f\x93\x02\x03\x7f\x9a\x02\x03\x7f\x9b\x02\x03\x7f\xa2\x02\x03\x7f\xb9\x02\x03\x7f\xd6\x02\x03\x7fg\x03\x03\x7f\x04\x04\x03\x7fG\x04\x03\x7f[\x04\x03\x7f\\\x04\x03\x7f\x02\x05\x03\x7f\x07\x05\x03\x7f\xab\x05\x03\x7f\xba\x05\x03\x7f' | \x52\x00\x03\x7f\x59\x00\x03\x7f\x5a\x00\x03\x7f\x69\x01\x03\x7f\x6a\x01\x03\x7f\x6b\x01\x03\x7f\x6c\x01\x03\x7f\x6d\x01\x03\x7f\x6e\x01\x03\x7f\x99\x01\x03\x7f\xb9\x01\x03\x7f\xba\x01\x03\x7f\xdf\x01\x03\x7f\x8b\x02\x03\x7f\x93\x02\x03\x7f\x9a\x02\x03\x7f\x9b\x02\x03\x7f\xa2\x02\x03\x7f\xb9\x02\x03\x7f\xd6\x02\x03\x7f\x67\x03\x03\x7f\x04\x04\x03\x7f\x47\x04\x03\x7f\x5b\x04\x03\x7f\x5c\x04\x03\x7f\x02\x05\x03\x7f\x07\x05\x03\x7f\xab\x05\x03\x7f\xba\x05\x03\x7f
0478: fill-array-data-payload    b'R\x00\x03\x7fY\x00\x03\x7f\xfb\x00\x03\x7f\x8b\x02\x03\x7f\x07\x05\x03\x7f\xba\x05\x03\x7f' | \x52\x00\x03\x7f\x59\x00\x03\x7f\xfb\x00\x03\x7f\x8b\x02\x03\x7f\x07\x05\x03\x7f\xba\x05\x03\x7f
0498: fill-array-data-payload    b'\xf2\x00\x01\x01\xa1\x00\x03\x7f\xa4\x00\x03\x7fQ\x03\x03\x7f\\\x03\x03\x7f\xff\x03\x03\x7f\xb9\x04\x03\x7f\xc1\x04\x03\x7f' | \xf2\x00\x01\x01\xa1\x00\x03\x7f\xa4\x00\x03\x7f\x51\x03\x03\x7f\x5c\x03\x03\x7f\xff\x03\x03\x7f\xb9\x04\x03\x7f\xc1\x04\x03\x7f
04c0: fill-array-data-payload    b'\x1c\x01\x01\x01\x94\x01\x01\x01\x95\x01\x01\x01\x96\x01\x01\x01\x0c\x03\x01\x01\r\x03\x01\x01' | \x1c\x01\x01\x01\x94\x01\x01\x01\x95\x01\x01\x01\x96\x01\x01\x01\x0c\x03\x01\x01\x0d\x03\x01\x01
04e0: fill-array-data-payload    b'4\x00\x01\x01m\x01\x01\x01n\x01\x01\x01o\x01\x01\x01p\x01\x01\x01\x92\x03\x01\x01\x93\x03\x01\x01' | \x34\x00\x01\x01\x6d\x01\x01\x01\x6e\x01\x01\x01\x6f\x01\x01\x01\x70\x01\x01\x01\x92\x03\x01\x01\x93\x03\x01\x01
0504: fill-array-data-payload    b'4\x00\x01\x01K\x00\x03\x7fL\x00\x03\x7fM\x00\x03\x7fN\x00\x03\x7fO\x00\x03\x7f\xc9\x01\x03\x7f\xca\x01\x03\x7f\xcb\x01\x03\x7f\xcc\x01\x03\x7f\xce\x01\x03\x7f\xcf\x01\x03\x7f\xd0\x01\x03\x7f\xd1\x01\x03\x7f\xe3\x01\x03\x7f6\x02\x03\x7ff\x02\x03\x7fp\x02\x03\x7f\xf6\x02\x03\x7fH\x03\x03\x7f<\x05\x03\x7f\x83\x05\x03\x7f' | \x34\x00\x01\x01\x4b\x00\x03\x7f\x4c\x00\x03\x7f\x4d\x00\x03\x7f\x4e\x00\x03\x7f\x4f\x00\x03\x7f\xc9\x01\x03\x7f\xca\x01\x03\x7f\xcb\x01\x03\x7f\xcc\x01\x03\x7f\xce\x01\x03\x7f\xcf\x01\x03\x7f\xd0\x01\x03\x7f\xd1\x01\x03\x7f\xe3\x01\x03\x7f\x36\x02\x03\x7f\x66\x02\x03\x7f\x70\x02\x03\x7f\xf6\x02\x03\x7f\x48\x03\x03\x7f\x3c\x05\x03\x7f\x83\x05\x03\x7f
0564: fill-array-data-payload    b'W\x00\x01\x01\xae\x00\x01\x01\x03\x00\x03\x7f\x04\x00\x03\x7f\x05\x00\x03\x7f\x06\x00\x03\x7f\x07\x00\x03\x7f\x08\x00\x03\x7f\t\x00\x03\x7f\n\x00\x03\x7f\x0b\x00\x03\x7f\x0c\x00\x03\x7f\r\x00\x03\x7f\x0e\x00\x03\x7f\x0f\x00\x03\x7f\x11\x00\x03\x7f\x12\x00\x03\x7f\x13\x00\x03\x7f\x14\x00\x03\x7f\x15\x00\x03\x7f\x16\x00\x03\x7f\x17\x00\x03\x7f\x18\x00\x03\x7f\x19\x00\x03\x7f\x1a\x00\x03\x7f\x1b\x00\x03\x7f\x1c\x00\x03\x7f\x1d\x00\x03\x7f\x1e\x00\x03\x7f\x1f\x00\x03\x7f \x00\x03\x7f!\x00\x03\x7f"\x00\x03\x7f#\x00\x03\x7f)\x00\x03\x7f.\x00\x03\x7f/\x00\x03\x7f0\x00\x03\x7f1\x00\x03\x7fI\x00\x03\x7f\x86\x00\x03\x7f\x99\x00\x03\x7f\x9a\x00\x03\x7f\x9b\x00\x03\x7f\x9c\x00\x03\x7f\x9d\x00\x03\x7f\xa7\x00\x03\x7f\xa8\x00\x03\x7f\xc5\x00\x03\x7f\xd0\x00\x03\x7f\x0c\x01\x03\x7f\r\x01\x03\x7f\x0e\x01\x03\x7f\x12\x01\x03\x7f\x13\x01\x03\x7f\x14\x01\x03\x7f\x15\x01\x03\x7f/\x01\x03\x7f1\x01\x03\x7fG\x01\x03\x7fz\x01\x03\x7f\xb0\x01\x03\x7f\xb5\x01\x03\x7f\xb6\x01\x03\x7f\xbc\x01\x03\x7f\xc1\x01\x03\x7f\xd6\x01\x03\x7f\xd7\x01\x03\x7f\xdb\x01\x03\x7f\xdc\x01\x03\x7f\xde\x01\x03\x7f\x9a\x02\x03\x7f\xb1\x02\x03\x7fK\x03\x03\x7fL\x03\x03\x7fM\x03\x03\x7fN\x03\x03\x7f]\x03\x03\x7f^\x03\x03\x7f_\x03\x03\x7f`\x03\x03\x7fa\x03\x03\x7fb\x03\x03\x7fc\x03\x03\x7fd\x03\x03\x7fe\x03\x03\x7f)\x04\x03\x7f*\x04\x03\x7f+\x04\x03\x7fF\x04\x03\x7fH\x04\x03\x7fc\x04\x03\x7fe\x04\x03\x7ff\x04\x03\x7fg\x04\x03\x7f\x87\x04\x03\x7f\x90\x04\x03\x7f\x92\x04\x03\x7f\x93\x04\x03\x7f\xcd\x04\x03\x7f\xce\x04\x03\x7f\x15\x05\x03\x7f_\x05\x03\x7fa\x05\x03\x7fb\x05\x03\x7fc\x05\x03\x7fe\x05\x03\x7ff\x05\x03\x7fg\x05\x03\x7fh\x05\x03\x7fw\x05\x03\x7fx\x05\x03\x7f\xbf\x05\x03\x7f\xc0\x05\x03\x7f\xc2\x05\x03\x7f\xc3\x05\x03\x7f\xf6\x05\x03\x7f\r\x06\x03\x7f\x0e\x06\x03\x7f\x0f\x06\x03\x7f\x10\x06\x03\x7f\x11\x06\x03\x7f\x12\x06\x03\x7f\x13\x06\x03\x7f\x14\x06\x03\x7f\x15\x06\x03\x7f\x16\x06\x03\x7f' | \x57\x00\x01\x01\xae\x00\x01\x01\x03\x00\x03\x7f\x04\x00\x03\x7f\x05\x00\x03\x7f\x06\x00\x03\x7f\x07\x00\x03\x7f\x08\x00\x03\x7f\x09\x00\x03\x7f\x0a\x00\x03\x7f\x0b\x00\x03\x7f\x0c\x00\x03\x7f\x0d\x00\x03\x7f\x0e\x00\x03\x7f\x0f\x00\x03\x7f\x11\x00\x03\x7f\x12\x00\x03\x7f\x13\x00\x03\x7f\x14\x00\x03\x7f\x15\x00\x03\x7f\x16\x00\x03\x7f\x17\x00\x03\x7f\x18\x00\x03\x7f\x19\x00\x03\x7f\x1a\x00\x03\x7f\x1b\x00\x03\x7f\x1c\x00\x03\x7f\x1d\x00\x03\x7f\x1e\x00\x03\x7f\x1f\x00\x03\x7f\x20\x00\x03\x7f\x21\x00\x03\x7f\x22\x00\x03\x7f\x23\x00\x03\x7f\x29\x00\x03\x7f\x2e\x00\x03\x7f\x2f\x00\x03\x7f\x30\x00\x03\x7f\x31\x00\x03\x7f\x49\x00\x03\x7f\x86\x00\x03\x7f\x99\x00\x03\x7f\x9a\x00\x03\x7f\x9b\x00\x03\x7f\x9c\x00\x03\x7f\x9d\x00\x03\x7f\xa7\x00\x03\x7f\xa8\x00\x03\x7f\xc5\x00\x03\x7f\xd0\x00\x03\x7f\x0c\x01\x03\x7f\x0d\x01\x03\x7f\x0e\x01\x03\x7f\x12\x01\x03\x7f\x13\x01\x03\x7f\x14\x01\x03\x7f\x15\x01\x03\x7f\x2f\x01\x03\x7f\x31\x01\x03\x7f\x47\x01\x03\x7f\x7a\x01\x03\x7f\xb0\x01\x03\x7f\xb5\x01\x03\x7f\xb6\x01\x03\x7f\xbc\x01\x03\x7f\xc1\x01\x03\x7f\xd6\x01\x03\x7f\xd7\x01\x03\x7f\xdb\x01\x03\x7f\xdc\x01\x03\x7f\xde\x01\x03\x7f\x9a\x02\x03\x7f\xb1\x02\x03\x7f\x4b\x03\x03\x7f\x4c\x03\x03\x7f\x4d\x03\x03\x7f\x4e\x03\x03\x7f\x5d\x03\x03\x7f\x5e\x03\x03\x7f\x5f\x03\x03\x7f\x60\x03\x03\x7f\x61\x03\x03\x7f\x62\x03\x03\x7f\x63\x03\x03\x7f\x64\x03\x03\x7f\x65\x03\x03\x7f\x29\x04\x03\x7f\x2a\x04\x03\x7f\x2b\x04\x03\x7f\x46\x04\x03\x7f\x48\x04\x03\x7f\x63\x04\x03\x7f\x65\x04\x03\x7f\x66\x04\x03\x7f\x67\x04\x03\x7f\x87\x04\x03\x7f\x90\x04\x03\x7f\x92\x04\x03\x7f\x93\x04\x03\x7f\xcd\x04\x03\x7f\xce\x04\x03\x7f\x15\x05\x03\x7f\x5f\x05\x03\x7f\x61\x05\x03\x7f\x62\x05\x03\x7f\x63\x05\x03\x7f\x65\x05\x03\x7f\x66\x05\x03\x7f\x67\x05\x03\x7f\x68\x05\x03\x7f\x77\x05\x03\x7f\x78\x05\x03\x7f\xbf\x05\x03\x7f\xc0\x05\x03\x7f\xc2\x05\x03\x7f\xc3\x05\x03\x7f\xf6\x05\x03\x7f\x0d\x06\x03\x7f\x0e\x06\x03\x7f\x0f\x06\x03\x7f\x10\x06\x03\x7f\x11\x06\x03\x7f\x12\x06\x03\x7f\x13\x06\x03\x7f\x14\x06\x03\x7f\x15\x06\x03\x7f\x16\x06\x03\x7f
0768: fill-array-data-payload    b'D\x00\x03\x7fE\x00\x03\x7fo\x00\x03\x7f\x0b\x01\x03\x7f\xcd\x01\x03\x7fw\x02\x03\x7f\xcc\x04\x03\x7f\x8e\x05\x03\x7f' | \x44\x00\x03\x7f\x45\x00\x03\x7f\x6f\x00\x03\x7f\x0b\x01\x03\x7f\xcd\x01\x03\x7f\x77\x02\x03\x7f\xcc\x04\x03\x7f\x8e\x05\x03\x7f
0790: fill-array-data-payload    b'g\x02\x03\x7fh\x02\x03\x7fi\x02\x03\x7fj\x02\x03\x7fk\x02\x03\x7fl\x02\x03\x7fm\x02\x03\x7fn\x02\x03\x7f' | \x67\x02\x03\x7f\x68\x02\x03\x7f\x69\x02\x03\x7f\x6a\x02\x03\x7f\x6b\x02\x03\x7f\x6c\x02\x03\x7f\x6d\x02\x03\x7f\x6e\x02\x03\x7f
07b8: fill-array-data-payload    b'2\x05\x01\x013\x05\x01\x01?\x05\x01\x01o\x05\x01\x01p\x05\x01\x01e\x02\x03\x7fo\x02\x03\x7fp\x02\x03\x7fq\x02\x03\x7f\xeb\x05\x03\x7f' | \x32\x05\x01\x01\x33\x05\x01\x01\x3f\x05\x01\x01\x6f\x05\x01\x01\x70\x05\x01\x01\x65\x02\x03\x7f\x6f\x02\x03\x7f\x70\x02\x03\x7f\x71\x02\x03\x7f\xeb\x05\x03\x7f
07e8: fill-array-data-payload    b'\x9d\x01\x01\x01\x9e\x01\x01\x01\xa1\x01\x01\x01\xa2\x01\x01\x01\xa3\x01\x01\x01\xa4\x01\x01\x01\x01\x02\x01\x01\x0b\x02\x01\x01\x10\x05\x01\x01\x11\x05\x01\x01\x12\x05\x01\x01\x13\x05\x01\x01' | \x9d\x01\x01\x01\x9e\x01\x01\x01\xa1\x01\x01\x01\xa2\x01\x01\x01\xa3\x01\x01\x01\xa4\x01\x01\x01\x01\x02\x01\x01\x0b\x02\x01\x01\x10\x05\x01\x01\x11\x05\x01\x01\x12\x05\x01\x01\x13\x05\x01\x01
0820: fill-array-data-payload    b"\xaf\x00\x01\x01\xc4\x00\x01\x01&\x01\x01\x01'\x01\x01\x01(\x01\x01\x01\xba\x01\x03\x7f\xbf\x01\x03\x7f\xb8\x03\x03\x7f\xb3\x04\x03\x7f" | \xaf\x00\x01\x01\xc4\x00\x01\x01\x26\x01\x01\x01\x27\x01\x01\x01\x28\x01\x01\x01\xba\x01\x03\x7f\xbf\x01\x03\x7f\xb8\x03\x03\x7f\xb3\x04\x03\x7f
084c: fill-array-data-payload    b'\x0e\x00\x01\x01\xd0\x00\x01\x01\x94\x01\x01\x01\xde\x01\x01\x01\xdf\x01\x01\x01\xe0\x01\x01\x01' | \x0e\x00\x01\x01\xd0\x00\x01\x01\x94\x01\x01\x01\xde\x01\x01\x01\xdf\x01\x01\x01\xe0\x01\x01\x01
086c: fill-array-data-payload    b'\x02\x00\x01\x01\x0e\x00\x01\x01\xd0\x00\x01\x01\x06\x01\x01\x01\x94\x01\x01\x01\xde\x01\x01\x01\xdf\x01\x01\x01\xe1\x01\x01\x01\xe2\x01\x01\x01\xe3\x01\x01\x01\xe4\x01\x01\x01\xe5\x01\x01\x01o\x02\x01\x01\x10\x00\x03\x7f$\x00\x03\x7f&\x00\x03\x7f7\x00\x03\x7fh\x01\x03\x7f\xaa\x02\x03\x7f\xab\x02\x03\x7f\r\x04\x03\x7f\xb1\x04\x03\x7f\xc5\x05\x03\x7f' | \x02\x00\x01\x01\x0e\x00\x01\x01\xd0\x00\x01\x01\x06\x01\x01\x01\x94\x01\x01\x01\xde\x01\x01\x01\xdf\x01\x01\x01\xe1\x01\x01\x01\xe2\x01\x01\x01\xe3\x01\x01\x01\xe4\x01\x01\x01\xe5\x01\x01\x01\x6f\x02\x01\x01\x10\x00\x03\x7f\x24\x00\x03\x7f\x26\x00\x03\x7f\x37\x00\x03\x7f\x68\x01\x03\x7f\xaa\x02\x03\x7f\xab\x02\x03\x7f\x0d\x04\x03\x7f\xb1\x04\x03\x7f\xc5\x05\x03\x7f
08d0: fill-array-data-payload    b'\xae\x00\x01\x01,\x01\x01\x01-\x01\x01\x01.\x01\x01\x01/\x01\x01\x010\x01\x01\x011\x01\x01\x01W\x04\x03\x7f\xfb\x04\x03\x7f' | \xae\x00\x01\x01\x2c\x01\x01\x01\x2d\x01\x01\x01\x2e\x01\x01\x01\x2f\x01\x01\x01\x30\x01\x01\x01\x31\x01\x01\x01\x57\x04\x03\x7f\xfb\x04\x03\x7f
08fc: fill-array-data-payload    b'4\x00\x01\x01\xda\x00\x01\x01\x1f\x01\x01\x01O\x01\x01\x01P\x01\x01\x01 \x02\x01\x01d\x02\x01\x01;\x00\x03\x7f<\x00\x03\x7fJ\x00\x03\x7fQ\x00\x03\x7f[\x00\x03\x7f\xf4\x00\x03\x7fL\x01\x03\x7fU\x01\x03\x7f\xa7\x01\x03\x7f\xc2\x01\x03\x7fy\x02\x03\x7f\x89\x02\x03\x7f\x92\x02\x03\x7f\xac\x02\x03\x7f\xf9\x02\x03\x7f`\x04\x03\x7fa\x04\x03\x7f\x84\x04\x03\x7f\x85\x04\x03\x7f\x86\x04\x03\x7f\x01\x05\x03\x7f\x0b\x05\x03\x7f\xf0\x05\x03\x7f\xfc\x05\x03\x7f' | \x34\x00\x01\x01\xda\x00\x01\x01\x1f\x01\x01\x01\x4f\x01\x01\x01\x50\x01\x01\x01\x20\x02\x01\x01\x64\x02\x01\x01\x3b\x00\x03\x7f\x3c\x00\x03\x7f\x4a\x00\x03\x7f\x51\x00\x03\x7f\x5b\x00\x03\x7f\xf4\x00\x03\x7f\x4c\x01\x03\x7f\x55\x01\x03\x7f\xa7\x01\x03\x7f\xc2\x01\x03\x7f\x79\x02\x03\x7f\x89\x02\x03\x7f\x92\x02\x03\x7f\xac\x02\x03\x7f\xf9\x02\x03\x7f\x60\x04\x03\x7f\x61\x04\x03\x7f\x84\x04\x03\x7f\x85\x04\x03\x7f\x86\x04\x03\x7f\x01\x05\x03\x7f\x0b\x05\x03\x7f\xf0\x05\x03\x7f\xfc\x05\x03\x7f
0980: fill-array-data-payload    b'\x1c\x01\x01\x01\x94\x01\x01\x01\x95\x01\x01\x01\x96\x01\x01\x01\x0c\x03\x01\x01\r\x03\x01\x01' | \x1c\x01\x01\x01\x94\x01\x01\x01\x95\x01\x01\x01\x96\x01\x01\x01\x0c\x03\x01\x01\x0d\x03\x01\x01
09a0: fill-array-data-payload    b'$\x01\x01\x01%\x01\x01\x01B\x01\x01\x01\xb8\x04\x03\x7f\xd6\x04\x03\x7f\x11\x05\x03\x7f\x12\x05\x03\x7f\x16\x05\x03\x7f\x99\x05\x03\x7f\x9a\x05\x03\x7f\x9b\x05\x03\x7f\xca\x05\x03\x7f\xe0\x05\x03\x7f\xe1\x05\x03\x7f' | \x24\x01\x01\x01\x25\x01\x01\x01\x42\x01\x01\x01\xb8\x04\x03\x7f\xd6\x04\x03\x7f\x11\x05\x03\x7f\x12\x05\x03\x7f\x16\x05\x03\x7f\x99\x05\x03\x7f\x9a\x05\x03\x7f\x9b\x05\x03\x7f\xca\x05\x03\x7f\xe0\x05\x03\x7f\xe1\x05\x03\x7f
09e0: fill-array-data-payload    b'\x95\x00\x01\x01\x96\x00\x01\x01\x97\x00\x01\x01\x98\x00\x01\x01\x9a\x00\x01\x01\x9b\x00\x01\x01a\x01\x01\x01b\x01\x01\x01c\x01\x01\x01d\x01\x01\x01\xac\x03\x01\x01\x85\x05\x01\x01f\x02\x03\x7fp\x02\x03\x7f<\x05\x03\x7f\x83\x05\x03\x7f' | \x95\x00\x01\x01\x96\x00\x01\x01\x97\x00\x01\x01\x98\x00\x01\x01\x9a\x00\x01\x01\x9b\x00\x01\x01\x61\x01\x01\x01\x62\x01\x01\x01\x63\x01\x01\x01\x64\x01\x01\x01\xac\x03\x01\x01\x85\x05\x01\x01\x66\x02\x03\x7f\x70\x02\x03\x7f\x3c\x05\x03\x7f\x83\x05\x03\x7f
0a28: fill-array-data-payload    b'\xaf\x00\x01\x01@\x01\x01\x01\x9f\x00\x03\x7f\xfc\x00\x03\x7f\xfd\x00\x03\x7fi\x01\x03\x7fj\x01\x03\x7fk\x01\x03\x7fl\x01\x03\x7fm\x01\x03\x7fn\x01\x03\x7fg\x03\x03\x7fi\x03\x03\x7f\xaf\x03\x03\x7f\xb9\x03\x03\x7f\x01\x04\x03\x7f\x02\x04\x03\x7fG\x04\x03\x7f\x02\x05\x03\x7f\x05\x05\x03\x7f\x06\x05\x03\x7f\xab\x05\x03\x7f\xaf\x05\x03\x7f\xb0\x05\x03\x7f\xb1\x05\x03\x7f\xb2\x05\x03\x7f\xb3\x05\x03\x7f\xb4\x05\x03\x7f\xb7\x05\x03\x7f\xb8\x05\x03\x7f' | \xaf\x00\x01\x01\x40\x01\x01\x01\x9f\x00\x03\x7f\xfc\x00\x03\x7f\xfd\x00\x03\x7f\x69\x01\x03\x7f\x6a\x01\x03\x7f\x6b\x01\x03\x7f\x6c\x01\x03\x7f\x6d\x01\x03\x7f\x6e\x01\x03\x7f\x67\x03\x03\x7f\x69\x03\x03\x7f\xaf\x03\x03\x7f\xb9\x03\x03\x7f\x01\x04\x03\x7f\x02\x04\x03\x7f\x47\x04\x03\x7f\x02\x05\x03\x7f\x05\x05\x03\x7f\x06\x05\x03\x7f\xab\x05\x03\x7f\xaf\x05\x03\x7f\xb0\x05\x03\x7f\xb1\x05\x03\x7f\xb2\x05\x03\x7f\xb3\x05\x03\x7f\xb4\x05\x03\x7f\xb7\x05\x03\x7f\xb8\x05\x03\x7f

Lcom/conexant/libcnxtservice/ServiceConfigModule; <clinit>()V code_off=0x5a2924
0000: new-instance               v0, Lcom/conexant/libcnxtservice/ServiceConfigModule$1;
0004: invoke-direct              v0, Lcom/conexant/libcnxtservice/ServiceConfigModule$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/libcnxtservice/ServiceConfigModule;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/libcnxtservice/ServiceConfigParam; <clinit>()V code_off=0x5a2b04
0000: new-instance               v0, Lcom/conexant/libcnxtservice/ServiceConfigParam$1;
0004: invoke-direct              v0, Lcom/conexant/libcnxtservice/ServiceConfigParam$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/libcnxtservice/ServiceConfigParam;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/libcnxtservice/ServiceDataProxyFactory; <clinit>()V code_off=0x5a2d64
0000: new-instance               v0, Ljava/lang/Object;
0004: invoke-direct              v0, Ljava/lang/Object;-><init>()V
000a: sput-object                v0, Lcom/conexant/libcnxtservice/ServiceDataProxyFactory;->mSyncObj Ljava/lang/Object;
000e: return-void                

Lcom/conexant/libcnxtservice/ServiceModuleCommand; <clinit>()V code_off=0x5a33b4
0000: new-instance               v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand$1;
0004: invoke-direct              v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/libcnxtservice/ServiceModuleConfig; <clinit>()V code_off=0x5a380c
0000: new-instance               v0, Lcom/conexant/libcnxtservice/ServiceModuleConfig$1;
0004: invoke-direct              v0, Lcom/conexant/libcnxtservice/ServiceModuleConfig$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/libcnxtservice/ServiceModuleConfig;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/libcnxtservice/ServiceModuleDescriptor; <clinit>()V code_off=0x5a397c
0000: new-instance               v0, Lcom/conexant/libcnxtservice/ServiceModuleDescriptor$1;
0004: invoke-direct              v0, Lcom/conexant/libcnxtservice/ServiceModuleDescriptor$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/libcnxtservice/ServiceModuleDescriptor;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/libcnxtservice/ServiceModuleManager; <clinit>()V code_off=0x5a3e2c
0000: new-instance               v0, Ljava/lang/Object;
0004: invoke-direct              v0, Ljava/lang/Object;-><init>()V
000a: sput-object                v0, Lcom/conexant/libcnxtservice/ServiceModuleManager;->mInstanceSyncObj Ljava/lang/Object;
000e: return-void                

Lcom/conexant/libcnxtservice/ServiceResultReceiver; <clinit>()V code_off=0x5a4144
0000: new-instance               v0, Lcom/conexant/libcnxtservice/ServiceResultReceiver$1;
0004: invoke-direct              v0, Lcom/conexant/libcnxtservice/ServiceResultReceiver$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/libcnxtservice/ServiceResultReceiver;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/libcnxtservice/ServiceUtils$ServiceCallback; onServiceConnected()V code_off=0x0

Lcom/conexant/libcnxtservice/ServiceUtils$ServiceCallback; onServiceDisconnected()V code_off=0x0

Lcom/conexant/libcnxtservice/ServiceUtils$ServiceWrapper; onServiceConnected(Landroid/content/ComponentName; Landroid/os/IBinder;)V code_off=0x5a41d4
0000: instance-of                v0, v3, Lcom/conexant/libcnxtservice/CoreService$ServiceBinder;
0004: if-eqz                     v0, +00bh
0008: move-object                v0, v3
000a: check-cast                 v0, Lcom/conexant/libcnxtservice/CoreService$ServiceBinder;
000e: invoke-virtual             v0, Lcom/conexant/libcnxtservice/CoreService$ServiceBinder;->getService()Lcom/conexant/libcnxtservice/ICoreService;
0014: move-result-object         v0
0016: sput-object                v0, Lcom/conexant/libcnxtservice/ServiceUtils;->sService Lcom/conexant/libcnxtservice/ICoreService;
001a: iget-object                v1, v1, Lcom/conexant/libcnxtservice/ServiceUtils$ServiceWrapper;->mCallback Landroid/content/ServiceConnection;
001e: if-eqz                     v1, +005h
0022: invoke-interface           v1, v2, v3, Landroid/content/ServiceConnection;->onServiceConnected(Landroid/content/ComponentName; Landroid/os/IBinder;)V
0028: invoke-static              Lcom/conexant/libcnxtservice/ServiceUtils;->a()Ljava/util/LinkedHashSet;
002e: move-result-object         v1
0030: invoke-virtual             v1, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;
0036: move-result-object         v1
0038: invoke-interface           v1, Ljava/util/Iterator;->hasNext()Z
003e: move-result                v2
0040: if-eqz                     v2, +00ch
0044: invoke-interface           v1, Ljava/util/Iterator;->next()Ljava/lang/Object;
004a: move-result-object         v2
004c: check-cast                 v2, Lcom/conexant/libcnxtservice/ServiceUtils$ServiceCallback;
0050: invoke-interface           v2, Lcom/conexant/libcnxtservice/ServiceUtils$ServiceCallback;->onServiceConnected()V
0056: goto                       -fh
0058: return-void                

Lcom/conexant/libcnxtservice/ServiceUtils$ServiceWrapper; onServiceDisconnected(Landroid/content/ComponentName;)V code_off=0x5a4240
0000: iget-object                v0, v0, Lcom/conexant/libcnxtservice/ServiceUtils$ServiceWrapper;->mCallback Landroid/content/ServiceConnection;
0004: if-eqz                     v0, +005h
0008: invoke-interface           v0, v1, Landroid/content/ServiceConnection;->onServiceDisconnected(Landroid/content/ComponentName;)V
000e: const/4                    v0, 0
0010: sput-object                v0, Lcom/conexant/libcnxtservice/ServiceUtils;->sService Lcom/conexant/libcnxtservice/ICoreService;
0014: return-void                

Lcom/conexant/libcnxtservice/ServiceUtils; <clinit>()V code_off=0x5a4364
0000: new-instance               v0, Ljava/util/WeakHashMap;
0004: invoke-direct              v0, Ljava/util/WeakHashMap;-><init>()V
000a: sput-object                v0, Lcom/conexant/libcnxtservice/ServiceUtils;->sServiceConnections Ljava/util/WeakHashMap;
000e: new-instance               v0, Ljava/util/LinkedHashSet;
0012: invoke-direct              v0, Ljava/util/LinkedHashSet;-><init>()V
0018: sput-object                v0, Lcom/conexant/libcnxtservice/ServiceUtils;->sCallbacks Ljava/util/LinkedHashSet;
001c: return-void                

Lcom/conexant/libcnxtservice/StringMsgArg; <clinit>()V code_off=0x5a4628
0000: new-instance               v0, Lcom/conexant/libcnxtservice/StringMsgArg$1;
0004: invoke-direct              v0, Lcom/conexant/libcnxtservice/StringMsgArg$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/libcnxtservice/StringMsgArg;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/libcnxtservice/StringParcelable; <clinit>()V code_off=0x5a476c
0000: new-instance               v0, Lcom/conexant/libcnxtservice/StringParcelable$1;
0004: invoke-direct              v0, Lcom/conexant/libcnxtservice/StringParcelable$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/libcnxtservice/StringParcelable;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/libcnxtservice/service/IUSBSession; getDeviceType()I code_off=0x0

Lcom/conexant/libcnxtservice/service/IUSBSession; getUsbDevice()Landroid/hardware/usb/UsbDevice; code_off=0x0

Lcom/conexant/libcnxtservice/service/USBSessionBase; <clinit>()V code_off=0x5a5900
0000: new-instance               v0, Ljava/lang/Object;
0004: invoke-direct              v0, Ljava/lang/Object;-><init>()V
000a: sput-object                v0, Lcom/conexant/libcnxtservice/service/USBSessionBase;->mClassSyncObj Ljava/lang/Object;
000e: return-void                

Lcom/conexant/libcnxtservice/service/USBSessionBase; getDeviceType()I code_off=0x5a58b8
0000: iget                       v0, v0, Lcom/conexant/libcnxtservice/service/USBSessionBase;->mDeviceType I
0004: return                     v0

Lcom/conexant/libcnxtservice/service/USBSessionBase; getUsbDevice()Landroid/hardware/usb/UsbDevice; code_off=0x5a57cc
0000: iget-object                v0, v0, Lcom/conexant/libcnxtservice/service/USBSessionBase;->mUsbDevice Landroid/hardware/usb/UsbDevice;
0004: return-object              v0

Lcom/conexant/libcnxtservice/service/USBSessionBase; getUsbDeviceBase()Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase; code_off=0x0

Lcom/conexant/libcnxtservice/service/FreemanSession; bldCmdGetDeviceChipCode(I)Lcom/conexant/libcnxtservice/ServiceModuleCommand; code_off=0x5a4b08
0000: new-instance               v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0004: invoke-direct              v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand;-><init>()V
000a: invoke-virtual             v0, v1, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->setCommandExecutorId(I)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0010: move-result-object         v1
0012: const/16                   v0, 21
0016: invoke-virtual             v1, v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->setCommandId(I)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
001c: move-result-object         v1
001e: return-object              v1

Lcom/conexant/libcnxtservice/service/FreemanSession; bldCmdGetFirmwareParam(I Lcom/syna/FirmwareParam;)Lcom/conexant/libcnxtservice/ServiceModuleCommand; code_off=0x5a4c68
0000: new-instance               v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0004: invoke-direct              v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand;-><init>()V
000a: invoke-virtual             v0, v1, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->setCommandExecutorId(I)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0010: move-result-object         v1
0012: const/4                    v0, 3
0014: invoke-virtual             v1, v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->setCommandId(I)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
001a: move-result-object         v1
001c: invoke-virtual             v1, v2, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->setInputParam(Landroid/os/Parcelable;)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0022: move-result-object         v1
0024: return-object              v1

Lcom/conexant/libcnxtservice/service/FreemanSession; bldCmdGetUpdateFirmwareProgress(I)Lcom/conexant/libcnxtservice/ServiceModuleCommand; code_off=0x5a4d80
0000: new-instance               v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0004: invoke-direct              v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand;-><init>()V
000a: invoke-virtual             v0, v1, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->setCommandExecutorId(I)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0010: move-result-object         v1
0012: const/4                    v0, 5
0014: invoke-virtual             v1, v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->setCommandId(I)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
001a: move-result-object         v1
001c: return-object              v1

Lcom/conexant/libcnxtservice/service/FreemanSession; bldCmdResetDevice(I)Lcom/conexant/libcnxtservice/ServiceModuleCommand; code_off=0x5a4db0
0000: new-instance               v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0004: invoke-direct              v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand;-><init>()V
000a: invoke-virtual             v0, v1, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->setCommandExecutorId(I)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0010: move-result-object         v1
0012: const/16                   v0, 26
0016: invoke-virtual             v1, v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->setCommandId(I)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
001c: move-result-object         v1
001e: return-object              v1

Lcom/conexant/libcnxtservice/service/FreemanSession; bldCmdSendCmdToDevice(I Lcom/conexant/universalfunction/CnxtUsbCommand;)Lcom/conexant/libcnxtservice/ServiceModuleCommand; code_off=0x5a4e24
0000: new-instance               v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0004: invoke-direct              v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand;-><init>()V
000a: invoke-virtual             v0, v1, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->setCommandExecutorId(I)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0010: move-result-object         v1
0012: const/16                   v0, 11
0016: invoke-virtual             v1, v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->setCommandId(I)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
001c: move-result-object         v1
001e: invoke-virtual             v1, v2, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->setInputParam(Landroid/os/Parcelable;)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0024: move-result-object         v1
0026: return-object              v1

Lcom/conexant/libcnxtservice/service/FreemanSession; bldCmdUpdateFirmware(I Ljava/lang/String;)Lcom/conexant/libcnxtservice/ServiceModuleCommand; code_off=0x5a5028
0000: new-instance               v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0004: invoke-direct              v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand;-><init>()V
000a: invoke-virtual             v0, v1, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->setCommandExecutorId(I)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0010: move-result-object         v1
0012: const/4                    v0, 4
0014: invoke-virtual             v1, v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->setCommandId(I)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
001a: move-result-object         v1
001c: new-instance               v0, Lcom/conexant/libcnxtservice/StringParcelable;
0020: invoke-direct              v0, v2, Lcom/conexant/libcnxtservice/StringParcelable;-><init>(Ljava/lang/String;)V
0026: invoke-virtual             v1, v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->setInputParam(Landroid/os/Parcelable;)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
002c: move-result-object         v1
002e: return-object              v1

Lcom/conexant/libcnxtservice/service/FreemanSession; getUsbDeviceBase()Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase; code_off=0x5a4ab8
0000: iget-object                v0, v0, Lcom/conexant/libcnxtservice/service/FreemanSession;->mFreeman Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;
0004: return-object              v0

Lcom/conexant/libcnxtservice/service/USBModuleDescriptor; <clinit>()V code_off=0x5a5624
0000: new-instance               v0, Lcom/conexant/libcnxtservice/service/USBModuleDescriptor$1;
0004: invoke-direct              v0, Lcom/conexant/libcnxtservice/service/USBModuleDescriptor$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/libcnxtservice/service/USBModuleDescriptor;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/libcnxtservice/service/USBSessionMsgArg; <clinit>()V code_off=0x5a5b2c
0000: new-instance               v0, Lcom/conexant/libcnxtservice/service/USBSessionMsgArg$1;
0004: invoke-direct              v0, Lcom/conexant/libcnxtservice/service/USBSessionMsgArg$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/libcnxtservice/service/USBSessionMsgArg;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/libcnxtservice/service/USBUnKnownSession; getDeviceIdentifier()Ljava/lang/String; code_off=0x5a5c68
0000: const-string               v0, ""
0004: return-object              v0

Lcom/conexant/libcnxtservice/service/USBUnKnownSession; getUsbDeviceBase()Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase; code_off=0x5a5c50
0000: iget-object                v0, v0, Lcom/conexant/libcnxtservice/service/USBUnKnownSession;->mUnknownDevice Lcom/conexant/libcnxtservice/service/UnknownCnxtUsbDevice;
0004: return-object              v0

Lcom/conexant/libcnxtservice/service/UnknownCnxtUsbDevice; getDeviceChipCode()I code_off=0x5a5cc0
0000: const/4                    v0, 0
0002: return                     v0

Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor; <clinit>()V code_off=0x5a5e28
0000: new-instance               v0, Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor$1;
0004: invoke-direct              v0, Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor; getDeviceType()I code_off=0x5a5de0
0000: iget                       v0, v0, Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;->mDeviceType I
0004: return                     v0

Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor; getUsbDevice()Landroid/hardware/usb/UsbDevice; code_off=0x5a5d9c
0000: iget-object                v0, v0, Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;->mUsbDevice Landroid/hardware/usb/UsbDevice;
0004: return-object              v0

Lcom/conexant/libcnxtservice/service/UsbSessionFactory; doParseCnxtDevicesConfig(Lorg/xmlpull/v1/XmlPullParser;)V code_off=0x5a60b8
0000: new-instance               v0, Lcom/conexant/libcnxtservice/service/UsbSessionFactory$DevicesConfig;
0004: const/4                    v1, 0
0006: invoke-direct              v0, v1, Lcom/conexant/libcnxtservice/service/UsbSessionFactory$DevicesConfig;-><init>(I)V
000c: invoke-interface           v8, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I
0012: move-result                v2
0014: const/4                    v3, 0
0016: move-object                v4, v3
0018: const/4                    v5, 1
001a: if-eq                      v2, v5, +05fh
001e: const/4                    v5, 2
0020: const-string               v6, "device"
0024: if-eq                      v2, v5, +01dh
0028: const/4                    v5, 3
002a: if-eq                      v2, v5, +003h
002e: goto                       +50h
0030: invoke-interface           v8, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;
0036: move-result-object         v2
0038: invoke-virtual             v2, v6, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
003e: move-result                v2
0040: if-eqz                     v2, +047h
0044: iget-object                v2, v0, Lcom/conexant/libcnxtservice/service/UsbSessionFactory$DevicesConfig;->configs Ljava/util/List;
0048: invoke-interface           v2, v4, Ljava/util/List;->add(Ljava/lang/Object;)Z
004e: iget-object                v2, v7, Lcom/conexant/libcnxtservice/service/UsbSessionFactory;->mDeviceConfigs Ljava/util/Map;
0052: iget-object                v5, v4, Lcom/conexant/libcnxtservice/service/UsbSessionFactory$DeviceConfig;->mUsbIdString Ljava/lang/String;
0056: invoke-interface           v2, v5, v4, Ljava/util/Map;->put(Ljava/lang/Object; Ljava/lang/Object;)Ljava/lang/Object;
005c: goto                       +39h
005e: invoke-interface           v8, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;
0064: move-result-object         v2
0066: invoke-virtual             v2, v6, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
006c: move-result                v5
006e: const-string               v6, "key"
0072: if-eqz                     v5, +016h
0076: new-instance               v4, Lcom/conexant/libcnxtservice/service/UsbSessionFactory$DeviceConfig;
007a: invoke-direct              v4, v1, Lcom/conexant/libcnxtservice/service/UsbSessionFactory$DeviceConfig;-><init>(I)V
0080: invoke-interface           v8, v3, v6, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String; Ljava/lang/String;)Ljava/lang/String;
0086: move-result-object         v2
0088: iput-object                v2, v4, Lcom/conexant/libcnxtservice/service/UsbSessionFactory$DeviceConfig;->mUsbIdString Ljava/lang/String;
008c: const-string               v2, "className"
0090: invoke-interface           v8, v3, v2, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String; Ljava/lang/String;)Ljava/lang/String;
0096: move-result-object         v2
0098: iput-object                v2, v4, Lcom/conexant/libcnxtservice/service/UsbSessionFactory$DeviceConfig;->mClassName Ljava/lang/String;
009c: goto                       +19h
009e: const-string               v5, "device_param"
00a2: invoke-virtual             v2, v5, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
00a8: move-result                v2
00aa: if-eqz                     v2, +012h
00ae: iget-object                v2, v4, Lcom/conexant/libcnxtservice/service/UsbSessionFactory$DeviceConfig;->mParams Ljava/util/Map;
00b2: invoke-interface           v8, v3, v6, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String; Ljava/lang/String;)Ljava/lang/String;
00b8: move-result-object         v5
00ba: const-string/jumbo         v6, value
00c0: invoke-interface           v8, v3, v6, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String; Ljava/lang/String;)Ljava/lang/String;
00c6: move-result-object         v6
00c8: invoke-interface           v2, v5, v6, Ljava/util/Map;->put(Ljava/lang/Object; Ljava/lang/Object;)Ljava/lang/Object;
00ce: invoke-interface           v8, Lorg/xmlpull/v1/XmlPullParser;->next()I
00d4: move-result                v2
00d6: goto                       -5fh
00d8: return-void                
00da: move-exception             v7
00dc: invoke-virtual             v7, Ljava/lang/Throwable;->printStackTrace()V
00e2: return-void                

Lcom/conexant/libcnxtservice/service/UsbSessionFactory; parseCnxtDevicesConfig(Ljava/lang/String;)V code_off=0x5a61cc
0000: invoke-static              Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;
0006: move-result-object         v0
0008: const/4                    v1, 0
000a: invoke-virtual             v0, v1, Lorg/xmlpull/v1/XmlPullParserFactory;->setNamespaceAware(Z)V
0010: invoke-virtual             v0, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;
0016: move-result-object         v0
0018: new-instance               v1, Ljava/io/StringReader;
001c: invoke-direct              v1, v3, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V
0022: invoke-interface           v0, v1, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/Reader;)V
0028: invoke-direct              v2, v0, Lcom/conexant/libcnxtservice/service/UsbSessionFactory;->doParseCnxtDevicesConfig(Lorg/xmlpull/v1/XmlPullParser;)V
002e: return-void                
0030: move-exception             v2
0032: invoke-virtual             v2, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V
0038: return-void                

Lcom/conexant/libcnxtservice/utils/Helper; <clinit>()V code_off=0x5a6658
0000: const-string               v0, "^(25[0-5]|2[0-4]\d|[0-1]?\d?\d)(\.(25[0-5]|2[0-4]\d|[0-1]?\d?\d)){3}$"
0004: invoke-static              v0, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;
000a: move-result-object         v0
000c: sput-object                v0, Lcom/conexant/libcnxtservice/utils/Helper;->IPV4_PATTERN Ljava/util/regex/Pattern;
0010: return-void                

Lcom/conexant/libcnxtservice/utils/UsbDeviceDetector; checkHasUsbDevice()V code_off=0x5a6a00
0000: iget-object                v0, v2, Lcom/conexant/libcnxtservice/utils/UsbDeviceDetector;->mContext Landroid/content/Context;
0004: const-string/jumbo         v1, usb
000a: invoke-virtual             v0, v1, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
0010: move-result-object         v0
0012: check-cast                 v0, Landroid/hardware/usb/UsbManager;
0016: if-nez                     v0, +00ah
001a: sget-object                v2, Lcom/conexant/libcnxtservice/utils/UsbDeviceDetector;->TAG Ljava/lang/String;
001e: const-string               v0, "checkHasUsbDevice: UsbManager is null"
0022: invoke-static              v2, v0, Lcom/conexant/libcnxtservice/SmartLog;->e(Ljava/lang/String; Ljava/lang/String;)I
0028: return-void                
002a: iget-object                v2, v2, Lcom/conexant/libcnxtservice/utils/UsbDeviceDetector;->mUsbDevices Ljava/util/List;
002e: invoke-virtual             v0, Landroid/hardware/usb/UsbManager;->getDeviceList()Ljava/util/HashMap;
0034: move-result-object         v0
0036: invoke-virtual             v0, Ljava/util/HashMap;->values()Ljava/util/Collection;
003c: move-result-object         v0
003e: invoke-interface           v2, v0, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
0044: return-void                

Lcom/conexant/libcnxtservice/utils/UsbDeviceDetector; updateUsbDeviceState(Landroid/hardware/usb/UsbDevice; Z)V code_off=0x5a6abc
0000: iget-object                v0, v1, Lcom/conexant/libcnxtservice/utils/UsbDeviceDetector;->mUsbDevices Ljava/util/List;
0004: if-eqz                     v3, +006h
0008: invoke-interface           v0, v2, Ljava/util/List;->add(Ljava/lang/Object;)Z
000e: goto                       +4h
0010: invoke-interface           v0, v2, Ljava/util/List;->remove(Ljava/lang/Object;)Z
0016: iget-object                v1, v1, Lcom/conexant/libcnxtservice/utils/UsbDeviceDetector;->mUsbDeviceStateChangeds Ljava/util/List;
001a: invoke-interface           v1, Ljava/util/List;->iterator()Ljava/util/Iterator;
0020: move-result-object         v1
0022: invoke-interface           v1, Ljava/util/Iterator;->hasNext()Z
0028: move-result                v0
002a: if-eqz                     v0, +00ch
002e: invoke-interface           v1, Ljava/util/Iterator;->next()Ljava/lang/Object;
0034: move-result-object         v0
0036: check-cast                 v0, Lcom/conexant/libcnxtservice/utils/UsbDeviceDetector$onUsbDeviceStateChanged;
003a: invoke-interface           v0, v2, v3, Lcom/conexant/libcnxtservice/utils/UsbDeviceDetector$onUsbDeviceStateChanged;->plugStateChange(Landroid/hardware/usb/UsbDevice; Z)V
0040: goto                       -fh
0042: return-void                

Lcom/conexant/libcnxtservice/utils/UsbDeviceDetector; addOnUsbDeviceStateChanged(Lcom/conexant/libcnxtservice/utils/UsbDeviceDetector$onUsbDeviceStateChanged;)V code_off=0x5a69b4
0000: iget-object                v0, v2, Lcom/conexant/libcnxtservice/utils/UsbDeviceDetector;->mUsbDeviceStateChangeds Ljava/util/List;
0004: invoke-interface           v0, v3, Ljava/util/List;->add(Ljava/lang/Object;)Z
000a: iget-object                v2, v2, Lcom/conexant/libcnxtservice/utils/UsbDeviceDetector;->mUsbDevices Ljava/util/List;
000e: invoke-interface           v2, Ljava/util/List;->iterator()Ljava/util/Iterator;
0014: move-result-object         v2
0016: invoke-interface           v2, Ljava/util/Iterator;->hasNext()Z
001c: move-result                v0
001e: if-eqz                     v0, +00dh
0022: invoke-interface           v2, Ljava/util/Iterator;->next()Ljava/lang/Object;
0028: move-result-object         v0
002a: check-cast                 v0, Landroid/hardware/usb/UsbDevice;
002e: const/4                    v1, 1
0030: invoke-interface           v3, v0, v1, Lcom/conexant/libcnxtservice/utils/UsbDeviceDetector$onUsbDeviceStateChanged;->plugStateChange(Landroid/hardware/usb/UsbDevice; Z)V
0036: goto                       -10h
0038: return-void                

Lcom/conexant/libcnxtservice/utils/UsbDevicePermissionDetector; requestUsbDevicePermission(Landroid/hardware/usb/UsbDevice;)V code_off=0x5a6cd4
0000: iget-object                v0, v5, Lcom/conexant/libcnxtservice/utils/UsbDevicePermissionDetector;->mContext Landroid/content/Context;
0004: const-string/jumbo         v1, usb
000a: invoke-virtual             v0, v1, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
0010: move-result-object         v0
0012: check-cast                 v0, Landroid/hardware/usb/UsbManager;
0016: sget                       v1, Landroid/os/Build$VERSION;->SDK_INT I
001a: iget-object                v5, v5, Lcom/conexant/libcnxtservice/utils/UsbDevicePermissionDetector;->mContext Landroid/content/Context;
001e: const-string               v2, "com.moondroplab.moondrop.USB_PERMISSION"
0022: const/4                    v3, 0
0024: const/16                   v4, 31
0028: if-lt                      v1, v4, +00eh
002c: new-instance               v1, Landroid/content/Intent;
0030: invoke-direct              v1, v2, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
0036: const/high16               v2, 201326592
003a: invoke-static              v5, v3, v1, v2, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context; I Landroid/content/Intent; I)Landroid/app/PendingIntent;
0040: move-result-object         v5
0042: goto                       +ch
0044: new-instance               v1, Landroid/content/Intent;
0048: invoke-direct              v1, v2, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
004e: const/high16               v2, 134217728
0052: invoke-static              v5, v3, v1, v2, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context; I Landroid/content/Intent; I)Landroid/app/PendingIntent;
0058: move-result-object         v5
005a: invoke-virtual             v0, v6, v5, Landroid/hardware/usb/UsbManager;->requestPermission(Landroid/hardware/usb/UsbDevice; Landroid/app/PendingIntent;)V
0060: return-void                

Lcom/conexant/libcnxtservice/utils/UsbDevicePermissionDetector; updatePermissionState(Landroid/hardware/usb/UsbDevice; Z)V code_off=0x5a6d48
0000: iget-object                v1, v1, Lcom/conexant/libcnxtservice/utils/UsbDevicePermissionDetector;->mPermissionStateChangeds Ljava/util/List;
0004: invoke-interface           v1, Ljava/util/List;->iterator()Ljava/util/Iterator;
000a: move-result-object         v1
000c: invoke-interface           v1, Ljava/util/Iterator;->hasNext()Z
0012: move-result                v0
0014: if-eqz                     v0, +00ch
0018: invoke-interface           v1, Ljava/util/Iterator;->next()Ljava/lang/Object;
001e: move-result-object         v0
0020: check-cast                 v0, Lcom/conexant/libcnxtservice/utils/UsbDevicePermissionDetector$onPermissionStateChanged;
0024: invoke-interface           v0, v2, v3, Lcom/conexant/libcnxtservice/utils/UsbDevicePermissionDetector$onPermissionStateChanged;->permissionStateChange(Landroid/hardware/usb/UsbDevice; Z)V
002a: goto                       -fh
002c: return-void                

Lcom/conexant/universalfunction/CnxtUsbCommand; <clinit>()V code_off=0x5a70b4
0000: new-instance               v0, Lcom/conexant/universalfunction/CnxtUsbCommand$1;
0004: invoke-direct              v0, Lcom/conexant/universalfunction/CnxtUsbCommand$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/universalfunction/CnxtUsbCommand;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/universalfunction/CnxtUsbConstants; <clinit>()V code_off=0x5a71e0
0000: const-string               v0, "OUTD"
0004: const-string               v1, "CAFE"
0008: const-string               v2, "AIRP"
000c: const-string               v3, "METR"
0010: const-string               v4, "OFFI"
0014: filled-new-array           v2, v3, v4, v0, v1, [Ljava/lang/String;
001a: move-result-object         v0
001c: sput-object                v0, Lcom/conexant/universalfunction/CnxtUsbConstants;->ANC_MODE_ARRAY [Ljava/lang/String;
0020: const-string               v9, "ZFT9"
0024: const-string               v10, "ZFTA"
0028: const-string               v1, "ZFT1"
002c: const-string               v2, "ZFT2"
0030: const-string               v3, "ZFT3"
0034: const-string               v4, "ZFT4"
0038: const-string               v5, "ZFT5"
003c: const-string               v6, "ZFT6"
0040: const-string               v7, "ZFT7"
0044: const-string               v8, "ZFT8"
0048: filled-new-array/range     v1 ... v10, [Ljava/lang/String;
004e: move-result-object         v0
0050: sput-object                v0, Lcom/conexant/universalfunction/CnxtUsbConstants;->ANC_MODES_FIELD_TEST_ARRAY [Ljava/lang/String;
0054: const/4                    v0, 0
0056: const/16                   v1, 8000
005a: filled-new-array           v0, v1, [I
0060: move-result-object         v2
0062: const/4                    v0, 1
0064: const/16                   v1, 16000
0068: filled-new-array           v0, v1, [I
006e: move-result-object         v3
0070: const/4                    v0, 2
0072: const/16                   v1, 24000
0076: filled-new-array           v0, v1, [I
007c: move-result-object         v4
007e: const/16                   v0, 32000
0082: const/4                    v1, 3
0084: filled-new-array           v1, v0, [I
008a: move-result-object         v5
008c: const/4                    v0, 4
008e: const                      v6, 44000
0094: filled-new-array           v0, v6, [I
009a: move-result-object         v6
009c: const/4                    v0, 5
009e: const                      v7, 48000
00a4: filled-new-array           v0, v7, [I
00aa: move-result-object         v7
00ac: const/4                    v0, 6
00ae: const                      v8, 96000
00b4: filled-new-array           v0, v8, [I
00ba: move-result-object         v8
00bc: const/4                    v0, 7
00be: const                      v9, 192000
00c4: filled-new-array           v0, v9, [I
00ca: move-result-object         v9
00cc: const/16                   v0, 8
00d0: const                      v10, 384000
00d6: filled-new-array           v0, v10, [I
00dc: move-result-object         v10
00de: filled-new-array/range     v2 ... v10, [[I
00e4: move-result-object         v0
00e6: sput-object                v0, Lcom/conexant/universalfunction/CnxtUsbConstants;->SAMPLE_RATE_ARRAY [[I
00ea: sput                       v1, Lcom/conexant/universalfunction/CnxtUsbConstants;->EQ_FILTER_TYPE_TEST_VALUE I
00ee: const/16                   v0, 11
00f2: new-array                  v0, v0, [I
00f6: fill-array-data            v0, +000000dh
00fc: sput-object                v0, Lcom/conexant/universalfunction/CnxtUsbConstants;->FREQ_SAMPLE_RATE [I
0100: const-string               v0, ""
0104: sput-object                v0, Lcom/conexant/universalfunction/CnxtUsbConstants;->CURRENT_DEVICE_VENDOR_ID Ljava/lang/String;
0108: sput-object                v0, Lcom/conexant/universalfunction/CnxtUsbConstants;->CURRENT_DEVICE_PRODUCT_ID Ljava/lang/String;
010c: return-void                
010e: nop                        
0110: fill-array-data-payload    b'@\x1f\x00\x00\x80>\x00\x00\xc0]\x00\x00\x00}\x00\x00D\xac\x00\x00\x80\xbb\x00\x00\x00w\x01\x00\x00\xee\x02\x00\x00\xdc\x05\x00Pu\r\x00\x80\xaf\x02\x00' | \x40\x1f\x00\x00\x80\x3e\x00\x00\xc0\x5d\x00\x00\x00\x7d\x00\x00\x44\xac\x00\x00\x80\xbb\x00\x00\x00\x77\x01\x00\x00\xee\x02\x00\x00\xdc\x05\x00\x50\x75\x0d\x00\x80\xaf\x02\x00

Lcom/conexant/universalfunction/CommonUtil; getDeviceIdFromXMLConfig(Landroid/content/Context; I)Ljava/util/Map; code_off=0x5a78b4
0000: invoke-virtual             v8, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
0006: move-result-object         v8
0008: invoke-virtual             v8, v9, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;
000e: move-result-object         v8
0010: const/4                    v9, 0
0012: invoke-interface           v8, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I
0018: move-result                v0
001a: const-string               v1, ""
001e: move-object                v2, v9
0020: move-object                v3, v2
0022: move-object                v4, v3
0024: const/4                    v5, 1
0026: if-eq                      v0, v5, +075h
002a: if-eqz                     v0, +068h
002e: const/4                    v5, 2
0030: const-string               v6, "device"
0034: const-string/jumbo         v7, usb_device
003a: if-eq                      v0, v5, +025h
003e: const/4                    v5, 3
0040: if-eq                      v0, v5, +003h
0044: goto                       +61h
0046: invoke-interface           v8, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;
004c: move-result-object         v0
004e: invoke-virtual             v0, v7, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0054: move-result                v5
0056: if-eqz                     v5, +00ch
005a: invoke-interface           v3, v4, Ljava/util/List;->add(Ljava/lang/Object;)Z
0060: move-object                v4, v9
0062: goto                       +52h
0064: move-exception             v8
0066: move-object                v9, v2
0068: goto                       +58h
006a: move-exception             v8
006c: goto                       -3h
006e: invoke-virtual             v0, v6, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0074: move-result                v0
0076: if-eqz                     v0, +048h
007a: invoke-interface           v2, v1, v3, Ljava/util/Map;->put(Ljava/lang/Object; Ljava/lang/Object;)Ljava/lang/Object;
0080: move-object                v3, v9
0082: goto                       +42h
0084: invoke-interface           v8, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;
008a: move-result-object         v0
008c: invoke-virtual             v0, v6, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0092: move-result                v5
0094: if-eqz                     v5, +010h
0098: const-string               v0, "device_name"
009c: invoke-interface           v8, v9, v0, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String; Ljava/lang/String;)Ljava/lang/String;
00a2: move-result-object         v0
00a4: new-instance               v1, Ljava/util/ArrayList;
00a8: invoke-direct              v1, Ljava/util/ArrayList;-><init>()V
00ae: move-object                v3, v1
00b0: move-object                v1, v0
00b2: goto                       +2ah
00b4: invoke-virtual             v0, v7, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
00ba: move-result                v0
00bc: if-eqz                     v0, +025h
00c0: new-instance               v4, Lcom/conexant/universalfunction/DeviceId;
00c4: invoke-direct              v4, Lcom/conexant/universalfunction/DeviceId;-><init>()V
00ca: const-string/jumbo         v0, vendor_id
00d0: invoke-interface           v8, v9, v0, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String; Ljava/lang/String;)Ljava/lang/String;
00d6: move-result-object         v0
00d8: const-string               v5, "product_id"
00dc: invoke-interface           v8, v9, v5, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String; Ljava/lang/String;)Ljava/lang/String;
00e2: move-result-object         v5
00e4: invoke-virtual             v4, v0, Lcom/conexant/universalfunction/DeviceId;->setVendorId(Ljava/lang/String;)V
00ea: invoke-virtual             v4, v5, Lcom/conexant/universalfunction/DeviceId;->setProductId(Ljava/lang/String;)V
00f0: invoke-interface           v8, Lorg/xmlpull/v1/XmlPullParser;->next()I
00f6: move-result                v0
00f8: goto                       -6ah
00fa: new-instance               v0, Ljava/util/HashMap;
00fe: invoke-direct              v0, Ljava/util/HashMap;-><init>()V
0104: move-object                v2, v0
0106: invoke-interface           v8, Lorg/xmlpull/v1/XmlPullParser;->next()I
010c: move-result                v0
010e: goto                       -75h
0110: return-object              v2
0112: move-exception             v8
0114: goto                       +2h
0116: move-exception             v8
0118: invoke-virtual             v8, Ljava/lang/Throwable;->printStackTrace()V
011e: return-object              v9

Lcom/conexant/universalfunction/CommonUtil; shiftEQBandForFreeman3(I)I code_off=0x5a75cc
0000: add-int/lit8               v0, v0, 5
0004: return                     v0

Lcom/conexant/universalfunction/CommonUtilNative; <clinit>()V code_off=0x5a734c
0000: const-string               v0, "cxaudiodsplib_embca_jni"
0004: invoke-static              v0, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
000a: return-void                

Lcom/conexant/universalfunction/HidCmdByteArray; <clinit>()V code_off=0x5a7bc0
0000: new-instance               v0, Lcom/conexant/universalfunction/HidCmdByteArray$1;
0004: invoke-direct              v0, Lcom/conexant/universalfunction/HidCmdByteArray$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/universalfunction/HidCmdByteArray;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask; onProgressUpdate([Ljava/lang/Integer;)V code_off=0x5ed1e4
0000: iget-object                v1, v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask;->this$0 Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;
0004: invoke-static              v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->d(Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;)Landroid/app/ProgressDialog;
000a: move-result-object         v1
000c: const/4                    v0, 0
000e: aget-object                v2, v2, v0
0012: invoke-virtual             v2, Ljava/lang/Integer;->intValue()I
0018: move-result                v2
001a: invoke-virtual             v1, v2, Landroid/app/ProgressDialog;->setProgress(I)V
0020: return-void                

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask; onProgressUpdate([Ljava/lang/Object;)V code_off=0x5ed218
0000: check-cast                 v1, [Ljava/lang/Integer;
0004: invoke-virtual             v0, v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask;->onProgressUpdate([Ljava/lang/Integer;)V
000a: return-void                

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity; lambda$showUpdatedStatusDialog$0(Z)V code_off=0x5ed35c
0000: iget-object                v0, v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFwProgressDialog Landroid/app/ProgressDialog;
0004: if-eqz                     v0, +00dh
0008: invoke-virtual             v0, Landroid/app/Dialog;->isShowing()Z
000e: move-result                v0
0010: if-eqz                     v0, +007h
0014: iget-object                v0, v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFwProgressDialog Landroid/app/ProgressDialog;
0018: invoke-virtual             v0, Landroid/app/Dialog;->dismiss()V
001e: if-eqz                     v2, +007h
0022: const/4                    v2, 1
0024: invoke-direct              v1, v2, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->notifySynopsysOtaCompleted(Z)V
002a: goto                       +eh
002c: const-string               v2, "Firmware Update Failed"
0030: const/4                    v0, 0
0032: invoke-static              v1, v2, v0, Landroid/widget/Toast;->makeText(Landroid/content/Context; Ljava/lang/CharSequence; I)Landroid/widget/Toast;
0038: move-result-object         v2
003a: invoke-virtual             v2, Landroid/widget/Toast;->show()V
0040: invoke-direct              v1, v0, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->notifySynopsysOtaCompleted(Z)V
0046: invoke-virtual             v1, Landroid/app/Activity;->finish()V
004c: return-void                

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity; showUpdateFirmwareDialog()V code_off=0x5ed56c
0000: new-instance               v0, Landroid/app/ProgressDialog;
0004: const/4                    v1, 5
0006: invoke-direct              v0, v4, v1, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context; I)V
000c: iput-object                v0, v4, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFwProgressDialog Landroid/app/ProgressDialog;
0010: sget                       v1, Lcom/moondroplab/moondrop/moondrop_app/R$string;->firmware_update_in_progress I
0014: invoke-virtual             v4, v1, Landroid/content/Context;->getString(I)Ljava/lang/String;
001a: move-result-object         v1
001c: invoke-virtual             v0, v1, Landroid/app/Dialog;->setTitle(Ljava/lang/CharSequence;)V
0022: iget-object                v0, v4, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFwProgressDialog Landroid/app/ProgressDialog;
0026: const/4                    v1, 0
0028: invoke-virtual             v0, v1, Landroid/app/Dialog;->setCancelable(Z)V
002e: iget-object                v0, v4, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFwProgressDialog Landroid/app/ProgressDialog;
0032: const/4                    v2, 1
0034: invoke-virtual             v0, v2, Landroid/app/ProgressDialog;->setProgressStyle(I)V
003a: iget-object                v0, v4, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFwAsyncTask Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask;
003e: if-eqz                     v0, +017h
0042: invoke-virtual             v0, Landroid/os/AsyncTask;->getStatus()Landroid/os/AsyncTask$Status;
0048: move-result-object         v0
004a: sget-object                v3, Landroid/os/AsyncTask$Status;->FINISHED Landroid/os/AsyncTask$Status;
004e: if-eq                      v0, v3, +00fh
0052: sget-object                v0, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->TAG Ljava/lang/String;
0056: const-string/jumbo         v3, showUpdateFirmwareDialog: cancel asynctask
005c: invoke-static              v0, v3, Lcom/conexant/libcnxtservice/SmartLog;->d(Ljava/lang/String; Ljava/lang/String;)I
0062: iget-object                v0, v4, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFwAsyncTask Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask;
0066: invoke-virtual             v0, v2, Landroid/os/AsyncTask;->cancel(Z)Z
006c: new-instance               v0, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask;
0070: invoke-direct              v0, v4, v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask;-><init>(Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity; I)V
0076: iput-object                v0, v4, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFwAsyncTask Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask;
007a: new-array                  v4, v1, [Ljava/lang/Void;
007e: invoke-virtual             v0, v4, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
0084: return-void                

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity; showUpdatedStatusDialog(Z)V code_off=0x5ed604
0000: new-instance               v0, Lum;
0004: const/4                    v1, 4
0006: invoke-direct              v0, v1, v2, v3, Lum;-><init>(I Ljava/lang/Object; Z)V
000c: invoke-virtual             v2, v0, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
0012: return-void                

Lcom/syna/FirmwareParam$1; <init>()V code_off=0x69fa28
0000: invoke-direct              v0, Ljava/lang/Object;-><init>()V
0006: return-void                

Lcom/syna/FirmwareParam$1; createFromParcel(Landroid/os/Parcel;)Lcom/syna/FirmwareParam; code_off=0x69f9bc
0000: new-instance               v0, Lcom/syna/FirmwareParam;
0004: invoke-direct              v0, v1, Lcom/syna/FirmwareParam;-><init>(Landroid/os/Parcel;)V
000a: return-object              v0

Lcom/syna/FirmwareParam$1; createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object; code_off=0x69f9f0
0000: invoke-virtual             v0, v1, Lcom/syna/FirmwareParam$1;->createFromParcel(Landroid/os/Parcel;)Lcom/syna/FirmwareParam;
0006: move-result-object         v0
0008: return-object              v0

Lcom/syna/FirmwareParam$1; newArray(I)[Lcom/syna/FirmwareParam; code_off=0x69f9d8
0000: new-array                  v0, v1, [Lcom/syna/FirmwareParam;
0004: return-object              v0

Lcom/syna/FirmwareParam$1; newArray(I)[Ljava/lang/Object; code_off=0x69fa0c
0000: invoke-virtual             v0, v1, Lcom/syna/FirmwareParam$1;->newArray(I)[Lcom/syna/FirmwareParam;
0006: move-result-object         v0
0008: return-object              v0

Lcom/syna/FirmwareParam; <clinit>()V code_off=0x69fafc
0000: new-instance               v0, Lcom/syna/FirmwareParam$1;
0004: invoke-direct              v0, Lcom/syna/FirmwareParam$1;-><init>()V
000a: sput-object                v0, Lcom/syna/FirmwareParam;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/syna/FirmwareParam; <init>()V code_off=0x69fb1c
0000: invoke-direct              v0, Ljava/lang/Object;-><init>()V
0006: return-void                

Lcom/syna/FirmwareParam; <init>(Landroid/os/Parcel;)V code_off=0x69fb34
0000: invoke-direct              v2, Ljava/lang/Object;-><init>()V
0006: invoke-virtual             v3, Landroid/os/Parcel;->readString()Ljava/lang/String;
000c: move-result-object         v0
000e: iput-object                v0, v2, Lcom/syna/FirmwareParam;->manufacture Ljava/lang/String;
0012: invoke-virtual             v3, Landroid/os/Parcel;->readString()Ljava/lang/String;
0018: move-result-object         v0
001a: iput-object                v0, v2, Lcom/syna/FirmwareParam;->product Ljava/lang/String;
001e: invoke-virtual             v3, Landroid/os/Parcel;->readString()Ljava/lang/String;
0024: move-result-object         v0
0026: iput-object                v0, v2, Lcom/syna/FirmwareParam;->serial Ljava/lang/String;
002a: invoke-virtual             v3, Landroid/os/Parcel;->readString()Ljava/lang/String;
0030: move-result-object         v0
0032: iput-object                v0, v2, Lcom/syna/FirmwareParam;->firmware_version Ljava/lang/String;
0036: invoke-virtual             v3, Landroid/os/Parcel;->readInt()I
003c: move-result                v0
003e: iput                       v0, v2, Lcom/syna/FirmwareParam;->usb_vendor_id I
0042: invoke-virtual             v3, Landroid/os/Parcel;->readInt()I
0048: move-result                v0
004a: iput                       v0, v2, Lcom/syna/FirmwareParam;->usb_product_id I
004e: invoke-virtual             v3, Landroid/os/Parcel;->readInt()I
0054: move-result                v0
0056: iput                       v0, v2, Lcom/syna/FirmwareParam;->device I
005a: invoke-virtual             v3, Landroid/os/Parcel;->readInt()I
0060: move-result                v0
0062: iput                       v0, v2, Lcom/syna/FirmwareParam;->crc_value I
0066: invoke-virtual             v3, Landroid/os/Parcel;->readLong()J
006c: move-result-wide           v0
006e: iput-wide                  v0, v2, Lcom/syna/FirmwareParam;->firmware_partiton J
0072: return-void                

Lcom/syna/FirmwareParam; describeContents()I code_off=0x69fa40
0000: const/4                    v0, 0
0002: return                     v0

Lcom/syna/FirmwareParam; getDevice()I code_off=0x69fa54
0000: iget                       v0, v0, Lcom/syna/FirmwareParam;->device I
0004: return                     v0

Lcom/syna/FirmwareParam; getFirmware_version()Ljava/lang/String; code_off=0x69fa9c
0000: iget-object                v0, v0, Lcom/syna/FirmwareParam;->firmware_version Ljava/lang/String;
0004: return-object              v0

Lcom/syna/FirmwareParam; getManufacture()Ljava/lang/String; code_off=0x69fab4
0000: iget-object                v0, v0, Lcom/syna/FirmwareParam;->manufacture Ljava/lang/String;
0004: return-object              v0

Lcom/syna/FirmwareParam; getProduct()Ljava/lang/String; code_off=0x69facc
0000: iget-object                v0, v0, Lcom/syna/FirmwareParam;->product Ljava/lang/String;
0004: return-object              v0

Lcom/syna/FirmwareParam; getSerial()Ljava/lang/String; code_off=0x69fae4
0000: iget-object                v0, v0, Lcom/syna/FirmwareParam;->serial Ljava/lang/String;
0004: return-object              v0

Lcom/syna/FirmwareParam; getUsb_product_id()I code_off=0x69fa6c
0000: iget                       v0, v0, Lcom/syna/FirmwareParam;->usb_product_id I
0004: return                     v0

Lcom/syna/FirmwareParam; getUsb_vendor_id()I code_off=0x69fa84
0000: iget                       v0, v0, Lcom/syna/FirmwareParam;->usb_vendor_id I
0004: return                     v0

Lcom/syna/FirmwareParam; setDevice(I)V code_off=0x69fbb8
0000: iput                       v1, v0, Lcom/syna/FirmwareParam;->device I
0004: return-void                

Lcom/syna/FirmwareParam; setFirmware_version(Ljava/lang/String;)V code_off=0x69fbd0
0000: if-eqz                     v1, +003h
0004: goto                       +3h
0006: const-string               v1, "00"
000a: iput-object                v1, v0, Lcom/syna/FirmwareParam;->firmware_version Ljava/lang/String;
000e: return-void                

Lcom/syna/FirmwareParam; setManufacture(Ljava/lang/String;)V code_off=0x69fbf0
0000: if-eqz                     v1, +003h
0004: goto                       +3h
0006: const-string               v1, "00"
000a: iput-object                v1, v0, Lcom/syna/FirmwareParam;->manufacture Ljava/lang/String;
000e: return-void                

Lcom/syna/FirmwareParam; setProduct(Ljava/lang/String;)V code_off=0x69fc10
0000: if-eqz                     v1, +003h
0004: goto                       +3h
0006: const-string               v1, "00"
000a: iput-object                v1, v0, Lcom/syna/FirmwareParam;->product Ljava/lang/String;
000e: return-void                

Lcom/syna/FirmwareParam; setSerial(Ljava/lang/String;)V code_off=0x69fc30
0000: if-eqz                     v1, +003h
0004: goto                       +3h
0006: const-string               v1, "00"
000a: iput-object                v1, v0, Lcom/syna/FirmwareParam;->serial Ljava/lang/String;
000e: return-void                

Lcom/syna/FirmwareParam; setUsb_product_id(I)V code_off=0x69fc50
0000: iput                       v1, v0, Lcom/syna/FirmwareParam;->usb_product_id I
0004: return-void                

Lcom/syna/FirmwareParam; setUsb_vendor_id(I)V code_off=0x69fc68
0000: iput                       v1, v0, Lcom/syna/FirmwareParam;->usb_vendor_id I
0004: return-void                

Lcom/syna/FirmwareParam; writeToParcel(Landroid/os/Parcel; I)V code_off=0x69fc80
0000: iget-object                v4, v2, Lcom/syna/FirmwareParam;->manufacture Ljava/lang/String;
0004: invoke-virtual             v3, v4, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V
000a: iget-object                v4, v2, Lcom/syna/FirmwareParam;->product Ljava/lang/String;
000e: invoke-virtual             v3, v4, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V
0014: iget-object                v4, v2, Lcom/syna/FirmwareParam;->serial Ljava/lang/String;
0018: invoke-virtual             v3, v4, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V
001e: iget-object                v4, v2, Lcom/syna/FirmwareParam;->firmware_version Ljava/lang/String;
0022: invoke-virtual             v3, v4, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V
0028: iget                       v4, v2, Lcom/syna/FirmwareParam;->usb_vendor_id I
002c: invoke-virtual             v3, v4, Landroid/os/Parcel;->writeInt(I)V
0032: iget                       v4, v2, Lcom/syna/FirmwareParam;->usb_product_id I
0036: invoke-virtual             v3, v4, Landroid/os/Parcel;->writeInt(I)V
003c: iget                       v4, v2, Lcom/syna/FirmwareParam;->device I
0040: invoke-virtual             v3, v4, Landroid/os/Parcel;->writeInt(I)V
0046: iget                       v4, v2, Lcom/syna/FirmwareParam;->crc_value I
004a: invoke-virtual             v3, v4, Landroid/os/Parcel;->writeInt(I)V
0050: iget-wide                  v0, v2, Lcom/syna/FirmwareParam;->firmware_partiton J
0054: invoke-virtual             v3, v0, v1, Landroid/os/Parcel;->writeLong(J)V
005a: return-void                

Lcom/syna/FirmwareUpdate; <clinit>()V code_off=0x69ff8c
0000: const-string               v0, "CxAudioHidLib_EMBCB_jni"
0004: invoke-static              v0, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
000a: invoke-static              Lcom/syna/FirmwareUpdate;->native_init()V
0010: return-void                

Lcom/syna/FirmwareUpdate; <init>()V code_off=0x69ffb0
0000: invoke-direct              v1, Ljava/lang/Object;-><init>()V
0006: const/4                    v0, 0
0008: iput-object                v0, v1, Lcom/syna/FirmwareUpdate;->firmwareParam Lcom/syna/FirmwareParam;
000c: const/4                    v0, 1
000e: iput                       v0, v1, Lcom/syna/FirmwareUpdate;->CR_TRUE I
0012: return-void                

Lcom/syna/FirmwareUpdate; GetDeviceInformation()V code_off=0x69ffd4
0000: new-instance               v0, Lcom/syna/FirmwareParam;
0004: invoke-direct              v0, Lcom/syna/FirmwareParam;-><init>()V
000a: iput-object                v0, v4, Lcom/syna/FirmwareUpdate;->firmwareParam Lcom/syna/FirmwareParam;
000e: invoke-static              Lcom/syna/FirmwareUpdate;->native_GetManufacturerString()Ljava/lang/String;
0014: move-result-object         v1
0016: invoke-virtual             v0, v1, Lcom/syna/FirmwareParam;->setManufacture(Ljava/lang/String;)V
001c: iget-object                v0, v4, Lcom/syna/FirmwareUpdate;->firmwareParam Lcom/syna/FirmwareParam;
0020: invoke-static              Lcom/syna/FirmwareUpdate;->native_GetProductString()Ljava/lang/String;
0026: move-result-object         v1
0028: invoke-virtual             v0, v1, Lcom/syna/FirmwareParam;->setProduct(Ljava/lang/String;)V
002e: invoke-static              Lcom/syna/FirmwareUpdate;->native_GetSerialNumberString()Ljava/lang/String;
0034: move-result-object         v0
0036: sget-object                v1, Lcom/syna/FirmwareUpdate;->TAG Ljava/lang/String;
003a: new-instance               v2, Ljava/lang/StringBuilder;
003e: const-string               v3, "GetDeviceInformation: SerialNumberString: "
0042: invoke-direct              v2, v3, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
0048: invoke-virtual             v2, v0, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
004e: invoke-virtual             v2, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
0054: move-result-object         v2
0056: invoke-static              v1, v2, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
005c: iget-object                v1, v4, Lcom/syna/FirmwareUpdate;->firmwareParam Lcom/syna/FirmwareParam;
0060: invoke-virtual             v1, v0, Lcom/syna/FirmwareParam;->setSerial(Ljava/lang/String;)V
0066: iget-object                v0, v4, Lcom/syna/FirmwareUpdate;->firmwareParam Lcom/syna/FirmwareParam;
006a: invoke-static              Lcom/syna/FirmwareUpdate;->native_GetProductID()I
0070: move-result                v1
0072: invoke-virtual             v0, v1, Lcom/syna/FirmwareParam;->setUsb_product_id(I)V
0078: iget-object                v0, v4, Lcom/syna/FirmwareUpdate;->firmwareParam Lcom/syna/FirmwareParam;
007c: invoke-static              Lcom/syna/FirmwareUpdate;->native_GetVendorID()I
0082: move-result                v1
0084: invoke-virtual             v0, v1, Lcom/syna/FirmwareParam;->setUsb_vendor_id(I)V
008a: iget-object                v4, v4, Lcom/syna/FirmwareUpdate;->firmwareParam Lcom/syna/FirmwareParam;
008e: invoke-static              Lcom/syna/FirmwareUpdate;->native_GetFirmwareVersionString()Ljava/lang/String;
0094: move-result-object         v0
0096: invoke-virtual             v4, v0, Lcom/syna/FirmwareParam;->setFirmware_version(Ljava/lang/String;)V
009c: return-void                

Lcom/syna/FirmwareUpdate; native_ClaimHidInterface()I code_off=0x0

Lcom/syna/FirmwareUpdate; native_DeviceReset()I code_off=0x0

Lcom/syna/FirmwareUpdate; native_FirmwareDetect(Ljava/lang/String;)I code_off=0x0

Lcom/syna/FirmwareUpdate; native_GetChipCode()I code_off=0x0

Lcom/syna/FirmwareUpdate; native_GetFirmwareVersionString()Ljava/lang/String; code_off=0x0

Lcom/syna/FirmwareUpdate; native_GetManufacturerString()Ljava/lang/String; code_off=0x0

Lcom/syna/FirmwareUpdate; native_GetProductID()I code_off=0x0

Lcom/syna/FirmwareUpdate; native_GetProductString()Ljava/lang/String; code_off=0x0

Lcom/syna/FirmwareUpdate; native_GetProgressPerCent()I code_off=0x0

Lcom/syna/FirmwareUpdate; native_GetSerialNumberString()Ljava/lang/String; code_off=0x0

Lcom/syna/FirmwareUpdate; native_GetVendorID()I code_off=0x0

Lcom/syna/FirmwareUpdate; native_ReleaseHidInterface()I code_off=0x0

Lcom/syna/FirmwareUpdate; native_connect(I)I code_off=0x0

Lcom/syna/FirmwareUpdate; native_disconnect()V code_off=0x0

Lcom/syna/FirmwareUpdate; native_download(Ljava/lang/String; I)I code_off=0x0

Lcom/syna/FirmwareUpdate; native_finalize()V code_off=0x0

Lcom/syna/FirmwareUpdate; native_init()V code_off=0x0

Lcom/syna/FirmwareUpdate; DetectNewFirmware(Ljava/lang/String;)Z code_off=0x69fcec
0000: invoke-static              Lcom/syna/FirmwareUpdate;->native_ClaimHidInterface()I
0006: move-result                v1
0008: const/4                    v0, 0
000a: if-gez                     v1, +00ah
000e: sget-object                v1, Lcom/syna/FirmwareUpdate;->TAG Ljava/lang/String;
0012: const-string               v2, "DetectNewFirmware: Claim Hid interface failed"
0016: invoke-static              v1, v2, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
001c: return                     v0
001e: invoke-static              v2, Lcom/syna/FirmwareUpdate;->native_FirmwareDetect(Ljava/lang/String;)I
0024: move-result                v1
0026: invoke-static              Lcom/syna/FirmwareUpdate;->native_ReleaseHidInterface()I
002c: const/4                    v2, 1
002e: if-ne                      v1, v2, +003h
0032: return                     v2
0034: return                     v0

Lcom/syna/FirmwareUpdate; claimSynaDeviceInterface()Z code_off=0x69fd34
0000: invoke-static              Lcom/syna/FirmwareUpdate;->native_ClaimHidInterface()I
0006: move-result                v0
0008: if-ltz                     v0, +004h
000c: const/4                    v0, 1
000e: return                     v0
0010: const/4                    v0, 0
0012: return                     v0

Lcom/syna/FirmwareUpdate; connectSynaDevice(I)Z code_off=0x69fd58
0000: invoke-static              v1, Lcom/syna/FirmwareUpdate;->native_connect(I)I
0006: move-result                v0
0008: const/4                    v1, 1
000a: if-ne                      v0, v1, +006h
000e: invoke-static              Lcom/syna/FirmwareUpdate;->native_ReleaseHidInterface()I
0014: return                     v1
0016: sget-object                v0, Lcom/syna/FirmwareUpdate;->TAG Ljava/lang/String;
001a: const-string               v1, "connectSynaDevice failed"
001e: invoke-static              v0, v1, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0024: invoke-static              Lcom/syna/FirmwareUpdate;->native_ReleaseHidInterface()I
002a: const/4                    v0, 0
002c: return                     v0

Lcom/syna/FirmwareUpdate; deviceReset()Z code_off=0x69fd98
0000: invoke-static              Lcom/syna/FirmwareUpdate;->native_ClaimHidInterface()I
0006: move-result                v2
0008: const/4                    v0, 0
000a: if-gez                     v2, +00ah
000e: sget-object                v2, Lcom/syna/FirmwareUpdate;->TAG Ljava/lang/String;
0012: const-string               v1, "deviceReset: claim Hid interface failed"
0016: invoke-static              v2, v1, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
001c: return                     v0
001e: invoke-static              Lcom/syna/FirmwareUpdate;->native_DeviceReset()I
0024: move-result                v2
0026: invoke-static              Lcom/syna/FirmwareUpdate;->native_ReleaseHidInterface()I
002c: const/4                    v1, 1
002e: if-ne                      v2, v1, +003h
0032: return                     v1
0034: return                     v0

Lcom/syna/FirmwareUpdate; disconnectSynaDevice()V code_off=0x6a0084
0000: invoke-static              Lcom/syna/FirmwareUpdate;->native_disconnect()V
0006: const/4                    v0, 0
0008: iput-object                v0, v1, Lcom/syna/FirmwareUpdate;->firmwareParam Lcom/syna/FirmwareParam;
000c: return-void                

Lcom/syna/FirmwareUpdate; downloadFirmware(Ljava/lang/String; I)I code_off=0x69fe28
0000: invoke-static              Lcom/syna/FirmwareUpdate;->native_ClaimHidInterface()I
0006: move-result                v1
0008: if-gez                     v1, +00ah
000c: sget-object                v1, Lcom/syna/FirmwareUpdate;->TAG Ljava/lang/String;
0010: const-string               v0, "downloadFirmware claim failed"
0014: invoke-static              v1, v0, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
001a: goto                       +8h
001c: sget-object                v1, Lcom/syna/FirmwareUpdate;->TAG Ljava/lang/String;
0020: const-string               v0, "downloadFirmware claim ok"
0024: invoke-static              v1, v0, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
002a: invoke-static              v2, v3, Lcom/syna/FirmwareUpdate;->native_download(Ljava/lang/String; I)I
0030: move-result                v2
0032: invoke-static              Lcom/syna/FirmwareUpdate;->native_ReleaseHidInterface()I
0038: move-result                v3
003a: if-gez                     v3, +008h
003e: const-string               v3, "downloadFirmware release failed"
0042: invoke-static              v1, v3, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0048: return                     v2
004a: const-string               v3, "downloadFirmware release ok"
004e: invoke-static              v1, v3, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0054: return                     v2

Lcom/syna/FirmwareUpdate; getActivePartition()Ljava/lang/String; code_off=0x69ff00
0000: const-string               v0, "2"
0004: return-object              v0

Lcom/syna/FirmwareUpdate; getFirmwareVersionString()Ljava/lang/String; code_off=0x69ff18
0000: invoke-virtual             v0, Lcom/syna/FirmwareUpdate;->getActivePartition()Ljava/lang/String;
0006: invoke-static              Lcom/syna/FirmwareUpdate;->native_GetFirmwareVersionString()Ljava/lang/String;
000c: move-result-object         v0
000e: return-object              v0

Lcom/syna/FirmwareUpdate; getManufactureString()Ljava/lang/String; code_off=0x69ff38
0000: invoke-static              Lcom/syna/FirmwareUpdate;->native_GetManufacturerString()Ljava/lang/String;
0006: move-result-object         v0
0008: return-object              v0

Lcom/syna/FirmwareUpdate; getProductString()Ljava/lang/String; code_off=0x69ff54
0000: invoke-static              Lcom/syna/FirmwareUpdate;->native_GetProductString()Ljava/lang/String;
0006: move-result-object         v0
0008: return-object              v0

Lcom/syna/FirmwareUpdate; getSerialNumberString()Ljava/lang/String; code_off=0x69ff70
0000: invoke-static              Lcom/syna/FirmwareUpdate;->native_GetSerialNumberString()Ljava/lang/String;
0006: move-result-object         v0
0008: return-object              v0

Lcom/syna/FirmwareUpdate; getSynaDeviceChipCode()I code_off=0x69fe90
0000: invoke-static              Lcom/syna/FirmwareUpdate;->native_GetChipCode()I
0006: move-result                v0
0008: return                     v0

Lcom/syna/FirmwareUpdate; getSynaDeviceInfo()Lcom/syna/FirmwareParam; code_off=0x69fe04
0000: iget-object                v0, v1, Lcom/syna/FirmwareUpdate;->firmwareParam Lcom/syna/FirmwareParam;
0004: if-nez                     v0, +005h
0008: invoke-direct              v1, Lcom/syna/FirmwareUpdate;->GetDeviceInformation()V
000e: iget-object                v1, v1, Lcom/syna/FirmwareUpdate;->firmwareParam Lcom/syna/FirmwareParam;
0012: return-object              v1

Lcom/syna/FirmwareUpdate; getSynaDeviceProductId()I code_off=0x69feac
0000: invoke-static              Lcom/syna/FirmwareUpdate;->native_GetProductID()I
0006: move-result                v0
0008: return                     v0

Lcom/syna/FirmwareUpdate; getSynaDeviceVendorId()I code_off=0x69fec8
0000: invoke-static              Lcom/syna/FirmwareUpdate;->native_GetVendorID()I
0006: move-result                v0
0008: return                     v0

Lcom/syna/FirmwareUpdate; getUpdateFirmwareProgress()I code_off=0x69fee4
0000: invoke-static              Lcom/syna/FirmwareUpdate;->native_GetProgressPerCent()I
0006: move-result                v0
0008: return                     v0

Lcom/syna/FirmwareUpdate; releaseSynaDeviceHidInterface()Z code_off=0x69fde0
0000: invoke-static              Lcom/syna/FirmwareUpdate;->native_ReleaseHidInterface()I
0006: move-result                v0
0008: if-ltz                     v0, +004h
000c: const/4                    v0, 1
000e: return                     v0
0010: const/4                    v0, 0
0012: return                     v0

Lcom/syna/cxaudiohidinterface/BuildConfig; <init>()V code_off=0x6a00a4
0000: invoke-direct              v0, Ljava/lang/Object;-><init>()V
0006: return-void                
