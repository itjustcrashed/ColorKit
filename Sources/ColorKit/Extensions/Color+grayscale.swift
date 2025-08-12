extension Color {
    /// The grayscale conversion of this color.
    var grayscale: Color {
        hsb(0, 0, self.brightness)
    }
}
