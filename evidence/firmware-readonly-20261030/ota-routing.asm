
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

Lcom/conexant/cnxtusbcheadset/GenericReturnValue; <clinit>()V code_off=0x59ce40
0000: new-instance               v0, Lcom/conexant/cnxtusbcheadset/GenericReturnValue$1;
0004: invoke-direct              v0, Lcom/conexant/cnxtusbcheadset/GenericReturnValue$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/cnxtusbcheadset/GenericReturnValue;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

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

Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient; <clinit>()V code_off=0x59e984
0000: new-instance               v0, Ljava/lang/Object;
0004: invoke-direct              v0, Ljava/lang/Object;-><init>()V
000a: sput-object                v0, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->mSyncObj Ljava/lang/Object;
000e: return-void                

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

Lcom/conexant/libcnxtservice/service/USBSessionBase; <clinit>()V code_off=0x5a5900
0000: new-instance               v0, Ljava/lang/Object;
0004: invoke-direct              v0, Ljava/lang/Object;-><init>()V
000a: sput-object                v0, Lcom/conexant/libcnxtservice/service/USBSessionBase;->mClassSyncObj Ljava/lang/Object;
000e: return-void                

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

Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor; <clinit>()V code_off=0x5a5e28
0000: new-instance               v0, Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor$1;
0004: invoke-direct              v0, Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/conexant/libcnxtservice/utils/Helper; <clinit>()V code_off=0x5a6658
0000: const-string               v0, "^(25[0-5]|2[0-4]\d|[0-1]?\d?\d)(\.(25[0-5]|2[0-4]\d|[0-1]?\d?\d)){3}$"
0004: invoke-static              v0, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;
000a: move-result-object         v0
000c: sput-object                v0, Lcom/conexant/libcnxtservice/utils/Helper;->IPV4_PATTERN Ljava/util/regex/Pattern;
0010: return-void                

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

Lcom/conexant/universalfunction/CommonUtilNative; <clinit>()V code_off=0x5a734c
0000: const-string               v0, "cxaudiodsplib_embca_jni"
0004: invoke-static              v0, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
000a: return-void                

