import Foundation

// https://graphviz.org/doc/info/colors.html

public struct Color: Hashable, Sendable {
    public let schemeName: String?
    public let colorName: String
    
    public var fullColorName: String {
        var components: [String] = []
        if let schemeName {
            components.append(contentsOf: ["", schemeName])
        }
        components.append(colorName)
        return components.joined(separator: "/")
    }
    
    public init(r: UInt8, g: UInt8, b: UInt8, a: UInt8? = nil) {
        self.schemeName = nil
        let components = [r, g, b, a].compactMap { $0?.hex }.joined()
        self.colorName = "#" + components
    }
    
    public init(h: Double, s: Double, v: Double) {
        self.schemeName = nil
        self.colorName = "\(h) \(s) \(v)"
    }
    
    public init(x11ColorName: String) {
        self.schemeName = "x11"
        self.colorName = x11ColorName
    }
    
    public init(svgColorName: String) {
        self.schemeName = "svg"
        self.colorName = svgColorName
    }
    
    public init(scheme: BrewerScheme, index: Int, maxIndex: Int = 5) {
        self.schemeName = "\(scheme.rawValue)\(maxIndex)"
        self.colorName = String(describing: index)
    }
    
    // https://r-graph-gallery.com/38-rcolorbrewers-palettes.html
    public enum BrewerScheme: String {
        // Sequential
        case blues
        case bugn
        case bupu
        case gnbu
        case greens
        case greys
        case oranges
        case orrd
        case pubu
        case pubugn
        case purd
        case purples
        case rdpu
        case reds
        case ylgn
        case ylgnbu
        case ylorbr
        case ylorrd

        // Divergent
        case accent
        case dark2
        case paired
        case pastel1
        case pastel2
        case set1
        case set2
        case set3

        // Qualitative
        case brbg
        case piyg
        case prgn
        case puor
        case rdbu
        case rdgy
        case rdylbu
        case rdylgn
        case spectral
    }
}

extension Color: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.init(x11ColorName: value)
    }
}

extension Color {
    public static let red: Color = "red"
    public static let green: Color = "green"
    public static let blue: Color = "blue"
    public static let cyan: Color = "cyan"
    public static let magenta: Color = "magenta"
    public static let yellow: Color = "yellow"
    public static let black: Color = "black"
    public static let white: Color = "white"
    public static let gray: Color = "gray"
}

extension Color: CustomStringConvertible {
    public var description: String {
        colorName
    }
}
