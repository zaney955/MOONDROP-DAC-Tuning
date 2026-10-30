Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler; handleEnterSpvUpdateMode(Lio/flutter/plugin/common/MethodChannel$Result;)V code_off=0x61bf20
0000: const-string             v0, "native: enterSpvUpdateMode"
0004: sget-object              v1, Ljava/lang/System;->out Ljava/io/PrintStream;
0008: invoke-virtual           v1, v0, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V
000e: new-instance             v0, Lps4;
0012: const/16                 v1, 16
0016: invoke-direct            v0, v2, v3, v1, Lps4;-><init>(Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler; Lio/flutter/plugin/common/MethodChannel$Result; I)V
001c: const/16                 v2, 31
0020: invoke-static            v0, v2, Loi6;->a(Lix1; I)V
0026: return-void              
Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler; handleEnterSpvUpdateMode$lambda$0(Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler; Lio/flutter/plugin/common/MethodChannel$Result;)Ltq4; code_off=0x616678
0000: iget-object              v0, v6, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->usbCommunication Lns4;
0004: const/4                  v1, 0
0006: const-string/jumbo       v2, usbCommunication
000c: if-eqz                   v0, +04bh
0010: iget-object              v0, v0, Lns4;->c Lha4;
0014: iget-object              v3, v0, Lha4;->c Ljava/util/concurrent/locks/ReentrantLock;
0018: invoke-virtual           v3, Ljava/util/concurrent/locks/ReentrantLock;->lock()V
001e: const/4                  v4, 1
0020: const/4                  v5, -1
0022: invoke-virtual           v0, v4, v5, Lha4;->c(B B)Lbu;
0028: move-result-object       v4
002a: iget-object              v5, v4, Lbu;->b [B
002e: iget                     v4, v4, Lbu;->c I
0032: invoke-static            v5, v4, Lcom/moondroplab/communication/usb/util/SpvCodecNative;->buildSpvPacket([B I)[B
0038: move-result-object       v4
003a: iget-object              v0, v0, Lha4;->a Lbt4;
003e: invoke-virtual           v0, v4, Lbt4;->k([B)Z
0044: move-result              v0
0046: invoke-virtual           v3, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V
004c: iget-object              v3, v6, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->spvEventListener Lja4;
0050: if-eqz                   v3, +011h
0054: iget-object              v6, v6, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->usbCommunication Lns4;
0058: if-eqz                   v6, +007h
005c: iget-object              v6, v6, Lns4;->f Ly81;
0060: iput-object              v3, v6, Ly81;->v Ljava/lang/Object;
0064: goto                     +7h
0066: invoke-static            v2, Ldf2;->e(Ljava/lang/String;)V
006c: throw                    v1
006e: move-exception           v6
0070: goto                     +1dh
0072: new-instance             v6, Landroid/os/Handler;
0076: invoke-static            Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
007c: move-result-object       v1
007e: invoke-direct            v6, v1, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
0084: new-instance             v1, Lus4;
0088: const/4                  v2, 2
008a: invoke-direct            v1, v7, v0, v2, Lus4;-><init>(Lio/flutter/plugin/common/MethodChannel$Result; Z I)V
0090: invoke-virtual           v6, v1, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
0096: goto                     +34h
0098: move-exception           v6
009a: invoke-virtual           v3, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V
00a0: throw                    v6
00a2: invoke-static            v2, Ldf2;->e(Ljava/lang/String;)V
00a8: throw                    v1
00aa: invoke-virtual           v6, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;
00b0: move-result-object       v0
00b2: new-instance             v1, Ljava/lang/StringBuilder;
00b6: const-string             v2, "[Handler] handleEnterSpvUpdateMode exception: "
00ba: invoke-direct            v1, v2, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
00c0: invoke-virtual           v1, v0, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
00c6: invoke-virtual           v1, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
00cc: move-result-object       v0
00ce: const-string             v1, "SPV"
00d2: invoke-static            v1, v0, v6, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String; Ljava/lang/Throwable;)I
00d8: new-instance             v0, Landroid/os/Handler;
00dc: invoke-static            Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
00e2: move-result-object       v1
00e4: invoke-direct            v0, v1, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
00ea: new-instance             v1, Lys4;
00ee: const/16                 v2, 19
00f2: invoke-direct            v1, v7, v6, v2, Lys4;-><init>(Lio/flutter/plugin/common/MethodChannel$Result; Ljava/lang/Exception; I)V
00f8: invoke-virtual           v0, v1, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
00fe: sget-object              v6, Ltq4;->a Ltq4;
0102: return-object            v6
Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler; handleEnterSpvUpdateMode$lambda$0$1(Lio/flutter/plugin/common/MethodChannel$Result; Z)V code_off=0x61bed8
0000: invoke-static            v1, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
0006: move-result-object       v1
0008: invoke-interface         v0, v1, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
000e: return-void              
Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler; handleEnterSpvUpdateMode$lambda$0$2(Lio/flutter/plugin/common/MethodChannel$Result; Ljava/lang/Exception;)V code_off=0x61bef8
0000: invoke-virtual           v3, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;
0006: move-result-object       v3
0008: const/4                  v0, 0
000a: const-string             v1, "ENTER_SPV_UPDATE_ERROR"
000e: invoke-interface         v2, v1, v3, v0, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String; Ljava/lang/String; Ljava/lang/Object;)V
0014: return-void              
Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler; handleStartSpvUpgrade(Lio/flutter/plugin/common/MethodCall; Lio/flutter/plugin/common/MethodChannel$Result;)V code_off=0x61d870
0000: const-string             v0, "native: startSpvUpgrade"
0004: sget-object              v1, Ljava/lang/System;->out Ljava/io/PrintStream;
0008: invoke-virtual           v1, v0, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V
000e: const-string/jumbo       v0, uriStr
0014: invoke-virtual           v3, v0, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;
001a: move-result-object       v3
001c: instance-of              v0, v3, Ljava/lang/String;
0020: const/4                  v1, 0
0022: if-eqz                   v0, +005h
0026: check-cast               v3, Ljava/lang/String;
002a: goto                     +2h
002c: move-object              v3, v1
002e: if-eqz                   v3, +015h
0032: invoke-static            v3, Lke4;->k(Ljava/lang/CharSequence;)Z
0038: move-result              v0
003a: if-eqz                   v0, +003h
003e: goto                     +dh
0040: new-instance             v0, Lcy3;
0044: const/4                  v1, 1
0046: invoke-direct            v0, v2, v3, v4, v1, Lcy3;-><init>(Ljava/lang/Object; Ljava/lang/Object; Ljava/lang/Object; I)V
004c: const/16                 v2, 31
0050: invoke-static            v0, v2, Loi6;->a(Lix1; I)V
0056: return-void              
0058: const-string             v2, "SPV_UPGRADE_INVALID_URI"
005c: const-string             v3, "SPV upgrade URI is empty"
0060: invoke-interface         v4, v2, v3, v1, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String; Ljava/lang/String; Ljava/lang/Object;)V
0066: return-void              
Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler; handleStartSpvUpgrade$lambda$0(Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler; Ljava/lang/String; Lio/flutter/plugin/common/MethodChannel$Result;)Ltq4; code_off=0x619494
0000: iget-object              v2, v2, Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler;->usbCommunication Lns4;
0004: if-eqz                   v2, +01bh
0008: invoke-virtual           v2, v3, Lns4;->y(Ljava/lang/String;)I
000e: move-result              v2
0010: new-instance             v3, Landroid/os/Handler;
0014: invoke-static            Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
001a: move-result-object       v0
001c: invoke-direct            v3, v0, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
0022: new-instance             v0, Lws4;
0026: const/4                  v1, 2
0028: invoke-direct            v0, v4, v2, v1, Lws4;-><init>(Lio/flutter/plugin/common/MethodChannel$Result; I I)V
002e: invoke-virtual           v3, v0, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
0034: goto                     +35h
0036: move-exception           v2
0038: goto                     +9h
003a: const-string/jumbo       v2, usbCommunication
0040: invoke-static            v2, Ldf2;->e(Ljava/lang/String;)V
0046: const/4                  v2, 0
0048: throw                    v2
004a: invoke-virtual           v2, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;
0050: move-result-object       v3
0052: new-instance             v0, Ljava/lang/StringBuilder;
0056: const-string             v1, "[Handler] handleStartSpvUpgrade exception: "
005a: invoke-direct            v0, v1, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
0060: invoke-virtual           v0, v3, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
0066: invoke-virtual           v0, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
006c: move-result-object       v3
006e: const-string             v0, "SPV"
0072: invoke-static            v0, v3, v2, Landroid/util/Log;->e(Ljava/lang/String; Ljava/lang/String; Ljava/lang/Throwable;)I
0078: new-instance             v3, Landroid/os/Handler;
007c: invoke-static            Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
0082: move-result-object       v0
0084: invoke-direct            v3, v0, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
008a: new-instance             v0, Lys4;
008e: const/16                 v1, 9
0092: invoke-direct            v0, v4, v2, v1, Lys4;-><init>(Lio/flutter/plugin/common/MethodChannel$Result; Ljava/lang/Exception; I)V
0098: invoke-virtual           v3, v0, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
009e: sget-object              v2, Ltq4;->a Ltq4;
00a2: return-object            v2
Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler; handleStartSpvUpgrade$lambda$0$0(Lio/flutter/plugin/common/MethodChannel$Result; I)V code_off=0x61d828
0000: invoke-static            v1, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
0006: move-result-object       v1
0008: invoke-interface         v0, v1, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
000e: return-void              
Lcom/moondroplab/moondrop/moondrop_app/native/handlers/UsbDeviceHandler; handleStartSpvUpgrade$lambda$0$1(Lio/flutter/plugin/common/MethodChannel$Result; Ljava/lang/Exception;)V code_off=0x61d848
0000: invoke-virtual           v3, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;
0006: move-result-object       v3
0008: const/4                  v0, 0
000a: const-string             v1, "SPV_UPGRADE_ERROR"
000e: invoke-interface         v2, v1, v3, v0, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String; Ljava/lang/String; Ljava/lang/Object;)V
0014: return-void              
