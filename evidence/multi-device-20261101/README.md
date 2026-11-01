# Multi-device validation

See [validation-20261101.md](../../docs/validation-20261101.md) for automated checks, real hardware results and naming migration.

- `python-and-c-tests.log`: fake-device regressions, 73 Python tests and four C test programs.
- `live-web-result.json`: real ECHO-A webpage read, same-configuration apply, independent read-only verify and final read. Hardware apply executed once; after a test-status timing issue all further device operations were read-only.
- `live-web-desktop.png`, `live-web-mobile.png`: screenshots of the real device's two-band state. These are not headphone frequency-response measurements.

The real apply and verify records are [here](../../runs/20261101T051320.634673Z-visual-editor/README.md). No controlled power-persistence or analog-output measurement is claimed.
