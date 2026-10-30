# Official catalog ECHO-B OTA candidate: structural and native export-path review

2026-10-30; offline only. No firmware file execution or loading on hardware. No USB operations. This is ordinary objdump, Python byte parsing, and pyelftools evidence, not REA Evidence.

## Downloaded candidate package

The parent investigator downloaded the public official-catalog ECHO-B 1.0.0 link to `evidence/firmware-readonly-20261030/official-ECHO-B-ota-1.0.0.bin`. File size 442216 bytes; SHA-256 `b68e0cd4a561cb664605f32ebf5d3c3e51f6138482b3bfc97ef9666a42b5acc1`.

Header contains ASCII `SPV@` at offset 4; tags CPU, MOD, PBK, EXT at offsets 0x20, 0x30, 0x40, 0x50. No `SFSE`, `ESFS`, `Conexant`, `Synaptics`, `CX208`, `CX207`, `BOOT`, or `boot` byte strings were found. This does not prove absence of a bootloader or exclude any architecture because code/strings may be encoded or lack names.

USB-style UTF-16 string descriptor records include `Marigold` and `MOONDROP`; exact offsets and preceding descriptor bytes are retained in `ota-package-structure.json`. No valid matching 35d8:149b USB device descriptor was identified by this bounded scan. The single ASCII ECHO at 0xb918 sits beside RECORD, REPLAY, COMMON, WAKEUP, SETKEY, etc., suggesting an application command table, not a model string.

This is a substantial compatibility warning: an official catalog label is evidence that the server offers the package, but these contents do not establish it belongs to the user's known USB 35d8:149b ECHO-B. Could be stale/mistaken catalog linkage, shared product-string defaults, or a hardware variant; none is established. Do not suggest flashing it. It is a vendor package, not a backup taken from the user's device.

## EEPROM export versus firmware upgrade JNI

`firmware-jni.asm` function `EepromOperation@0x20f0` uses filename substring checks for `.hid` (VA0x284b) and `.sfs` (VA0x2850), calls `HandleImageFile`, obtains the `ICxAudioHidDevSpimem` interface (name VA0x2855), and eventually invokes EepromPatch / Cx2070xEepromPatch. The selected wrapper does not itself call fwrite to export a complete image. Its analyzed `.hid`/`.sfs` branches cannot be assumed to consume the newly downloaded SPV@ `.bin` package.

There IS a separate genuine EEPROM dump implementation: `CxAudioHidDevice::EepromContentsOperation@0x17bc0`, operation 1. Constant/relocation tables resolve operation names as 1=`Saving EEPROM contents`, 2=`Restoring EEPROM contents`, 3=`Blanking EEPROM contents`. Operation 1 opens the path as `wb`, calls EepromGetSize, allocates that size, invokes EepromRead(address=0,length=size) at VA0x17f50, and writes the resulting host buffer via fwrite at VA0x17f6c. This is credible full-address-range EEPROM export code for supported devices, though it does not prove this ECHO-B's mapping/readability.

Crucially, even operation 1 first calls virtual `EepromPrepareForPatch` at VA0x17c60. For the 20805 route that method at VA0x27a54 sends non-GET module `0xB72D3300`, command `0x0001`, with count 0. Its success log string at VA0x2efdf is exactly `EepromPrepareForPatch: Reset streamer app`. Thus the SDK's high-level EEPROM saving helper changes execution state before reading. It does NOT satisfy the user's requirement to avoid device changes and was not run. This also reinforces why calling a function named Read/Save is not enough to establish observational-only behavior.

New disassembly: `eeprom-contents-operation.asm`, `eeprom-prepare-for-patch.asm`, `eeprom-patch.asm` in this temporary directory. No repository mutation by this subagent.
