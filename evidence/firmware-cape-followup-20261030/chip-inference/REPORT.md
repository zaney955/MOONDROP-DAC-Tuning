# ECHO-B CAPE / CX208xx protocol inference from existing bytes

Date: 2026-10-30. All work was offline. No USB enumeration/open/request, device tool, target library execution, or APK launch occurred. This follow-up compares the existing SDK and existing physical-device captures; it is ordinary objdump/Python/ELF evidence, not a new REA runtime observation.

## Answer

The combined evidence now supports a **high-confidence CAPE / CX208xx-style firmware-control protocol classification** for the saved ECHO-B `35d8:149b` captures, and a strong inference that the corresponding implementation in this particular SDK is `CxAudioHidDev20805`. This is stronger than merely finding an exported SDK symbol or a 62-byte report.

It still does **not** establish the exact physical silicon model as CX20805, independently observe the App's native class selection, or identify all flash/ROM/OTP regions. The SDK's own display string is the family name `CX208xx`, and the numeric function contains a default that can be mistaken for a measured identity.

## 1. Frame correspondence, not only total size

Existing source `evidence/usb-identity.json` records report ID 1 and 62-byte reports. Its descriptor has report size 8, report count 61, and ID 1 for the relevant input/output report: 61 bytes plus one report ID byte. Separately, 20 saved replies from `backups/initial-read.jsonl` and `backups/coefficients-read.jsonl` have all of these properties:

| Byte offset | Saved capture contents | Matching SDK interpretation |
| --- | --- | --- |
| 0 | `01` | report ID 1 |
| 1 | `00` | reserved framing byte |
| 2 | signed int16 count, observed 6/8/13 | CAPE body count |
| 4 | uint16 command, e.g. `0x815a`, `0x81dd`, `0x81be` | reply flag `0x8000`, GET flag `0x0100`, original command low byte |
| 6 | `00 23 2d b3` | module `0xb32d2300` (CTRL) |
| 10 | remaining payload | up to 13 32-bit words in a 60-byte command body |

The `CxAudioHidDev20805` transport matches this layout exactly:

- `Write@0x245a4` writes byte 0 = 1 and leaves byte 1 zero, copies a maximum 60-byte body to offset 2 (`0x2461c–0x2465c`), and sends length `0x3e` = 62 (`0x24668–0x24680`).
- `Read@0x247e4` requests report 1 with length 62 (`0x24860–0x24870`), then copies at most 60 bytes from offset 2 (`0x2487c–0x24894`).
- `SendCommand@0x249b4` sends/reads a 60-byte body through those virtual slots. It checks bit 31 of the first uint32 for the command reply flag, then bit 15 / signed low int16 for an error count (`0x24a48`, `0x24b08–0x24b9c`). That matches the captures' count/command packing, rather than an unrelated 62-byte protocol.
- The 20805 class's CTRL requests, including `MemoryReadDword@0x24470` and `DeviceGetChipCode@0x2539c`, build the same module `0xb32d2300`. The real stored ECHO-B replies echo this module and its GET/reply format.

`protocol-frame-comparison.json` retains the decoded observations. `compare_saved_frames.py` reproduces the frame checks using only the two saved capture files.

## 2. SDK family discrimination and remaining native-selection gap

The previously extracted `DeviceInfo` table has nine records. The `CAPE` record (type 8) uniquely has both candidate report-length fields at offsets `+0x1a` and `+0x1c` set to 62; the other records use 6 or 37 for the output field (and their corresponding smaller input lengths). The native factory's `CAPE` selection constructs `CxAudioHidDev20805`.

Within this library's exported implementations, `CxAudioHidDev20805::SendCommand(CAPE_FW_FULL_COMMAND,...)` is the implementation of that 60-byte module-command format. Other SDK families use the generic register/memory report machinery or other routes. Thus the combination of prefix, body packing, command flags, CTRL module and stored responses strongly discriminates the current control protocol from the older register-oriented paths in this same SDK.

