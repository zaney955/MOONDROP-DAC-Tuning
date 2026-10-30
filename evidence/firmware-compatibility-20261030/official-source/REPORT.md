# ECHO-B firmware public-source follow-up — 2026-10-30

Scope: Public GET requests and static analysis of official site JavaScript/catalog snapshots only. No device access, no execution of browser/device code, no mode changes, no update commands, no login and no POST. No firmware comparison packages were downloaded by this worker; parent owns those.

## Result

No newly discovered downloadable image was established as matching ECHO-B USB 35D8:149B. Targeted exact-name/PID/filename public searches did not supply another verifiable package or factory SDK image. This is a bounded search result, not proof no factory image exists.

## Official current Web source

Entry https://hub.moondroplab.tech/ declares app1.6.5 build26B1081, build date2026-10-10T08:33:50.721Z and /assets/index-BiX0aPAV.js.

- https://hub.moondroplab.tech/assets/index-BiX0aPAV.js SHA256404e9d0c6c9395462c836c4b13130d47e9d4ab250821ca455e8e93c942564f4a
- https://hub.moondroplab.tech/assets/index-CxuoSDqE.js SHA256a8517e2f389d8d0955ff60038011b8a3f7841636de8220f29fb218d3f2110f9e

The first source configures Marigold class $p with productUUID395619a3-3442-419a-a598-94f9f1d4ef4b, reportId75, peqCount8, supportUpgradeFirmware:false, then aliases ry=$p. Its registry has deviceClass:ry/productId284, using default vendorId13784. This resolves Marigold to USB35D8:011C in this official app. ECHO-B35D8:149B (decimal5275) is not in the inspected registry. The distinct Echo-BP name is a 32-band jieliusb family device and is not ECHO-B.

The first source contains class cj, an SPV APP firmware parser. It checks little-endian uint32 at offset4 equals1079398483 (0x40565053, bytes SPV@), then chooses its 16- or32-byte bin-table format using userFlag high bytes. Section-address low24 bits select data within the file. The parser supports a CPU/MOD/PBK/EXT-like table when present. This is exact official parser behavior, not an independently guessed file format. Extracted in official-spv-parser.js.txt; parent owns applying it to candidates. Existence of this parser does not establish ECHO-B compatibility.

## Exact public OTA product binding query

Second source defines:

    function Gm(e){return yt.Get("/ota-configs/all",{params:e})}
    function uA(e){return e.filter(t=>t.version!=="1.0.0")}

Its cA reads current deviceInstance.getProductUUID() into h, calls Gm({productUuid:h,appVersion:"web-app"}).send(!0), and passes returned data through uA before returning firmwareList. cA has one caller, the current Web online upgrade page (__name:"index"); firmwareList feeds FirmwareSelector. Thus the version1.0.0 exclusion is established only for this Web upgrade list, not Android or all possible firmware/recovery pages.

This worker exercised the exact source-shaped GET with explicit productUuid and appVersion=web-app:

- ECHO-B product f92054d7-b36e-492f-8d3b-db2b935c3279 returns exactly OTA a87f4c45-91f7-45c1-a79a-7da2bee72449 / ECHO-B / version1.0.0 / zZje7CUxdVaqgDf5QpXgEusb_headphone_denoise_dual_MOONDROP_0x119_8_27.bin.
- FreeDSP product e39f79d7-3cb1-40c5-987c-982243e19673 returns exactly OTA3946f8a7-6ed2-4f9f-920d-bd469c8edd0f / FreeDSP1.1 / version1.0.0 / yisxlaYhtjXT7_Fx0PUh-freedsp1.hid.
- Marigold product395619a3-3442-419a-a598-94f9f1d4ef4b returns exactly OTA4699ec41-9f8e-4dc3-a510-af5c0c897760 / MOONDROP Marigold / version1.0.0 / nfvX9QU1-bghh2285C__1006.fot.

Therefore the conflicting ECHO-B candidate is an actual server-side product-specific association, not merely a name match in an unfiltered list. All three entries are excluded by this Web list's version1.0.0 rule. Neither fact establishes why the association exists or proves it is a placeholder/production release; the parent binary results remain necessary for compatibility.

GET /ota-configs/{known_uuid} is not supported (HTTP404 for these three tested IDs). Neither current downloaded JavaScript file contains related-product-ota/search, related-product, or ota/search. No parameters for that endpoint were inferred or guessed from absence.

## Recovery clue boundary

The lazy source contains developer-menu label/routeName firmware-recovery. No corresponding implementation/route was found in these two current bundles; the visible main router has only app at root. Treat the string as a menu/development artifact, not a proven working rescue interface. Generic SPV-family upgrade config mentions USB20 vendor1638/product2184 (0666:0888), but this is not evidence that ECHO-B enters it.

## Saved evidence

Raw current JavaScript and index, source excerpts with character offsets, exact query responses/GET manifest, registry alias chain, catalog family comparison, and hash list are in this directory. The parent already downloaded/analyzed firmware files; no duplicate downloads were made here.

## Final control query

The final public GET /api/v1/ota-configs/all?productUuid=f92054d7-b36e-492f-8d3b-db2b935c3279 (without appVersion) returned HTTP200, code0, and the exact same JSON as the source-shaped Web query. This confirms the ECHO-B association is not introduced by appVersion=web-app filtering. Bodies and metadata are saved as product-only-ota-echo.json and product-only-ota-echo-manifest.json.
