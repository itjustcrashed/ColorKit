import Foundation

/// Get a ``Color`` from HSB values.
/// - Parameter hue: The hue as a decimal clamped between 0.0 and 1.0.
/// - Parameter saturation: The saturation as a decimal clamped between 0.0 and 1.0.
/// - Parameter brightness: The brightness as a decimal clamped between 0.0 and 1.0.
/// - Returns: A ``Color`` instance with the specified HSB values.
public func hsb(_ hue: Double, _ saturation: Double, _ brightness: Double) -> Color {
    return Color(hue: hue, saturation: saturation, brightness: brightness)
}

/// Get a ``Color`` from RGB values.
/// - Parameter red: The red component as a decimal clamped between 0.0 and 1.0.
/// - Parameter green: The green component as a decimal clamped between 0.0 and 1.0.
/// - Parameter blue: The blue component as a decimal clamped between 0.0 and 1.0.
/// - Returns: A ``Color`` instance with the specified RGB values.
public func rgb(_ red: Double, _ green: Double, _ blue: Double) -> Color {
    return Color(red: red, green: green, blue: blue)
}