This does not prove no other hardware or firmware can implement the same protocol. Also, the native factory actually chooses its class by USB string index `0x29`, not by report length alone. That string is absent from the previously saved identity capture. The Java `Freeman3` mapping of `35d8:149b` is already proven by APK XML, but it is a Java SDK classification, not a measurement of the physical part marking.

## 3. Chip-code accessors are not unconditional identity evidence

`CxAudioHidDev20805::DeviceGetChipCode@0x2539c`:

1. At `0x253e8–0x25400`, writes the constant decimal **20805** (`0x5145`) into the caller's output buffer.
2. Builds CTRL GET `0x0103`, parameter 1, and calls `SendCommand@0x25448`.
3. Only on success replaces that output with the returned payload word (`0x2544c–0x25454`).

Therefore seeing a buffer containing 20805 without checking success would only reveal a default. This command was not executed in this investigation, and no saved successful reply for it was found in the selected capture set.

`DeviceGetChipCodeString@0x25480` calls the numeric method, checks status, then formats a **fixed literal `CX208xx`** at VA `0x2ed73` (`0x254d4–0x254e4`); it does not format the returned numeric code into a more precise model string. This confirms the class serves a family-level naming path, despite its C++ class name.

## 4. Memory-region limitations remain

- For this CAPE implementation, `EepromRead@0x258a8` directly dispatches to the `SpimemRead` virtual slot (`+0x318`). The SDK name EEPROM can therefore refer to the SPI storage path, not necessarily a separate physical EEPROM chip.
- `EepromGetSize@0x258c0` merely returns cached `[this+0xc]`. `AutoConfigure@0x24068` probes SPI capability, queries size or tries SFS headers at 0/0x1000, and caches the result. The library's cached size/support flags are not a layout measurement from this ECHO-B, and automatic configuration includes device commands.
- The `CAPE` `DeviceInfo` record has count 0 and a null generic memory-descriptor pointer, rather than a self-contained ROM/OTP/flash map. Other families' descriptor tables cannot simply be imported as this device's memory layout.
- `MemoryReadDword` only accepts two `CXCAPE_MEMORY_TYPE` selector values (0/1); static host preconditions do not identify their entire physical ranges or ensure every address is safe/readable.
- `DeviceGetRomVersionString@0x25040` calls the `DeviceGetFirmwareVersion` virtual slot (`+0x230`), modifies the returned version fields, and formats them. That method is not evidence of reading a separate ROM image or an independently accessible ROM recovery loader.
- Generic OTP helpers exist elsewhere in the shared base SDK, but their presence does not demonstrate that this physical ECHO-B has a particular OTP layout, exposes all OTP contents, or stores calibration/identity data in the part of SPI flash that might eventually be dumped.

Consequently the stronger family inference helps prioritize offline CAPE/SFS-format research, but does not remove the missing evidence for complete backup coverage, unique data preservation, protected regions, or restoration compatibility. No advanced SDK connection or auto-configuration routine was run to resolve these unknowns.

## Saved evidence

- `native-chip-transport.asm`: selected Initialize/MemoryOperation/CAPE constructor/AutoConfigure/SendCommand/chip-code disassembly.
- `cape-report-and-regions.asm`: selected Write/Read/EepromRead/GetSize/RomVersionString disassembly. One attempted extra symbol was absent; the actual included symbols are visible in the file and the missing symbol supplies no evidence.
- `chip-constants.json`: fixed string/default-related bytes and constants.
- `cape-vtable-slots.json`: ELF relocation proof for the selected virtual-call targets.
- `source-identity.json`: source library, identity capture and stored reply hashes.
- `protocol-frame-comparison.json`: 20 saved frame comparisons; no live read.

The earlier `DeviceInfo` table and factory selection evidence remain in the previous routing investigation and were reused, not reacquired from the device.
