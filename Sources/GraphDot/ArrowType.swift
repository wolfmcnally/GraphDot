import Foundation

public struct ArrowType: Hashable, ExpressibleByStringLiteral, Sendable {
    let type: String
    
    public init(_ type: String) {
        self.type = type
    }
    
    public init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }
    
    public static let box = ArrowType("box")
    public static let crow = ArrowType("crow")
    public static let diamond = ArrowType("diamond")
    public static let dot = ArrowType("dot")
    public static let inv = ArrowType("inv")
    public static let none = ArrowType("none")
    public static let normal = ArrowType("normal")
    public static let tee = ArrowType("tee")
    public static let vee = ArrowType("vee")
    public static let odot = ArrowType("odot")
    public static let invdot = ArrowType("invdot")
    public static let invodot = ArrowType("invodot")
    public static let obox = ArrowType("obox")
    public static let odiamond = ArrowType("odiamond")
}

extension ArrowType: CustomStringConvertible {
    public var description: String {
        type
    }
}