Lcom/conexant/universalfunction/HidCmdByteArray; <clinit>()V code_off=0x5a7bc0
0000: new-instance               v0, Lcom/conexant/universalfunction/HidCmdByteArray$1;
0004: invoke-direct              v0, Lcom/conexant/universalfunction/HidCmdByteArray$1;-><init>()V
000a: sput-object                v0, Lcom/conexant/universalfunction/HidCmdByteArray;->CREATOR Landroid/os/Parcelable$Creator;
000e: return-void                

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$1; <init>(Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;)V code_off=0x5ecf24
0000: iput-object                v1, v0, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$1;->this$0 Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;
0004: invoke-direct              v0, Ljava/lang/Object;-><init>()V
000a: return-void                

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$1; run()V code_off=0x5ecf40
0000: invoke-static              Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->getUsb()Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;
0006: move-result-object         v0
0008: invoke-static              v0, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;
000e: iget-object                v1, v5, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$1;->this$0 Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;
0012: invoke-static              v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->b(Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;)Ljava/lang/String;
0018: move-result-object         v1
001a: invoke-virtual             v0, v1, Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;->updateFirmware(Ljava/lang/String;)Lcom/conexant/cnxtusbcheadset/GenericReturnValue;
0020: move-result-object         v0
0022: invoke-static              Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->f()Ljava/lang/String;
0028: move-result-object         v1
002a: iget                       v2, v0, Lcom/conexant/cnxtusbcheadset/GenericReturnValue;->resValue I
002e: if-nez                     v2, +005h
0032: const-string               v2, " Success"
0036: goto                       +3h
0038: const-string               v2, " Failure"
003c: const-string               v3, "mUpdateFWRunnable: update firmware : "
0040: invoke-virtual             v3, v2, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
0046: move-result-object         v2
0048: invoke-static              v1, v2, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
004e: iget-object                v1, v5, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$1;->this$0 Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;
0052: invoke-static              v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->c(Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;)Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask;
0058: move-result-object         v1
005a: const/4                    v2, 1
005c: const/4                    v3, 0
005e: if-eqz                     v1, +02ah
0062: iget-object                v1, v5, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$1;->this$0 Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;
0066: invoke-static              v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->c(Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;)Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask;
006c: move-result-object         v1
006e: iput-boolean               v3, v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask;->mIsRunning Z
0072: iget-object                v1, v5, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$1;->this$0 Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;
0076: invoke-static              v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->c(Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;)Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask;
007c: move-result-object         v1
007e: invoke-virtual             v1, Landroid/os/AsyncTask;->getStatus()Landroid/os/AsyncTask$Status;
0084: move-result-object         v1
0086: sget-object                v4, Landroid/os/AsyncTask$Status;->RUNNING Landroid/os/AsyncTask$Status;
008a: if-ne                      v1, v4, +014h
008e: invoke-static              Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->f()Ljava/lang/String;
0094: move-result-object         v1
0096: const-string               v4, "mUpdateFWRunnable: cancel mUpdateFwAsyncTask"
009a: invoke-static              v1, v4, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
00a0: iget-object                v1, v5, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$1;->this$0 Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;
00a4: invoke-static              v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->c(Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;)Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask;
00aa: move-result-object         v1
00ac: invoke-virtual             v1, v2, Landroid/os/AsyncTask;->cancel(Z)Z
00b2: iget-object                v5, v5, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$1;->this$0 Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;
00b6: iget                       v0, v0, Lcom/conexant/cnxtusbcheadset/GenericReturnValue;->resValue I
00ba: if-nez                     v0, +003h
00be: goto                       +2h
00c0: move                       v2, v3
00c2: invoke-static              v5, v2, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->e(Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity; Z)V
00c8: return-void                

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask; <init>(Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;)V code_off=0x5ed118
0000: iput-object                v1, v0, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask;->this$0 Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;
0004: invoke-direct              v0, Landroid/os/AsyncTask;-><init>()V
000a: const/4                    v1, 1
000c: iput-boolean               v1, v0, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask;->mIsRunning Z
0010: return-void                

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask; <init>(Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity; I)V code_off=0x5ed13c
0000: invoke-direct              v0, v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask;-><init>(Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;)V
0006: return-void                

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask; doInBackground([Ljava/lang/Void;)Ljava/lang/Integer; code_off=0x5ed01c
0000: const/4                    v6, 1
0002: invoke-static              v6, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
0008: move-result-object         v6
000a: invoke-static              Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->f()Ljava/lang/String;
0010: move-result-object         v0
0012: const-string               v1, "doInBackground: "
0016: invoke-static              v0, v1, Lcom/conexant/libcnxtservice/SmartLog;->d(Ljava/lang/String; Ljava/lang/String;)I
001c: const/4                    v0, 0
001e: if-ltz                     v0, +04ch
0022: const/16                   v1, 100
0026: if-gt                      v0, v1, +048h
002a: iget-boolean               v0, v5, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask;->mIsRunning Z
002e: if-eqz                     v0, +044h
0032: const-wide/16              v2, 200
0036: invoke-static              v2, v3, Ljava/lang/Thread;->sleep(J)V
003c: invoke-static              Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->getUsb()Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;
0042: move-result-object         v0
0044: if-nez                     v0, +003h
0048: return-object              v6
004a: invoke-static              Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->getUsb()Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;
0050: move-result-object         v0
0052: invoke-virtual             v0, Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;->getUpdateFirmwareProgress()I
0058: move-result                v0
005a: invoke-static              Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->f()Ljava/lang/String;
0060: move-result-object         v2
0062: new-instance               v3, Ljava/lang/StringBuilder;
0066: invoke-direct              v3, Ljava/lang/StringBuilder;-><init>()V
006c: const-string               v4, "doInBackground: curProgress is : "
0070: invoke-virtual             v3, v4, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0076: invoke-virtual             v3, v0, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
007c: invoke-virtual             v3, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
0082: move-result-object         v3
0084: invoke-static              v2, v3, Lcom/conexant/libcnxtservice/SmartLog;->d(Ljava/lang/String; Ljava/lang/String;)I
008a: invoke-static              v0, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
0090: move-result-object         v2
0092: filled-new-array           v2, [Ljava/lang/Integer;
0098: move-result-object         v2
009a: invoke-virtual             v5, v2, Landroid/os/AsyncTask;->publishProgress([Ljava/lang/Object;)V
00a0: if-ne                      v0, v1, -041h
00a4: return-object              v6
00a6: new-instance               v5, Ljava/lang/RuntimeException;
00aa: invoke-direct              v5, Ljava/lang/RuntimeException;-><init>()V
00b0: throw                      v5
00b2: const/4                    v5, 0
00b4: return-object              v5
00b6: return-object              v6

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask; doInBackground([Ljava/lang/Object;)Ljava/lang/Object; code_off=0x5ed0f8
0000: check-cast                 v1, [Ljava/lang/Void;
0004: invoke-virtual             v0, v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Integer;
000a: move-result-object         v0
000c: return-object              v0

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask; onCancelled()V code_off=0x5ed154
0000: const/4                    v0, 0
0002: iput-boolean               v0, v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask;->mIsRunning Z
0006: return-void                

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask; onPostExecute(Ljava/lang/Integer;)V code_off=0x5ed16c
0000: invoke-static              Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->f()Ljava/lang/String;
0006: move-result-object         v2
0008: const-string               v0, "onPostExecute: "
000c: invoke-static              v2, v0, Lcom/conexant/libcnxtservice/SmartLog;->d(Ljava/lang/String; Ljava/lang/String;)I
0012: iget-object                v1, v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask;->this$0 Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;
0016: invoke-static              v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->d(Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;)Landroid/app/ProgressDialog;
001c: move-result-object         v1
001e: invoke-virtual             v1, Landroid/app/Dialog;->dismiss()V
0024: return-void                

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask; onPostExecute(Ljava/lang/Object;)V code_off=0x5ed1a4
0000: check-cast                 v1, Ljava/lang/Integer;
0004: invoke-virtual             v0, v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask;->onPostExecute(Ljava/lang/Integer;)V
000a: return-void                

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask; onPreExecute()V code_off=0x5ed1c0
0000: iget-object                v0, v0, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask;->this$0 Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;
0004: invoke-static              v0, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->d(Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;)Landroid/app/ProgressDialog;
000a: move-result-object         v0
000c: invoke-virtual             v0, Landroid/app/Dialog;->show()V
0012: return-void                

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

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity; <init>()V code_off=0x5ed2c4
0000: invoke-direct              v1, Lcom/moondroplab/moondrop/moondrop_app/BaseActivity;-><init>()V
0006: const-string               v0, ""
000a: iput-object                v0, v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->firmwareUri Ljava/lang/String;
000e: const/4                    v0, 0
0010: iput-object                v0, v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFWHandler Landroid/os/Handler;
0014: iput-object                v0, v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFWHandlerThread Landroid/os/HandlerThread;
0018: new-instance               v0, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$1;
001c: invoke-direct              v0, v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$1;-><init>(Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;)V
0022: iput-object                v0, v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFWRunnable Ljava/lang/Runnable;
0026: return-void                

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity; a(Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity; Z)V code_off=0x5ed294
0000: invoke-direct              v0, v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->lambda$showUpdatedStatusDialog$0(Z)V
0006: return-void                

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity; b(Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;)Ljava/lang/String; code_off=0x5ed264
0000: iget-object                v0, v0, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->firmwareUri Ljava/lang/String;
0004: return-object              v0

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity; c(Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;)Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask; code_off=0x5ed24c
0000: iget-object                v0, v0, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFwAsyncTask Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask;
0004: return-object              v0

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity; d(Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;)Landroid/app/ProgressDialog; code_off=0x5ed234
0000: iget-object                v0, v0, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFwProgressDialog Landroid/app/ProgressDialog;
0004: return-object              v0

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity; e(Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity; Z)V code_off=0x5ed2ac
0000: invoke-direct              v0, v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->showUpdatedStatusDialog(Z)V
0006: return-void                

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity; f()Ljava/lang/String; code_off=0x5ed27c
0000: sget-object                v0, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->TAG Ljava/lang/String;
0004: return-object              v0

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity; initData()V code_off=0x5ed2fc
0000: new-instance               v0, Landroid/os/HandlerThread;
0004: const-string               v1, "UpdateFirmware"
0008: invoke-direct              v0, v1, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V
000e: iput-object                v0, v2, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFWHandlerThread Landroid/os/HandlerThread;
0012: invoke-virtual             v0, Ljava/lang/Thread;->start()V
0018: new-instance               v0, Landroid/os/Handler;
001c: iget-object                v1, v2, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFWHandlerThread Landroid/os/HandlerThread;
0020: invoke-virtual             v1, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;
0026: move-result-object         v1
0028: invoke-direct              v0, v1, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
002e: iput-object                v0, v2, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFWHandler Landroid/os/Handler;
0032: invoke-virtual             v2, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
0038: move-result-object         v0
003a: const-string/jumbo         v1, uriString
0040: invoke-virtual             v0, v1, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
0046: move-result-object         v0
0048: iput-object                v0, v2, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->firmwareUri Ljava/lang/String;
004c: return-void                

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

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity; notifySynopsysOtaCompleted(Z)V code_off=0x5ed3bc
0000: invoke-static              Lcom/moondroplab/moondrop/moondrop_app/MethodChannelSingleton;->getMethodChannel()Lio/flutter/plugin/common/MethodChannel;
0006: move-result-object         v2
0008: if-nez                     v2, +00ah
000c: sget-object                v2, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->TAG Ljava/lang/String;
0010: const-string               v3, "notifySynopsysOtaCompleted: methodChannel is null"
0014: invoke-static              v2, v3, Landroid/util/Log;->w(Ljava/lang/String; Ljava/lang/String;)I
001a: return-void                
001c: new-instance               v0, Ljava/util/HashMap;
0020: invoke-direct              v0, Ljava/util/HashMap;-><init>()V
0026: const-string/jumbo         v1, success
002c: invoke-static              v3, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
0032: move-result-object         v3
0034: invoke-virtual             v0, v1, v3, Ljava/util/HashMap;->put(Ljava/lang/Object; Ljava/lang/Object;)Ljava/lang/Object;
003a: const-string/jumbo         v3, syncSyOtaCompleted
0040: invoke-virtual             v2, v3, v0, Lio/flutter/plugin/common/MethodChannel;->invokeMethod(Ljava/lang/String; Ljava/lang/Object;)V
0046: return-void                

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

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity; onActivityResult(I I Landroid/content/Intent;)V code_off=0x5ed414
0000: invoke-super               v0, v1, v2, v3, Landroid/app/Activity;->onActivityResult(I I Landroid/content/Intent;)V
0006: const/4                    v0, -1
0008: if-ne                      v2, v0, +009h
000c: const/16                   v0, 509
0010: if-ne                      v1, v0, +005h
0014: invoke-static              Lh4;->A()V
001a: return-void                

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity; onClick(Landroid/view/View;)V code_off=0x5ed440
0000: return-void                

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity; onCreate(Landroid/os/Bundle;)V code_off=0x5ed454
0000: invoke-super               v1, v2, Lcom/moondroplab/moondrop/moondrop_app/BaseActivity;->onCreate(Landroid/os/Bundle;)V
0006: sget                       v2, Lcom/moondroplab/moondrop/moondrop_app/R$layout;->activity_firmware_update I
000a: invoke-virtual             v1, v2, Landroid/app/Activity;->setContentView(I)V
0010: invoke-static              v1, Lcom/conexant/conexantusbtypec/crash/ActivityCollector;->addActivity(Landroid/app/Activity;)V
0016: invoke-direct              v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->initData()V
001c: invoke-direct              v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->showUpdateFirmwareDialog()V
0022: iget-object                v2, v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFWHandler Landroid/os/Handler;
0026: iget-object                v0, v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFWRunnable Ljava/lang/Runnable;
002a: invoke-virtual             v2, v0, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
0030: iget-object                v2, v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFWHandler Landroid/os/Handler;
0034: iget-object                v1, v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFWRunnable Ljava/lang/Runnable;
0038: invoke-virtual             v2, v1, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
003e: return-void                

Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity; onDestroy()V code_off=0x5ed4a4
0000: sget-object                v0, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->TAG Ljava/lang/String;
0004: const-string               v1, "onDestroy: "
0008: invoke-static              v0, v1, Lcom/conexant/libcnxtservice/SmartLog;->d(Ljava/lang/String; Ljava/lang/String;)I
000e: iget-object                v0, v3, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mSuccessAlertDialog Landroid/app/AlertDialog;
0012: if-eqz                     v0, +00dh
0016: invoke-virtual             v0, Landroid/app/Dialog;->isShowing()Z
001c: move-result                v0
001e: if-eqz                     v0, +007h
0022: iget-object                v0, v3, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mSuccessAlertDialog Landroid/app/AlertDialog;
0026: invoke-virtual             v0, Landroid/app/Dialog;->dismiss()V
002c: iget-object                v0, v3, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFwProgressDialog Landroid/app/ProgressDialog;
0030: const/4                    v1, 0
0032: if-eqz                     v0, +00fh
0036: invoke-virtual             v0, Landroid/app/Dialog;->isShowing()Z
003c: move-result                v0
003e: if-eqz                     v0, +009h
0042: iget-object                v0, v3, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFwProgressDialog Landroid/app/ProgressDialog;
0046: invoke-virtual             v0, Landroid/app/Dialog;->dismiss()V
004c: iput-object                v1, v3, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFwProgressDialog Landroid/app/ProgressDialog;
0050: iget-object                v0, v3, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFWHandler Landroid/os/Handler;
0054: if-eqz                     v0, +00dh
0058: iget-object                v2, v3, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFWRunnable Ljava/lang/Runnable;
005c: if-eqz                     v2, +007h
0060: invoke-virtual             v0, v2, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
0066: iput-object                v1, v3, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFWRunnable Ljava/lang/Runnable;
006a: iput-object                v1, v3, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFWHandler Landroid/os/Handler;
006e: iget-object                v0, v3, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFWHandlerThread Landroid/os/HandlerThread;
0072: if-eqz                     v0, +007h
0076: invoke-virtual             v0, Landroid/os/HandlerThread;->quitSafely()Z
007c: iput-object                v1, v3, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFWHandlerThread Landroid/os/HandlerThread;
0080: iget-object                v0, v3, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFwAsyncTask Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask;
0084: if-eqz                     v0, +015h
0088: invoke-virtual             v0, Landroid/os/AsyncTask;->getStatus()Landroid/os/AsyncTask$Status;
008e: move-result-object         v0
0090: sget-object                v1, Landroid/os/AsyncTask$Status;->FINISHED Landroid/os/AsyncTask$Status;
0094: if-eq                      v0, v1, +00dh
0098: iget-object                v0, v3, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFwAsyncTask Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask;
009c: const/4                    v1, 0
009e: iput-boolean               v1, v0, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask;->mIsRunning Z
00a2: iget-object                v0, v3, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;->mUpdateFwAsyncTask Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity$UpdateFwAsyncTask;
00a6: const/4                    v1, 1
00a8: invoke-virtual             v0, v1, Landroid/os/AsyncTask;->cancel(Z)Z
00ae: invoke-super               v3, Landroid/app/Activity;->onDestroy()V
00b4: return-void                

Lcom/moondroplab/moondrop/moondrop_app/FotaManager; a(Lcom/moondroplab/moondrop/moondrop_app/FotaManager; Lcom/moondroplab/moondrop/moondrop_app/FotaManager$VersionCallback;)V code_off=0x5eefb0
0000: invoke-direct              v0, v1, Lcom/moondroplab/moondrop/moondrop_app/FotaManager;->lambda$getFirmwareVersionAsync$2(Lcom/moondroplab/moondrop/moondrop_app/FotaManager$VersionCallback;)V
0006: return-void                

Lcom/moondroplab/moondrop/moondrop_app/FotaManager; lambda$startTransfer$1(Ljava/lang/String; Ljava/lang/String;)V code_off=0x5ef2d4
0000: const-string               v0, "Battery level threshold set to "
0004: const-string               v1, "Dual firmware bin file path: "
0008: const-string               v2, "Primary firmware bin file path: "
000c: const-string               v3, "FOTA target resolved: "
0010: sget-object                v4, Ljava/lang/System;->out Ljava/io/PrintStream;
0014: const-string               v5, "Starting firmware transfer..."
0018: invoke-virtual             v4, v5, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
001e: if-eqz                     v8, +0c5h
0022: invoke-virtual             v8, Ljava/lang/String;->isEmpty()Z
0028: move-result                v4
002a: if-eqz                     v4, +004h
002e: goto/16                    +0bdh
0032: iget-object                v4, v7, Lcom/moondroplab/moondrop/moondrop_app/FotaManager;->deviceType Lcom/airoha/sdk/api/utils/DeviceType;
0036: iget-object                v5, v7, Lcom/moondroplab/moondrop/moondrop_app/FotaManager;->chipType Lcom/airoha/sdk/api/utils/ChipType;
003a: iget-boolean               v6, v7, Lcom/moondroplab/moondrop/moondrop_app/FotaManager;->fotaOnlyOtaAgent Z
003e: invoke-static              v4, v5, v6, Lcom/moondroplab/moondrop/moondrop_app/FotaManager;->resolveTarget(Lcom/airoha/sdk/api/utils/DeviceType; Lcom/airoha/sdk/api/utils/ChipType; Z)Lcom/airoha/sdk/api/ota/FotaSettings$FotaTargetEnum;
0044: move-result-object         v4
0046: sget-object                v5, Ljava/lang/System;->out Ljava/io/PrintStream;
004a: new-instance               v6, Ljava/lang/StringBuilder;
004e: invoke-direct              v6, v3, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
0054: invoke-virtual             v6, v4, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
005a: invoke-virtual             v6, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
0060: move-result-object         v3
0062: invoke-virtual             v5, v3, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
0068: sget-object                v3, Ljava/lang/System;->out Ljava/io/PrintStream;
006c: invoke-virtual             v2, v8, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
0072: move-result-object         v2
0074: invoke-virtual             v3, v2, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
007a: sget-object                v2, Ljava/lang/System;->out Ljava/io/PrintStream;
007e: new-instance               v3, Ljava/lang/StringBuilder;
0082: invoke-direct              v3, v1, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
0088: invoke-virtual             v3, v9, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
008e: invoke-virtual             v3, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
0094: move-result-object         v1
0096: invoke-virtual             v2, v1, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
009c: iget-object                v1, v7, Lcom/moondroplab/moondrop/moondrop_app/FotaManager;->chipType Lcom/airoha/sdk/api/utils/ChipType;
00a0: invoke-static              v1, Lcom/moondroplab/moondrop/moondrop_app/FotaManager;->isDualChip(Lcom/airoha/sdk/api/utils/ChipType;)Z
00a6: move-result                v1
00a8: if-eqz                     v1, +026h
00ac: sget-object                v1, Ljava/lang/System;->out Ljava/io/PrintStream;
00b0: const-string               v2, "Device is dual-chip, dual firmware required"
00b4: invoke-virtual             v1, v2, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
00ba: if-eqz                     v9, +00ch
00be: invoke-virtual             v9, Ljava/lang/String;->isEmpty()Z
00c4: move-result                v1
00c6: if-eqz                     v1, +01fh
00ca: goto                       +4h
00cc: move-exception             v8
00ce: goto/16                    +07eh
00d2: sget-object                v8, Ljava/lang/System;->out Ljava/io/PrintStream;
00d6: const-string               v9, "Dual firmware bin file path is invalid"
00da: invoke-virtual             v8, v9, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
00e0: iget-object                v8, v7, Lcom/moondroplab/moondrop/moondrop_app/FotaManager;->callback Lcom/moondroplab/moondrop/moondrop_app/FotaManager$FotaCallback;
00e4: if-eqz                     v8, +08dh
00e8: const-string               v9, "Dual FW slave bin file path is invalid"
00ec: invoke-interface           v8, v9, Lcom/moondroplab/moondrop/moondrop_app/FotaManager$FotaCallback;->onError(Ljava/lang/String;)V
00f2: return-void                
00f4: sget-object                v9, Ljava/lang/System;->out Ljava/io/PrintStream;
00f8: const-string               v1, "Device is single-chip, using same firmware for dual"
00fc: invoke-virtual             v9, v1, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
0102: move-object                v9, v8
0104: new-instance               v1, Lcom/airoha/sdk/api/ota/FotaSettings;
0108: sget-object                v2, Lcom/airoha/sdk/api/ota/FotaSettings$FotaTypeEnum;->Typical Lcom/airoha/sdk/api/ota/FotaSettings$FotaTypeEnum;
010c: invoke-direct              v1, v2, v4, v8, v9, Lcom/airoha/sdk/api/ota/FotaSettings;-><init>(Lcom/airoha/sdk/api/ota/FotaSettings$FotaTypeEnum; Lcom/airoha/sdk/api/ota/FotaSettings$FotaTargetEnum; Ljava/lang/String; Ljava/lang/String;)V
0112: sget-object                v8, Ljava/lang/System;->out Ljava/io/PrintStream;
0116: const-string               v9, "FotaSettings created"
011a: invoke-virtual             v8, v9, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
0120: sget-object                v8, Lcom/airoha/sdk/api/ota/FotaSettings$FotaModeEnum;->Adaptive Lcom/airoha/sdk/api/ota/FotaSettings$FotaModeEnum;
0124: invoke-virtual             v1, v8, Lcom/airoha/sdk/api/ota/FotaSettings;->setFotaMode(Lcom/airoha/sdk/api/ota/FotaSettings$FotaModeEnum;)V
012a: sget-object                v8, Ljava/lang/System;->out Ljava/io/PrintStream;
012e: const-string               v9, "FotaMode set to Adaptive"
0132: invoke-virtual             v8, v9, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
0138: iget                       v8, v7, Lcom/moondroplab/moondrop/moondrop_app/FotaManager;->batteryLevelThreshold I
013c: invoke-virtual             v1, v8, Lcom/airoha/sdk/api/ota/FotaSettings;->setBatteryLevelThrd(I)V
0142: sget-object                v8, Ljava/lang/System;->out Ljava/io/PrintStream;
0146: new-instance               v9, Ljava/lang/StringBuilder;
014a: invoke-direct              v9, v0, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
0150: iget                       v0, v7, Lcom/moondroplab/moondrop/moondrop_app/FotaManager;->batteryLevelThreshold I
0154: invoke-virtual             v9, v0, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
015a: invoke-virtual             v9, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
0160: move-result-object         v9
0162: invoke-virtual             v8, v9, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
0168: sget-object                v8, Lxa;->y Lxa;
016c: invoke-virtual             v8, Lxa;->f()Lcom/airoha/sdk/api/ota/AirohaFOTAControl;
0172: move-result-object         v8
0174: if-eqz                     v8, +012h
0178: const/4                    v9, 0
017a: invoke-interface           v8, v1, v9, Lcom/airoha/sdk/api/ota/AirohaFOTAControl;->startDataTransfer(Lcom/airoha/sdk/api/ota/FotaSettings; Lcom/airoha/sdk/api/ota/AirohaFOTAControl$AirohaFOTAStatusListener;)Z
0180: sget-object                v8, Ljava/lang/System;->out Ljava/io/PrintStream;
0184: const-string/jumbo         v9, startDataTransfer called
018a: invoke-virtual             v8, v9, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
0190: const/4                    v8, 1
0192: iput-boolean               v8, v7, Lcom/moondroplab/moondrop/moondrop_app/FotaManager;->isFotaRunning Z
0196: return-void                
0198: new-instance               v8, Ljava/lang/IllegalStateException;
019c: const-string               v9, "Airoha FOTA control is not ready"
01a0: invoke-direct              v8, v9, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V
01a6: throw                      v8
01a8: sget-object                v8, Ljava/lang/System;->out Ljava/io/PrintStream;
01ac: const-string               v9, "Main firmware bin file path is invalid"
01b0: invoke-virtual             v8, v9, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
01b6: iget-object                v8, v7, Lcom/moondroplab/moondrop/moondrop_app/FotaManager;->callback Lcom/moondroplab/moondrop/moondrop_app/FotaManager$FotaCallback;
01ba: if-eqz                     v8, +022h
01be: const-string               v9, "FW bin file path is invalid"
01c2: invoke-interface           v8, v9, Lcom/moondroplab/moondrop/moondrop_app/FotaManager$FotaCallback;->onError(Ljava/lang/String;)V
01c8: return-void                
01ca: iget-object                v7, v7, Lcom/moondroplab/moondrop/moondrop_app/FotaManager;->callback Lcom/moondroplab/moondrop/moondrop_app/FotaManager$FotaCallback;
01ce: if-eqz                     v7, +018h
01d2: new-instance               v9, Ljava/lang/StringBuilder;
01d6: const-string/jumbo         v0, startTransfer error: 
01dc: invoke-direct              v9, v0, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
01e2: invoke-virtual             v8, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;
01e8: move-result-object         v8
01ea: invoke-virtual             v9, v8, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
01f0: invoke-virtual             v9, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
01f6: move-result-object         v8
01f8: invoke-interface           v7, v8, Lcom/moondroplab/moondrop/moondrop_app/FotaManager$FotaCallback;->onError(Ljava/lang/String;)V
01fe: return-void                

Lcom/moondroplab/moondrop/moondrop_app/FotaManager; applyNewFirmware()V code_off=0x5ef0ac
0000: const/4                    v0, 1
0002: iput-boolean               v0, v3, Lcom/moondroplab/moondrop/moondrop_app/FotaManager;->isCommitRunning Z
0006: sget-object                v0, Lxa;->y Lxa;
000a: invoke-virtual             v0, Lxa;->f()Lcom/airoha/sdk/api/ota/AirohaFOTAControl;
0010: move-result-object         v0
0012: if-eqz                     v0, +00ah
0016: iget                       v1, v3, Lcom/moondroplab/moondrop/moondrop_app/FotaManager;->batteryLevelThreshold I
001a: invoke-interface           v0, v1, Lcom/airoha/sdk/api/ota/AirohaFOTAControl;->applyNewFirmware(I)Z
0020: return-void                
0022: move-exception             v0
0024: goto                       +9h
0026: new-instance               v0, Ljava/lang/IllegalStateException;
002a: const-string               v1, "Airoha FOTA control is not ready"
002e: invoke-direct              v0, v1, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V
0034: throw                      v0
0036: iget-object                v3, v3, Lcom/moondroplab/moondrop/moondrop_app/FotaManager;->callback Lcom/moondroplab/moondrop/moondrop_app/FotaManager$FotaCallback;
003a: if-eqz                     v3, +017h
003e: new-instance               v1, Ljava/lang/StringBuilder;
0042: const-string               v2, "applyNewFirmware error: "
0046: invoke-direct              v1, v2, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
004c: invoke-virtual             v0, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;
0052: move-result-object         v0
0054: invoke-virtual             v1, v0, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
005a: invoke-virtual             v1, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
0060: move-result-object         v0
0062: invoke-interface           v3, v0, Lcom/moondroplab/moondrop/moondrop_app/FotaManager$FotaCallback;->onError(Ljava/lang/String;)V
0068: return-void                

Lcom/moondroplab/moondrop/moondrop_app/FotaManager; copyUriToCache(Landroid/net/Uri;)Ljava/io/File; code_off=0x5eeda8
0000: invoke-virtual             v10, Landroid/net/Uri;->getScheme()Ljava/lang/String;
0006: move-result-object         v0
0008: const/4                    v1, 0
000a: if-eqz                     v0, +0a0h
000e: const-string               v2, "file"
0012: invoke-virtual             v2, v0, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0018: move-result                v2
001a: if-eqz                     v2, +00fh
001e: new-instance               v9, Ljava/io/File;
0022: invoke-virtual             v10, Landroid/net/Uri;->getPath()Ljava/lang/String;
0028: move-result-object         v10
002a: invoke-static              v10, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;
0030: invoke-direct              v9, v10, Ljava/io/File;-><init>(Ljava/lang/String;)V
0036: return-object              v9
0038: const-string               v2, "content"
003c: invoke-virtual             v2, v0, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0042: move-result                v2
0044: if-eqz                     v2, +079h
0048: iget-object                v3, v9, Lcom/moondroplab/moondrop/moondrop_app/FotaManager;->resolver Landroid/content/ContentResolver;
004c: const/4                    v7, 0
004e: const/4                    v8, 0
0050: const/4                    v5, 0
0052: const/4                    v6, 0
0054: move-object                v4, v10
0056: invoke-virtual/range       v3 ... v8, Landroid/content/ContentResolver;->query(Landroid/net/Uri; [Ljava/lang/String; Ljava/lang/String; [Ljava/lang/String; Ljava/lang/String;)Landroid/database/Cursor;
005c: move-result-object         v10
005e: const-string               v0, "firmware.bin"
0062: if-eqz                     v10, +017h
0066: invoke-interface           v10, Landroid/database/Cursor;->moveToFirst()Z
006c: move-result                v1
006e: if-eqz                     v1, +00eh
0072: const-string               v1, "_display_name"
0076: invoke-interface           v10, v1, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I
007c: move-result                v1
007e: if-ltz                     v1, +006h
0082: invoke-interface           v10, v1, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
0088: move-result-object         v0
008a: invoke-interface           v10, Landroid/database/Cursor;->close()V
0090: new-instance               v10, Ljava/io/File;
0094: iget-object                v1, v9, Lcom/moondroplab/moondrop/moondrop_app/FotaManager;->externalCacheDir Ljava/io/File;
0098: invoke-direct              v10, v1, v0, Ljava/io/File;-><init>(Ljava/io/File; Ljava/lang/String;)V
009e: invoke-virtual             v10, Ljava/io/File;->deleteOnExit()V
00a4: iget-object                v9, v9, Lcom/moondroplab/moondrop/moondrop_app/FotaManager;->resolver Landroid/content/ContentResolver;
00a8: invoke-virtual             v9, v4, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;
00ae: move-result-object         v9
00b0: new-instance               v1, Ljava/io/FileOutputStream;
00b4: invoke-direct              v1, v10, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
00ba: sget                       v0, Landroid/os/Build$VERSION;->SDK_INT I
00be: const/16                   v2, 29
00c2: if-lt                      v0, v2, +009h
00c6: invoke-static              v9, v1, Lc71;->k(Ljava/io/InputStream; Ljava/io/FileOutputStream;)V
00cc: goto                       +fh
00ce: move-exception             v0
00d0: move-object                v10, v0
00d2: goto                       +1dh
00d4: const/16                   v0, 8192
00d8: new-array                  v0, v0, [B
00dc: invoke-virtual             v9, v0, Ljava/io/InputStream;->read([B)I
00e2: move-result                v2
00e4: const/4                    v3, -1
00e6: if-ne                      v2, v3, +00eh
00ea: invoke-virtual             v1, Ljava/io/FileOutputStream;->close()V
00f0: if-eqz                     v9, +005h
00f4: invoke-virtual             v9, Ljava/io/InputStream;->close()V
00fa: return-object              v10
00fc: move-exception             v0
00fe: move-object                v10, v0
0100: goto                       +fh
0102: const/4                    v3, 0
0104: invoke-virtual             v1, v0, v3, v2, Ljava/io/FileOutputStream;->write([B I I)V
010a: goto                       -17h
010c: invoke-virtual             v1, Ljava/io/FileOutputStream;->close()V
0112: goto                       +5h
0114: move-exception             v0
0116: invoke-virtual             v10, v0, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
011c: throw                      v10
011e: if-eqz                     v9, +00bh
0122: invoke-virtual             v9, Ljava/io/InputStream;->close()V
0128: goto                       +6h
012a: move-exception             v0
012c: move-object                v9, v0
012e: invoke-virtual             v10, v9, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
0134: throw                      v10
0136: const-string               v9, "Unsupported Uri scheme: "
013a: invoke-virtual             v9, v0, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
0140: move-result-object         v9
0142: invoke-static              v9, Lr71;->i(Ljava/lang/String;)V
0148: return-object              v1
014a: const-string               v9, "Uri scheme is null"
014e: invoke-static              v9, Lr71;->i(Ljava/lang/String;)V
0154: return-object              v1

Lcom/moondroplab/moondrop/moondrop_app/MainActivity; configureFlutterEngine$lambda$0(Lcom/moondroplab/moondrop/moondrop_app/MainActivity; Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V code_off=0x5f02a0
0000: invoke-virtual             v3, Ljava/lang/Object;->getClass()Ljava/lang/Class;
0006: invoke-virtual             v4, Ljava/lang/Object;->getClass()Ljava/lang/Class;
000c: iget-object                v0, v3, Lio/flutter/plugin/common/MethodCall;->method Ljava/lang/String;
0010: const-string               v1, "jumpToFwUpdateActivity"
0014: invoke-static              v0, v1, Ldf2;->a(Ljava/lang/Object; Ljava/lang/Object;)Z
001a: move-result                v0
001c: if-eqz                     v0, +01eh
0020: const-string/jumbo         v0, uriStr
0026: invoke-virtual             v3, v0, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;
002c: move-result-object         v3
002e: check-cast                 v3, Ljava/lang/String;
0032: new-instance               v0, Landroid/content/Intent;
0036: const-class                v1, Lcom/moondroplab/moondrop/moondrop_app/FirmwareUpdateActivity;
003a: invoke-direct              v0, v2, v1, Landroid/content/Intent;-><init>(Landroid/content/Context; Ljava/lang/Class;)V
0040: const-string/jumbo         v1, uriString
0046: invoke-virtual             v0, v1, v3, Landroid/content/Intent;->putExtra(Ljava/lang/String; Ljava/lang/String;)Landroid/content/Intent;
004c: invoke-virtual             v2, v0, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
0052: invoke-interface           v4, v3, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
0058: return-void                

Lcom/moondroplab/moondrop/moondrop_app/native/FlutterNative; mDevicePlugListener$lambda$0(Lcom/moondroplab/moondrop/moondrop_app/native/FlutterNative; Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor; Z)V code_off=0x5f624c
0000: const-string               v0, "openCommunication: onSuccess, map to Flutter is "
0004: const-string               v1, "openCommunication: usbCommunication = "
0008: const-string               v2, "Synopsys USB rediscovered with permission, supported="
000c: const/4                    v3, 0
000e: if-eqz                     v10, +007h
0012: invoke-virtual             v10, Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;->getUsbDevice()Landroid/hardware/usb/UsbDevice;
0018: move-result-object         v4
001a: goto                       +2h
001c: move-object                v4, v3
001e: if-nez                     v4, +016h
0022: const-string               v9, "FlutterNative"
0026: new-instance               v10, Ljava/lang/StringBuilder;
002a: const-string               v0, "DevicePlugListener ignored: usbDevice is null, isAttach="
002e: invoke-direct              v10, v0, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
0034: invoke-virtual             v10, v11, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
003a: invoke-virtual             v10, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
0040: move-result-object         v10
0042: invoke-static              v9, v10, Landroid/util/Log;->w(Ljava/lang/String; Ljava/lang/String;)I
0048: return-void                
004a: invoke-virtual             v4, Landroid/hardware/usb/UsbDevice;->getVendorId()I
0050: move-result                v5
0052: const/16                   v6, 13784
0056: const/4                    v7, 0
0058: const/4                    v8, 1
005a: if-ne                      v5, v6, +010h
005e: invoke-virtual             v4, Landroid/hardware/usb/UsbDevice;->getProductId()I
0064: move-result                v5
0066: const/16                   v6, 5269
006a: if-gt                      v6, v5, +008h
006e: const/16                   v6, 5277
0072: if-ge                      v5, v6, +004h
0076: move                       v5, v8
0078: goto                       +2h
007a: move                       v5, v7
007c: if-eqz                     v11, +0e9h
0080: iget-object                v11, v9, Lcom/moondroplab/moondrop/moondrop_app/native/FlutterNative;->mObjSync Ljava/lang/Object;
0084: monitor-enter              v11
0086: if-eqz                     v5, +086h
008a: iput-boolean               v8, v9, Lcom/moondroplab/moondrop/moondrop_app/native/FlutterNative;->isUsbDeviceAttached Z
008e: iget-object                v0, v9, Lcom/moondroplab/moondrop/moondrop_app/native/FlutterNative;->usbDeviceHandler Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;
0092: invoke-virtual             v0, v8, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->setUsbDeviceAttached(Z)V
0098: iget-object                v0, v9, Lcom/moondroplab/moondrop/moondrop_app/native/FlutterNative;->miscHandler Lcom/moondroplab/moondrop/moondrop_app/native/handlers/MiscHandler;
009c: invoke-virtual             v0, v8, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/MiscHandler;->setUsbDeviceAttached(Z)V
00a2: const/4                    v0, 2
00a4: invoke-static              v9, v4, v3, v0, v3, Lcom/moondroplab/moondrop/moondrop_app/native/FlutterNative;->getUsbDisplayName$default(Lcom/moondroplab/moondrop/moondrop_app/native/FlutterNative; Landroid/hardware/usb/UsbDevice; Ljava/lang/String; I Ljava/lang/Object;)Ljava/lang/String;
00aa: move-result-object         v0
00ac: iput-object                v0, v9, Lcom/moondroplab/moondrop/moondrop_app/native/FlutterNative;->syProductName Ljava/lang/String;
00b0: invoke-virtual             v10, Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;->getHasPermission()Z
00b6: move-result                v10
00b8: if-eqz                     v10, +03ch
00bc: invoke-static              Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->get()Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;
00c2: move-result-object         v10
00c4: if-eqz                     v10, +00dh
00c8: invoke-virtual             v10, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->checkIsSupportedDevice()Z
00ce: move-result                v10
00d0: if-ne                      v10, v8, +007h
00d4: move                       v7, v8
00d6: goto                       +4h
00d8: move-exception             v9
00da: goto/16                    +0b8h
00de: iput-boolean               v7, v9, Lcom/moondroplab/moondrop/moondrop_app/native/FlutterNative;->isUsbPermissionAllowed Z
00e2: iget-object                v10, v9, Lcom/moondroplab/moondrop/moondrop_app/native/FlutterNative;->usbDeviceHandler Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;
00e6: invoke-virtual             v10, v7, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->setUsbPermissionAllowed(Z)V
00ec: iget-object                v10, v9, Lcom/moondroplab/moondrop/moondrop_app/native/FlutterNative;->miscHandler Lcom/moondroplab/moondrop/moondrop_app/native/handlers/MiscHandler;
00f0: invoke-virtual             v10, v7, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/MiscHandler;->setUsbPermissionAllowed(Z)V
00f6: iget-object                v10, v9, Lcom/moondroplab/moondrop/moondrop_app/native/FlutterNative;->isSyDeviceAvailable Lcom/qualcomm/qti/gaiaclient/ui/common/StickyLiveData;
00fa: if-eqz                     v10, +009h
00fe: invoke-static              v7, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
0104: move-result-object         v0
0106: invoke-virtual             v10, v0, Lcom/qualcomm/qti/gaiaclient/ui/common/StickyLiveData;->setValue(Ljava/lang/Object;)V
010c: const-string               v10, "FlutterNative"
0110: new-instance               v0, Ljava/lang/StringBuilder;
0114: invoke-direct              v0, v2, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
011a: invoke-virtual             v0, v7, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
0120: invoke-virtual             v0, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
0126: move-result-object         v0
0128: invoke-static              v10, v0, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
012e: goto                       +1fh
0130: iput-boolean               v7, v9, Lcom/moondroplab/moondrop/moondrop_app/native/FlutterNative;->isUsbPermissionAllowed Z
0134: iget-object                v10, v9, Lcom/moondroplab/moondrop/moondrop_app/native/FlutterNative;->usbDeviceHandler Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;
0138: invoke-virtual             v10, v7, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->setUsbPermissionAllowed(Z)V
013e: iget-object                v10, v9, Lcom/moondroplab/moondrop/moondrop_app/native/FlutterNative;->miscHandler Lcom/moondroplab/moondrop/moondrop_app/native/handlers/MiscHandler;
0142: invoke-virtual             v10, v7, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/MiscHandler;->setUsbPermissionAllowed(Z)V
0148: iget-object                v10, v9, Lcom/moondroplab/moondrop/moondrop_app/native/FlutterNative;->isSyDeviceAvailable Lcom/qualcomm/qti/gaiaclient/ui/common/StickyLiveData;
014c: if-eqz                     v10, +007h
0150: sget-object                v0, Ljava/lang/Boolean;->FALSE Ljava/lang/Boolean;
0154: invoke-virtual             v10, v0, Lcom/qualcomm/qti/gaiaclient/ui/common/StickyLiveData;->setValue(Ljava/lang/Object;)V
015a: invoke-static              Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->get()Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;
0160: move-result-object         v10
0162: if-eqz                     v10, +005h
0166: invoke-virtual             v10, Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->requestPermission()V
016c: const-string/jumbo         v10, syncUsbDevice
0172: iget-object                v0, v9, Lcom/moondroplab/moondrop/moondrop_app/native/FlutterNative;->syProductName Ljava/lang/String;
0176: invoke-direct              v9, v4, v0, Lcom/moondroplab/moondrop/moondrop_app/native/FlutterNative;->buildUsbDeviceMap(Landroid/hardware/usb/UsbDevice; Ljava/lang/String;)Ljava/util/Map;
017c: move-result-object         v0
017e: invoke-direct              v9, v10, v0, Lcom/moondroplab/moondrop/moondrop_app/native/FlutterNative;->invokeFlutter(Ljava/lang/String; Ljava/lang/Object;)V
0184: const-string/jumbo         v10, syncSyState
018a: invoke-direct              v9, v10, v3, Lcom/moondroplab/moondrop/moondrop_app/native/FlutterNative;->invokeFlutter(Ljava/lang/String; Ljava/lang/Object;)V
0190: goto                       +54h
0192: const-string               v10, "FlutterNative"
0196: const-string               v2, "onStateChange: Device is not synaptics, other device attached"
019a: invoke-static              v10, v2, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
01a0: iget-object                v10, v9, Lcom/moondroplab/moondrop/moondrop_app/native/FlutterNative;->context Landroid/content/Context;
01a4: invoke-static              v10, Lns4;->c(Landroid/content/Context;)Lns4;
01aa: move-result-object         v10
01ac: invoke-virtual             v10, Ljava/lang/Object;->getClass()Ljava/lang/Class;
01b2: iput-object                v10, v9, Lcom/moondroplab/moondrop/moondrop_app/native/FlutterNative;->usbCommunication Lns4;
01b6: const-string               v2, "FlutterNative"
01ba: invoke-virtual             v10, Lns4;->e()Ljava/lang/String;
01c0: move-result-object         v10
01c2: new-instance               v5, Ljava/lang/StringBuilder;
01c6: invoke-direct              v5, v1, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
01cc: invoke-virtual             v5, v10, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
01d2: invoke-virtual             v5, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
01d8: move-result-object         v10
01da: invoke-static              v2, v10, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
01e0: iget-object                v10, v9, Lcom/moondroplab/moondrop/moondrop_app/native/FlutterNative;->usbCommunication Lns4;
01e4: if-eqz                     v10, +02ch
01e8: invoke-virtual             v10, Lns4;->e()Ljava/lang/String;
01ee: move-result-object         v10
01f0: invoke-direct              v9, v4, v10, Lcom/moondroplab/moondrop/moondrop_app/native/FlutterNative;->buildUsbDeviceMap(Landroid/hardware/usb/UsbDevice; Ljava/lang/String;)Ljava/util/Map;
01f6: move-result-object         v10
01f8: const-string/jumbo         v1, syncUsbDevice
01fe: invoke-direct              v9, v1, v10, Lcom/moondroplab/moondrop/moondrop_app/native/FlutterNative;->invokeFlutter(Ljava/lang/String; Ljava/lang/Object;)V
0204: const-string               v9, "FlutterNative"
0208: new-instance               v1, Lcom/google/gson/Gson;
020c: invoke-direct              v1, Lcom/google/gson/Gson;-><init>()V
0212: invoke-virtual             v1, v10, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;
0218: move-result-object         v10
021a: new-instance               v1, Ljava/lang/StringBuilder;
021e: invoke-direct              v1, v0, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
0224: invoke-virtual             v1, v10, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
022a: invoke-virtual             v1, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
0230: move-result-object         v10
0232: invoke-static              v9, v10, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0238: monitor-exit               v11
023a: return-void                
023c: const-string/jumbo         v9, usbCommunication
0242: invoke-static              v9, Ldf2;->e(Ljava/lang/String;)V
0248: throw                      v3
024a: monitor-exit               v11
024c: throw                      v9
024e: return-void                

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion; <init>(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode; I I I)V code_off=0x5f9be0
0000: invoke-virtual             v1, Ljava/lang/Object;->getClass()Ljava/lang/Class;
0006: invoke-direct              v0, Ljava/lang/Object;-><init>()V
000c: iput-object                v1, v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->statusCode Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode;
0010: iput                       v2, v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->major I
0014: iput                       v3, v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->minor I
0018: iput                       v4, v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->patch I
001c: return-void                

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion; copy$default(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion; Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode; I I I I Ljava/lang/Object;)Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion; code_off=0x5f9998
0000: and-int/lit8               v6, v5, 1
0004: if-eqz                     v6, +004h
0008: iget-object                v1, v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->statusCode Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode;
000c: and-int/lit8               v6, v5, 2
0010: if-eqz                     v6, +004h
0014: iget                       v2, v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->major I
0018: and-int/lit8               v6, v5, 4
001c: if-eqz                     v6, +004h
0020: iget                       v3, v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->minor I
0024: and-int/lit8               v5, v5, 8
0028: if-eqz                     v5, +004h
002c: iget                       v4, v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->patch I
0030: invoke-virtual             v0, v1, v2, v3, v4, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->copy(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode; I I I)Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;
0036: move-result-object         v0
0038: return-object              v0

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion; component1()Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode; code_off=0x5f9a08
0000: iget-object                v0, v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->statusCode Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode;
0004: return-object              v0

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion; component2()I code_off=0x5f9a38
0000: iget                       v0, v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->major I
0004: return                     v0

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion; component3()I code_off=0x5f9a50
0000: iget                       v0, v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->minor I
0004: return                     v0

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion; component4()I code_off=0x5f9a68
0000: iget                       v0, v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->patch I
0004: return                     v0

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion; copy(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode; I I I)Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion; code_off=0x5f99e4
0000: invoke-virtual             v1, Ljava/lang/Object;->getClass()Ljava/lang/Class;
0006: new-instance               v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;
000a: invoke-direct              v0, v1, v2, v3, v4, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;-><init>(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode; I I I)V
0010: return-object              v0

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion; equals(Ljava/lang/Object;)Z code_off=0x5f9934
0000: const/4                    v0, 1
0002: if-ne                      v4, v5, +003h
0006: return                     v0
0008: instance-of                v1, v5, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;
000c: const/4                    v2, 0
000e: if-nez                     v1, +003h
0012: return                     v2
0014: check-cast                 v5, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;
0018: iget-object                v1, v4, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->statusCode Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode;
001c: iget-object                v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->statusCode Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode;
0020: if-eq                      v1, v3, +003h
0024: return                     v2
0026: iget                       v1, v4, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->major I
002a: iget                       v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->major I
002e: if-eq                      v1, v3, +003h
0032: return                     v2
0034: iget                       v1, v4, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->minor I
0038: iget                       v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->minor I
003c: if-eq                      v1, v3, +003h
0040: return                     v2
0042: iget                       v4, v4, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->patch I
0046: iget                       v5, v5, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->patch I
004a: if-eq                      v4, v5, +003h
004e: return                     v2
0050: return                     v0

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion; getMajor()I code_off=0x5f9a80
0000: iget                       v0, v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->major I
0004: return                     v0

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion; getMinor()I code_off=0x5f9a98
0000: iget                       v0, v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->minor I
0004: return                     v0

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion; getPatch()I code_off=0x5f9ab0
0000: iget                       v0, v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->patch I
0004: return                     v0

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion; getStatusCode()Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode; code_off=0x5f9a20
0000: iget-object                v0, v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->statusCode Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode;
0004: return-object              v0

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion; getVersionName()Ljava/lang/String; code_off=0x5f9b14
0000: iget                       v0, v3, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->major I
0004: iget                       v1, v3, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->minor I
0008: iget                       v3, v3, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->patch I
000c: new-instance               v2, Ljava/lang/StringBuilder;
0010: invoke-direct              v2, Ljava/lang/StringBuilder;-><init>()V
0016: invoke-virtual             v2, v0, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
001c: const-string               v0, "."
0020: invoke-virtual             v2, v0, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0026: invoke-virtual             v2, v1, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
002c: invoke-virtual             v2, v0, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0032: invoke-virtual             v2, v3, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0038: invoke-virtual             v2, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
003e: move-result-object         v3
0040: return-object              v3

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion; hashCode()I code_off=0x5f9ac8
0000: iget-object                v0, v3, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->statusCode Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode;
0004: invoke-virtual             v0, Ljava/lang/Object;->hashCode()I
000a: move-result                v0
000c: const/16                   v1, 31
0010: mul-int/2addr              v0, v1
0012: iget                       v2, v3, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->major I
0016: invoke-static              v2, v0, v1, Ln50;->C(I I I)I
001c: move-result                v0
001e: iget                       v2, v3, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->minor I
0022: invoke-static              v2, v0, v1, Ln50;->C(I I I)I
0028: move-result                v0
002a: iget                       v3, v3, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->patch I
002e: invoke-static              v3, Ljava/lang/Integer;->hashCode(I)I
0034: move-result                v3
0036: add-int/2addr              v3, v0
0038: return                     v3

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion; toString()Ljava/lang/String; code_off=0x5f9b68
0000: iget-object                v0, v5, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->statusCode Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode;
0004: iget                       v1, v5, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->major I
0008: iget                       v2, v5, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->minor I
000c: iget                       v5, v5, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->patch I
0010: new-instance               v3, Ljava/lang/StringBuilder;
0014: const-string               v4, "BleSourceFirmwareVersion(statusCode="
0018: invoke-direct              v3, v4, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
001e: invoke-virtual             v3, v0, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
0024: const-string               v0, ", major="
0028: invoke-virtual             v3, v0, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
002e: invoke-virtual             v3, v1, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0034: const-string               v0, ", minor="
0038: invoke-virtual             v3, v0, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
003e: invoke-virtual             v3, v2, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0044: const-string               v0, ", patch="
0048: invoke-virtual             v3, v0, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
004e: invoke-virtual             v3, v5, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0054: const-string               v5, ")"
0058: invoke-virtual             v3, v5, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
005e: invoke-virtual             v3, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
0064: move-result-object         v5
0066: return-object              v5

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion; <init>(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand; I Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;)V code_off=0x5faec8
0000: invoke-virtual             v4, Ljava/lang/Object;->getClass()Ljava/lang/Class;
0006: const/4                    v0, 0
0008: invoke-direct              v1, v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse;-><init>(Laz0;)V
000e: iput-object                v2, v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;->command Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand;
0012: iput                       v3, v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;->commandId I
0016: iput-object                v4, v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;->value Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;
001a: return-void                

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion; copy$default(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion; Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand; I Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion; I Ljava/lang/Object;)Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion; code_off=0x5fad88
0000: and-int/lit8               v5, v4, 1
0004: if-eqz                     v5, +004h
0008: iget-object                v1, v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;->command Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand;
000c: and-int/lit8               v5, v4, 2
0010: if-eqz                     v5, +004h
0014: iget                       v2, v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;->commandId I
0018: and-int/lit8               v4, v4, 4
001c: if-eqz                     v4, +004h
0020: iget-object                v3, v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;->value Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;
0024: invoke-virtual             v0, v1, v2, v3, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;->copy(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand; I Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;)Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;
002a: move-result-object         v0
002c: return-object              v0

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion; component1()Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand; code_off=0x5fad28
0000: iget-object                v0, v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;->command Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand;
0004: return-object              v0

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion; component2()I code_off=0x5fadec
0000: iget                       v0, v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;->commandId I
0004: return                     v0

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion; component3()Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion; code_off=0x5fad58
0000: iget-object                v0, v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;->value Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;
0004: return-object              v0

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion; copy(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand; I Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;)Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion; code_off=0x5fadc8
0000: invoke-virtual             v3, Ljava/lang/Object;->getClass()Ljava/lang/Class;
0006: new-instance               v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;
000a: invoke-direct              v0, v1, v2, v3, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;-><init>(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand; I Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;)V
0010: return-object              v0

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion; equals(Ljava/lang/Object;)Z code_off=0x5faccc
0000: const/4                    v0, 1
0002: if-ne                      v4, v5, +003h
0006: return                     v0
0008: instance-of                v1, v5, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;
000c: const/4                    v2, 0
000e: if-nez                     v1, +003h
0012: return                     v2
0014: check-cast                 v5, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;
0018: iget-object                v1, v4, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;->command Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand;
001c: iget-object                v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;->command Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand;
0020: if-eq                      v1, v3, +003h
0024: return                     v2
0026: iget                       v1, v4, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;->commandId I
002a: iget                       v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;->commandId I
002e: if-eq                      v1, v3, +003h
0032: return                     v2
0034: iget-object                v4, v4, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;->value Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;
0038: iget-object                v5, v5, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;->value Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;
003c: invoke-static              v4, v5, Ldf2;->a(Ljava/lang/Object; Ljava/lang/Object;)Z
0042: move-result                v4
0044: if-nez                     v4, +003h
0048: return                     v2
004a: return                     v0

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion; getCommand()Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand; code_off=0x5fad40
0000: iget-object                v0, v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;->command Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand;
0004: return-object              v0

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion; getCommandId()I code_off=0x5fae04
0000: iget                       v0, v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;->commandId I
0004: return                     v0

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion; getValue()Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion; code_off=0x5fad70
0000: iget-object                v0, v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;->value Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;
0004: return-object              v0

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion; hashCode()I code_off=0x5fae1c
0000: iget-object                v0, v3, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;->command Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand;
0004: if-nez                     v0, +004h
0008: const/4                    v0, 0
000a: goto                       +5h
000c: invoke-virtual             v0, Ljava/lang/Object;->hashCode()I
0012: move-result                v0
0014: const/16                   v1, 31
0018: mul-int/2addr              v0, v1
001a: iget                       v2, v3, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;->commandId I
001e: invoke-static              v2, v0, v1, Ln50;->C(I I I)I
0024: move-result                v0
0026: iget-object                v3, v3, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;->value Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;
002a: invoke-virtual             v3, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->hashCode()I
0030: move-result                v3
0032: add-int/2addr              v3, v0
0034: return                     v3

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion; toString()Ljava/lang/String; code_off=0x5fae64
0000: iget-object                v0, v4, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;->command Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand;
0004: iget                       v1, v4, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;->commandId I
0008: iget-object                v4, v4, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;->value Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;
000c: new-instance               v2, Ljava/lang/StringBuilder;
0010: const-string               v3, "FirmwareVersion(command="
0014: invoke-direct              v2, v3, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
001a: invoke-virtual             v2, v0, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
0020: const-string               v0, ", commandId="
0024: invoke-virtual             v2, v0, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
002a: invoke-virtual             v2, v1, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
0030: const-string               v0, ", value="
0034: invoke-virtual             v2, v0, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
003a: invoke-virtual             v2, v4, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
0040: const-string               v4, ")"
0044: invoke-virtual             v2, v4, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
004a: invoke-virtual             v2, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
0050: move-result-object         v4
0052: return-object              v4

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchClient; getFirmwareVersion$lambda$0(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse;)Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion; code_off=0x5fd5f4
0000: invoke-virtual             v2, Ljava/lang/Object;->getClass()Ljava/lang/Class;
0006: instance-of                v0, v2, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;
000a: const/4                    v1, 0
000c: if-eqz                     v0, +005h
0010: check-cast                 v2, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;
0014: goto                       +2h
0016: move-object                v2, v1
0018: if-eqz                     v2, +007h
001c: invoke-virtual             v2, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;->getValue()Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;
0022: move-result-object         v2
0024: return-object              v2
0026: return-object              v1

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchClient; i(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse;)Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion; code_off=0x5fd5d8
0000: invoke-static              v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchClient;->getFirmwareVersion$lambda$0(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse;)Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;
0006: move-result-object         v0
0008: return-object              v0

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchFrames; parseFirmwareVersionPayload(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode; [B)Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion; code_off=0x5feacc
0000: array-length               v3, v5
0002: const/4                    v0, 3
0004: if-lt                      v3, v0, +01dh
0008: new-instance               v3, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;
000c: const/4                    v0, 0
000e: aget-byte                  v0, v5, v0
0012: invoke-static              v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleProtocolBytesKt;->u8(B)I
0018: move-result                v0
001a: const/4                    v1, 1
001c: aget-byte                  v1, v5, v1
0020: invoke-static              v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleProtocolBytesKt;->u8(B)I
0026: move-result                v1
0028: const/4                    v2, 2
002a: aget-byte                  v5, v5, v2
002e: invoke-static              v5, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleProtocolBytesKt;->u8(B)I
0034: move-result                v5
0036: invoke-direct              v3, v4, v0, v1, v5, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;-><init>(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode; I I I)V
003c: return-object              v3
003e: const-string               v3, "Firmware version payload must contain 3 bytes"
0042: invoke-static              v3, Lr71;->i(Ljava/lang/String;)V
0048: const/4                    v3, 0
004a: return-object              v3

Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchFrames; parseResponse([B)Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse; code_off=0x5fec0c
0000: invoke-virtual             v9, Ljava/lang/Object;->getClass()Ljava/lang/Class;
0006: invoke-direct              v8, v9, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchFrames;->parseFrame([B)Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchFrames$ParsedFrame;
000c: move-result-object         v9
000e: sget-object                v0, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand;->Companion Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand$Companion;
0012: invoke-virtual             v9, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchFrames$ParsedFrame;->getMessageId()I
0018: move-result                v1
001a: invoke-virtual             v0, v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand$Companion;->fromId(I)Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand;
0020: move-result-object         v0
0022: invoke-virtual             v9, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchFrames$ParsedFrame;->getPayload()[B
0028: move-result-object         v1
002a: array-length               v2, v1
002c: const/4                    v3, 1
002e: const/4                    v4, 0
0030: if-nez                     v2, +004h
0034: move                       v2, v3
0036: goto                       +2h
0038: move                       v2, v4
003a: const/4                    v5, 0
003c: if-nez                     v2, +12fh
0040: sget-object                v2, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode;->Companion Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode$Companion;
0044: aget-byte                  v6, v1, v4
0048: invoke-static              v6, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleProtocolBytesKt;->u8(B)I
004e: move-result                v6
0050: invoke-virtual             v2, v6, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode$Companion;->fromId(I)Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode;
0056: move-result-object         v2
0058: array-length               v6, v1
005a: invoke-static              v3, v6, v1, Lsj;->j(I I [B)[B
0060: move-result-object         v3
0062: if-nez                     v0, +004h
0066: const/4                    v6, -1
0068: goto                       +9h
006a: sget-object                v6, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchFrames$WhenMappings;->$EnumSwitchMapping$0 [I
006e: invoke-virtual             v0, Ljava/lang/Enum;->ordinal()I
0074: move-result                v7
0076: aget                       v6, v6, v7
007a: packed-switch              v6, +0000117h
0080: invoke-static              Lcl1;->j()V
0086: return-object              v5
0088: new-instance               v8, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$EarbudSnChunk;
008c: invoke-virtual             v9, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchFrames$ParsedFrame;->getMessageId()I
0092: move-result                v9
0094: sget-object                v2, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/identity/BleDeviceIdentityProtocolCodec;->INSTANCE Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/identity/BleDeviceIdentityProtocolCodec;
0098: invoke-virtual             v2, v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/identity/BleDeviceIdentityProtocolCodec;->parseSnChunk([B)Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/identity/BleEarbudSnChunk;
009e: move-result-object         v1
00a0: invoke-direct              v8, v0, v9, v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$EarbudSnChunk;-><init>(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand; I Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/identity/BleEarbudSnChunk;)V
00a6: return-object              v8
00a8: new-instance               v8, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$EarbudInfo;
00ac: invoke-virtual             v9, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchFrames$ParsedFrame;->getMessageId()I
00b2: move-result                v9
00b4: sget-object                v2, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/identity/BleDeviceIdentityProtocolCodec;->INSTANCE Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/identity/BleDeviceIdentityProtocolCodec;
00b8: invoke-virtual             v2, v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/identity/BleDeviceIdentityProtocolCodec;->parseInfo([B)Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/identity/BleEarbudInfo;
00be: move-result-object         v1
00c0: invoke-direct              v8, v0, v9, v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$EarbudInfo;-><init>(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand; I Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/identity/BleEarbudInfo;)V
00c6: return-object              v8
00c8: new-instance               v8, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$MicGain;
00cc: invoke-virtual             v9, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchFrames$ParsedFrame;->getMessageId()I
00d2: move-result                v9
00d4: sget-object                v2, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/mic/BleMicGainProtocolCodec;->INSTANCE Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/mic/BleMicGainProtocolCodec;
00d8: invoke-virtual             v2, v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/mic/BleMicGainProtocolCodec;->parseStatus([B)Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/mic/BleMicGainStatus;
00de: move-result-object         v1
00e0: invoke-direct              v8, v0, v9, v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$MicGain;-><init>(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand; I Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/mic/BleMicGainStatus;)V
00e6: return-object              v8
00e8: new-instance               v8, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$PeqCommit;
00ec: invoke-virtual             v9, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchFrames$ParsedFrame;->getMessageId()I
00f2: move-result                v9
00f4: sget-object                v2, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BleEqProtocolCodec;->INSTANCE Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BleEqProtocolCodec;
00f8: invoke-virtual             v2, v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BleEqProtocolCodec;->parseCommit([B)Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BlePeqCommitResult;
00fe: move-result-object         v1
0100: invoke-direct              v8, v0, v9, v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$PeqCommit;-><init>(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand; I Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BlePeqCommitResult;)V
0106: return-object              v8
0108: new-instance               v8, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$PeqPoint;
010c: invoke-virtual             v9, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchFrames$ParsedFrame;->getMessageId()I
0112: move-result                v9
0114: sget-object                v2, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BleEqProtocolCodec;->INSTANCE Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BleEqProtocolCodec;
0118: invoke-virtual             v2, v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BleEqProtocolCodec;->parsePoint([B)Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BlePeqPoint;
011e: move-result-object         v1
0120: invoke-direct              v8, v0, v9, v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$PeqPoint;-><init>(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand; I Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BlePeqPoint;)V
0126: return-object              v8
0128: new-instance               v8, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$PeqPreGain;
012c: invoke-virtual             v9, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchFrames$ParsedFrame;->getMessageId()I
0132: move-result                v9
0134: sget-object                v2, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BleEqProtocolCodec;->INSTANCE Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BleEqProtocolCodec;
0138: invoke-virtual             v2, v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BleEqProtocolCodec;->parsePreGain([B)Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BlePeqPreGain;
013e: move-result-object         v1
0140: invoke-direct              v8, v0, v9, v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$PeqPreGain;-><init>(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand; I Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BlePeqPreGain;)V
0146: return-object              v8
0148: new-instance               v8, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$PeqConfig;
014c: invoke-virtual             v9, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchFrames$ParsedFrame;->getMessageId()I
0152: move-result                v9
0154: sget-object                v2, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BleEqProtocolCodec;->INSTANCE Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BleEqProtocolCodec;
0158: invoke-virtual             v2, v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BleEqProtocolCodec;->parseConfig([B)Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BlePeqConfig;
015e: move-result-object         v1
0160: invoke-direct              v8, v0, v9, v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$PeqConfig;-><init>(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand; I Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BlePeqConfig;)V
0166: return-object              v8
0168: new-instance               v8, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$PresetEqChange;
016c: invoke-virtual             v9, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchFrames$ParsedFrame;->getMessageId()I
0172: move-result                v9
0174: sget-object                v2, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BleEqProtocolCodec;->INSTANCE Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BleEqProtocolCodec;
0178: invoke-virtual             v2, v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BleEqProtocolCodec;->parsePresetChange([B)Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BlePresetEqChange;
017e: move-result-object         v1
0180: invoke-direct              v8, v0, v9, v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$PresetEqChange;-><init>(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand; I Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BlePresetEqChange;)V
0186: return-object              v8
0188: new-instance               v8, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$PresetEqInfo;
018c: invoke-virtual             v9, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchFrames$ParsedFrame;->getMessageId()I
0192: move-result                v9
0194: sget-object                v2, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BleEqProtocolCodec;->INSTANCE Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BleEqProtocolCodec;
0198: invoke-virtual             v2, v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BleEqProtocolCodec;->parsePresetInfo([B)Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BlePresetEqInfo;
019e: move-result-object         v1
01a0: invoke-direct              v8, v0, v9, v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$PresetEqInfo;-><init>(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand; I Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/eq/BlePresetEqInfo;)V
01a6: return-object              v8
01a8: new-instance               v8, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$DeviceVolume;
01ac: invoke-virtual             v9, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchFrames$ParsedFrame;->getMessageId()I
01b2: move-result                v9
01b4: new-instance               v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleDeviceVolumeStatus;
01b8: aget-byte                  v3, v3, v4
01bc: invoke-static              v3, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleProtocolBytesKt;->u8(B)I
01c2: move-result                v3
01c4: invoke-direct              v1, v2, v3, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleDeviceVolumeStatus;-><init>(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode; I)V
01ca: invoke-direct              v8, v0, v9, v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$DeviceVolume;-><init>(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand; I Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleDeviceVolumeStatus;)V
01d0: return-object              v8
01d2: invoke-virtual             v9, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchFrames$ParsedFrame;->getMessageId()I
01d8: move-result                v8
01da: new-instance               v9, Ljava/util/ArrayList;
01de: array-length               v1, v3
01e0: invoke-direct              v9, v1, Ljava/util/ArrayList;-><init>(I)V
01e6: array-length               v1, v3
01e8: if-ge                      v4, v1, +012h
01ec: aget-byte                  v5, v3, v4
01f0: invoke-static              v5, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleProtocolBytesKt;->u8(B)I
01f6: move-result                v5
01f8: invoke-static              v5, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
01fe: move-result-object         v5
0200: invoke-interface           v9, v5, Ljava/util/Collection;->add(Ljava/lang/Object;)Z
0206: add-int/lit8               v4, v4, 1
020a: goto                       -11h
020c: new-instance               v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCapability;
0210: invoke-direct              v1, v2, v9, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCapability;-><init>(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode; Ljava/util/List;)V
0216: new-instance               v9, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$Capability;
021a: invoke-direct              v9, v0, v8, v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$Capability;-><init>(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand; I Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCapability;)V
0220: return-object              v9
0222: new-instance               v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;
0226: invoke-virtual             v9, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchFrames$ParsedFrame;->getMessageId()I
022c: move-result                v9
022e: invoke-direct              v8, v2, v3, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchFrames;->parseFirmwareVersionPayload(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode; [B)Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;
0234: move-result-object         v8
0236: invoke-direct              v1, v0, v9, v8, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$FirmwareVersion;-><init>(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand; I Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;)V
023c: return-object              v1
023e: new-instance               v8, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$Status;
0242: invoke-virtual             v9, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchFrames$ParsedFrame;->getMessageId()I
0248: move-result                v9
024a: new-instance               v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatus;
024e: invoke-direct              v1, v2, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatus;-><init>(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode;)V
0254: invoke-direct              v8, v0, v9, v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$Status;-><init>(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand; I Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatus;)V
025a: return-object              v8
025c: new-instance               v8, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$CurrentSource;
0260: invoke-virtual             v9, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchFrames$ParsedFrame;->getMessageId()I
0266: move-result                v9
0268: new-instance               v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleCurrentSource;
026c: aget-byte                  v3, v3, v4
0270: invoke-static              v3, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleProtocolBytesKt;->u8(B)I
0276: move-result                v3
0278: invoke-direct              v1, v2, v3, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleCurrentSource;-><init>(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode; I)V
027e: invoke-direct              v8, v0, v9, v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$CurrentSource;-><init>(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand; I Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleCurrentSource;)V
0284: return-object              v8
0286: new-instance               v8, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$Raw;
028a: invoke-virtual             v9, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchFrames$ParsedFrame;->getMessageId()I
0290: move-result                v9
0292: invoke-direct              v8, v0, v9, v1, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceResponse$Raw;-><init>(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceCommand; I [B)V
0298: return-object              v8
029a: const-string               v8, "Response payload must contain a status byte"
029e: invoke-static              v8, Lr71;->i(Ljava/lang/String;)V
02a4: return-object              v5
02a6: nop                        
02a8: packed-switch-payload      -1 0 1 2 3 4 5 6 7 8 9 a b c d e f 10 11 12 13 14

Lcom/moondroplab/moondrop/moondrop_app/native/handlers/AirohaHandler; handleAirohaApplyNewFirmware()V code_off=0x606a70
0000: iget-object                v0, v0, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/AirohaHandler;->manager Lcom/moondroplab/moondrop/moondrop_app/FotaManager;
0004: invoke-virtual             v0, Lcom/moondroplab/moondrop/moondrop_app/FotaManager;->applyNewFirmware()V
000a: return-void                

Lcom/moondroplab/moondrop/moondrop_app/native/handlers/AirohaHandler; handleAirohaGetOtaVersion(Lio/flutter/plugin/common/MethodChannel$Result;)V code_off=0x606c98
0000: iget-object                v0, v2, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/AirohaHandler;->manager Lcom/moondroplab/moondrop/moondrop_app/FotaManager;
0004: invoke-virtual             v0, Lcom/moondroplab/moondrop/moondrop_app/FotaManager;->start()Z
000a: iget-object                v2, v2, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/AirohaHandler;->manager Lcom/moondroplab/moondrop/moondrop_app/FotaManager;
000e: new-instance               v0, Lw9;
0012: const/4                    v1, 0
0014: invoke-direct              v0, v3, v1, Lw9;-><init>(Lio/flutter/plugin/common/MethodChannel$Result; I)V
001a: invoke-virtual             v2, v0, Lcom/moondroplab/moondrop/moondrop_app/FotaManager;->getFirmwareVersionAsync(Lcom/moondroplab/moondrop/moondrop_app/FotaManager$VersionCallback;)V
0020: return-void                

Lcom/moondroplab/moondrop/moondrop_app/native/handlers/AirohaHandler; handleMethod(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)Z code_off=0x6066f8
0000: invoke-virtual             v4, Ljava/lang/Object;->getClass()Ljava/lang/Class;
0006: invoke-virtual             v5, Ljava/lang/Object;->getClass()Ljava/lang/Class;
000c: iget-object                v0, v4, Lio/flutter/plugin/common/MethodCall;->method Ljava/lang/String;
0010: if-eqz                     v0, +059h
0014: invoke-virtual             v0, Ljava/lang/String;->hashCode()I
001a: move-result                v1
001c: const/4                    v2, 1
001e: sparse-switch              v1, +0000055h
0024: goto                       +4fh
0026: const-string               v4, "airohaGetOtaVersion"
002a: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0030: move-result                v4
0032: if-nez                     v4, +003h
0036: goto                       +46h
0038: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/AirohaHandler;->handleAirohaGetOtaVersion(Lio/flutter/plugin/common/MethodChannel$Result;)V
003e: return                     v2
0040: const-string               v5, "airohaStartFota"
0044: invoke-virtual             v0, v5, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
004a: move-result                v5
004c: if-nez                     v5, +003h
0050: goto                       +39h
0052: invoke-direct              v3, v4, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/AirohaHandler;->handleAirohaStartFota(Lio/flutter/plugin/common/MethodCall;)V
0058: return                     v2
005a: const-string               v4, "airohaApplyNewFirmware"
005e: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0064: move-result                v4
0066: if-nez                     v4, +003h
006a: goto                       +2ch
006c: invoke-direct              v3, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/AirohaHandler;->handleAirohaApplyNewFirmware()V
0072: return                     v2
0074: const-string               v1, "airohaPrepareFota"
0078: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
007e: move-result                v0
0080: if-nez                     v0, +003h
0084: goto                       +1fh
0086: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/AirohaHandler;->handleAirohaPrepareFota(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
008c: return                     v2
008e: const-string               v5, "airohaSetPeq"
0092: invoke-virtual             v0, v5, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0098: move-result                v5
009a: if-nez                     v5, +003h
009e: goto                       +12h
00a0: invoke-direct              v3, v4, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/AirohaHandler;->handleAirohaSetPeq(Lio/flutter/plugin/common/MethodCall;)V
00a6: return                     v2
00a8: const-string               v5, "airohaConnectBT"
00ac: invoke-virtual             v0, v5, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
00b2: move-result                v5
00b4: if-nez                     v5, +003h
00b8: goto                       +5h
00ba: invoke-direct              v3, v4, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/AirohaHandler;->handleAirohaConnectBT(Lio/flutter/plugin/common/MethodCall;)V
00c0: return                     v2
00c2: const/4                    v3, 0
00c4: return                     v3
00c6: nop                        
00c8: sparse-switch-payload      -61dce7c2 -1f6460e8 -133f7c61 18817b6b 41b86dfa 6aaf5e94

Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler; R(Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler; Lio/flutter/plugin/common/MethodChannel$Result; Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchClient;)Ltq4; code_off=0x609584
0000: invoke-static              v0, v1, v2, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleGetFirmwareVersion$lambda$0(Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler; Lio/flutter/plugin/common/MethodChannel$Result; Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchClient;)Ltq4;
0006: move-result-object         v0
0008: return-object              v0

Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler; f(Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler; Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;)Ljava/lang/Object; code_off=0x60a12c
0000: invoke-static              v0, v1, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleGetFirmwareVersion$lambda$0$0(Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler; Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;)Ljava/lang/Object;
0006: move-result-object         v0
0008: return-object              v0

Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler; handleGetFirmwareVersion$lambda$0(Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler; Lio/flutter/plugin/common/MethodChannel$Result; Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchClient;)Ltq4; code_off=0x609748
0000: invoke-virtual             v4, Ljava/lang/Object;->getClass()Ljava/lang/Class;
0006: new-instance               v0, Lmw;
000a: const/4                    v1, 3
000c: invoke-direct              v0, v2, v1, Lmw;-><init>(Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler; I)V
0012: invoke-direct              v2, v3, v0, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->resultCallback(Lio/flutter/plugin/common/MethodChannel$Result; Lkx1;)Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchCallback;
0018: move-result-object         v2
001a: invoke-virtual             v4, v2, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchClient;->getFirmwareVersion(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchCallback;)V
0020: sget-object                v2, Ltq4;->a Ltq4;
0024: return-object              v2

Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler; handleGetFirmwareVersion$lambda$0$0(Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler; Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;)Ljava/lang/Object; code_off=0x60a40c
0000: invoke-virtual             v1, Ljava/lang/Object;->getClass()Ljava/lang/Class;
0006: invoke-direct              v0, v1, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->toFlutterMap(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;)Ljava/util/Map;
000c: move-result-object         v0
000e: return-object              v0

Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler; toFlutterMap(Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;)Ljava/util/Map; code_off=0x60a7e4
0000: invoke-virtual             v7, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->getStatusCode()Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode;
0006: move-result-object         v6
0008: invoke-virtual             v6, Ljava/lang/Enum;->name()Ljava/lang/String;
000e: move-result-object         v6
0010: new-instance               v0, Lr93;
0014: const-string/jumbo         v1, statusCode
001a: invoke-direct              v0, v1, v6, Lr93;-><init>(Ljava/lang/Object; Ljava/lang/Object;)V
0020: invoke-virtual             v7, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->getStatusCode()Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode;
0026: move-result-object         v6
0028: invoke-virtual             v6, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceStatusCode;->getId()I
002e: move-result                v6
0030: invoke-static              v6, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
0036: move-result-object         v6
0038: new-instance               v1, Lr93;
003c: const-string/jumbo         v2, statusCodeId
0042: invoke-direct              v1, v2, v6, Lr93;-><init>(Ljava/lang/Object; Ljava/lang/Object;)V
0048: invoke-virtual             v7, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->getMajor()I
004e: move-result                v6
0050: invoke-static              v6, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
0056: move-result-object         v6
0058: new-instance               v2, Lr93;
005c: const-string               v3, "major"
0060: invoke-direct              v2, v3, v6, Lr93;-><init>(Ljava/lang/Object; Ljava/lang/Object;)V
0066: invoke-virtual             v7, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->getMinor()I
006c: move-result                v6
006e: invoke-static              v6, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
0074: move-result-object         v6
0076: new-instance               v3, Lr93;
007a: const-string               v4, "minor"
007e: invoke-direct              v3, v4, v6, Lr93;-><init>(Ljava/lang/Object; Ljava/lang/Object;)V
0084: invoke-virtual             v7, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->getPatch()I
008a: move-result                v6
008c: invoke-static              v6, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
0092: move-result-object         v6
0094: new-instance               v4, Lr93;
0098: const-string               v5, "patch"
009c: invoke-direct              v4, v5, v6, Lr93;-><init>(Ljava/lang/Object; Ljava/lang/Object;)V
00a2: invoke-virtual             v7, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceFirmwareVersion;->getVersionName()Ljava/lang/String;
00a8: move-result-object         v6
00aa: new-instance               v5, Lr93;
00ae: const-string/jumbo         v7, versionName
00b4: invoke-direct              v5, v7, v6, Lr93;-><init>(Ljava/lang/Object; Ljava/lang/Object;)V
00ba: filled-new-array/range     v0 ... v5, [Lr93;
00c0: move-result-object         v6
00c2: invoke-static              v6, Lgq2;->c([Lr93;)Ljava/util/Map;
00c8: move-result-object         v6
00ca: return-object              v6

Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler; handleMethod(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)Z code_off=0x609ac0
0000: invoke-virtual             v5, Ljava/lang/Object;->getClass()Ljava/lang/Class;
0006: invoke-virtual             v6, Ljava/lang/Object;->getClass()Ljava/lang/Class;
000c: iget-object                v0, v5, Lio/flutter/plugin/common/MethodCall;->method Ljava/lang/String;
0010: const/4                    v1, 0
0012: if-eqz                     v0, +1cah
0016: invoke-virtual             v0, Ljava/lang/String;->hashCode()I
001c: move-result                v2
001e: const/4                    v3, 1
0020: sparse-switch              v2, +00001c4h
0026: goto/16                    +1c0h
002a: const-string               v5, "bleSourceGetPresetEq"
002e: invoke-virtual             v0, v5, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0034: move-result                v5
0036: if-nez                     v5, +004h
003a: goto/16                    +1b6h
003e: invoke-direct              v4, v6, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleGetPresetEq(Lio/flutter/plugin/common/MethodChannel$Result;)V
0044: return                     v3
0046: const-string               v2, "bleSourceSetPresetEq"
004a: invoke-virtual             v0, v2, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0050: move-result                v0
0052: if-nez                     v0, +004h
0056: goto/16                    +1a8h
005a: invoke-direct              v4, v5, v6, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleSetPresetEq(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
0060: return                     v3
0062: const-string               v5, "bleSourceGetEarbudColor"
0066: invoke-virtual             v0, v5, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
006c: move-result                v5
006e: if-nez                     v5, +004h
0072: goto/16                    +19ah
0076: invoke-direct              v4, v6, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleGetEarbudColor(Lio/flutter/plugin/common/MethodChannel$Result;)V
007c: return                     v3
007e: const-string               v5, "bleSourceIsConnected"
0082: invoke-virtual             v0, v5, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0088: move-result                v5
008a: if-nez                     v5, +004h
008e: goto/16                    +18ch
0092: iget-object                v5, v4, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->client Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchClient;
0096: if-eqz                     v5, +009h
009a: invoke-virtual             v5, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchClient;->isConnected()Z
00a0: move-result                v5
00a2: if-ne                      v5, v3, +003h
00a6: move                       v1, v3
00a8: invoke-static              v1, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
00ae: move-result-object         v5
00b0: invoke-direct              v4, v6, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->resultSuccess(Lio/flutter/plugin/common/MethodChannel$Result; Ljava/lang/Object;)V
00b6: return                     v3
00b8: const-string               v5, "bleSourceStopScan"
00bc: invoke-virtual             v0, v5, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
00c2: move-result                v5
00c4: if-nez                     v5, +004h
00c8: goto/16                    +16fh
00cc: invoke-direct              v4, v6, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleStopScan(Lio/flutter/plugin/common/MethodChannel$Result;)V
00d2: return                     v3
00d4: const-string               v5, "bleSourceDisconnect"
00d8: invoke-virtual             v0, v5, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
00de: move-result                v5
00e0: if-nez                     v5, +004h
00e4: goto/16                    +161h
00e8: invoke-direct              v4, v6, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleDisconnect(Lio/flutter/plugin/common/MethodChannel$Result;)V
00ee: return                     v3
00f0: const-string               v5, "bleSourceGetScanResults"
00f4: invoke-virtual             v0, v5, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
00fa: move-result                v5
00fc: if-nez                     v5, +004h
0100: goto/16                    +153h
0104: iget-object                v5, v4, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->scanResults Ljava/util/LinkedHashMap;
0108: invoke-virtual             v5, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;
010e: move-result-object         v5
0110: invoke-virtual             v5, Ljava/lang/Object;->getClass()Ljava/lang/Class;
0116: invoke-static              v5, Lyi0;->K(Ljava/lang/Iterable;)Ljava/util/List;
011c: move-result-object         v5
011e: invoke-direct              v4, v6, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->resultSuccess(Lio/flutter/plugin/common/MethodChannel$Result; Ljava/lang/Object;)V
0124: return                     v3
0126: const-string               v2, "bleSourceSetDeviceVolume"
012a: invoke-virtual             v0, v2, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0130: move-result                v0
0132: if-nez                     v0, +004h
0136: goto/16                    +138h
013a: invoke-direct              v4, v5, v6, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleSetDeviceVolume(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
0140: return                     v3
0142: const-string               v5, "bleSourceGetEarbudLanguage"
0146: invoke-virtual             v0, v5, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
014c: move-result                v5
014e: if-nez                     v5, +004h
0152: goto/16                    +12ah
0156: invoke-direct              v4, v6, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleGetEarbudLanguage(Lio/flutter/plugin/common/MethodChannel$Result;)V
015c: return                     v3
015e: const-string               v5, "bleSourceGetCapability"
0162: invoke-virtual             v0, v5, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0168: move-result                v5
016a: if-nez                     v5, +004h
016e: goto/16                    +11ch
0172: invoke-direct              v4, v6, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleGetCapability(Lio/flutter/plugin/common/MethodChannel$Result;)V
0178: return                     v3
017a: const-string               v5, "bleSourceGetEarbudSkuInfo"
017e: invoke-virtual             v0, v5, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0184: move-result                v5
0186: if-nez                     v5, +004h
018a: goto/16                    +10eh
018e: invoke-direct              v4, v6, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleGetEarbudSkuInfo(Lio/flutter/plugin/common/MethodChannel$Result;)V
0194: return                     v3
0196: const-string               v2, "bleSourceSetAudioSource"
019a: invoke-virtual             v0, v2, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
01a0: move-result                v0
01a2: if-nez                     v0, +004h
01a6: goto/16                    +100h
01aa: invoke-direct              v4, v5, v6, v1, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleSetAudioSource(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result; Z)V
01b0: return                     v3
01b2: const-string               v2, "bleSourceSetMicGain"
01b6: invoke-virtual             v0, v2, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
01bc: move-result                v0
01be: if-nez                     v0, +004h
01c2: goto/16                    +0f2h
01c6: invoke-direct              v4, v5, v6, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleSetMicGain(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
01cc: return                     v3
01ce: const-string               v2, "bleSourceSetPeqPreGain"
01d2: invoke-virtual             v0, v2, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
01d8: move-result                v0
01da: if-nez                     v0, +004h
01de: goto/16                    +0e4h
01e2: invoke-direct              v4, v5, v6, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleSetPeqPreGain(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
01e8: return                     v3
01ea: const-string               v5, "bleSourceGetFirmwareVersion"
01ee: invoke-virtual             v0, v5, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
01f4: move-result                v5
01f6: if-nez                     v5, +004h
01fa: goto/16                    +0d6h
01fe: invoke-direct              v4, v6, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleGetFirmwareVersion(Lio/flutter/plugin/common/MethodChannel$Result;)V
0204: return                     v3
0206: const-string               v5, "bleSourceGetDeviceVolume"
020a: invoke-virtual             v0, v5, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0210: move-result                v5
0212: if-nez                     v5, +004h
0216: goto/16                    +0c8h
021a: invoke-direct              v4, v6, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleGetDeviceVolume(Lio/flutter/plugin/common/MethodChannel$Result;)V
0220: return                     v3
0222: const-string               v5, "bleSourceSetPowerOff"
0226: invoke-virtual             v0, v5, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
022c: move-result                v5
022e: if-nez                     v5, +004h
0232: goto/16                    +0bah
0236: invoke-direct              v4, v6, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleSetPowerOff(Lio/flutter/plugin/common/MethodChannel$Result;)V
023c: return                     v3
023e: const-string               v5, "bleSourceGetCurrentAudioSource"
0242: invoke-virtual             v0, v5, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0248: move-result                v5
024a: if-nez                     v5, +004h
024e: goto/16                    +0ach
0252: invoke-direct              v4, v6, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleGetCurrentAudioSource(Lio/flutter/plugin/common/MethodChannel$Result;)V
0258: return                     v3
025a: const-string               v2, "bleSourceCommitPeq"
025e: invoke-virtual             v0, v2, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0264: move-result                v0
0266: if-nez                     v0, +004h
026a: goto/16                    +09eh
026e: invoke-direct              v4, v5, v6, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleCommitPeq(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
0274: return                     v3
0276: const-string               v5, "bleSourceRelease"
027a: invoke-virtual             v0, v5, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0280: move-result                v5
0282: if-nez                     v5, +004h
0286: goto/16                    +090h
028a: iget-object                v5, v4, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->scanner Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchScanner;
028e: invoke-virtual             v5, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchScanner;->stopScan()V
0294: iget-object                v5, v4, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->client Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchClient;
0298: if-eqz                     v5, +005h
029c: invoke-virtual             v5, Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchClient;->close()V
02a2: const/4                    v5, 0
02a4: iput-object                v5, v4, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->client Lcom/moondroplab/moondrop/moondrop_app/native/ble/source/BleSourceSwitchClient;
02a8: iget-object                v0, v4, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->scanResults Ljava/util/LinkedHashMap;
02ac: invoke-virtual             v0, Ljava/util/LinkedHashMap;->clear()V
02b2: invoke-direct              v4, v6, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->resultSuccess(Lio/flutter/plugin/common/MethodChannel$Result; Ljava/lang/Object;)V
02b8: return                     v3
02ba: const-string               v2, "bleSourceSetAudioSourceAndWait"
02be: invoke-virtual             v0, v2, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
02c4: move-result                v0
02c6: if-nez                     v0, +004h
02ca: goto/16                    +06eh
02ce: invoke-direct              v4, v5, v6, v3, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleSetAudioSource(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result; Z)V
02d4: return                     v3
02d6: const-string               v2, "bleSourceGetPeqPoint"
02da: invoke-virtual             v0, v2, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
02e0: move-result                v0
02e2: if-nez                     v0, +003h
02e6: goto                       +60h
02e8: invoke-direct              v4, v5, v6, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleGetPeqPoint(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
02ee: return                     v3
02f0: const-string               v2, "bleSourceSetPeqPoint"
02f4: invoke-virtual             v0, v2, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
02fa: move-result                v0
02fc: if-nez                     v0, +003h
0300: goto                       +53h
0302: invoke-direct              v4, v5, v6, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleSetPeqPoint(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
0308: return                     v3
030a: const-string               v2, "bleSourceConnect"
030e: invoke-virtual             v0, v2, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0314: move-result                v0
0316: if-nez                     v0, +003h
031a: goto                       +46h
031c: invoke-direct              v4, v5, v6, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleConnect(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
0322: return                     v3
0324: const-string               v2, "bleSourceStartScan"
0328: invoke-virtual             v0, v2, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
032e: move-result                v0
0330: if-nez                     v0, +003h
0334: goto                       +39h
0336: invoke-direct              v4, v5, v6, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleStartScan(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
033c: return                     v3
033e: const-string               v5, "bleSourceGetMicGain"
0342: invoke-virtual             v0, v5, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0348: move-result                v5
034a: if-nez                     v5, +003h
034e: goto                       +2ch
0350: invoke-direct              v4, v6, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleGetMicGain(Lio/flutter/plugin/common/MethodChannel$Result;)V
0356: return                     v3
0358: const-string               v5, "bleSourceGetPeqConfig"
035c: invoke-virtual             v0, v5, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0362: move-result                v5
0364: if-nez                     v5, +003h
0368: goto                       +1fh
036a: invoke-direct              v4, v6, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleGetPeqConfig(Lio/flutter/plugin/common/MethodChannel$Result;)V
0370: return                     v3
0372: const-string               v5, "bleSourceGetRightEarbudSn"
0376: invoke-virtual             v0, v5, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
037c: move-result                v5
037e: if-nez                     v5, +003h
0382: goto                       +12h
0384: invoke-direct              v4, v6, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleGetRightEarbudSn(Lio/flutter/plugin/common/MethodChannel$Result;)V
038a: return                     v3
038c: const-string               v5, "bleSourceGetLeftEarbudSn"
0390: invoke-virtual             v0, v5, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0396: move-result                v5
0398: if-nez                     v5, +003h
039c: goto                       +5h
039e: invoke-direct              v4, v6, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BleSourceSwitchFlutterHandler;->handleGetLeftEarbudSn(Lio/flutter/plugin/common/MethodChannel$Result;)V
03a4: return                     v3
03a6: return                     v1
03a8: sparse-switch-payload      -70d91183 -600db0ee -58e48ec2 -4fbd0fda -4bb3e2b7 -33211d4c -30b8e6e0 -2b7147ec -2b2cf499 -2ad46e2f -25aa7051 -18bdf168 -14549a8a 827eb50 ff9685d 1eb98852 23b43d9a 25fed0c5 2ad07150 382d4758 3ccf1e13 3e70e65c 45f75c79 534a2292 57584115 65a3a9c9 69fe1688 6c66c337 71ae622b

Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BluetrumFotaHandler; otaStatusFail(I)V code_off=0x60e244
0000: const/4                    v0, 1
0002: if-eq                      v5, v0, +025h
0006: const/4                    v1, 2
0008: if-eq                      v5, v1, +01fh
000c: const/16                   v1, 11
0010: if-eq                      v5, v1, +018h
0014: const/16                   v1, 4097
0018: if-eq                      v5, v1, +011h
001c: packed-switch              v5, +0000056h
0022: const-string               v5, "Unknown error"
0026: goto                       +15h
0028: const-string               v5, "DataReader error"
002c: goto                       +12h
002e: const-string               v5, "TWS disconnected, Stopping..."
0032: goto                       +fh
0034: const-string               v5, "receive timeout"
0038: goto                       +ch
003a: const-string               v5, "Device refused"
003e: goto                       +9h
0040: const-string               v5, "CRC error"
0044: goto                       +6h
0046: const-string               v5, "Key not match"
004a: goto                       +3h
004c: const-string               v5, "Same firmware"
0050: iget-object                v1, v4, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BluetrumFotaHandler;->blueOTAMap Ljava/util/Map;
0054: const-string/jumbo         v2, state
005a: const-string               v3, "ERROR"
005e: invoke-interface           v1, v2, v3, Ljava/util/Map;->put(Ljava/lang/Object; Ljava/lang/Object;)Ljava/lang/Object;
0064: iget-object                v1, v4, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BluetrumFotaHandler;->blueOTAMap Ljava/util/Map;
0068: const/4                    v2, 0
006a: invoke-static              v2, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
0070: move-result-object         v2
0072: const-string               v3, "progress"
0076: invoke-interface           v1, v3, v2, Ljava/util/Map;->put(Ljava/lang/Object; Ljava/lang/Object;)Ljava/lang/Object;
007c: iget-object                v1, v4, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BluetrumFotaHandler;->blueOTAMap Ljava/util/Map;
0080: const-string               v2, "errorDescription"
0084: invoke-interface           v1, v2, v5, Ljava/util/Map;->put(Ljava/lang/Object; Ljava/lang/Object;)Ljava/lang/Object;
008a: invoke-direct              v4, v0, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BluetrumFotaHandler;->publishBlueOta(Z)V
0090: iget-object                v5, v4, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BluetrumFotaHandler;->bluetrumBluetoothManager Lux;
0094: instance-of                v0, v5, Lca4;
0098: const/4                    v1, 0
009a: if-eqz                     v0, +005h
009e: check-cast                 v5, Lca4;
00a2: goto                       +2h
00a4: move-object                v5, v1
00a6: if-eqz                     v5, +005h
00aa: invoke-virtual             v5, Lca4;->a()V
00b0: iget-object                v5, v4, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BluetrumFotaHandler;->abOta Lv0;
00b4: iget-object                v0, v5, Lv0;->c Lw0;
00b8: invoke-virtual             v0, Lw0;->g()V
00be: iput-object                v1, v5, Lv0;->a Lca4;
00c2: iput-object                v1, v4, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/BluetrumFotaHandler;->bluetrumBluetoothManager Lux;
00c6: return-void                
00c8: packed-switch-payload      1003 1004 1005

Lcom/moondroplab/moondrop/moondrop_app/native/handlers/DeviceInfoHandler; notifyTouchV3FeatureMissing()V code_off=0x61351c
0000: const-string               v0, "DeviceInfoHandler"
0004: const-string               v1, "TouchV3 FeatureID 0x1A was not enumerated by firmware"
0008: invoke-static              v0, v1, Landroid/util/Log;->w(Ljava/lang/String; Ljava/lang/String;)I
000e: iget-object                v2, v2, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/DeviceInfoHandler;->channel Lio/flutter/plugin/common/MethodChannel;
0012: sget-object                v0, Lcom/qualcomm/qti/gaiaclient/core/gaia/qtil/data/QTILFeature;->TOUCHV3 Lcom/qualcomm/qti/gaiaclient/core/gaia/qtil/data/QTILFeature;
0016: invoke-virtual             v0, Lcom/qualcomm/qti/gaiaclient/core/gaia/qtil/data/QTILFeature;->getValue()I
001c: move-result                v0
001e: invoke-static              v0, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
0024: move-result-object         v0
0026: const-string               v1, "featureId"
002a: invoke-static              v1, v0, Ljava/util/Collections;->singletonMap(Ljava/lang/Object; Ljava/lang/Object;)Ljava/util/Map;
0030: move-result-object         v0
0032: invoke-virtual             v0, Ljava/lang/Object;->getClass()Ljava/lang/Class;
0038: const-string/jumbo         v1, syncTouchV3FeatureMissing
003e: invoke-static              v2, v1, v0, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/MethodChannelMainKt;->invokeOnMain(Lio/flutter/plugin/common/MethodChannel; Ljava/lang/String; Ljava/lang/Object;)V
0044: return-void                

Lcom/moondroplab/moondrop/moondrop_app/native/handlers/JieliFotaHandler; handleStartJieliFota(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V code_off=0x614a64
0000: iget-object                v0, v11, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/JieliFotaHandler;->finishReleaseRunnable Ljava/lang/Runnable;
0004: const-string               v1, "ERROR"
0008: const/4                    v2, 0
000a: if-eqz                     v0, +00dh
000e: const-string               v12, "Previous OTA session is still finishing"
0012: invoke-direct              v11, v1, v2, v12, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/JieliFotaHandler;->emitState(Ljava/lang/String; I Ljava/lang/String;)V
0018: sget-object                v11, Ljava/lang/Boolean;->FALSE Ljava/lang/Boolean;
001c: invoke-interface           v13, v11, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
0022: return-void                
0024: invoke-static              Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;
002a: move-result-object         v0
002c: if-eqz                     v0, +143h
0030: invoke-virtual             v0, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z
0036: move-result                v0
0038: if-nez                     v0, +004h
003c: goto/16                    +13bh
0040: const-string/jumbo         v0, uriStr
0046: invoke-virtual             v12, v0, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;
004c: move-result-object         v0
004e: check-cast                 v0, Ljava/lang/String;
0052: invoke-direct              v11, v0, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/JieliFotaHandler;->normalizeFilePath(Ljava/lang/String;)Ljava/lang/String;
0058: move-result-object         v0
005a: const-string               v3, "address"
005e: invoke-virtual             v12, v3, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;
0064: move-result-object         v3
0066: check-cast                 v3, Ljava/lang/String;
006a: const/4                    v4, 0
006c: if-eqz                     v3, +00bh
0070: invoke-static              v3, Lke4;->u(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
0076: move-result-object         v3
0078: invoke-virtual             v3, Ljava/lang/Object;->toString()Ljava/lang/String;
007e: move-result-object         v3
0080: goto                       +2h
0082: move-object                v3, v4
0084: const-string               v5, ""
0088: if-nez                     v3, +003h
008c: move-object                v3, v5
008e: const-string               v6, "name"
0092: invoke-virtual             v12, v6, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;
0098: move-result-object         v6
009a: check-cast                 v6, Ljava/lang/String;
009e: if-eqz                     v6, +00ah
00a2: invoke-static              v6, Lke4;->u(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
00a8: move-result-object         v4
00aa: invoke-virtual             v4, Ljava/lang/Object;->toString()Ljava/lang/String;
00b0: move-result-object         v4
00b2: if-nez                     v4, +003h
00b6: goto                       +2h
00b8: move-object                v5, v4
00ba: const-string/jumbo         v4, transport
00c0: invoke-virtual             v12, v4, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;
00c6: move-result-object         v12
00c8: check-cast                 v12, Ljava/lang/String;
00cc: sget                       v4, Lw73;->a I
00d0: const-string/jumbo         v4, spp
00d6: invoke-virtual             v4, v12, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
00dc: move-result                v4
00de: const/4                    v6, 1
00e0: if-eqz                     v4, +004h
00e4: move                       v12, v6
00e6: goto                       +ch
00e8: const-string               v4, "gatt_over_edr"
00ec: invoke-virtual             v4, v12, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
00f2: move-result                v12
00f4: if-eqz                     v12, +004h
00f8: const/4                    v12, 2
00fa: goto                       +2h
00fc: move                       v12, v2
00fe: invoke-static              v0, Lke4;->k(Ljava/lang/CharSequence;)Z
0104: move-result                v4
0106: if-eqz                     v4, +00dh
010a: const-string               v12, "OTA file path is invalid"
010e: invoke-direct              v11, v1, v2, v12, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/JieliFotaHandler;->emitState(Ljava/lang/String; I Ljava/lang/String;)V
0114: sget-object                v11, Ljava/lang/Boolean;->FALSE Ljava/lang/Boolean;
0118: invoke-interface           v13, v11, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
011e: return-void                
0120: invoke-static              v3, Lke4;->k(Ljava/lang/CharSequence;)Z
0126: move-result                v4
0128: if-eqz                     v4, +00dh
012c: const-string               v12, "Bluetooth address is required for Jieli OTA"
0130: invoke-direct              v11, v1, v2, v12, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/JieliFotaHandler;->emitState(Ljava/lang/String; I Ljava/lang/String;)V
0136: sget-object                v11, Ljava/lang/Boolean;->FALSE Ljava/lang/Boolean;
013a: invoke-interface           v13, v11, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
0140: return-void                
0142: new-instance               v4, Ljava/io/File;
0146: invoke-direct              v4, v0, Ljava/io/File;-><init>(Ljava/lang/String;)V
014c: invoke-virtual             v4, Ljava/io/File;->exists()Z
0152: move-result                v7
0154: if-eqz                     v7, +0a0h
0158: invoke-virtual             v4, Ljava/io/File;->canRead()Z
015e: move-result                v7
0160: if-eqz                     v7, +09ah
0164: invoke-virtual             v4, Ljava/io/File;->length()J
016a: move-result-wide           v7
016c: const-wide/16              v9, 0
0170: cmp-long                   v4, v7, v9
0174: if-gtz                     v4, +004h
0178: goto/16                    +08eh
017c: invoke-direct              v11, v3, v5, v12, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/JieliFotaHandler;->initOtaManagerIfNeeded(Ljava/lang/String; Ljava/lang/String; I)Lf83;
0182: move-result-object         v4
0184: iget-boolean               v5, v4, Lf83;->l Z
0188: if-eqz                     v5, +00dh
018c: const-string               v12, "OTA is already running"
0190: invoke-direct              v11, v1, v2, v12, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/JieliFotaHandler;->emitState(Ljava/lang/String; I Ljava/lang/String;)V
0196: sget-object                v11, Ljava/lang/Boolean;->FALSE Ljava/lang/Boolean;
019a: invoke-interface           v13, v11, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
01a0: return-void                
01a2: invoke-direct              v11, v3, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/JieliFotaHandler;->getBluetoothDeviceById(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;
01a8: move-result-object         v5
01aa: if-nez                     v5, +011h
01ae: const-string               v12, "Bluetooth device not found: "
01b2: invoke-virtual             v12, v3, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
01b8: move-result-object         v12
01ba: invoke-direct              v11, v1, v2, v12, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/JieliFotaHandler;->emitState(Ljava/lang/String; I Ljava/lang/String;)V
01c0: sget-object                v11, Ljava/lang/Boolean;->FALSE Ljava/lang/Boolean;
01c4: invoke-interface           v13, v11, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
01ca: return-void                
01cc: if-ne                      v12, v6, +00dh
01d0: sget-object                v12, Lcom/moondroplab/moondrop/moondrop_app/BluetoothConnectionForegroundService;->Companion Lcom/moondroplab/moondrop/moondrop_app/BluetoothConnectionForegroundService$Companion;
01d4: iget-object                v1, v11, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/JieliFotaHandler;->context Landroid/content/Context;
01d8: const-string               v2, "jieli_ota_spp"
01dc: const-string               v3, "Jieli firmware update connection"
01e0: invoke-virtual             v12, v1, v2, v3, Lcom/moondroplab/moondrop/moondrop_app/BluetoothConnectionForegroundService$Companion;->acquire(Landroid/content/Context; Ljava/lang/String; Ljava/lang/String;)V
01e6: iput-object                v0, v11, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/JieliFotaHandler;->pendingOtaFilePath Ljava/lang/String;
01ea: new-instance               v12, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/JieliFotaHandler$handleStartJieliFota$1;
01ee: invoke-direct              v12, v11, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/JieliFotaHandler$handleStartJieliFota$1;-><init>(Lcom/moondroplab/moondrop/moondrop_app/native/handlers/JieliFotaHandler;)V
01f4: iput-object                v12, v4, Lf83;->A Lcom/moondroplab/moondrop/moondrop_app/native/handlers/JieliFotaHandler$handleStartJieliFota$1;
01f8: iget-boolean               v0, v4, Lf83;->B Z
01fc: invoke-interface           v12, v0, Lg83;->onCanStartOtaChanged(Z)V
0202: iget-object                v12, v4, Lf83;->x Lix;
0206: iget                       v0, v12, Lix;->e I
020a: if-ne                      v0, v6, +007h
020e: iget-object                v12, v12, Lix;->c Lda4;
0212: iget-object                v12, v12, Lda4;->f Landroid/bluetooth/BluetoothDevice;
0216: goto                       +5h
0218: iget-object                v12, v12, Lix;->b Liw;
021c: iget-object                v12, v12, Liw;->h Landroid/bluetooth/BluetoothDevice;
0220: new-instance               v0, Ljava/lang/StringBuilder;
0224: const-string               v1, "getConnectedDevice: "
0228: invoke-direct              v0, v1, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
022e: if-eqz                     v12, +007h
0232: invoke-virtual             v12, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;
0238: move-result-object         v1
023a: goto                       +3h
023c: const-string               v1, "null"
0240: invoke-virtual             v0, v1, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0246: invoke-virtual             v0, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
024c: move-result-object         v0
024e: const-string               v1, "OtaManager"
0252: invoke-static              v1, v0, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0258: if-eqz                     v12, +015h
025c: invoke-virtual             v12, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;
0262: move-result-object         v12
0264: invoke-virtual             v5, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;
026a: move-result-object         v0
026c: invoke-static              v12, v0, Lse4;->d(Ljava/lang/String; Ljava/lang/String;)Z
0272: move-result                v12
0274: if-nez                     v12, +003h
0278: goto                       +5h
027a: invoke-direct              v11, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/JieliFotaHandler;->prepareOtaAfterInitialization()V
0280: goto                       +4h
0282: invoke-virtual             v4, v5, Lf83;->n(Landroid/bluetooth/BluetoothDevice;)V
0288: sget-object                v11, Ljava/lang/Boolean;->TRUE Ljava/lang/Boolean;
028c: invoke-interface           v13, v11, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
0292: return-void                
0294: const-string               v12, "OTA file is unavailable: "
0298: invoke-virtual             v12, v0, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
029e: move-result-object         v12
02a0: invoke-direct              v11, v1, v2, v12, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/JieliFotaHandler;->emitState(Ljava/lang/String; I Ljava/lang/String;)V
02a6: sget-object                v11, Ljava/lang/Boolean;->FALSE Ljava/lang/Boolean;
02aa: invoke-interface           v13, v11, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
02b0: return-void                
02b2: const-string               v12, "Bluetooth is not available or not enabled"
02b6: invoke-direct              v11, v1, v2, v12, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/JieliFotaHandler;->emitState(Ljava/lang/String; I Ljava/lang/String;)V
02bc: sget-object                v11, Ljava/lang/Boolean;->FALSE Ljava/lang/Boolean;
02c0: invoke-interface           v13, v11, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
02c6: return-void                

Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler; K1(Lio/flutter/plugin/common/MethodChannel$Result; Ljava/lang/String;)V code_off=0x61b4d8
0000: invoke-static              v0, v1, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleGetSpvFirmwareVersion$lambda$0$0(Lio/flutter/plugin/common/MethodChannel$Result; Ljava/lang/String;)V
0006: return-void                

Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler; S(Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler; Lio/flutter/plugin/common/MethodChannel$Result;)Ltq4; code_off=0x616250
0000: invoke-static              v0, v1, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleGetSpvFirmwareVersion$lambda$0(Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler; Lio/flutter/plugin/common/MethodChannel$Result;)Ltq4;
0006: move-result-object         v0
0008: return-object              v0

Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler; X0(Lio/flutter/plugin/common/MethodChannel$Result; Ljava/lang/Exception;)V code_off=0x61b280
0000: invoke-static              v0, v1, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleGetSpvFirmwareVersion$lambda$0$1(Lio/flutter/plugin/common/MethodChannel$Result; Ljava/lang/Exception;)V
0006: return-void                

Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler; handleGetSpvFirmwareVersion$lambda$0(Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler; Lio/flutter/plugin/common/MethodChannel$Result;)Ltq4; code_off=0x616d84
0000: const/16                   v0, 12
0004: iget-object                v4, v4, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->usbCommunication Lns4;
0008: if-eqz                     v4, +024h
000c: iget-object                v4, v4, Lns4;->c Lha4;
0010: invoke-virtual             v4, v0, Lha4;->k(B)[B
0016: move-result-object         v4
0018: array-length               v1, v4
001a: const/4                    v2, 0
001c: invoke-static              v2, v1, v4, Lha4;->i(I I [B)Ljava/lang/String;
0022: move-result-object         v4
0024: new-instance               v1, Landroid/os/Handler;
0028: invoke-static              Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
002e: move-result-object         v2
0030: invoke-direct              v1, v2, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
0036: new-instance               v2, Lba4;
003a: const/16                   v3, 9
003e: invoke-direct              v2, v3, v5, v4, Lba4;-><init>(I Ljava/lang/Object; Ljava/lang/Object;)V
0044: invoke-virtual             v1, v2, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
004a: goto                       +33h
004c: move-exception             v4
004e: goto                       +9h
0050: const-string/jumbo         v4, usbCommunication
0056: invoke-static              v4, Ldf2;->e(Ljava/lang/String;)V
005c: const/4                    v4, 0
005e: throw                      v4
0060: invoke-virtual             v4, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;
0066: move-result-object         v1
0068: new-instance               v2, Ljava/lang/StringBuilder;
006c: const-string               v3, "[Handler] handleGetSpvFirmwareVersion exception: "
0070: invoke-direct              v2, v3, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
0076: invoke-virtual             v2, v1, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
007c: invoke-virtual             v2, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
0082: move-result-object         v1
0084: const-string               v2, "SPV"
0088: invoke-static              v2, v1, v4, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String; Ljava/lang/Throwable;)I
008e: new-instance               v1, Landroid/os/Handler;
0092: invoke-static              Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
0098: move-result-object         v2
009a: invoke-direct              v1, v2, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
00a0: new-instance               v2, Lys4;
00a4: invoke-direct              v2, v5, v4, v0, Lys4;-><init>(Lio/flutter/plugin/common/MethodChannel$Result; Ljava/lang/Exception; I)V
00aa: invoke-virtual             v1, v2, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
00b0: sget-object                v4, Ltq4;->a Ltq4;
00b4: return-object              v4

Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler; handleSyGetDeviceFWVersion(Lio/flutter/plugin/common/MethodChannel$Result;)V code_off=0x61d9e0
0000: new-instance               v1, Lcom/syna/FirmwareParam;
0004: invoke-direct              v1, Lcom/syna/FirmwareParam;-><init>()V
000a: invoke-static              Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->getUsb()Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;
0010: move-result-object         v0
0012: invoke-virtual             v0, v1, Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;->getFirmwareParam(Lcom/syna/FirmwareParam;)I
0018: move-result                v0
001a: if-nez                     v0, +009h
001e: invoke-virtual             v1, Lcom/syna/FirmwareParam;->getFirmware_version()Ljava/lang/String;
0024: move-result-object         v1
0026: invoke-interface           v2, v1, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
002c: return-void                

Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler; handleSyGetProduct(Lio/flutter/plugin/common/MethodChannel$Result;)V code_off=0x61db74
0000: new-instance               v1, Lcom/syna/FirmwareParam;
0004: invoke-direct              v1, Lcom/syna/FirmwareParam;-><init>()V
000a: invoke-static              Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->getUsb()Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;
0010: move-result-object         v0
0012: invoke-virtual             v0, v1, Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;->getFirmwareParam(Lcom/syna/FirmwareParam;)I
0018: move-result                v0
001a: if-nez                     v0, +009h
001e: invoke-virtual             v1, Lcom/syna/FirmwareParam;->getProduct()Ljava/lang/String;
0024: move-result-object         v1
0026: invoke-interface           v2, v1, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
002c: return-void                

Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler; handleMethod(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)Z code_off=0x6196b4
0000: invoke-virtual             v4, Ljava/lang/Object;->getClass()Ljava/lang/Class;
0006: invoke-virtual             v5, Ljava/lang/Object;->getClass()Ljava/lang/Class;
000c: iget-object                v0, v4, Lio/flutter/plugin/common/MethodCall;->method Ljava/lang/String;
0010: if-eqz                     v0, +4b1h
0014: invoke-virtual             v0, Ljava/lang/String;->hashCode()I
001a: move-result                v1
001c: const/4                    v2, 1
001e: sparse-switch              v1, +00004adh
0024: goto/16                    +4a7h
0028: const-string               v4, "comtureGetLedState"
002c: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0032: move-result                v4
0034: if-nez                     v4, +004h
0038: goto/16                    +49dh
003c: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleComtureGetLedState(Lio/flutter/plugin/common/MethodChannel$Result;)V
0042: return                     v2
0044: const-string/jumbo         v4, syGetProduct
004a: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0050: move-result                v4
0052: if-nez                     v4, +004h
0056: goto/16                    +48eh
005a: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSyGetProduct(Lio/flutter/plugin/common/MethodChannel$Result;)V
0060: return                     v2
0062: const-string               v1, "comtureSetLedState"
0066: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
006c: move-result                v0
006e: if-nez                     v0, +004h
0072: goto/16                    +480h
0076: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleComtureSetLedState(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
007c: return                     v2
007e: const-string               v4, "getJiuEq"
0082: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0088: move-result                v4
008a: if-nez                     v4, +004h
008e: goto/16                    +472h
0092: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleGetJiuEq(Lio/flutter/plugin/common/MethodChannel$Result;)V
0098: return                     v2
009a: const-string               v4, "getSpvSelectedPresetGain"
009e: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
00a4: move-result                v4
00a6: if-nez                     v4, +004h
00aa: goto/16                    +464h
00ae: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleGetSpvSelectedPresetGain(Lio/flutter/plugin/common/MethodChannel$Result;)V
00b4: return                     v2
00b6: const-string/jumbo         v1, setSpvPowerOffTimeout
00bc: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
00c2: move-result                v0
00c4: if-nez                     v0, +004h
00c8: goto/16                    +455h
00cc: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSetSpvPowerOffTimeout(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
00d2: return                     v2
00d4: const-string               v4, "comtureDisconnect"
00d8: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
00de: move-result                v4
00e0: if-nez                     v4, +004h
00e4: goto/16                    +447h
00e8: invoke-direct              v3, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleComtureDisconnect()V
00ee: return                     v2
00f0: const-string               v4, "getSpvLedState"
00f4: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
00fa: move-result                v4
00fc: if-nez                     v4, +004h
0100: goto/16                    +439h
0104: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleGetSpvLedState(Lio/flutter/plugin/common/MethodChannel$Result;)V
010a: return                     v2
010c: const-string/jumbo         v1, setSpvHeadTrackingState
0112: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0118: move-result                v0
011a: if-nez                     v0, +004h
011e: goto/16                    +42ah
0122: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSetSpvHeadTrackingState(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
0128: return                     v2
012a: const-string               v4, "comtureCheckIsConnected"
012e: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0134: move-result                v4
0136: if-nez                     v4, +004h
013a: goto/16                    +41ch
013e: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleComtureCheckIsConnected(Lio/flutter/plugin/common/MethodChannel$Result;)V
0144: return                     v2
0146: const-string               v1, "setJiuEq"
014a: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0150: move-result                v0
0152: if-nez                     v0, +004h
0156: goto/16                    +40eh
015a: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSetJiuEq(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
0160: return                     v2
0162: const-string/jumbo         v1, setSpvDacGain
0168: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
016e: move-result                v0
0170: if-nez                     v0, +004h
0174: goto/16                    +3ffh
0178: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSetSpvDacGain(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
017e: return                     v2
0180: const-string               v4, "comtureGetVolume"
0184: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
018a: move-result                v4
018c: if-nez                     v4, +004h
0190: goto/16                    +3f1h
0194: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleComtureGetVolume(Lio/flutter/plugin/common/MethodChannel$Result;)V
019a: return                     v2
019c: const-string/jumbo         v1, switchSpvCs43131Filter
01a2: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
01a8: move-result                v0
01aa: if-nez                     v0, +004h
01ae: goto/16                    +3e2h
01b2: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSwitchSpvCs43131Filter(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
01b8: return                     v2
01ba: const-string               v4, "probeAbUsbOtaReadOnly"
01be: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
01c4: move-result                v4
01c6: if-nez                     v4, +004h
01ca: goto/16                    +3d4h
01ce: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleProbeAbUsbOtaReadOnly(Lio/flutter/plugin/common/MethodChannel$Result;)V
01d4: return                     v2
01d6: const-string/jumbo         v1, spvDacLedSwitch
01dc: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
01e2: move-result                v0
01e4: if-nez                     v0, +004h
01e8: goto/16                    +3c5h
01ec: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSpvDacLedSwitch(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
01f2: return                     v2
01f4: const-string/jumbo         v1, setSpvPresetGain
01fa: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0200: move-result                v0
0202: if-nez                     v0, +004h
0206: goto/16                    +3b6h
020a: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSetSpvPresetGain(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
0210: return                     v2
0212: const-string/jumbo         v1, startSpvUpgrade
0218: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
021e: move-result                v0
0220: if-nez                     v0, +004h
0224: goto/16                    +3a7h
0228: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleStartSpvUpgrade(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
022e: return                     v2
0230: const-string               v1, "comtureSetVolume"
0234: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
023a: move-result                v0
023c: if-nez                     v0, +004h
0240: goto/16                    +399h
0244: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleComtureSetVolume(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
024a: return                     v2
024c: const-string/jumbo         v1, setSpvButtonActions
0252: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0258: move-result                v0
025a: if-nez                     v0, +004h
025e: goto/16                    +38ah
0262: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSetSpvButtonActions(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
0268: return                     v2
026a: const-string/jumbo         v1, setSpvAdcVol
0270: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0276: move-result                v0
0278: if-nez                     v0, +004h
027c: goto/16                    +37bh
0280: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSetSpvAdcVol(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
0286: return                     v2
0288: const-string               v4, "saveSpvPeq"
028c: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0292: move-result                v4
0294: if-nez                     v4, +004h
0298: goto/16                    +36dh
029c: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSaveSpvPeq(Lio/flutter/plugin/common/MethodChannel$Result;)V
02a2: return                     v2
02a4: const-string/jumbo         v4, syCheckIsUsbAvailable
02aa: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
02b0: move-result                v4
02b2: if-nez                     v4, +004h
02b6: goto/16                    +35eh
02ba: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSyCheckIsUsbAvailable(Lio/flutter/plugin/common/MethodChannel$Result;)V
02c0: return                     v2
02c2: const-string/jumbo         v1, setSpvMicGain
02c8: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
02ce: move-result                v0
02d0: if-nez                     v0, +004h
02d4: goto/16                    +34fh
02d8: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSetSpvMicGain(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
02de: return                     v2
02e0: const-string               v4, "getSpvStandbyTimeout"
02e4: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
02ea: move-result                v4
02ec: if-nez                     v4, +004h
02f0: goto/16                    +341h
02f4: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleGetSpvStandbyTimeout(Lio/flutter/plugin/common/MethodChannel$Result;)V
02fa: return                     v2
02fc: const-string/jumbo         v5, sySendEqParams
0302: invoke-virtual             v0, v5, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0308: move-result                v5
030a: if-nez                     v5, +004h
030e: goto/16                    +332h
0312: invoke-direct              v3, v4, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSySendEqParams(Lio/flutter/plugin/common/MethodCall;)V
0318: return                     v2
031a: const-string               v4, "comtureGetFilter"
031e: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0324: move-result                v4
0326: if-nez                     v4, +004h
032a: goto/16                    +324h
032e: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleComtureGetFilter(Lio/flutter/plugin/common/MethodChannel$Result;)V
0334: return                     v2
0336: const-string/jumbo         v4, spvCheckIsConnected
033c: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0342: move-result                v4
0344: if-nez                     v4, +004h
0348: goto/16                    +315h
034c: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSpvCheckIsConnected(Lio/flutter/plugin/common/MethodChannel$Result;)V
0352: return                     v2
0354: const-string               v1, "getSpvPeq"
0358: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
035e: move-result                v0
0360: if-nez                     v0, +004h
0364: goto/16                    +307h
0368: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleGetSpvPeq(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
036e: return                     v2
0370: const-string               v4, "enterSpvUpdateMode"
0374: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
037a: move-result                v4
037c: if-nez                     v4, +004h
0380: goto/16                    +2f9h
0384: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleEnterSpvUpdateMode(Lio/flutter/plugin/common/MethodChannel$Result;)V
038a: return                     v2
038c: const-string/jumbo         v4, syGetDeviceFWVersion
0392: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0398: move-result                v4
039a: if-nez                     v4, +004h
039e: goto/16                    +2eah
03a2: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSyGetDeviceFWVersion(Lio/flutter/plugin/common/MethodChannel$Result;)V
03a8: return                     v2
03aa: const-string               v4, "comtureConnectUsbDevice"
03ae: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
03b4: move-result                v4
03b6: if-nez                     v4, +004h
03ba: goto/16                    +2dch
03be: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleComtureConnectUsbDevice(Lio/flutter/plugin/common/MethodChannel$Result;)V
03c4: return                     v2
03c6: const-string               v4, "getSpvSpatialAudioInfo"
03ca: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
03d0: move-result                v4
03d2: if-nez                     v4, +004h
03d6: goto/16                    +2ceh
03da: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleGetSpvSpatialAudioInfo(Lio/flutter/plugin/common/MethodChannel$Result;)V
03e0: return                     v2
03e2: const-string               v1, "comtureSetFilter"
03e6: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
03ec: move-result                v0
03ee: if-nez                     v0, +004h
03f2: goto/16                    +2c0h
03f6: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleComtureSetFilter(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
03fc: return                     v2
03fe: const-string               v4, "getSpvDacGain"
0402: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0408: move-result                v4
040a: if-nez                     v4, +004h
040e: goto/16                    +2b2h
0412: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleGetSpvDacGain(Lio/flutter/plugin/common/MethodChannel$Result;)V
0418: return                     v2
041a: const-string/jumbo         v1, setSpvPeq
0420: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0426: move-result                v0
0428: if-nez                     v0, +004h
042c: goto/16                    +2a3h
0430: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSetSpvPeq(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
0436: return                     v2
0438: const-string/jumbo         v1, setSpvSpatialAudioEnabled
043e: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0444: move-result                v0
0446: if-nez                     v0, +004h
044a: goto/16                    +294h
044e: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSetSpvSpatialAudioEnabled(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
0454: return                     v2
0456: const-string/jumbo         v1, setSpvPowerTimeoutInfo
045c: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0462: move-result                v0
0464: if-nez                     v0, +004h
0468: goto/16                    +285h
046c: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSetSpvPowerTimeoutInfo(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
0472: return                     v2
0474: const-string/jumbo         v1, setSpvStandbyTimeout
047a: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0480: move-result                v0
0482: if-nez                     v0, +004h
0486: goto/16                    +276h
048a: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSetSpvStandbyTimeout(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
0490: return                     v2
0492: const-string/jumbo         v4, syGetProductName
0498: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
049e: move-result                v4
04a0: if-nez                     v4, +004h
04a4: goto/16                    +267h
04a8: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSyGetProductName(Lio/flutter/plugin/common/MethodChannel$Result;)V
04ae: return                     v2
04b0: const-string               v4, "getSpvMicGain"
04b4: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
04ba: move-result                v4
04bc: if-nez                     v4, +004h
04c0: goto/16                    +259h
04c4: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleGetSpvMicGain(Lio/flutter/plugin/common/MethodChannel$Result;)V
04ca: return                     v2
04cc: const-string/jumbo         v4, syRequestUsbPermission
04d2: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
04d8: move-result                v4
04da: if-nez                     v4, +004h
04de: goto/16                    +24ah
04e2: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSyRequestUsbPermission(Lio/flutter/plugin/common/MethodChannel$Result;)V
04e8: return                     v2
04ea: const-string               v1, "selectSpvEq"
04ee: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
04f4: move-result                v0
04f6: if-nez                     v0, +004h
04fa: goto/16                    +23ch
04fe: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSelectSpvEq(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
0504: return                     v2
0506: const-string               v4, "saveSpvDacAdcToFlash"
050a: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0510: move-result                v4
0512: if-nez                     v4, +004h
0516: goto/16                    +22eh
051a: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSaveSpvDacAdcToFlash(Lio/flutter/plugin/common/MethodChannel$Result;)V
0520: return                     v2
0522: const-string               v4, "getSpvSensorState"
0526: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
052c: move-result                v4
052e: if-nez                     v4, +004h
0532: goto/16                    +220h
0536: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleGetSpvSensorState(Lio/flutter/plugin/common/MethodChannel$Result;)V
053c: return                     v2
053e: const-string               v4, "getSpvPromptToneInfo"
0542: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0548: move-result                v4
054a: if-nez                     v4, +004h
054e: goto/16                    +212h
0552: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleGetSpvPromptToneInfo(Lio/flutter/plugin/common/MethodChannel$Result;)V
0558: return                     v2
055a: const-string               v4, "finishWebPeqWrite"
055e: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0564: move-result                v4
0566: if-nez                     v4, +004h
056a: goto/16                    +204h
056e: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleFinishWebPeqWrite(Lio/flutter/plugin/common/MethodChannel$Result;)V
0574: return                     v2
0576: const-string               v4, "getSpvAudioResourceInfo"
057a: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0580: move-result                v4
0582: if-nez                     v4, +004h
0586: goto/16                    +1f6h
058a: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleGetSpvAudioResourceInfo(Lio/flutter/plugin/common/MethodChannel$Result;)V
0590: return                     v2
0592: const-string               v4, "resetSpvFactorySettings"
0596: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
059c: move-result                v4
059e: if-nez                     v4, +004h
05a2: goto/16                    +1e8h
05a6: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleResetSpvFactorySettings(Lio/flutter/plugin/common/MethodChannel$Result;)V
05ac: return                     v2
05ae: const-string               v4, "getSpvSelectedEq"
05b2: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
05b8: move-result                v4
05ba: if-nez                     v4, +004h
05be: goto/16                    +1dah
05c2: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleGetSpvSelectedEq(Lio/flutter/plugin/common/MethodChannel$Result;)V
05c8: return                     v2
05ca: const-string/jumbo         v1, setSpvLedState
05d0: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
05d6: move-result                v0
05d8: if-nez                     v0, +004h
05dc: goto/16                    +1cbh
05e0: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSetSpvLedState(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
05e6: return                     v2
05e8: const-string               v1, "comtureSetGainLevel"
05ec: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
05f2: move-result                v0
05f4: if-nez                     v0, +004h
05f8: goto/16                    +1bdh
05fc: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleComtureSetGainLevel(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
0602: return                     v2
0604: const-string/jumbo         v1, updateAllSpvEqParamsToReg
060a: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0610: move-result                v0
0612: if-nez                     v0, +004h
0616: goto/16                    +1aeh
061a: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleUpdateAllSpvEqParamsToReg(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
0620: return                     v2
0622: const-string               v4, "physicalShutdown"
0626: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
062c: move-result                v4
062e: if-nez                     v4, +004h
0632: goto/16                    +1a0h
0636: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handlePhysicalShutdown(Lio/flutter/plugin/common/MethodChannel$Result;)V
063c: return                     v2
063e: const-string/jumbo         v1, setSpvPreGain
0644: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
064a: move-result                v0
064c: if-nez                     v0, +004h
0650: goto/16                    +191h
0654: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSetSpvPreGain(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
065a: return                     v2
065c: const-string               v4, "getSpvAdcVol"
0660: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0666: move-result                v4
0668: if-nez                     v4, +004h
066c: goto/16                    +183h
0670: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleGetSpvAdcVol(Lio/flutter/plugin/common/MethodChannel$Result;)V
0676: return                     v2
0678: const-string/jumbo         v1, setSpvPromptToneInfo
067e: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0684: move-result                v0
0686: if-nez                     v0, +004h
068a: goto/16                    +174h
068e: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSetSpvPromptToneInfo(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
0694: return                     v2
0696: const-string               v4, "getSpvCs43131WorkingMode"
069a: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
06a0: move-result                v4
06a2: if-nez                     v4, +004h
06a6: goto/16                    +166h
06aa: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleGetSpvCs43131WorkingMode(Lio/flutter/plugin/common/MethodChannel$Result;)V
06b0: return                     v2
06b2: const-string/jumbo         v4, syDisconnectFromService
06b8: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
06be: move-result                v4
06c0: if-nez                     v4, +004h
06c4: goto/16                    +157h
06c8: invoke-direct              v3, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSyDisconnectFromService()V
06ce: return                     v2
06d0: const-string               v4, "isSpvDacLedEnabled"
06d4: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
06da: move-result                v4
06dc: if-nez                     v4, +004h
06e0: goto/16                    +149h
06e4: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleIsSpvDacLedEnabled(Lio/flutter/plugin/common/MethodChannel$Result;)V
06ea: return                     v2
06ec: const-string/jumbo         v4, usbGetProductName
06f2: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
06f8: move-result                v4
06fa: if-nez                     v4, +004h
06fe: goto/16                    +13ah
0702: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleUsbGetProductName(Lio/flutter/plugin/common/MethodChannel$Result;)V
0708: return                     v2
070a: const-string               v4, "getDongleStatus"
070e: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0714: move-result                v4
0716: if-nez                     v4, +004h
071a: goto/16                    +12ch
071e: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleGetDongleStatus(Lio/flutter/plugin/common/MethodChannel$Result;)V
0724: return                     v2
0726: const-string               v4, "checkIsJiuConnected"
072a: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0730: move-result                v4
0732: if-nez                     v4, +004h
0736: goto/16                    +11eh
073a: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleCheckIsJiuConnected(Lio/flutter/plugin/common/MethodChannel$Result;)V
0740: return                     v2
0742: const-string               v4, "getSpvSkuSnInfo"
0746: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
074c: move-result                v4
074e: if-nez                     v4, +004h
0752: goto/16                    +110h
0756: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleGetSpvSkuSnInfo(Lio/flutter/plugin/common/MethodChannel$Result;)V
075c: return                     v2
075e: const-string/jumbo         v1, setSpvSensorState
0764: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
076a: move-result                v0
076c: if-nez                     v0, +004h
0770: goto/16                    +101h
0774: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSetSpvSensorState(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
077a: return                     v2
077c: const-string               v4, "getSpvPowerOffTimeout"
0780: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0786: move-result                v4
0788: if-nez                     v4, +004h
078c: goto/16                    +0f3h
0790: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleGetSpvPowerOffTimeout(Lio/flutter/plugin/common/MethodChannel$Result;)V
0796: return                     v2
0798: const-string               v4, "getSpvCs43131FilterType"
079c: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
07a2: move-result                v4
07a4: if-nez                     v4, +004h
07a8: goto/16                    +0e5h
07ac: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleGetSpvCs43131FilterType(Lio/flutter/plugin/common/MethodChannel$Result;)V
07b2: return                     v2
07b4: const-string               v4, "getSpvPowerTimeoutInfo"
07b8: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
07be: move-result                v4
07c0: if-nez                     v4, +004h
07c4: goto/16                    +0d7h
07c8: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleGetSpvPowerTimeoutInfo(Lio/flutter/plugin/common/MethodChannel$Result;)V
07ce: return                     v2
07d0: const-string               v4, "saveJiuRegs"
07d4: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
07da: move-result                v4
07dc: if-nez                     v4, +004h
07e0: goto/16                    +0c9h
07e4: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSaveJiuRegs(Lio/flutter/plugin/common/MethodChannel$Result;)V
07ea: return                     v2
07ec: const-string/jumbo         v1, setSpvAncMode
07f2: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
07f8: move-result                v0
07fa: if-nez                     v0, +004h
07fe: goto/16                    +0bah
0802: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSetSpvAncMode(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
0808: return                     v2
080a: const-string               v4, "getSpvPreGain"
080e: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0814: move-result                v4
0816: if-nez                     v4, +004h
081a: goto/16                    +0ach
081e: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleGetSpvPreGain(Lio/flutter/plugin/common/MethodChannel$Result;)V
0824: return                     v2
0826: const-string/jumbo         v5, sySavePeqParamsToFlash
082c: invoke-virtual             v0, v5, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0832: move-result                v5
0834: if-nez                     v5, +004h
0838: goto/16                    +09dh
083c: invoke-direct              v3, v4, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSySavePeqParamsToFlash(Lio/flutter/plugin/common/MethodCall;)V
0842: return                     v2
0844: const-string/jumbo         v1, setSpvAudioResource
084a: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0850: move-result                v0
0852: if-nez                     v0, +004h
0856: goto/16                    +08eh
085a: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSetSpvAudioResource(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
0860: return                     v2
0862: const-string/jumbo         v1, setSpvCs43131WorkingMode
0868: invoke-virtual             v0, v1, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
086e: move-result                v0
0870: if-nez                     v0, +004h
0874: goto/16                    +07fh
0878: invoke-direct              v3, v4, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSetSpvCs43131WorkingMode(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V
087e: return                     v2
0880: const-string/jumbo         v5, sySelectEqPreset
0886: invoke-virtual             v0, v5, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
088c: move-result                v5
088e: if-nez                     v5, +004h
0892: goto/16                    +070h
0896: invoke-direct              v3, v4, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSySelectEqPreset(Lio/flutter/plugin/common/MethodCall;)V
089c: return                     v2
089e: const-string               v4, "getSpvBatteryLevel"
08a2: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
08a8: move-result                v4
08aa: if-nez                     v4, +003h
08ae: goto                       +62h
08b0: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleGetSpvBatteryLevel(Lio/flutter/plugin/common/MethodChannel$Result;)V
08b6: return                     v2
08b8: const-string/jumbo         v5, sySaveEqParamsToFlash
08be: invoke-virtual             v0, v5, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
08c4: move-result                v5
08c6: if-nez                     v5, +003h
08ca: goto                       +54h
08cc: invoke-direct              v3, v4, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSySaveEqParamsToFlash(Lio/flutter/plugin/common/MethodCall;)V
08d2: return                     v2
08d4: const-string               v4, "getSpvButtonActions"
08d8: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
08de: move-result                v4
08e0: if-nez                     v4, +003h
08e4: goto                       +47h
08e6: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleGetSpvButtonActions(Lio/flutter/plugin/common/MethodChannel$Result;)V
08ec: return                     v2
08ee: const-string               v4, "resetSpvEq"
08f2: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
08f8: move-result                v4
08fa: if-nez                     v4, +003h
08fe: goto                       +3ah
0900: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleResetSpvEq(Lio/flutter/plugin/common/MethodChannel$Result;)V
0906: return                     v2
0908: const-string               v4, "getSpvAncMode"
090c: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0912: move-result                v4
0914: if-nez                     v4, +003h
0918: goto                       +2dh
091a: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleGetSpvAncMode(Lio/flutter/plugin/common/MethodChannel$Result;)V
0920: return                     v2
0922: const-string               v4, "getSpvFirmwareVersion"
0926: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
092c: move-result                v4
092e: if-nez                     v4, +003h
0932: goto                       +20h
0934: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleGetSpvFirmwareVersion(Lio/flutter/plugin/common/MethodChannel$Result;)V
093a: return                     v2
093c: const-string               v4, "comtureGetGainLevel"
0940: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0946: move-result                v4
0948: if-nez                     v4, +003h
094c: goto                       +13h
094e: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleComtureGetGainLevel(Lio/flutter/plugin/common/MethodChannel$Result;)V
0954: return                     v2
0956: const-string/jumbo         v4, syGetEqParamsFromFlash
095c: invoke-virtual             v0, v4, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
0962: move-result                v4
0964: if-nez                     v4, +003h
0968: goto                       +5h
096a: invoke-direct              v3, v5, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->handleSyGetEqParamsFromFlash(Lio/flutter/plugin/common/MethodChannel$Result;)V
0970: return                     v2
0972: const/4                    v3, 0
0974: return                     v3
0976: nop                        
0978: sparse-switch-payload      -72c187fc -6e1cb15c -67f9ca66 -6544536a -6496d7ca -6220b458 -612a9300 -58ac2c66 -5149c833 -4db62a55 -4b4e2eb3 -4b1092ca -44da3741 -3720055e -35bc71a8 -35646bf3 -347cdc51 -336e3d2c -2fc8b980 -2dfdca1d -2bf739fb -2961033b -22a67278 -1fbd9d13 -1eff5957 -1dc8dcc9 -1ca28765 -1c973f8a -16b5e935 -15987bb3 -1523cf1a -11c8f0e8 -10402ba3 -a7bfc76 -1c2e3fd -91f371 5b43504 7c76c27 840de74 c0fd3ff c2cd4a9 ce483aa cfb4a63 126da2ea 1621ebcb 18e05381 20cb1e38 22eacba5 233c7022 2722bc85 28afcda3 2904bec5 29ae0001 2dc1e8ad 2fb59799 338672b0 33ed8879 390de680 3a8bdf57 3b1f986f 3dd672d1 3f8f5080 3fbc80ea 41dbe0b4 42c4d827 436e5025 43c2c455 4bb3c892 4c2ea7cb 4e553eb3 4f8fa41b 5160be2e 5332f720 5457166c 574ab4e3 595a60e9 5e82fff1 63bd44e0 714253dc 74a4dcac 75a2a313 7712abbf 7aea4207
