
classes.dex: Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice; claimInterfaceByBaseClass()V code_off=0x59c510
0000: sget-object              v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
0004: if-eqz                   v0, +015h
0008: iget-object              v0, v2, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->mHidInterface Landroid/hardware/usb/UsbInterface;
000c: if-nez                   v0, +00dh
0010: sget-object              v0, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
0014: const-string             v1, "saveCustomEQ: mHidInterface is null, connect"
0018: invoke-static            v0, v1, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
001e: invoke-virtual           v2, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->reConnectUsbDeviceByApplication()I
0024: return-void              
0026: invoke-direct            v2, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->releaseInterfaceByBaseClass()V
002c: return-void              
002e: sget-object              v2, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
0032: const-string             v0, "saveCustomEQ: UsbConnection is null"
0036: invoke-static            v2, v0, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
003c: return-void              

classes.dex: Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice; releaseInterfaceByBaseClass()V code_off=0x59cad4
0000: sget-object              v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->mConnection Landroid/hardware/usb/UsbDeviceConnection;
0004: if-eqz                   v0, +00dh
0008: sget-object              v0, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
000c: const-string             v1, "saveCustomEQ: disConnectUsbDeviceByApplication"
0010: invoke-static            v0, v1, Landroid/util/Log;->d(Ljava/lang/String; Ljava/lang/String;)I
0016: invoke-virtual           v2, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->disConnectUsbDeviceByApplication()I
001c: return-void              
001e: sget-object              v2, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->TAG Ljava/lang/String;
0022: const-string             v0, "saveCustomEQ: UsbConnection is null"
0026: invoke-static            v2, v0, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String;)I
002c: return-void              

