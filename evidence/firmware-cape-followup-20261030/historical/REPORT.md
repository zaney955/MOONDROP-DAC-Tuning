# ECHO-B historical public-source investigation — 2026-10-30

Scope: Public historical metadata, official-link response headers, and original protocol-tool repository history. No device I/O, no app execution, no software installs, no login/contact, no broad CDN/file-name scan. No APK or firmware package was downloaded by this worker. Parent owned any binary download attempts.

## New useful lead: original official older APK snapshots

The Internet Archive public CDX index for the exact historical official URL https://download.moondroplab.com/moondroplink/app-release.apk returned four distinct-content captures:

| Capture timestamp (UTC) | CDX digest | Archive record length |
| --- | --- | --- |
| 2024-01-09 23:53:10 | HULEZH3MVNC7EWEZV5EXBZTBC5Q5TTU7 | 54518413 |
| 2024-09-25 17:46:27 | X4B3AVGXSSCQQ6OGPGFFBJECWDULAXFX | 29380485 |
| 2025-01-18 04:37:07 | 2KRGCDVPKZUVGLX73CKXKVY6DC5UMZW2 | 32037599 |
| 2025-11-22 14:34:10 | 2EG5M6A2TLUJ3AMSQJJTY2AHSAAO7JSO | 49212864 |

These lengths are CDX/WARC record metadata, not proven APK decoded file sizes. CDX digest is archive identity metadata and was not verified against downloaded files. No manifest versions, contained SDKs, bundled ECHO-B firmware, or old OTA mapping have been inferred from capture timestamps.

The first relevant launch-era analysis candidate was sent to parent:
https://web.archive.org/web/20240925174627id_/https://download.moondroplab.com/moondroplink/app-release.apk

The parent reported one attempted download was blocked with HTTP429. After receiving that report this worker made no further Wayback requests and did not try mirrors, alternate archive modifiers, or retries to evade the limit. Therefore the historical App route remains an accessible-index lead, not an inspected APK result.

The original vendor URL was HEAD-only here and returned500. This does not prove GET fails or that the artifact has been removed. Parent was informed to own any one GET attempt. The current official android-release.apk HEAD returned200, Content-Length110710316 and Last-Modified2026-09-16T12:00:56Z. Existing current local manifest was already verified by parent as version2.25.0c-260813ai; headers alone do not prove equality with that local file.

## Historical website/API index boundary

Exact CDX queries succeeded for:

- https://moondroplab.com/en/download : multiple distinct snapshots spanning2022 onward (full inventory saved; no page bodies replayed in this worker).
- https://moondroplab.com/en/products/echo-b :17 distinct snapshots starting2025-01-18 (full inventory saved; no page bodies replayed).
- https://moondroplab.com/download : old-site snapshots from2020–2022 and a2025 page; these predate ECHO-B except the last and were not used as firmware evidence.

Exact CDX queries for the known ECHO-B-labeled CDN .bin URL and cdn-service /api/v1/ota-configs/all returned an empty list. That only reports this index/query scope; it does not establish the historic contents, age, or origin of the mismatched package. No historical server product/OTA mapping was recovered.

## Original author repository history

Official GitHub REST GETs for EffectiveEquivalent/FreeDSP-Studio returned49 commits back to the initial69ca21144432ef18b5815a44779d54e50b18e835 (2026-08-12), with head1b42f63db24f7dc8e94f6897575c1c403f4d4882 (2026-10-16). The current recursive tree has73 items and truncated:false. The inspected current tree names contain no firmware/.hid/.sfs/echo/conex/research/protocol/apk entries; commit subjects focus on EQ, UI, platform, and device support rather than factory firmware releases. This is not a scan of every historical blob or branch and does not prove none ever existed. It supplies no2024 ECHO-B matching-image provenance.

Sources:
- https://api.github.com/repos/EffectiveEquivalent/FreeDSP-Studio/commits?per_page=100
- https://api.github.com/repos/EffectiveEquivalent/FreeDSP-Studio/git/trees/main?recursive=1
- https://github.com/EffectiveEquivalent/FreeDSP-Studio

The older original frahz/mdrop repository was inspected as a bounded search lead; its supported models are old Dawn Pro / Dawn3.5 / Dawn4.4 with vendor2fc6. It does not establish an ECHO-B35D8:149B updater or image and was excluded from device-specific claims.
- https://github.com/frahz/mdrop

## Conclusion

No new matching35D8:149B .hid image, ECHO-B-specific historical upgrade mapping, or historical explanation for the SPV mislabeled-candidate association was proven. The concrete new lead is a set of exact official-URL historical APK captures, whose payload analysis remains unavailable after the reported429. Existing current App/catalog/package results must retain their previous compatibility limitations. No unknown firmware or recovery command was executed.

Saved evidence: raw CDX responses, HEAD responses, request manifests and hashes, original GitHub history/tree JSON, findings.json, SHA256SUMS. Public search listings for third-party APK-version hosts and Bluetooth-only firmware reports were treated as leads only and did not substitute for official-artifact identity.
