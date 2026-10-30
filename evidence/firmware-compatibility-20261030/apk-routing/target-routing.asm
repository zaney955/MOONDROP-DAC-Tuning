
Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory; <clinit>()V code_off=0x59a610
0000: new-instance               v0, Ljava/lang/Object;
0004: invoke-direct              v0, Ljava/lang/Object;-><init>()V
000a: sput-object                v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->mSyncObj Ljava/lang/Object;
000e: return-void                

Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory; <init>()V code_off=0x59a630
0000: invoke-direct              v1, Ljava/lang/Object;-><init>()V
0006: const/4                    v0, 0
0008: iput-object                v0, v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->mClassMap Ljava/util/Map;
000c: const/4                    v0, 0
000e: iput-boolean               v0, v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->mInitialized Z
0012: return-void                

Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory; config(Ljava/util/Map;)V code_off=0x59a654
0000: iput-object                v1, v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->mClassMap Ljava/util/Map;
0004: const/4                    v1, 1
0006: iput-boolean               v1, v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->mInitialized Z
000a: return-void                

Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory; get()Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory; code_off=0x59a598
0000: sget-object                v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->mInstance Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;
0004: if-nez                     v0, +028h
0008: sget-object                v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->mSyncObj Ljava/lang/Object;
000c: monitor-enter              v0
000e: sget-object                v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->mInstance Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;
0012: if-nez                     v1, +01dh
0016: new-instance               v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;
001a: invoke-direct              v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;-><init>()V
0020: sput-object                v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->mInstance Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;
0024: new-instance               v1, Ljava/util/HashMap;
0028: invoke-direct              v1, Ljava/util/HashMap;-><init>()V
002e: const-string               v2, "CAPE"
0032: const-class                v3, Lcom/conexant/cnxtusbcheadset/FreemanCnxtUsbDevice;
0036: invoke-virtual             v1, v2, v3, Ljava/util/HashMap;->put(Ljava/lang/Object; Ljava/lang/Object;)Ljava/lang/Object;
003c: sget-object                v2, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->mInstance Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;
0040: invoke-direct              v2, v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->config(Ljava/util/Map;)V
0046: goto                       +3h
0048: move-exception             v1
004a: goto                       +3h
004c: monitor-exit               v0
004e: goto                       +3h
0050: monitor-exit               v0
0052: throw                      v1
0054: sget-object                v0, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->mInstance Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;
0058: return-object              v0

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

Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory; init(Ljava/util/Map;)V code_off=0x59a670
0000: invoke-static              Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->get()Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;
0006: move-result-object         v0
0008: invoke-direct              v0, v1, Lcom/conexant/cnxtusbcheadset/CnxtUsbFactory;->config(Ljava/util/Map;)V
000e: return-void                

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

Lcom/conexant/universalfunction/DeviceId; <init>()V code_off=0x5a7ae0
0000: invoke-direct              v0, Ljava/lang/Object;-><init>()V
0006: return-void                

Lcom/conexant/universalfunction/DeviceId; getProductId()Ljava/lang/String; code_off=0x5a7ab0
0000: iget-object                v0, v0, Lcom/conexant/universalfunction/DeviceId;->productId Ljava/lang/String;
0004: return-object              v0

Lcom/conexant/universalfunction/DeviceId; getVendorId()Ljava/lang/String; code_off=0x5a7ac8
0000: iget-object                v0, v0, Lcom/conexant/universalfunction/DeviceId;->vendorId Ljava/lang/String;
0004: return-object              v0

Lcom/conexant/universalfunction/DeviceId; setProductId(Ljava/lang/String;)V code_off=0x5a7af8
0000: iput-object                v1, v0, Lcom/conexant/universalfunction/DeviceId;->productId Ljava/lang/String;
0004: return-void                

Lcom/conexant/universalfunction/DeviceId; setVendorId(Ljava/lang/String;)V code_off=0x5a7b10
0000: iput-object                v1, v0, Lcom/conexant/universalfunction/DeviceId;->vendorId Ljava/lang/String;
0004: return-void                

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

Lju2; m()Z code_off=0x429dcc
0000: invoke-virtual             v1, Lju2;->k()Z
0006: move-result                v0
0008: if-nez                     v0, +003h
000c: goto                       +1bh
000e: iget-object                v1, v1, Lju2;->i Ljava/lang/Object;
0012: check-cast                 v1, Landroid/hardware/usb/UsbDevice;
0016: invoke-virtual             v1, Landroid/hardware/usb/UsbDevice;->getProductId()I
001c: move-result                v1
001e: const/16                   v0, 273
0022: if-eq                      v1, v0, +010h
0026: const/16                   v0, 274
002a: if-eq                      v1, v0, +00ch
002e: const/16                   v0, 5269
0032: if-le                      v1, v0, +006h
0036: const/16                   v0, 5275
003a: if-lt                      v1, v0, +004h
003e: const/4                    v1, 1
0040: return                     v1
0042: const/4                    v1, 0
0044: return                     v1

