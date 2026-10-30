# ECHO-B official-public-source firmware investigation (2026-10-30)

Scope: Public official pages and public primary-source code only. No USB commands, firmware tools, device open, mode changes, reset, erase, or writes were performed.

## Findings

1. Official ECHO-B product pages, Chinese and English, describe USB-C DSP / 32-bit 384kHz and tuning shared with FreeDSP. Their download section links only MOONDROP Link. The User Guide/说明书 section is marked `w-condition-invisible` and its link is `href="#"`. It does not provide an actual downloadable ECHO-B manual or firmware image.
   - https://moondroplab.com/cn-products/echo-b
   - https://moondroplab.com/en/products/echo-b
2. Official Chinese and English download pages list audio firmware only for MOONRIVER2:TI and DAWN PRO; further firmware entries are DASH75 keyboard variants. ECHO-B is not listed in this observed list. The audio firmware download resolves to https://download.moondroplab.com/66c2bbfc74132.zip. This package was NOT downloaded or inspected, and is NOT ECHO-B firmware evidence.
   - https://moondroplab.com/cn/download
   - https://moondroplab.com/en/download
3. Official manual pages contain inline hidden `manual-data` inventories, not an unseen API-backed full search. The downloaded English HTML contains 53 manual entries and the Chinese HTML 65; neither contains an ECHO/ECHO-B manual entry. Product search inventory does contain ECHO-B, so a generic ECHO-B page hit is not a manual download.
   - https://moondroplab.com/en/manual
   - https://moondroplab.com/cn/manual
4. No ECHO-B-specific official recovery, bootloader-entry procedure, or complete-firmware readout command was found in the public web pages and targeted searches examined. The public website did not expose an ECHO-B download, but the parent investigation subsequently discovered an exact ECHO-B CONFIG OTA entry through the official App service. Therefore this public-website negative result MUST NOT be reported as absence of an official package. The parent is downloading/analyzing that exact package separately.

## Primary-source comparison lead: fwupd CxAudio

Official fwupd source contains a Synaptics CxAudio plugin with EEPROM read/write operations. Its README says supported firmware uses modified SREC, is installed during normal runtime, then resets. `fu-synaptics-cxaudio-device.c` has memory read implementation with 32-byte chunks, output report 0x04/input report 0x05 per common header. EEPROM header/custom info and chip-ID are read in setup; write/reset functions also exist elsewhere, so DO NOT run the generic plugin against ECHO-B as a read-only probe. No complete-device dump/read_firmware entry point was found in this inspected implementation.

The quirk list covers specific Lenovo/Google USB IDs, with CX2098X/CX2198X chip bases; it does not list USB 35D8:149B or Moondrop. The Rust enums also name older CX2077X-family image types, but enums alone do not establish ECHO-B compatibility. Treat these files only as offline protocol comparison leads.

- https://raw.githubusercontent.com/fwupd/fwupd/main/plugins/synaptics-cxaudio/README.md
- https://raw.githubusercontent.com/fwupd/fwupd/main/plugins/synaptics-cxaudio/fu-synaptics-cxaudio-device.c
- https://raw.githubusercontent.com/fwupd/fwupd/main/plugins/synaptics-cxaudio/fu-synaptics-cxaudio-common.h
- https://raw.githubusercontent.com/fwupd/fwupd/main/plugins/synaptics-cxaudio/fu-synaptics-cxaudio.rs
- https://raw.githubusercontent.com/fwupd/fwupd/main/plugins/synaptics-cxaudio/synaptics-cxaudio.quirk

## Rejected as device identity proof

A 2014 Conexant-authored CX2077x product brief is preserved at https://datasheet.datasheetarchive.com/originals/crawler/conexant.com/a6c23d922e22c39945eaf0ace2992504.pdf. It describes CX20773/CX20774 with 24-bit/48kHz-class performance, different from ECHO-B advertising. The shared SDK/class-family name does not prove ECHO-B uses either exact part; this brief cannot justify a flash layout or rescue procedure.

## Search boundary

Searches used exact ECHO-B with Moondrop, firmware, 固件, 升级, 救砖, bootloader, 35d8:149b, official-domain package/manual searches, and CxAudio/CX207xx firmware read leads. Results for Snowsky/FiiO ECHO, ECHO-A, Bluetooth TWS OTA, KT02H20, unrelated Samsung Echo-B SoCs, and generic keyboard/MCU recovery were excluded. Third-party indexed AI-generated articles making 32-band ECHO-B claims were not used.

## Saved evidence

Raw official HTML, extracted inventories/observations, fetched fwupd sources, and SHA-256 manifests are beside this report. The fwupd snapshots were fetched from `main` and are identified by hashes and retrieval date, not an immutable upstream commit.

## Official App service cross-check (parent-discovered route)

Read-only GET https://cdn-service.moondroplab.tech/api/v1/products/f92054d7-b36e-492f-8d3b-db2b935c3279 returned code 0 and exact ECHO-B product metadata: hasotaconfig true; isDongleUpgradable false; chipType synopsys; eqBands 9; all manual URL fields empty. These are server catalog flags, not proof of silicon or all possible update interfaces.

GET https://cdn-service.moondroplab.tech/api/v1/products/f92054d7-b36e-492f-8d3b-db2b935c3279/relations/uuids returned code 0 with relatedUuids empty. The relation semantics have not been established, so this does not disprove binding to the exact ECHO-B OTA entry found by the parent.

Saved bodies and status/hash manifest: product-detail.json, product-relations-uuids.json, product-relations-fetch-manifest.json. No POST, login, or authenticated API was used.
