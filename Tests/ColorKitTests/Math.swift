import Testing

@testable import ColorKit

@Suite("Math tests")
struct MathTestSuite {
    // MARK: Custom color swatches for testing
    let red = rgb(1, 0, 0)
    let green = rgb(0, 1, 0)
    let blue = rgb(0, 0, 1)
    let cyan = rgb(0, 1, 1)
    let magenta = rgb(1, 0, 1)
    let yellow = rgb(1, 1, 0)

    // MARK: Tests
    @Test("Calculate complimentary colors")
    func calculateComplimentaryColor() async throws {
        #expect(red.compliment == cyan)
        #expect(green.compliment == magenta)
        #expect(blue.compliment == yellow)
        #expect(cyan.compliment == red)
        #expect(magenta.compliment == green)
        #expect(yellow.compliment == blue)
    }

    @Test("Convert between color systems")
    func convertBetweenColorSystems() async throws {
        let hsbRed = hsb(0, 1, 1)
        let hsbGreen = hsb(120 / 360, 1, 1)
        let hsbBlue = hsb(240 / 360, 1, 1)
        let rgbRed = rgb(1, 0, 0)
        let rgbGreen = rgb(0, 1, 0)
        let rgbBlue = rgb(0, 0, 1)
        // HSB Colors
        #expect(hsbRed.red == rgbRed.red)
        #expect(hsbRed.green == rgbRed.green)
        #expect(hsbRed.blue == rgbRed.blue)
        #expect(hsbGreen.red == rgbGreen.red)
        #expect(hsbGreen.green == rgbGreen.green)
        #expect(hsbGreen.blue == rgbGreen.blue)
        #expect(hsbBlue.red == rgbBlue.red)
        #expect(hsbBlue.green == rgbBlue.green)
        #expect(hsbBlue.blue == rgbBlue.blue)
        // RGB Colors
        #expect(rgbRed.red == hsbRed.red)
        #expect(rgbRed.green == hsbRed.green)
        #expect(rgbRed.blue == hsbRed.blue)
        #expect(rgbGreen.red == hsbGreen.red)
        #expect(rgbGreen.green == hsbGreen.green)
        #expect(rgbGreen.blue == hsbGreen.blue)
        #expect(rgbBlue.red == hsbBlue.red)
        #expect(rgbBlue.green == hsbBlue.green)
        #expect(rgbBlue.blue == hsbBlue.blue)
    }
}
