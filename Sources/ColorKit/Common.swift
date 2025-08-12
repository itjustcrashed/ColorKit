import Foundation

/// Convert RGB values to HSB.
func rgbToHSB(_ red: Double, _ green: Double, _ blue: Double) -> (
    hue: Double, saturation: Double, brightness: Double
) {
    let r = red
    let g = green
    let b = blue

    let maxVal = max(r, g, b)
    let minVal = min(r, g, b)
    let delta = maxVal - minVal

    var hue: Double = 0
    var saturation: Double = 0
    let brightness = maxVal

    if delta != 0 {
        saturation = delta / maxVal

        if maxVal == r {
            hue = (g - b) / delta + (g < b ? 6 : 0)
        } else if maxVal == g {
            hue = (b - r) / delta + 2
        } else {
            hue = (r - g) / delta + 4
        }
        hue /= 6
    }

    return (hue, saturation, brightness)
}

/// Convert HSB values to RGB.
func hsbToRGB(_ hue: Double, _ saturation: Double, _ brightness: Double) -> (
    red: Double, green: Double, blue: Double
) {
    let clampedHue = min(max(hue, 0), 1)
    let clampedSaturation = min(max(saturation, 0), 1)
    let clampedBrightness = min(max(brightness, 0), 1)
    
    let h = clampedHue * 6
    let c = clampedBrightness * clampedSaturation
    let x = c * (1 - abs(h.truncatingRemainder(dividingBy: 2) - 1))
    let m = clampedBrightness - c

    var r: Double = 0
    var g: Double = 0
    var b: Double = 0

    if h >= 0 && h < 1 {
        r = c; g = x; b = 0
    } else if h >= 1 && h < 2 {
        r = x; g = c; b = 0
    } else if h >= 2 && h < 3 {
        r = 0; g = c; b = x
    } else if h >= 3 && h < 4 {
        r = 0; g = x; b = c
    } else if h >= 4 && h < 5 {
        r = x; g = 0; b = c
    } else if h >= 5 && h < 6 {
        r = c; g = 0; b = x
    }

    return (r + m, g + m, b + m)
}
