extension Color {
    /// The compliment of this color.
    /// - Returns: A new `Color` instance that is the compliment of this color.
    /// - SeeAlso: [Wikipedia: Complementary colors](https://en.wikipedia.org/wiki/Complementary_color)
    public var compliment: Color {
        rgb(1.0 - red, 1.0 - green, 1.0 - blue)
    }
}
