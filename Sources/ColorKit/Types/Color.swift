import Foundation
import OSLog

/// A representation of a color.
public struct Color: Codable, Hashable, Equatable, Sendable {
    /// The red value as a decimal clamped between 0.0 and 1.0
    public var red: Double {
        get { _red }
        set {
            _red = min(max(newValue, 0.0), 1.0)
            updateHSBFromRGB()
        }
    }
    private var _red: Double

    /// The green value as a decimal clamped between 0.0 and 1.0.
    public var green: Double {
        get { _green }
        set {
            _green = min(max(newValue, 0.0), 1.0)
            updateHSBFromRGB()
        }
    }
    private var _green: Double

    /// The blue value as a decimal clamped between 0.0 and 1.0.
    public var blue: Double {
        get { _blue }
        set {
            _blue = min(max(newValue, 0.0), 1.0)
            updateHSBFromRGB()
        }
    }
    private var _blue: Double

    /// The hue as a decimal clamped between 0.0 and 1.0.
    public var hue: Double {
        get { _hue }
        set {
            _hue = min(max(newValue, 0.0), 1.0)
            updateRGBFromHSB()
        }
    }
    private var _hue: Double

    /// The saturation as a decimal clamped between 0.0 and 1.0.
    public var saturation: Double {
        get { _saturation }
        set {
            _saturation = min(max(newValue, 0.0), 1.0)
            updateRGBFromHSB()
        }
    }
    private var _saturation: Double

    /// The brightness as a decimal clamped between 0.0 and 1.0.
    public var brightness: Double {
        get { _brightness }
        set {
            _brightness = min(max(newValue, 0.0), 1.0)
            updateRGBFromHSB()
        }
    }
    private var _brightness: Double

    /// Initialize a color from RGB and HSB values
    public init(
        red: Double,
        green: Double,
        blue: Double,
        hue: Double,
        saturation: Double,
        brightness: Double
    ) {
        self._red = min(max(red, 0.0), 1.0)
        self._green = min(max(green, 0.0), 1.0)
        self._blue = min(max(blue, 0.0), 1.0)
        self._hue = min(max(hue, 0.0), 1.0)
        self._saturation = min(max(saturation, 0.0), 1.0)
        self._brightness = min(max(brightness, 0.0), 1.0)
    }

    /// Initialize a color from RGB values and calculated HSB values.
    public init(
        red: Double,
        green: Double,
        blue: Double
    ) {
        self._red = min(max(red, 0.0), 1.0)
        self._green = min(max(green, 0.0), 1.0)
        self._blue = min(max(blue, 0.0), 1.0)
        let hsbValues = rgbToHSB(red, green, blue)
        self._hue = hsbValues.hue
        self._saturation = hsbValues.saturation
        self._brightness = hsbValues.brightness
    }

    /// Initialize a color from HSB values and calculated RGB values.
    public init(
        hue: Double,
        saturation: Double,
        brightness: Double
    ) {
        self._hue = min(max(hue, 0.0), 1.0)
        self._saturation = min(max(saturation, 0.0), 1.0)
        self._brightness = min(max(brightness, 0.0), 1.0)
        let rgbValues = hsbToRGB(hue, saturation, brightness)
        self._red = rgbValues.red
        self._blue = rgbValues.blue
        self._green = rgbValues.green
    }

    // MARK: - Private Synchronization Methods

    /// Update HSB values from the current RGB values.
    private mutating func updateHSBFromRGB() {
        let hsbValues = rgbToHSB(_red, _green, _blue)
        _hue = hsbValues.hue
        _saturation = hsbValues.saturation
        _brightness = hsbValues.brightness
    }

    /// Update RGB values from the current HSB values.
    private mutating func updateRGBFromHSB() {
        let rgbValues = hsbToRGB(_hue, _saturation, _brightness)
        _red = rgbValues.red
        _green = rgbValues.green
        _blue = rgbValues.blue
    }
}