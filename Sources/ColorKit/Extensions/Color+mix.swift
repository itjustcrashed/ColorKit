extension Color {
    /// Mixes this color with another color.
    /// The mix is a linear interpolation of the RGB components.
    /// - Parameter amount: 0.0 returns self, 1.0 returns other, 0.5 is an even mix.
    /// - Parameter other: The color to mix into the original color.
    /// - Returns: A new ``Color`` instance that is the result of mixing this color with the other color.
    func mix(with overlay: Color, amount: Double) -> Color {
        let t = min(max(amount, 0.0), 1.0)
        let r = self.red * (1 - t) + overlay.red * t
        let g = self.green * (1 - t) + overlay.green * t
        let b = self.blue * (1 - t) + overlay.blue * t
        return rgb(r, g, b)
    }
}