Lmu3; b(Landroid/content/Context; I)Landroid/graphics/drawable/Drawable; code_off=0x4ab19c
0000: iget-object                v0, v10, Lmu3;->c Landroid/util/TypedValue;
0004: if-nez                     v0, +009h
0008: new-instance               v0, Landroid/util/TypedValue;
000c: invoke-direct              v0, Landroid/util/TypedValue;-><init>()V
0012: iput-object                v0, v10, Lmu3;->c Landroid/util/TypedValue;
0016: invoke-virtual             v11, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
001c: move-result-object         v1
001e: const/4                    v2, 1
0020: invoke-virtual             v1, v12, v0, v2, Landroid/content/res/Resources;->getValue(I Landroid/util/TypedValue; Z)V
0026: iget                       v1, v0, Landroid/util/TypedValue;->assetCookie I
002a: int-to-long                v3, v1
002c: const/16                   v1, 32
0030: shl-long/2addr             v3, v1
0032: iget                       v1, v0, Landroid/util/TypedValue;->data I
0036: int-to-long                v5, v1
0038: or-long/2addr              v3, v5
003a: monitor-enter              v10
003c: iget-object                v1, v10, Lmu3;->b Ljava/util/WeakHashMap;
0040: invoke-virtual             v1, v11, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
0046: move-result-object         v1
0048: check-cast                 v1, Lto2;
004c: const/4                    v5, 0
004e: if-nez                     v1, +005h
0052: monitor-exit               v10
0054: move-object                v1, v5
0056: goto                       +36h
0058: invoke-virtual             v1, v3, v4, Lto2;->c(J)Ljava/lang/Object;
005e: move-result-object         v6
0060: check-cast                 v6, Ljava/lang/ref/WeakReference;
0064: if-eqz                     v6, +02dh
0068: invoke-virtual             v6, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
006e: move-result-object         v6
0070: check-cast                 v6, Landroid/graphics/drawable/Drawable$ConstantState;
0074: if-eqz                     v6, +00fh
0078: invoke-virtual             v11, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
007e: move-result-object         v1
0080: invoke-virtual             v6, v1, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;
0086: move-result-object         v1
0088: monitor-exit               v10
008a: goto                       +1ch
008c: move-exception             v11
008e: goto/16                    +099h
0092: iget-object                v6, v1, Lto2;->b [J
0096: iget                       v7, v1, Lto2;->d I
009a: invoke-static              v6, v7, v3, v4, Lx22;->b([J I J)I
00a0: move-result                v6
00a2: if-ltz                     v6, +00eh
00a6: iget-object                v7, v1, Lto2;->c [Ljava/lang/Object;
00aa: aget-object                v8, v7, v6
00ae: sget-object                v9, Lwa5;->a Ljava/lang/Object;
00b2: if-eq                      v8, v9, +006h
00b6: aput-object                v9, v7, v6
00ba: iput-boolean               v2, v1, Lto2;->a Z
00be: monitor-exit               v10
00c0: goto                       -36h
00c2: if-eqz                     v1, +003h
00c6: return-object              v1
00c8: iget-object                v1, v10, Lmu3;->e Lug;
00cc: if-nez                     v1, +003h
00d0: goto                       +44h
00d2: const                      v1, 2131165240
00d8: if-ne                      v12, v1, +01ah
00dc: new-instance               v5, Landroid/graphics/drawable/LayerDrawable;
00e0: const                      v12, 2131165239
00e6: invoke-virtual             v10, v11, v12, Lmu3;->d(Landroid/content/Context; I)Landroid/graphics/drawable/Drawable;
00ec: move-result-object         v12
00ee: const                      v1, 2131165241
00f4: invoke-virtual             v10, v11, v1, Lmu3;->d(Landroid/content/Context; I)Landroid/graphics/drawable/Drawable;
00fa: move-result-object         v1
00fc: filled-new-array           v12, v1, [Landroid/graphics/drawable/Drawable;
0102: move-result-object         v12
0104: invoke-direct              v5, v12, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V
010a: goto                       +27h
010c: const                      v1, 2131165275
0112: if-ne                      v12, v1, +00ah
0116: const                      v12, 2131099707
011c: invoke-static              v10, v11, v12, Lug;->h(Lmu3; Landroid/content/Context; I)Landroid/graphics/drawable/LayerDrawable;
0122: move-result-object         v5
0124: goto                       +1ah
0126: const                      v1, 2131165274
012c: if-ne                      v12, v1, +00ah
0130: const                      v12, 2131099708
0136: invoke-static              v10, v11, v12, Lug;->h(Lmu3; Landroid/content/Context; I)Landroid/graphics/drawable/LayerDrawable;
013c: move-result-object         v5
013e: goto                       +dh
0140: const                      v1, 2131165276
0146: if-ne                      v12, v1, +009h
014a: const                      v12, 2131099709
0150: invoke-static              v10, v11, v12, Lug;->h(Lmu3; Landroid/content/Context; I)Landroid/graphics/drawable/LayerDrawable;
0156: move-result-object         v5
0158: if-eqz                     v5, +033h
015c: iget                       v12, v0, Landroid/util/TypedValue;->changingConfigurations I
0160: invoke-virtual             v5, v12, Landroid/graphics/drawable/Drawable;->setChangingConfigurations(I)V
0166: monitor-enter              v10
0168: invoke-virtual             v5, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
016e: move-result-object         v12
0170: if-eqz                     v12, +023h
0174: iget-object                v0, v10, Lmu3;->b Ljava/util/WeakHashMap;
0178: invoke-virtual             v0, v11, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
017e: move-result-object         v0
0180: check-cast                 v0, Lto2;
0184: if-nez                     v0, +00fh
0188: new-instance               v0, Lto2;
018c: invoke-direct              v0, Lto2;-><init>()V
0192: iget-object                v1, v10, Lmu3;->b Ljava/util/WeakHashMap;
0196: invoke-virtual             v1, v11, v0, Ljava/util/WeakHashMap;->put(Ljava/lang/Object; Ljava/lang/Object;)Ljava/lang/Object;
019c: goto                       +3h
019e: move-exception             v11
01a0: goto                       +dh
01a2: new-instance               v11, Ljava/lang/ref/WeakReference;
01a6: invoke-direct              v11, v12, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
01ac: invoke-virtual             v0, v3, v4, v11, Lto2;->e(J Ljava/lang/Object;)V
01b2: monitor-exit               v10
01b4: return-object              v5
01b6: monitor-exit               v10
01b8: return-object              v5
01ba: monitor-exit               v10
01bc: throw                      v11
01be: return-object              v5
01c0: monitor-exit               v10
01c2: throw                      v11

Lmu3; h(Landroid/content/Context; I Z Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable; code_off=0x4ab4a4
0000: invoke-virtual             v8, v9, v10, Lmu3;->g(Landroid/content/Context; I)Landroid/content/res/ColorStateList;
0006: move-result-object         v0
0008: const/4                    v1, 0
000a: if-eqz                     v0, +01bh
000e: invoke-virtual             v12, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;
0014: move-result-object         v9
0016: invoke-virtual             v9, v0, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V
001c: iget-object                v8, v8, Lmu3;->e Lug;
0020: if-nez                     v8, +003h
0024: goto                       +8h
0026: const                      v8, 2131165289
002c: if-ne                      v10, v8, +004h
0030: sget-object                v1, Landroid/graphics/PorterDuff$Mode;->MULTIPLY Landroid/graphics/PorterDuff$Mode;
0034: if-eqz                     v1, +005h
0038: invoke-virtual             v9, v1, Landroid/graphics/drawable/Drawable;->setTintMode(Landroid/graphics/PorterDuff$Mode;)V
003e: return-object              v9
0040: iget-object                v0, v8, Lmu3;->e Lug;
0044: const                      v2, 2130903316
004a: const                      v3, 2130903314
0050: if-eqz                     v0, +06ch
0054: const                      v0, 2131165284
005a: const                      v4, 16908301
0060: const                      v5, 16908303
0066: const/high16               v6, 16908288
006a: if-ne                      v10, v0, +029h
006e: move-object                v8, v12
0070: check-cast                 v8, Landroid/graphics/drawable/LayerDrawable;
0074: invoke-virtual             v8, v6, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;
007a: move-result-object         v10
007c: invoke-static              v9, v2, Lck4;->c(Landroid/content/Context; I)I
0082: move-result                v11
0084: sget-object                v0, Lvg;->b Landroid/graphics/PorterDuff$Mode;
0088: invoke-static              v10, v11, v0, Lug;->q(Landroid/graphics/drawable/Drawable; I Landroid/graphics/PorterDuff$Mode;)V
008e: invoke-virtual             v8, v5, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;
0094: move-result-object         v10
0096: invoke-static              v9, v2, Lck4;->c(Landroid/content/Context; I)I
009c: move-result                v11
009e: invoke-static              v10, v11, v0, Lug;->q(Landroid/graphics/drawable/Drawable; I Landroid/graphics/PorterDuff$Mode;)V
00a4: invoke-virtual             v8, v4, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;
00aa: move-result-object         v8
00ac: invoke-static              v9, v3, Lck4;->c(Landroid/content/Context; I)I
00b2: move-result                v9
00b4: invoke-static              v8, v9, v0, Lug;->q(Landroid/graphics/drawable/Drawable; I Landroid/graphics/PorterDuff$Mode;)V
00ba: return-object              v12
00bc: const                      v0, 2131165275
00c2: if-eq                      v10, v0, +00ch
00c6: const                      v0, 2131165274
00cc: if-eq                      v10, v0, +007h
00d0: const                      v0, 2131165276
00d6: if-ne                      v10, v0, +029h
00da: move-object                v8, v12
00dc: check-cast                 v8, Landroid/graphics/drawable/LayerDrawable;
00e0: invoke-virtual             v8, v6, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;
00e6: move-result-object         v10
00e8: invoke-static              v9, v2, Lck4;->b(Landroid/content/Context; I)I
00ee: move-result                v11
00f0: sget-object                v0, Lvg;->b Landroid/graphics/PorterDuff$Mode;
00f4: invoke-static              v10, v11, v0, Lug;->q(Landroid/graphics/drawable/Drawable; I Landroid/graphics/PorterDuff$Mode;)V
00fa: invoke-virtual             v8, v5, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;
0100: move-result-object         v10
0102: invoke-static              v9, v3, Lck4;->c(Landroid/content/Context; I)I
0108: move-result                v11
010a: invoke-static              v10, v11, v0, Lug;->q(Landroid/graphics/drawable/Drawable; I Landroid/graphics/PorterDuff$Mode;)V
0110: invoke-virtual             v8, v4, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;
0116: move-result-object         v8
0118: invoke-static              v9, v3, Lck4;->c(Landroid/content/Context; I)I
011e: move-result                v9
0120: invoke-static              v8, v9, v0, Lug;->q(Landroid/graphics/drawable/Drawable; I Landroid/graphics/PorterDuff$Mode;)V
0126: return-object              v12
0128: iget-object                v8, v8, Lmu3;->e Lug;
012c: const/4                    v0, 0
012e: if-eqz                     v8, +060h
0132: sget-object                v4, Lvg;->b Landroid/graphics/PorterDuff$Mode;
0136: iget-object                v5, v8, Lug;->a Ljava/lang/Object;
013a: check-cast                 v5, [I
013e: invoke-static              v10, v5, Lug;->b(I [I)Z
0144: move-result                v5
0146: const/4                    v6, 1
0148: const/4                    v7, -1
014a: if-eqz                     v5, +005h
014e: move                       v10, v6
0150: move                       v8, v7
0152: goto                       +37h
0154: iget-object                v2, v8, Lug;->c Ljava/lang/Object;
0158: check-cast                 v2, [I
015c: invoke-static              v10, v2, Lug;->b(I [I)Z
0162: move-result                v2
0164: if-eqz                     v2, +004h
0168: move                       v2, v3
016a: goto                       -eh
016c: iget-object                v8, v8, Lug;->d Ljava/lang/Object;
0170: check-cast                 v8, [I
0174: invoke-static              v10, v8, Lug;->b(I [I)Z
017a: move-result                v8
017c: const                      v2, 16842801
0182: if-eqz                     v8, +005h
0186: sget-object                v4, Landroid/graphics/PorterDuff$Mode;->MULTIPLY Landroid/graphics/PorterDuff$Mode;
018a: goto                       -1eh
018c: const                      v8, 2131165261
0192: if-ne                      v10, v8, +00eh
0196: const                      v8, 1109603123
019c: invoke-static              v8, Ljava/lang/Math;->round(F)I
01a2: move-result                v8
01a4: const                      v2, 16842800
01aa: move                       v10, v6
01ac: goto                       +ah
01ae: const                      v8, 2131165243
01b4: if-ne                      v10, v8, +003h
01b8: goto                       -35h
01ba: move                       v10, v0
01bc: move                       v2, v10
01be: goto                       -37h
01c0: if-eqz                     v10, +017h
01c4: invoke-virtual             v12, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;
01ca: move-result-object         v10
01cc: invoke-static              v9, v2, Lck4;->c(Landroid/content/Context; I)I
01d2: move-result                v9
01d4: invoke-static              v9, v4, Lvg;->c(I Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;
01da: move-result-object         v9
01dc: invoke-virtual             v10, v9, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V
01e2: if-eq                      v8, v7, +005h
01e6: invoke-virtual             v10, v8, Landroid/graphics/drawable/Drawable;->setAlpha(I)V
01ec: move                       v0, v6
01ee: if-nez                     v0, +005h
01f2: if-eqz                     v11, +003h
01f6: return-object              v1
01f8: return-object              v12
