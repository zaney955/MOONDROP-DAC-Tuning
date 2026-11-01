import AppKit
import Foundation

let args = CommandLine.arguments
let source = NSImage(contentsOfFile: args[1])!
let points = try JSONSerialization.jsonObject(with: Data(contentsOf: URL(fileURLWithPath: args[2]))) as! [[Double]]
let output = args[3]
let width = 1800, height = 980
let bitmap = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: width, pixelsHigh: height, bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false, colorSpaceName: .deviceRGB, bytesPerRow: 0, bitsPerPixel: 0)!
NSGraphicsContext.saveGraphicsState()
NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: bitmap)
NSColor.white.setFill()
NSRect(x: 0, y: 0, width: width, height: height).fill()
let dst = NSRect(x: 25, y: 30, width: 1750, height: 860)
let src = NSRect(x: 40, y: 889-795, width: 875, height: 430)
source.draw(in: dst, from: src, operation: .copy, fraction: 1, respectFlipped: false, hints: [.interpolation: NSImageInterpolation.high])
let red = NSColor(srgbRed: 0.91, green: 0.17, blue: 0.09, alpha: 1)
let path = NSBezierPath()
for (i,p) in points.enumerated() {
    let position = NSPoint(x: 25+(p[0]-40)*2, y: 30+(795-p[1])*2)
    if i == 0 { path.move(to: position) } else { path.line(to: position) }
}
path.lineWidth = 1.5
path.lineJoinStyle = .round
red.setStroke(); path.stroke()
func label(_ string: String, _ x: Double, _ y: Double, _ size: Double, _ color: NSColor) {
    (string as NSString).draw(at: NSPoint(x: x,y: y), withAttributes: [.font: NSFont.systemFont(ofSize: size), .foregroundColor: color])
}
label("原道十周年 · 官方频响与 CSV 提取曲线叠加", 55, 930, 29, .black)
label("紫色：官方原图", 55, 892, 21, NSColor(srgbRed: 0.36,green: 0.32,blue: 0.85,alpha: 1))
label("红色细线：CSV 反算曲线（825 点）", 300, 892, 21, red)
label("同图回投检查 · 3.5 mm / 无海绵 / B&K 5128", 1000, 896, 18, .darkGray)
NSGraphicsContext.restoreGraphicsState()
try bitmap.representation(using: .png, properties: [:])!.write(to: URL(fileURLWithPath: output))
