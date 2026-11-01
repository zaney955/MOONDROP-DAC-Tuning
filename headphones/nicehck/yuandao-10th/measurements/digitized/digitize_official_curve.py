"""Digitize the archived official plot using macOS sips and Python stdlib.

Outputs estimates from a published image, NOT original acoustic measurements.
Run this file directly; no network or device access is performed.
"""
import bisect
import csv
import hashlib
import json
import math
from pathlib import Path
import statistics
import struct
import subprocess
import tempfile

HERE = Path(__file__).resolve().parent
SOURCE = HERE.parent / 'raw/06_15b37029-c621-4a3d-bb60-f66028fc9bbb.jpg'
EXPECTED_SHA256 = 'f33afca9e0d57c1fe81b5152fd86b82b8d1207d466d5c1be296c5fc40aafa09e'
# Manually identified tick/grid centres on the original 960 x 889 image.
FREQUENCY_ANCHORS = [(20,66),(30,115),(40,149),(50,176),(60,198),
    (80,232),(100,259),(200,341),(400,424.5),(500,451),(1000,533.5),
    (2000,616.5),(3000,665),(4000,700),(6000,749),(8000,783),
    (10000,809.5),(12000,831),(16000,865)]
LEVEL_ANCHORS = [(105,394),(100,435.5),(95,477.5),(90,519),(85,561),
    (80,602.5),(75,645.5),(70,686.5),(65,727.5)]


def fit(pairs):
    mx = statistics.mean(x for x,y in pairs)
    my = statistics.mean(y for x,y in pairs)
    slope = sum((x-mx)*(y-my) for x,y in pairs)/sum((x-mx)**2 for x,y in pairs)
    intercept = my-slope*mx
    residual = max(abs(y-(slope*x+intercept)) for x,y in pairs)
    return slope, intercept, residual


def main():
    assert hashlib.sha256(SOURCE.read_bytes()).hexdigest() == EXPECTED_SHA256
    with tempfile.TemporaryDirectory(prefix='yuandao-curve-') as temporary:
        bmp = Path(temporary)/'source.bmp'
        subprocess.run(['sips','-s','format','bmp',str(SOURCE),'--out',str(bmp)],
                       check=True, capture_output=True)
        raw = bmp.read_bytes()
    assert raw[:2] == b'BM'
    offset = struct.unpack_from('<I',raw,10)[0]
    size,width,height,planes,bits,compression = struct.unpack_from('<IiiHHI',raw,14)
    assert size >= 40 and (width,abs(height),planes,bits,compression)==(960,889,1,24,0)
    stride = (width*3+3)//4*4

    def rgb(x,y):
        row = y if height < 0 else abs(height)-1-y
        p = offset+row*stride+x*3
        blue,green,red = raw[p:p+3]
        return red,green,blue

    x_slope,x_intercept,x_error = fit([(math.log10(f),x) for f,x in FREQUENCY_ANCHORS])
    y_slope,y_intercept,y_error = fit(LEVEL_ANCHORS)
    extracted = []
    thickness = []
    for x in range(67,892):
        ys = []
        for y in range(380,759):
            r,g,b = rgb(x,y)
            if b-r>25 and b-g>25 and r-g>0:
                ys.append(y)
        if not ys or max(ys)-min(ys)>12:
            raise ValueError(f'Missing or ambiguous curve at column {x}')
        centre = statistics.median(ys)
        thickness.append(max(ys)-min(ys)+1)
        frequency = 10**((x-x_intercept)/x_slope)
        level = (centre-y_intercept)/y_slope
        extracted.append((x,frequency,level))

    # Interpolate in log-frequency (equivalently x) only to normalize at 1 kHz.
    x_ref = x_slope*3+x_intercept
    xs = [x for x,f,level in extracted]
    j = bisect.bisect_left(xs,x_ref)
    a,b = extracted[j-1],extracted[j]
    reference = a[2]+(b[2]-a[2])*(x_ref-a[0])/(b[0]-a[0])
    out = HERE/'official-unfoamed-5128-image-estimate.csv'
    with out.open('w',newline='',encoding='utf-8') as stream:
        writer = csv.writer(stream)
        writer.writerow(['frequency_hz','graph_level_estimate_db','relative_to_1khz_estimate_db'])
        for x,f,level in extracted:
            writer.writerow([f'{f:.2f}',f'{level:.2f}',f'{level-reference:.2f}'])

    metadata = {
        'data_kind':'image_digitization_estimate_not_raw_measurement',
        'source_file':'../raw/'+SOURCE.name,'source_sha256':EXPECTED_SHA256,
        'source_url':'https://cdn.shopify.com/s/files/1/0865/0850/3331/files/06_15b37029-c621-4a3d-bb60-f66028fc9bbb.jpg?v=1773218463',
        'source_page':'https://www.nicehck.com/products/yuandao-10th',
        'measurement_conditions':{'model':'NICEHCK Yuandao 10th Anniversary',
            'connector':'3.5 mm','microphone':False,'foam':'none','fixture':'B&K 5128 HATS',
            'drive_level':'not stated','channel':'not stated','smoothing':'not stated'},
        'csv_file':'../digitized/'+out.name,'csv_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),
        'script_file':'../digitized/'+Path(__file__).name,
        'script_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        'row_count':len(extracted),'frequency_range_hz':[extracted[0][1],extracted[-1][1]],
        'source_image_size_px':[width,abs(height)],
        'calibration':{'frequency_tick_hz_and_x_px':FREQUENCY_ANCHORS,
            'level_tick_db_and_y_px':LEVEL_ANCHORS,
            'x_equals_slope_times_log10_hz_plus_intercept':[x_slope,x_intercept],
            'y_equals_slope_times_db_plus_intercept':[y_slope,y_intercept],
            'max_frequency_anchor_residual_px':x_error,'max_level_anchor_residual_px':y_error},
        'extraction':{'plot_roi_xyxy':[67,380,891,758],
            'rgb_mask':'B-R > 25 and B-G > 25 and R-G > 0',
            'centre':'median detected y per integer x; no smoothing',
            'missing_columns':0,'max_detected_stroke_height_px':max(thickness),
            'normalization':'subtract linearly interpolated log-frequency response at 1000 Hz',
            'graph_level_at_1khz_estimate_db':reference,
            'extrapolation':'none; outer borders without a reliable trace are excluded'},
        'precision_note':'Two decimal places are formatting, not accuracy. One vertical pixel is about 0.12 dB; JPEG stroke and tick selection introduce additional error. No calibrated uncertainty bound is available. Acoustic uncertainty is unknown.',
        'limitations':['Not full-foam response','Not personal in-ear response',
            'Graph level is not calibrated user listening SPL',
            'Relative normalization is not target compensation',
            'No exact 20 Hz or 20000 Hz endpoints are fabricated',
            'Do not treat image estimates as precision AutoEQ measurement input']}
    meta_path = HERE.parent/'provenance/official-curve-digitization-20261101.json'
    meta_path.write_text(json.dumps(metadata,ensure_ascii=False,indent=2)+'\n')
    assert len(extracted)==825 and all(a[1]<b[1] for a,b in zip(extracted,extracted[1:]))
    assert all(math.isfinite(v) for row in extracted for v in row)
    print(json.dumps({'csv':str(out),'rows':len(extracted),'range_hz':metadata['frequency_range_hz'],
        'reference_db':reference,'frequency_calibration_residual_px':x_error,
        'level_calibration_residual_px':y_error},ensure_ascii=False,indent=2))


if __name__ == '__main__':
    main()
