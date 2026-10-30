# ECHO-B APK/native target routing and `.hid` target header (2026-10-30)

Scope: offline static file/resource/instruction inspection only. No APK launch, target library loading, emulation, USB enumeration, device open, or device command was performed. All findings below are ordinary Androguard/objdump/pyelftools observations, not REA runtime Evidence. The parent has already inventoried this same APK with REA CLI.

## Target routing is more specific than generic SDK symbol presence

1. `FlutterNative.mDevicePlugListener$lambda$0`, DEX code offset `0x5f624c`, instructions `0x0048–0x007c`, checks the USB vendor ID against decimal 13784 (`0x35d8`) and product ID in `[5269,5277)` (`[0x1495,0x149d)`). That includes the user's known `0x149b`. The true branch sets Synaptics USB availability and uses `SvcModClient`; the false branch uses the alternative `ns4` USB implementation. See `target-routing.asm` and the parent's `ota-routing.asm`.
2. `CnxtUsbFactory.createUsbDeviceBase`, code offset `0x59a120`, reads USB string index 41 (`0x29`) as `idStr` at method offsets `0x0094–0x00a6`. It checks an application class map, plus VID/PID entries from resource `R.xml.devicelist` (`0x7f140001`). Unknown class-map keys can fall back to `FreemanCnxtUsbDevice` / deviceName `Freeman3` if that ID is in the XML; a `CAPE` string also has a Freeman3 fallback. This is Java-level SDK routing, not a physical silicon ID.
3. Android resource `0x7f140001` resolves to APK member `res/qc.xml`. Decoded `devicelist.xml` has a `device_name="Freeman3"` group containing vendor 13784 and product IDs 5270–5276, including **13784:5275 = 35d8:149b**. This is direct artifact evidence connecting this USB ID to Freeman3, rather than an inference from a shared product name.
4. Native `CxAudioHidDevFactory::Connect(fd)@0x196c8` obtains index `0x29` again at `0x19714–0x19720`. It compares the returned string to prefixes in the relocated `DeviceInfo` array at `0x451c0`, stride `0x30`. The prefixes are `CAT_V033`, `CHAN_`, `CATP_`, `TIKI_`, `SHERMAN_`, `ANDRUS_`, `FREEMAN_V03`, `FREEMAN_`, and `CAPE`.
5. The last prefix `CAPE` selects native device type 8 and `CxAudioHidDev20805` construction at `0x199cc–0x199e4`. Other prefixes instantiate other classes, so Java name `Freeman3` or a USB PID alone cannot prove that native device type 8 was selected for this physical ECHO-B.

The repository's existing USB identity capture does not include string index `0x29`, and no such string was found in the existing backups/runs. Consequently the exact native route remains unconfirmed without additional preexisting evidence or a future separately authorized device descriptor read. No such read was attempted in this task.

## File selection / normal updater boundary

`MainActivity.configureFlutterEngine$lambda$0`, code offset `0x5f02a0`, handles Flutter method `jumpToFwUpdateActivity`, takes argument `uriStr`, and forwards it as intent extra `uriString` to `FirmwareUpdateActivity`. That activity stores the string as `firmwareUri`; its background runnable passes it to `UsbControllerBase.updateFirmware`. These selected Java methods do not themselves establish a target VID/PID match for the file.

`CnxtUsbDeviceBase.updateFirmware` connects the existing USB file descriptor to `com.syna.FirmwareUpdate`, invokes `downloadFirmware(path,1)`, then calls device reset/reconnect. The DEX native declaration is `native_download(String,int)`. Native registration mapping from that declaration to an exact hidden implementation was not independently resolved in this subtask, so do not attach an unproven native function address to `native_download` itself.

## `.hid` first 32 bytes: VID/PID semantics confirmed by implementation

`CxAudioHidDev20805::EepromPatch@0x27b68` checks for `.hid` at `0x27bb4–0x27bbc`, opens the file in `rb`, reads exactly `0x20` bytes at `0x27c0c`, and loads:

| File offset | Native load | Meaning from original log string |
| --- | --- | --- |
| `0x00` | `w20` at `0x27c10` | vendor ID |
| `0x04` | `w22` at `0x27c10` | product ID |
| `0x08` | `w23` at `0x27c14` | `fw_update_type` |
| `0x0c` | `w24` at `0x27c44` | `fw_signature` |
| `0x10` | `w25` at `0x27c44` | `crc_value` |

The strings at library VA `0x2f00e` and `0x2f048` explicitly say `hid_header: vid = 0x%x, pid = 0x%x, fw_update_type = %d` and `fw_signature ,crc_value =`. See `native-hid-field-strings.json` and the parent's `eeprom-patch.asm`.

The selected `.hid` path then sends a device command rather than comparing target IDs locally: at `0x27db4–0x27df0` it builds module `0xb32d2300`, command `0x00c8`, with the five values above, and calls `SendCommand`. The status controls logs `Device is ready for firmware upgrade` / `Device is not ready for firmware upgrade`. This is a device-side preparation handshake, **not** an offline compatibility verifier; it was not executed. The code alone cannot prove all firmware-side model/signature validation or that wrong headers always fail safely.

The parent's fetched `FreeDSP-1.1-reference.hid` starts with little-endian words `13784,5270,2`, confirming its header targets `35d8:1496`, not this user's `35d8:149b`. This makes header VID/PID a useful offline rejection criterion for `.hid` candidates. A matching header alone would still be insufficient to prove complete hardware compatibility, and editing the header cannot establish that compatibility.

## `.hid`, generic detection and SFS are separate paths

- JNI `EepromOperation@0x20f0` first searches for `.hid`. If present, it obtains payload length as file length minus 32 (`0x2234–0x2244`); this branch bypasses the generic S37 check. Its original filename and mode flow into patching later. It also has a distinct `.sfs` path and raw SFS parser fallback for some device types.
- `CxMemoryPatchCheckFile@0x19f5c` creates a base device and delegates to `MemoryPatchCheckFile@0x1e598`, which dispatches `MemoryPatch` with operation/flags zero and an S37 metadata output. It is not shown validating the `.hid` target header.
- `FirmwareDetect@0x1bd24` calls virtual `MemoryPatchCheckFile` and compares recovered firmware/version metadata with device data. It is not an established generic VID/PID compatibility validator for `.hid` or `SPV@` files.
- `HandleImageFile@0x1f270` is an SFS parser using `0x45534653` (`SFSE` on disk) for raw SFS headers; it is not shown accepting the parent's `SPV@` `.bin` candidate as equivalent to a `.hid` image.

No analyzed code gives a basis to rename, relabel or patch the Marigold/SPV package into an ECHO-B file, or to use the FreeDSP image solely because both devices accept similar EQ.

## Reproducibility and limits

`extract_routing.py` accepts the repository path and an output path, uses existing offline Python dependencies, decodes the exact resource, writes selected DEX instructions, resolves ELF dynamic relocations for `DeviceInfo`, and extracts the log strings above. It reads bytes and writes only analysis files; it does not execute the inspected APK/library or access USB.

`native-dispatch-and-format.asm` and `native-factory-parser.asm` were produced with `/usr/bin/objdump -d --disassemble-symbols=...` against the existing library. Source hashes are in `source-identity.json`. Parent report/source hashes should retain the APK identity and exact downloaded `.hid` bytes. Static execution branches may not cover reflection, Dart AOT model choice, every firmware format, or firmware-side validation; those remain bounded unknowns.
