# KA10000 SPI tunnel reference — bounded comparison

Date: 2026-10-30. Only three public source files were retrieved through the GitHub connector, pinned to `edgeimpulse/firmware-synaptics-ka10000` commit `ec5de44cc7dad796e9b81f748ddd4e7d8fea2e2d`. Nothing was compiled or run; no SDK or firmware was installed/downloaded beyond these text sources; no USB enumeration or device command occurred. This is source inspection, not ECHO-B firmware-handler evidence.

## Relevant observations

Source: [AudioSmart_libbg_upgrade.c](https://github.com/edgeimpulse/firmware-synaptics-ka10000/blob/ec5de44cc7dad796e9b81f748ddd4e7d8fea2e2d/SDK/fcp/host/api_src/top_level_api/bg_upgrade_api/AudioSmart_libbg_upgrade.c).

| Source lines | Observation |
| --- | --- |
| 345–361 | `SpimemClose` sends the tunnel CONFIG setter with zero buffer lengths; successful return clears the host configured flag and cached buffer size. |
| 364–410 | `SpimemOpen` chooses a default 4096-byte buffer (unless caller supplies one), negotiates configuration, and retries with a smaller buffer after module allocation failure. It updates host `Spimem.IsTunnelConfigured` and `Spimem.BufferSize`. |
| 381 | Open sends module `(ID_MM | FWID_SW)`, command `SW_SPIMEM_TUNNEL_CMD_SET_CONFIG`, arguments `(0,1,bufferSize,bufferSize)`. The comment identifies the configuration as buffer sizing for header reads or larger upgrades. |
| 436–464 | `SpimemOperation` validates read/write operation and automatically opens the tunnel when the host configured flag is false. |
| 467–481 | Read builds an APPLY/GET command carrying tunnel ID 0, memory address and byte length, then sends it before fetching the buffered data. |
| 486–545 | It then issues DATA/GET requests in bounded DWORD chunks and copies replies to the caller buffer. |
| 549–552 | The write branch applies its queued command after supplying data; that action is separate from the read branch. |
| 567–578 | `SpimemRead` delegates to the read operation. Its actual length arithmetic rounds to a multiple of 4, despite a source comment saying 8; do not treat that comment as an alignment guarantee. |
| 610–635 | SPI ID query also opens the tunnel first, then reads ID information. |
| 638–647 | Flash unprotect, erase/write, and readback verification are explicitly grouped in a separate write/verify helper. |

The selected read helper does not call flash erase, unprotect, program, partition invalidation, or reset. Open is visibly a device-side tunnel configuration request and host-side buffer negotiation. The actual device handler is outside these three files, so this host source cannot prove that configuration is entirely volatile or has no other firmware-side effects.

## Android comparison: conceptual correspondence, different command namespace

The existing official Android binary implements `SpimemOpen@0x266bc`, then a read-address/length operation followed by buffered data reads. Its known command sequence is CTRL/module `0xb32d2300`, CONFIG `0x000c`, READ/APPLY GET `0x010e`, DATA GET `0x010d`.

The KA10000 source has the same overall buffer/tunnel design, but it targets `(ID_MM | FWID_SW)` and the `SW_SPIMEM_TUNNEL_CMD_*` namespace. It does not establish that the module or numeric command IDs equal Android's CTRL commands. The repository's indexed definitions show base CONFIG=2, DATA=3, APPLY=4 for this SW command family; those differ from the Android base values 12/13/14. This comparison must therefore remain conceptual, not a compatible command recipe.

`AudioSmart_sendcmd_common.h` only defines the variadic `SENDCMD` wrapper and prototypes; it supplies no device-handler implementation and no persistence guarantee.

## Partition / complete dump limits

The inspected `.c` defines EFS boot/system headers and partition metadata, validates incoming headers against a bootloader header, reads current system headers to select update partitions, and has separate flashing helpers. In particular, `AudioSmart_validate_fw_headers` lines 835–931 reads SPI/bootloader data and optionally compares image VID/PID; `AudioSmart_start_fw_image_flashing` lines 992–1039 selects host-side active/updating indices before later writing. These are background-upgrade routines for this reference platform, not evidence of an ECHO-B recovery mode.

The public header `AudioSmart_libbg_upgrade.h` exposes reset/version/partition-query/header-validation/flashing APIs. It does not expose a full-device dump API in its 252 lines, and the inspected implementation has private SPI read helpers used for headers/readback rather than a file-export loop. This is a bounded absence within these files, not proof that no dump tool exists elsewhere.

No conclusion about ECHO-B flash capacity, partitions, safe read commands, ROM/OTP coverage, hardware recovery, or compatible firmware follows from this KA10000 reference alone. Its useful contribution is explaining why an apparent read workflow may first configure a device tunnel and negotiate buffers; it does not remove the earlier no-device-state-change restriction.

## Saved sources

`AudioSmart_libbg_upgrade.c`, `AudioSmart_sendcmd_common.h`, and `AudioSmart_libbg_upgrade.h` are saved beside this report. `sources.json` records exact pinned URLs, GitHub blob SHAs and SHA-256 hashes. No broader SDK acquisition was performed.