classes.dex: Lcom/conexant/conexantusbtypec/common/ApplicationData$freeman3EQParams; <clinit>()V code_off=0x59d54c
0000: const/16                 v0, 10
0004: new-array                v1, v0, [D
0008: fill-array-data          v1, +0000038h
000e: sput-object              v1, Lcom/conexant/conexantusbtypec/common/ApplicationData$freeman3EQParams;->Q_FACTOR [D
0012: new-array                v1, v0, [I
0016: fill-array-data          v1, +000005dh
001c: sput-object              v1, Lcom/conexant/conexantusbtypec/common/ApplicationData$freeman3EQParams;->FREQUENCY_ARRAY [I
0020: new-array                v1, v0, [I
0024: fill-array-data          v1, +000006eh
002a: sput-object              v1, Lcom/conexant/conexantusbtypec/common/ApplicationData$freeman3EQParams;->FILTER_TYPE [I
002e: new-array                v2, v0, [F
0032: fill-array-data          v2, +000007fh
0038: new-array                v3, v0, [F
003c: fill-array-data          v3, +0000092h
0042: new-array                v4, v0, [F
0046: fill-array-data          v4, +00000a5h
004c: new-array                v5, v0, [F
0050: fill-array-data          v5, +00000b8h
0056: new-array                v6, v0, [F
005a: fill-array-data          v6, +00000cbh
0060: new-array                v7, v0, [F
0064: fill-array-data          v7, +00000deh
006a: filled-new-array/range   v2 ... v7, [[F
0070: move-result-object       v0
0072: sput-object              v0, Lcom/conexant/conexantusbtypec/common/ApplicationData$freeman3EQParams;->PresetBandGainArray [[F
0076: return-void              
0078: fill-array-data-payload  b'\x00\x00\x00\x00\x00\x00\xf0?\x00\x00\x00\x00\x00\x00\xf0?\x00\x00\x00\x00\x00\x00\xf0?\x00\x00\x00\x00\x00\x00\xf0?\x00\x00\x00\x00\x00\x00\xf0?\x00\x00\x00\x00\x00\x00\xf0?\x00\x00\x00\x00\x00\x00\xf0?\x00\x00\x00\x00\x00\x00\xf0?\x00\x00\x00\x00\x00\x00\xf0?\x00\x00\x00\x00\x00\x00\xf0?' | \x00\x00\x00\x00\x00\x00\xf0\x3f\x00\x00\x00\x00\x00\x00\xf0\x3f\x00\x00\x00\x00\x00\x00\xf0\x3f\x00\x00\x00\x00\x00\x00\xf0\x3f\x00\x00\x00\x00\x00\x00\xf0\x3f\x00\x00\x00\x00\x00\x00\xf0\x3f\x00\x00\x00\x00\x00\x00\xf0\x3f\x00\x00\x00\x00\x00\x00\xf0\x3f\x00\x00\x00\x00\x00\x00\xf0\x3f\x00\x00\x00\x00\x00\x00\xf0\x3f
00d0: fill-array-data-payload  b"d\x00\x00\x00,\x01\x00\x00\xb0\x04\x00\x00\xd0\x07\x00\x00\x88\x13\x00\x00@\x1f\x00\x00\x10'\x00\x00\xb06\x00\x00PF\x00\x00 N\x00\x00" | \x64\x00\x00\x00\x2c\x01\x00\x00\xb0\x04\x00\x00\xd0\x07\x00\x00\x88\x13\x00\x00\x40\x1f\x00\x00\x10\x27\x00\x00\xb0\x36\x00\x00\x50\x46\x00\x00\x20\x4e\x00\x00
0100: fill-array-data-payload  b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' | \x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00
0130: fill-array-data-payload  b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' | \x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00
0160: fill-array-data-payload  b'\x00\x00\xa0@\x00\x00\x00@\x00\x00\x00\x00\x00\x00 \xc1\x00\x00\xa0\xc0\x00\x00\x00\x00\x00\x00\xa0@\x00\x00\x10A\x00\x000A\x00\x000A' | \x00\x00\xa0\x40\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x20\xc1\x00\x00\xa0\xc0\x00\x00\x00\x00\x00\x00\xa0\x40\x00\x00\x10\x41\x00\x00\x30\x41\x00\x00\x30\x41
0190: fill-array-data-payload  b'\x00\x00\xc0@\x00\x00@@\x00\x00\x00\xc1\x00\x00@\xc1\x00\x00\x80\xc0\x00\x00@@\x00\x00\x00A\x00\x00 A\x00\x00 A\x00\x00\xe0@' | \x00\x00\xc0\x40\x00\x00\x40\x40\x00\x00\x00\xc1\x00\x00\x40\xc1\x00\x00\x80\xc0\x00\x00\x40\x40\x00\x00\x00\x41\x00\x00\x20\x41\x00\x00\x20\x41\x00\x00\xe0\x40
01c0: fill-array-data-payload  b'\x00\x00\x00\xc1\x00\x00\xc0@\x00\x00\x00\x00\x00\x00\x00A\x00\x00\x00\xc1\x00\x00 A\x00\x00\x00\xc0\x00\x00@A\x00\x00\x00A\x00\x00\x80?' | \x00\x00\x00\xc1\x00\x00\xc0\x40\x00\x00\x00\x00\x00\x00\x00\x41\x00\x00\x00\xc1\x00\x00\x20\x41\x00\x00\x00\xc0\x00\x00\x40\x41\x00\x00\x00\x41\x00\x00\x80\x3f
01f0: fill-array-data-payload  b'\x00\x00@\xc1\x00\x00\x10\xc1\x00\x00\x80\xc0\x00\x00\x00@\x00\x00\x00A\x00\x00@A\x00\x00\x00@\x00\x000\xc1\x00\x00\x00\xc0\x00\x00\x00A' | \x00\x00\x40\xc1\x00\x00\x10\xc1\x00\x00\x80\xc0\x00\x00\x00\x40\x00\x00\x00\x41\x00\x00\x40\x41\x00\x00\x00\x40\x00\x00\x30\xc1\x00\x00\x00\xc0\x00\x00\x00\x41
0220: fill-array-data-payload  b'\x00\x00\x00\x00\x00\x00\xe0@\x00\x00\x80\xbf\x00\x00\xe0\xc0\x00\x00@\xc1\x00\x00\x00\xc1\x00\x00\x00\x00\x00\x00 A\x00\x00\x80@\x00\x00\xa0\xc0' | \x00\x00\x00\x00\x00\x00\xe0\x40\x00\x00\x80\xbf\x00\x00\xe0\xc0\x00\x00\x40\xc1\x00\x00\x00\xc1\x00\x00\x00\x00\x00\x00\x20\x41\x00\x00\x80\x40\x00\x00\xa0\xc0

classes.dex: Lcom/conexant/conexantusbtypec/common/ApplicationData$freemanEQParams; <clinit>()V code_off=0x59d7c4
0000: const/16                 v0, 3000
0004: const/16                 v1, 9000
0008: const/16                 v2, 100
000c: const/16                 v3, 300
0010: const/16                 v4, 1000
0014: filled-new-array         v2, v3, v4, v0, v1, [I
001a: move-result-object       v0
001c: sput-object              v0, Lcom/conexant/conexantusbtypec/common/ApplicationData$freemanEQParams;->FREQUENCY_ARRAY [I
0020: const/4                  v0, 0
0022: const/4                  v1, 2
0024: const/4                  v2, 1
0026: filled-new-array         v2, v0, v0, v0, v1, [I
002c: move-result-object       v0
002e: sput-object              v0, Lcom/conexant/conexantusbtypec/common/ApplicationData$freemanEQParams;->FILTER_TYPE [I
0032: const/4                  v0, 5
0034: new-array                v1, v0, [F
0038: fill-array-data          v1, +0000024h
003e: new-array                v2, v0, [F
0042: fill-array-data          v2, +000002dh
0048: new-array                v3, v0, [F
004c: fill-array-data          v3, +0000036h
0052: new-array                v4, v0, [F
0056: fill-array-data          v4, +000003fh
005c: new-array                v5, v0, [F
0060: fill-array-data          v5, +0000048h
0066: new-array                v6, v0, [F
006a: fill-array-data          v6, +0000051h
0070: filled-new-array/range   v1 ... v6, [[F
0076: move-result-object       v0
0078: sput-object              v0, Lcom/conexant/conexantusbtypec/common/ApplicationData$freemanEQParams;->PresetBandGainArray [[F
007c: return-void              
007e: nop                      
0080: fill-array-data-payload  b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' | \x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00
009c: fill-array-data-payload  b'\x00\x00\x00@\x00\x00 \xc1\x00\x00\x00\x00\x00\x00\x10A\x00\x000A' | \x00\x00\x00\x40\x00\x00\x20\xc1\x00\x00\x00\x00\x00\x00\x10\x41\x00\x00\x30\x41
00b8: fill-array-data-payload  b'\x00\x00@@\x00\x00@\xc1\x00\x00@@\x00\x00 A\x00\x00\xe0@' | \x00\x00\x40\x40\x00\x00\x40\xc1\x00\x00\x40\x40\x00\x00\x20\x41\x00\x00\xe0\x40
00d4: fill-array-data-payload  b'\x00\x00\xc0@\x00\x00\x00A\x00\x00 A\x00\x00@A\x00\x00\x80?' | \x00\x00\xc0\x40\x00\x00\x00\x41\x00\x00\x20\x41\x00\x00\x40\x41\x00\x00\x80\x3f
00f0: fill-array-data-payload  b'\x00\x00\x10\xc1\x00\x00\x00@\x00\x00@A\x00\x000\xc1\x00\x00\x00A' | \x00\x00\x10\xc1\x00\x00\x00\x40\x00\x00\x40\x41\x00\x00\x30\xc1\x00\x00\x00\x41
010c: fill-array-data-payload  b'\x00\x00\xe0@\x00\x00\xe0\xc0\x00\x00\x00\xc1\x00\x00 A\x00\x00\xa0\xc0' | \x00\x00\xe0\x40\x00\x00\xe0\xc0\x00\x00\x00\xc1\x00\x00\x20\x41\x00\x00\xa0\xc0

classes.dex: Lcom/conexant/conexantusbtypec/common/ApplicationData$wheelerEQParams; <clinit>()V code_off=0x59d914
0000: const/16                 v0, 10
0004: new-array                v1, v0, [I
0008: fill-array-data          v1, +0000032h
000e: sput-object              v1, Lcom/conexant/conexantusbtypec/common/ApplicationData$wheelerEQParams;->FREQUENCY_ARRAY [I
0012: new-array                v1, v0, [I
0016: fill-array-data          v1, +0000043h
001c: sput-object              v1, Lcom/conexant/conexantusbtypec/common/ApplicationData$wheelerEQParams;->FILTER_TYPE [I
0020: new-array                v2, v0, [F
0024: fill-array-data          v2, +0000054h
002a: new-array                v3, v0, [F
002e: fill-array-data          v3, +0000067h
0034: new-array                v4, v0, [F
0038: fill-array-data          v4, +000007ah
003e: new-array                v5, v0, [F
0042: fill-array-data          v5, +000008dh
0048: new-array                v6, v0, [F
004c: fill-array-data          v6, +00000a0h
0052: new-array                v7, v0, [F
0056: fill-array-data          v7, +00000b3h
005c: filled-new-array/range   v2 ... v7, [[F
0062: move-result-object       v0
0064: sput-object              v0, Lcom/conexant/conexantusbtypec/common/ApplicationData$wheelerEQParams;->PresetBandGainArray [[F
0068: return-void              
006a: nop                      
006c: fill-array-data-payload  b'd\x00\x00\x00N\x00\x00\x00}\x00\x00\x00\xfa\x00\x00\x00\xf4\x01\x00\x00\xe8\x03\x00\x00\xd0\x07\x00\x00\xa0\x0f\x00\x00@\x1f\x00\x00\xe0.\x00\x00' | \x64\x00\x00\x00\x4e\x00\x00\x00\x7d\x00\x00\x00\xfa\x00\x00\x00\xf4\x01\x00\x00\xe8\x03\x00\x00\xd0\x07\x00\x00\xa0\x0f\x00\x00\x40\x1f\x00\x00\xe0\x2e\x00\x00
009c: fill-array-data-payload  b'\x01\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00' | \x01\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00
00cc: fill-array-data-payload  b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' | \x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00
00fc: fill-array-data-payload  b'\x00\x00\xa0@\x00\x00\x00@\x00\x00\x00\x00\x00\x00 \xc1\x00\x00\xa0\xc0\x00\x00\x00\x00\x00\x00\xa0@\x00\x00\x10A\x00\x000A\x00\x000A' | \x00\x00\xa0\x40\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x20\xc1\x00\x00\xa0\xc0\x00\x00\x00\x00\x00\x00\xa0\x40\x00\x00\x10\x41\x00\x00\x30\x41\x00\x00\x30\x41
012c: fill-array-data-payload  b'\x00\x00\xc0@\x00\x00@@\x00\x00\x00\xc1\x00\x00@\xc1\x00\x00\x80\xc0\x00\x00@@\x00\x00\x00A\x00\x00 A\x00\x00 A\x00\x00\xe0@' | \x00\x00\xc0\x40\x00\x00\x40\x40\x00\x00\x00\xc1\x00\x00\x40\xc1\x00\x00\x80\xc0\x00\x00\x40\x40\x00\x00\x00\x41\x00\x00\x20\x41\x00\x00\x20\x41\x00\x00\xe0\x40
015c: fill-array-data-payload  b'\x00\x00\x00\xc1\x00\x00\xc0@\x00\x00\x00\x00\x00\x00\x00A\x00\x00\x00\xc1\x00\x00 A\x00\x00\x00\xc0\x00\x00@A\x00\x00\x00A\x00\x00\x80?' | \x00\x00\x00\xc1\x00\x00\xc0\x40\x00\x00\x00\x00\x00\x00\x00\x41\x00\x00\x00\xc1\x00\x00\x20\x41\x00\x00\x00\xc0\x00\x00\x40\x41\x00\x00\x00\x41\x00\x00\x80\x3f
018c: fill-array-data-payload  b'\x00\x00@\xc1\x00\x00\x10\xc1\x00\x00\x80\xc0\x00\x00\x00@\x00\x00\x00A\x00\x00@A\x00\x00\x00@\x00\x000\xc1\x00\x00\x00\xc0\x00\x00\x00A' | \x00\x00\x40\xc1\x00\x00\x10\xc1\x00\x00\x80\xc0\x00\x00\x00\x40\x00\x00\x00\x41\x00\x00\x40\x41\x00\x00\x00\x40\x00\x00\x30\xc1\x00\x00\x00\xc0\x00\x00\x00\x41
01bc: fill-array-data-payload  b'\x00\x00\x00\x00\x00\x00\xe0@\x00\x00\x80\xbf\x00\x00\xe0\xc0\x00\x00@\xc1\x00\x00\x00\xc1\x00\x00\x00\x00\x00\x00 A\x00\x00\x80@\x00\x00\xa0\xc0' | \x00\x00\x00\x00\x00\x00\xe0\x40\x00\x00\x80\xbf\x00\x00\xe0\xc0\x00\x00\x40\xc1\x00\x00\x00\xc1\x00\x00\x00\x00\x00\x00\x20\x41\x00\x00\x80\x40\x00\x00\xa0\xc0

classes.dex: Lcom/conexant/conexantusbtypec/svcimpl/FreemanController; saveEQParamsToFlash(Lcom/conexant/genericfeature/PersistEQParams;)I code_off=0x59e1bc
0000: iget-object              v0, v1, Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;->mUsbSession Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;
0004: invoke-virtual           v0, Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;->getSessionId()I
000a: move-result              v0
000c: invoke-static            v0, v2, Lcom/conexant/libcnxtservice/service/FreemanSession;->bldCmdSaveCustomEQList(I Lcom/conexant/genericfeature/PersistEQParams;)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0012: move-result-object       v2
0014: iget-object              v1, v1, Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;->mModuleId Ljava/lang/String;
0018: invoke-static            v1, v2, Lcom/conexant/libcnxtservice/ServiceUtils;->svcModuleCmd(Ljava/lang/String; Lcom/conexant/libcnxtservice/ServiceModuleCommand;)Z
001e: invoke-virtual           v2, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->getArg()J
0024: move-result-wide         v1
0026: long-to-int              v1, v1
0028: return                   v1

classes.dex: Lcom/conexant/conexantusbtypec/svcimpl/FreemanController; switchEQMode(I)I code_off=0x59e3b8
0000: iget-object              v0, v1, Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;->mModuleId Ljava/lang/String;
0004: iget-object              v1, v1, Lcom/conexant/conexantusbtypec/svcimpl/UsbControllerBase;->mUsbSession Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;
0008: invoke-virtual           v1, Lcom/conexant/libcnxtservice/service/UsbSessionDescriptor;->getSessionId()I
000e: move-result              v1
0010: invoke-static            v1, v2, Lcom/conexant/libcnxtservice/service/FreemanSession;->bldCmdSwitchEQMode(I I)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0016: move-result-object       v1
0018: invoke-static            v0, v1, Lcom/conexant/libcnxtservice/ServiceUtils;->svcModuleCmd(Ljava/lang/String; Lcom/conexant/libcnxtservice/ServiceModuleCommand;)Z
001e: move-result              v1
0020: if-eqz                   v1, +004h
0024: const/4                  v1, 0
0026: return                   v1
0028: const/16                 v1, -1001
002c: return                   v1

classes.dex: Lcom/conexant/conexantusbtypec/view/CustomTextView; onMeasure(I I)V code_off=0x5a04dc
0000: invoke-virtual           v2, Landroid/view/View;->getWidth()I
0006: move-result              v0
0008: if-lez                   v0, +019h
000c: invoke-virtual           v2, Landroid/view/View;->getHeight()I
0012: move-result              v0
0014: if-lez                   v0, +013h
0018: iget-boolean             v0, v2, Lcom/conexant/conexantusbtypec/view/CustomTextView;->mEnabled Z
001c: if-eqz                   v0, +00fh
0020: invoke-direct            v2, v2, Lcom/conexant/conexantusbtypec/view/CustomTextView;->autoSplitText(Landroid/widget/TextView;)Ljava/lang/CharSequence;
0026: move-result-object       v0
0028: invoke-static            v0, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
002e: move-result              v1
0030: if-nez                   v1, +005h
0034: invoke-virtual           v2, v0, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
003a: invoke-super             v2, v3, v4, Lei;->onMeasure(I I)V
0040: return-void              

classes.dex: Lcom/conexant/libcnxtservice/service/FreemanSession; executeCommand(Lcom/conexant/libcnxtservice/ServiceModuleCommand;)Z code_off=0x5a4888
0000: invoke-virtual           v5, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->getCommandId()I
0006: move-result              v0
0008: const/4                  v1, 1
000a: packed-switch            v0, +00000d1h
0010: const/4                  v4, 0
0012: return                   v4
0014: iget-object              v4, v4, Lcom/conexant/libcnxtservice/service/FreemanSession;->mFreeman Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;
0018: invoke-virtual           v5, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->getInputParam()Ljava/lang/Object;
001e: move-result-object       v0
0020: check-cast               v0, Lcom/conexant/genericfeature/PersistEQParams;
0024: invoke-virtual           v4, v0, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->getEQParamsFromFlash(Lcom/conexant/genericfeature/PersistEQParams;)I
002a: move-result              v4
002c: int-to-long              v2, v4
002e: invoke-virtual           v5, v2, v3, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->setArg(J)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0034: goto/16                  +0bah
0038: iget-object              v4, v4, Lcom/conexant/libcnxtservice/service/FreemanSession;->mFreeman Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;
003c: invoke-virtual           v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->resetDevice()V
0042: goto/16                  +0b3h
0046: iget-object              v4, v4, Lcom/conexant/libcnxtservice/service/FreemanSession;->mFreeman Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;
004a: invoke-virtual           v5, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->getInputParam()Ljava/lang/Object;
0050: move-result-object       v0
0052: check-cast               v0, Lcom/conexant/genericfeature/PersistEQParams;
0056: invoke-virtual           v4, v0, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->saveEQParamsToFlash(Lcom/conexant/genericfeature/PersistEQParams;)I
005c: move-result              v4
005e: int-to-long              v2, v4
0060: invoke-virtual           v5, v2, v3, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->setArg(J)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0066: goto/16                  +0a1h
006a: iget-object              v4, v4, Lcom/conexant/libcnxtservice/service/FreemanSession;->mFreeman Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;
006e: invoke-virtual           v5, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->getInputParam()Ljava/lang/Object;
0074: move-result-object       v0
0076: check-cast               v0, Lcom/conexant/genericfeature/FeatureConfigFM3;
007a: invoke-virtual           v4, v0, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->getFeatureConfigFM3(Lcom/conexant/genericfeature/FeatureConfigFM3;)I
0080: move-result              v4
0082: int-to-long              v2, v4
0084: invoke-virtual           v5, v2, v3, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->setArg(J)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
008a: goto/16                  +08fh
008e: iget-object              v4, v4, Lcom/conexant/libcnxtservice/service/FreemanSession;->mFreeman Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;
0092: invoke-virtual           v5, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->getArg()J
0098: move-result-wide         v2
009a: long-to-int              v0, v2
009c: invoke-virtual           v4, v0, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->switchEQMode(I)I
00a2: move-result              v4
00a4: int-to-long              v2, v4
00a6: invoke-virtual           v5, v2, v3, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->setArg(J)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
00ac: goto/16                  +07eh
00b0: iget-object              v4, v4, Lcom/conexant/libcnxtservice/service/FreemanSession;->mFreeman Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;
00b4: invoke-virtual           v4, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->getDeviceChipCode()I
00ba: move-result              v4
00bc: int-to-long              v2, v4
00be: invoke-virtual           v5, v2, v3, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->setArg(J)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
00c4: goto/16                  +072h
00c8: new-instance             v0, Lcom/conexant/cnxtusbcheadset/EQCoeffsList;
00cc: iget-object              v4, v4, Lcom/conexant/libcnxtservice/service/FreemanSession;->mFreeman Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;
00d0: invoke-virtual           v4, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->getF3EQCoefficientList()Ljava/util/List;
00d6: move-result-object       v4
00d8: invoke-direct            v0, v4, Lcom/conexant/cnxtusbcheadset/EQCoeffsList;-><init>(Ljava/util/List;)V
00de: invoke-virtual           v5, v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->setOutputParam(Landroid/os/Parcelable;)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
00e4: goto                     +62h
00e6: new-instance             v0, Lcom/conexant/genericfeature/PersistEQParams;
00ea: iget-object              v4, v4, Lcom/conexant/libcnxtservice/service/FreemanSession;->mFreeman Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;
00ee: invoke-virtual           v4, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->getEQParamList()Ljava/util/List;
00f4: move-result-object       v4
00f6: invoke-direct            v0, v4, Lcom/conexant/genericfeature/PersistEQParams;-><init>(Ljava/util/List;)V
00fc: invoke-virtual           v5, v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->setOutputParam(Landroid/os/Parcelable;)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0102: goto                     +53h
0104: iget-object              v4, v4, Lcom/conexant/libcnxtservice/service/FreemanSession;->mFreeman Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;
0108: invoke-virtual           v4, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->getUpdateFwProgress()I
010e: move-result              v4
0110: int-to-long              v2, v4
0112: invoke-virtual           v5, v2, v3, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->setArg(J)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0118: goto                     +48h
011a: new-instance             v0, Lcom/conexant/cnxtusbcheadset/GenericReturnValue;
011e: iget-object              v4, v4, Lcom/conexant/libcnxtservice/service/FreemanSession;->mFreeman Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;
0122: invoke-virtual           v5, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->getInputParam()Ljava/lang/Object;
0128: move-result-object       v2
012a: check-cast               v2, Lcom/conexant/libcnxtservice/StringParcelable;
012e: iget-object              v2, v2, Lcom/conexant/libcnxtservice/StringParcelable;->mString Ljava/lang/String;
0132: invoke-virtual           v4, v2, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->updateFirmware(Ljava/lang/String;)Lcom/conexant/cnxtusbcheadset/GenericReturnValue;
0138: move-result-object       v4
013a: invoke-direct            v0, v4, Lcom/conexant/cnxtusbcheadset/GenericReturnValue;-><init>(Lcom/conexant/cnxtusbcheadset/GenericReturnValue;)V
0140: invoke-virtual           v5, v0, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->setOutputParam(Landroid/os/Parcelable;)Lcom/conexant/libcnxtservice/ServiceModuleCommand;
0146: goto                     +31h
0148: iget-object              v4, v4, Lcom/conexant/libcnxtservice/service/FreemanSession;->mFreeman Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;
014c: invoke-virtual           v5, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->getInputParam()Ljava/lang/Object;
0152: move-result-object       v5
0154: check-cast               v5, Lcom/syna/FirmwareParam;
0158: invoke-virtual           v4, v5, Lcom/conexant/cnxtusbcheadset/CnxtUsbDeviceBase;->getFirmwareParam(Lcom/syna/FirmwareParam;)V
015e: goto                     +25h
0160: iget-object              v4, v4, Lcom/conexant/libcnxtservice/service/FreemanSession;->mFreeman Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;
0164: invoke-virtual           v5, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->getInputParam()Ljava/lang/Object;
016a: move-result-object       v5
016c: check-cast               v5, Lcom/conexant/genericfeature/EQParam;
0170: invoke-virtual           v4, v5, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->getEQParam(Lcom/conexant/genericfeature/EQParam;)V
0176: goto                     +19h
0178: iget-object              v0, v4, Lcom/conexant/libcnxtservice/service/FreemanSession;->mFreeman Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;
017c: invoke-virtual           v0, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->getEQEnabled()Z
0182: move-result              v0
0184: if-nez                   v0, +007h
0188: iget-object              v0, v4, Lcom/conexant/libcnxtservice/service/FreemanSession;->mFreeman Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;
018c: invoke-virtual           v0, v1, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->setEQEnabled(Z)V
0192: iget-object              v4, v4, Lcom/conexant/libcnxtservice/service/FreemanSession;->mFreeman Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;
0196: invoke-virtual           v5, Lcom/conexant/libcnxtservice/ServiceModuleCommand;->getInputParam()Ljava/lang/Object;
019c: move-result-object       v5
019e: check-cast               v5, Lcom/conexant/genericfeature/EQParam;
01a2: invoke-virtual           v4, v5, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;->setEQParam(Lcom/conexant/genericfeature/EQParam;)I
01a8: return                   v1
01aa: nop                      
01ac: packed-switch-payload    1 2 3 4 5 6 7 8 9 a b c d e f 10 11 12 13 14 15 16 17 18 19 1a 1b

classes.dex: Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler; handleSyGetEqParamsFromFlash(Lio/flutter/plugin/common/MethodChannel$Result;)V code_off=0x61da20
0000: invoke-static            Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->getUsbEQ()Lcom/conexant/genericfeature/IEqualizer;
0006: move-result-object       v13
0008: if-eqz                   v13, +09dh
000c: new-instance             v0, Lcom/conexant/genericfeature/PersistEQParams;
0010: invoke-direct            v0, Lcom/conexant/genericfeature/PersistEQParams;-><init>()V
0016: invoke-interface         v13, v0, Lcom/conexant/genericfeature/IEqualizer;->getEQParamsFromFlash(Lcom/conexant/genericfeature/PersistEQParams;)I
001c: move-result              v13
001e: if-eqz                   v13, +004h
0022: goto/16                  +090h
0026: iget                     v13, v0, Lcom/conexant/genericfeature/PersistEQParams;->eqModeIndex I
002a: const/16                 v1, 9
002e: new-array                v2, v1, [I
0032: new-array                v3, v1, [I
0036: new-array                v4, v1, [D
003a: new-array                v5, v1, [D
003e: new-array                v6, v1, [I
0042: iget-object              v0, v0, Lcom/conexant/genericfeature/PersistEQParams;->eqParams Ljava/util/List;
0046: const/4                  v7, 0
0048: move                     v8, v7
004a: if-ge                    v8, v1, +043h
004e: invoke-interface         v0, v8, Ljava/util/List;->get(I)Ljava/lang/Object;
0054: move-result-object       v9
0056: check-cast               v9, Lcom/conexant/genericfeature/EQParam;
005a: iget                     v9, v9, Lcom/conexant/genericfeature/EQParam;->band I
005e: aput                     v9, v2, v8
0062: invoke-interface         v0, v8, Ljava/util/List;->get(I)Ljava/lang/Object;
0068: move-result-object       v9
006a: check-cast               v9, Lcom/conexant/genericfeature/EQParam;
006e: iget                     v9, v9, Lcom/conexant/genericfeature/EQParam;->frequency I
0072: aput                     v9, v3, v8
0076: invoke-interface         v0, v8, Ljava/util/List;->get(I)Ljava/lang/Object;
007c: move-result-object       v9
007e: check-cast               v9, Lcom/conexant/genericfeature/EQParam;
0082: iget-wide                v9, v9, Lcom/conexant/genericfeature/EQParam;->gain D
0086: aput-wide                v9, v4, v8
008a: invoke-interface         v0, v8, Ljava/util/List;->get(I)Ljava/lang/Object;
0090: move-result-object       v9
0092: check-cast               v9, Lcom/conexant/genericfeature/EQParam;
0096: iget-wide                v9, v9, Lcom/conexant/genericfeature/EQParam;->qFactor D
009a: aput-wide                v9, v5, v8
009e: invoke-interface         v0, v8, Ljava/util/List;->get(I)Ljava/lang/Object;
00a4: move-result-object       v9
00a6: check-cast               v9, Lcom/conexant/genericfeature/EQParam;
00aa: iget                     v9, v9, Lcom/conexant/genericfeature/EQParam;->filterType I
00ae: if-eqz                   v9, +00bh
00b2: invoke-interface         v0, v8, Ljava/util/List;->get(I)Ljava/lang/Object;
00b8: move-result-object       v9
00ba: check-cast               v9, Lcom/conexant/genericfeature/EQParam;
00be: iget                     v9, v9, Lcom/conexant/genericfeature/EQParam;->filterType I
00c2: goto                     +2h
00c4: move                     v9, v7
00c6: aput                     v9, v6, v8
00ca: add-int/lit8             v8, v8, 1
00ce: goto                     -42h
00d0: invoke-static            v13, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
00d6: move-result-object       v13
00d8: new-instance             v7, Lr93;
00dc: const-string             v0, "presetEQModeIndex"
00e0: invoke-direct            v7, v0, v13, Lr93;-><init>(Ljava/lang/Object; Ljava/lang/Object;)V
00e6: new-instance             v8, Lr93;
00ea: const-string             v13, "bandArray"
00ee: invoke-direct            v8, v13, v2, Lr93;-><init>(Ljava/lang/Object; Ljava/lang/Object;)V
00f4: new-instance             v9, Lr93;
00f8: const-string             v13, "freqArray"
00fc: invoke-direct            v9, v13, v3, Lr93;-><init>(Ljava/lang/Object; Ljava/lang/Object;)V
0102: new-instance             v10, Lr93;
0106: const-string             v13, "gainArray"
010a: invoke-direct            v10, v13, v4, Lr93;-><init>(Ljava/lang/Object; Ljava/lang/Object;)V
0110: new-instance             v11, Lr93;
0114: const-string             v13, "qArray"
0118: invoke-direct            v11, v13, v5, Lr93;-><init>(Ljava/lang/Object; Ljava/lang/Object;)V
011e: new-instance             v12, Lr93;
0122: const-string             v13, "filterArray"
0126: invoke-direct            v12, v13, v6, Lr93;-><init>(Ljava/lang/Object; Ljava/lang/Object;)V
012c: filled-new-array/range   v7 ... v12, [Lr93;
0132: move-result-object       v13
0134: invoke-static            v13, Lgq2;->c([Lr93;)Ljava/util/Map;
013a: move-result-object       v13
013c: invoke-interface         v14, v13, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
0142: return-void              

classes.dex: Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler; handleSySaveEqParamsToFlash(Lio/flutter/plugin/common/MethodCall;)V code_off=0x61dc4c
0000: const-string             v10, "selectedMode"
0004: invoke-virtual           v11, v10, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;
000a: move-result-object       v10
000c: instance-of              v11, v10, Ljava/lang/Integer;
0010: if-eqz                   v11, +005h
0014: check-cast               v10, Ljava/lang/Integer;
0018: goto                     +2h
001a: const/4                  v10, 0
001c: const/16                 v11, 9
0020: new-array                v0, v11, [D
0024: fill-array-data          v0, +0000058h
002a: new-array                v1, v11, [I
002e: fill-array-data          v1, +000007bh
0034: new-array                v2, v11, [D
0038: fill-array-data          v2, +000008ch
003e: new-instance             v3, Lcom/conexant/genericfeature/PersistEQParams;
0042: invoke-direct            v3, Lcom/conexant/genericfeature/PersistEQParams;-><init>()V
0048: invoke-virtual           v10, Ljava/lang/Object;->getClass()Ljava/lang/Class;
004e: invoke-virtual           v10, Ljava/lang/Integer;->intValue()I
0054: move-result              v4
0056: iput                     v4, v3, Lcom/conexant/genericfeature/PersistEQParams;->eqModeIndex I
005a: invoke-virtual           v10, Ljava/lang/Integer;->intValue()I
0060: move-result              v10
0062: if-nez                   v10, +02eh
0066: new-instance             v10, Ljava/util/ArrayList;
006a: invoke-direct            v10, Ljava/util/ArrayList;-><init>()V
0070: const/4                  v4, 0
0072: move                     v5, v4
0074: if-ge                    v5, v11, +023h
0078: new-instance             v6, Lcom/conexant/genericfeature/EQParam;
007c: invoke-direct            v6, Lcom/conexant/genericfeature/EQParam;-><init>()V
0082: const                    v7, 48000
0088: iput                     v7, v6, Lcom/conexant/genericfeature/EQParam;->sampleRate I
008c: add-int/lit8             v7, v5, 1
0090: iput                     v7, v6, Lcom/conexant/genericfeature/EQParam;->band I
0094: aget-wide                v8, v0, v5
0098: iput-wide                v8, v6, Lcom/conexant/genericfeature/EQParam;->qFactor D
009c: aget                     v8, v1, v5
00a0: iput                     v8, v6, Lcom/conexant/genericfeature/EQParam;->frequency I
00a4: aget-wide                v8, v2, v5
00a8: iput-wide                v8, v6, Lcom/conexant/genericfeature/EQParam;->gain D
00ac: iput                     v4, v6, Lcom/conexant/genericfeature/EQParam;->filterType I
00b0: invoke-interface         v10, v6, Ljava/util/List;->add(Ljava/lang/Object;)Z
00b6: move                     v5, v7
00b8: goto                     -22h
00ba: iput-object              v10, v3, Lcom/conexant/genericfeature/PersistEQParams;->eqParams Ljava/util/List;
00be: invoke-static            Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->getUsbEQ()Lcom/conexant/genericfeature/IEqualizer;
00c4: move-result-object       v10
00c6: if-eqz                   v10, +005h
00ca: invoke-interface         v10, v3, Lcom/conexant/genericfeature/IEqualizer;->saveEQParamsToFlash(Lcom/conexant/genericfeature/PersistEQParams;)I
00d0: return-void              
00d2: nop                      
00d4: fill-array-data-payload  b'ffffff\xe6?ffffff\xe6?ffffff\xe6?ffffff\xe6?ffffff\xe6?ffffff\xe6?ffffff\xe6?ffffff\xe6?ffffff\xe6?' | \x66\x66\x66\x66\x66\x66\xe6\x3f\x66\x66\x66\x66\x66\x66\xe6\x3f\x66\x66\x66\x66\x66\x66\xe6\x3f\x66\x66\x66\x66\x66\x66\xe6\x3f\x66\x66\x66\x66\x66\x66\xe6\x3f\x66\x66\x66\x66\x66\x66\xe6\x3f\x66\x66\x66\x66\x66\x66\xe6\x3f\x66\x66\x66\x66\x66\x66\xe6\x3f\x66\x66\x66\x66\x66\x66\xe6\x3f
0124: fill-array-data-payload  b'd\x00\x00\x00n\x00\x00\x00x\x00\x00\x00\xa0\x00\x00\x00@\x01\x00\x00\x80\x02\x00\x00\xe8\x03\x00\x00\x08\x07\x00\x00\xd0\x07\x00\x00' | \x64\x00\x00\x00\x6e\x00\x00\x00\x78\x00\x00\x00\xa0\x00\x00\x00\x40\x01\x00\x00\x80\x02\x00\x00\xe8\x03\x00\x00\x08\x07\x00\x00\xd0\x07\x00\x00
0150: fill-array-data-payload  b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' | \x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00

classes.dex: Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler; handleSySavePeqParamsToFlash(Lio/flutter/plugin/common/MethodCall;)V code_off=0x61ddfc
0000: const-string             v0, "selectedMode"
0004: invoke-virtual           v11, v0, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;
000a: move-result-object       v0
000c: instance-of              v1, v0, Ljava/lang/Integer;
0010: const/4                  v2, 0
0012: if-eqz                   v1, +005h
0016: check-cast               v0, Ljava/lang/Integer;
001a: goto                     +2h
001c: move-object              v0, v2
001e: const-string             v1, "qArray"
0022: invoke-virtual           v11, v1, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;
0028: move-result-object       v1
002a: instance-of              v3, v1, [D
002e: if-eqz                   v3, +005h
0032: check-cast               v1, [D
0036: goto                     +2h
0038: move-object              v1, v2
003a: const-string             v3, "freqArray"
003e: invoke-virtual           v11, v3, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;
0044: move-result-object       v3
0046: instance-of              v4, v3, [I
004a: if-eqz                   v4, +005h
004e: check-cast               v3, [I
0052: goto                     +2h
0054: move-object              v3, v2
0056: const-string             v4, "gainArray"
005a: invoke-virtual           v11, v4, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;
0060: move-result-object       v4
0062: instance-of              v5, v4, [D
0066: if-eqz                   v5, +005h
006a: check-cast               v4, [D
006e: goto                     +2h
0070: move-object              v4, v2
0072: const-string             v5, "filterArray"
0076: invoke-virtual           v11, v5, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;
007c: move-result-object       v11
007e: instance-of              v5, v11, [I
0082: if-eqz                   v5, +005h
0086: move-object              v2, v11
0088: check-cast               v2, [I
008c: new-instance             v11, Lcom/conexant/genericfeature/PersistEQParams;
0090: invoke-direct            v11, Lcom/conexant/genericfeature/PersistEQParams;-><init>()V
0096: iget-object              v10, v10, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->context Landroid/content/Context;
009a: const-string             v5, "audio"
009e: invoke-virtual           v10, v5, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
00a4: move-result-object       v10
00a6: invoke-virtual           v10, Ljava/lang/Object;->getClass()Ljava/lang/Class;
00ac: check-cast               v10, Landroid/media/AudioManager;
00b0: invoke-virtual           v0, Ljava/lang/Object;->getClass()Ljava/lang/Class;
00b6: invoke-virtual           v0, Ljava/lang/Integer;->intValue()I
00bc: move-result              v5
00be: iput                     v5, v11, Lcom/conexant/genericfeature/PersistEQParams;->eqModeIndex I
00c2: invoke-virtual           v0, Ljava/lang/Integer;->intValue()I
00c8: move-result              v0
00ca: if-nez                   v0, +04bh
00ce: new-instance             v0, Ljava/util/ArrayList;
00d2: invoke-direct            v0, Ljava/util/ArrayList;-><init>()V
00d8: const/4                  v5, 0
00da: const/16                 v6, 9
00de: if-ge                    v5, v6, +03fh
00e2: new-instance             v6, Lcom/conexant/genericfeature/EQParam;
00e6: invoke-direct            v6, Lcom/conexant/genericfeature/EQParam;-><init>()V
00ec: const-string             v7, "android.media.property.OUTPUT_SAMPLE_RATE"
00f0: invoke-virtual           v10, v7, Landroid/media/AudioManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;
00f6: move-result-object       v7
00f8: invoke-static            v7, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;
00fe: move-result-object       v7
0100: invoke-virtual           v7, Ljava/lang/Object;->getClass()Ljava/lang/Class;
0106: invoke-virtual           v7, Ljava/lang/Number;->intValue()I
010c: move-result              v7
010e: iput                     v7, v6, Lcom/conexant/genericfeature/EQParam;->sampleRate I
0112: add-int/lit8             v7, v5, 1
0116: iput                     v7, v6, Lcom/conexant/genericfeature/EQParam;->band I
011a: invoke-virtual           v1, Ljava/lang/Object;->getClass()Ljava/lang/Class;
0120: aget-wide                v8, v1, v5
0124: iput-wide                v8, v6, Lcom/conexant/genericfeature/EQParam;->qFactor D
0128: invoke-virtual           v3, Ljava/lang/Object;->getClass()Ljava/lang/Class;
012e: aget                     v8, v3, v5
0132: iput                     v8, v6, Lcom/conexant/genericfeature/EQParam;->frequency I
0136: invoke-virtual           v4, Ljava/lang/Object;->getClass()Ljava/lang/Class;
013c: aget-wide                v8, v4, v5
0140: iput-wide                v8, v6, Lcom/conexant/genericfeature/EQParam;->gain D
0144: invoke-virtual           v2, Ljava/lang/Object;->getClass()Ljava/lang/Class;
014a: aget                     v5, v2, v5
014e: iput                     v5, v6, Lcom/conexant/genericfeature/EQParam;->filterType I
0152: invoke-interface         v0, v6, Ljava/util/List;->add(Ljava/lang/Object;)Z
0158: move                     v5, v7
015a: goto                     -40h
015c: iput-object              v0, v11, Lcom/conexant/genericfeature/PersistEQParams;->eqParams Ljava/util/List;
0160: invoke-static            Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->getUsbEQ()Lcom/conexant/genericfeature/IEqualizer;
0166: move-result-object       v10
0168: if-eqz                   v10, +005h
016c: invoke-interface         v10, v11, Lcom/conexant/genericfeature/IEqualizer;->saveEQParamsToFlash(Lcom/conexant/genericfeature/PersistEQParams;)I
0172: return-void              

classes.dex: Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler; handleSySelectEqPreset(Lio/flutter/plugin/common/MethodCall;)V code_off=0x61df80
0000: const-string             v0, "index"
0004: invoke-virtual           v1, v0, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;
000a: move-result-object       v0
000c: instance-of              v1, v0, Ljava/lang/Integer;
0010: if-eqz                   v1, +005h
0014: check-cast               v0, Ljava/lang/Integer;
0018: goto                     +2h
001a: const/4                  v0, 0
001c: invoke-static            Lcom/conexant/conexantusbtypec/svcimpl/SvcModClient;->getUsbEQ()Lcom/conexant/genericfeature/IEqualizer;
0022: move-result-object       v1
0024: if-eqz                   v1, +00ch
0028: invoke-virtual           v0, Ljava/lang/Object;->getClass()Ljava/lang/Class;
002e: invoke-virtual           v0, Ljava/lang/Integer;->intValue()I
0034: move-result              v0
0036: invoke-interface         v1, v0, Lcom/conexant/genericfeature/IEqualizer;->switchEQMode(I)I
003c: return-void              
