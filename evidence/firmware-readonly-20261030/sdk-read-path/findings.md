# ECHO-B candidate memory/flash read paths — static-only review

Date: 2026-10-30. No USB enumeration, open, control request, device command, mode change, flash write, or reset was performed. Repository files were read only. Analysis used ordinary macOS objdump and existing pyelftools, not REA; existing `evidence/rea-memory-read.json` is a historical provider-unavailable failure and is not successful REA Evidence.

Source: `evidence/android-arm64/libCxAudioHidLib.so`, SHA-256 `e3b58275c7421029be587218c35d8b997a9616a98c8e9795fc4c7db88d6e22cd`.

## Observations

1. `CxAudioHidDev20805::MemoryReadDword` at VA 0x24470 builds module `0xb32d2300`, GET command 0x0106, and passes `(memory_type, address)` to `SendCommand`. It rejects unsigned memory types greater than 1 and null output pointers; it does not validate a full persistent-storage address map. It returns one 32-bit value. Existing assembly: `evidence/official-memory-read.asm` lines 18–36 (preconditions), 37–60 (request and call), 63–70 (result). This is a candidate memory read primitive, not a demonstrated flash-image dump.

2. `CxAudioHidDev20805::SpimemRead` at VA 0x26c8c merely passes operation=0 to `SpimemOperation`. Existing assembly: `evidence/official-spimem-read.asm` lines 6–16.

3. `SpimemOperation` at VA 0x269c4 checks `[this+0x510]` and operation<=1, clamps requested byte count to buffer length, and automatically calls vtable+0x308 (`SpimemOpen`) when `[this+0x4d4]` is zero. Existing assembly: `evidence/official-spimem-operation.asm` lines 22–31 and 46–60. AArch64 ELF dynamic relocations identify vtable base 0x46590, offset+0x300 SendCommand, +0x308 SpimemOpen, +0x310 SpimemClose, +0x318 SpimemRead; see `vtable-and-constants.txt`.

4. In read mode, `SpimemOperation` builds CTRL/0x010e with address and chunk length, then CTRL/0x010d data requests. The address is 32-bit. Chunking is negotiated via host-object `[this+0x4d0]`; lengths are converted to 32-bit-word counts using a right-shift by 2 (alignment and partial words require care). Existing assembly lines 61–103, 105–147, 149–163. No direct erase/write/protect call appears in the selected read branch, but that is not proof the firmware-side command handler has no state changes.

5. `SpimemOpen` VA 0x266bc does send a non-GET command: constant at 0x2e710 decodes to count=5, command=0x000c, module=0xb32d2300, parameters beginning `(0,1,...)`, followed by requested buffer sizes. It calls SendCommand at 0x26794, then tracks open state/negotiated size at object offsets 0x4d4/0x4d0. `SpimemClose` VA 0x2684c sends the same command 0x000c with zeroed parameters at 0x268b4. The full SPI read workflow therefore includes an open/close transaction and cannot be called a strictly observational GET-only operation. The selected static code does not establish a flash erase or write during open/close. See `spimem-open-close.asm`.

6. `SpimemSize` VA 0x270d4 also automatically opens the SPI transaction if needed, sends CTRL/0x010b (constant at 0x2e750), and matches returned flash identifiers to sizes (512 KiB through 8 MiB). These are supported chip cases, not this ECHO-B's measured capacity. See `spimem-size.asm`. Calling this SDK method is not a harmless USB-descriptor read.

7. `SpimemInfo` VA 0x27414 reads 64-byte SFS headers at 0 and 0x1000, checks magic 0x45534653, generates combined SFS metadata, reads another 8 bytes at a header-derived block*0x1000 address, and caches layout. It calls SpimemClose at 0x27534 after initial header reads. Existing `evidence/official-read-functions.asm` lines 79–152 and 252–283. This describes a generic supported flash layout, not the actual ECHO-B contents or a complete backup format.

8. `SpimemReadBlock` VA 0x26ee8 shifts block number by 12 and requests 0x1000 bytes, still through SpimemRead. Existing `official-read-functions.asm` lines 62–77.

9. The same library has different chip-family classes. `CxAudioHidDev2077x` uses base-class `EepromRead`, not `CxAudioHidDev20805::SpimemRead`; its vtable at 0x45c08 differs. A class/method name present in the shared SDK does not prove the ECHO-B dispatcher selects it. ECHO-B CTRL protocol similarity is a useful clue but needs corroborating product-selection evidence. Do not label physical silicon CX20805 or CX2077x based on these symbols alone.

10. `CxAudioHidDev20805::SfsFileRead` VA 0x18ea0, despite its name, appears to perform argument/precondition validation and return; the selected body does not fetch file data. Existing `official-read-functions.asm` lines 6–55. A method name alone is insufficient evidence for backup support.

## Answer / unresolved boundaries

The official SDK contains credible flash-read candidate implementation, so there is more evidence than EQ readback alone. However, full backup remains unverified: actual chip-family route, flash presence and capacity, read-protection, accessible regions, ROM/OTP/device-specific calibration coverage, and restoration compatibility are unknown. No image has been read from the user's ECHO-B. The SPI helpers include non-GET open/close commands; therefore they were not executed under the user's no-device-changes instruction.

The next safe work is offline: establish the ECHO-B App dispatcher route, trace SendCommand and the vendor command handlers if a firmware image becomes available, identify the exact official firmware format and required unique regions, and define whether any eventual device read can satisfy the requested state-preservation guarantee. Static host SDK code cannot prove what the device handler changes internally.


---

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

JNI native download method dynamic binding has not been independently established by this subagent; do not infer it solely from function adjacency or an exported-looking symbol. The parent investigator owns APK/native registration mapping evidence.
