import Foundation
import Graph

public struct NodeAttributes: DefaultConstructable {
    public var label: String?
    public var color: Color?
    public var style: NodeStyle?
    public var shape: NodeShape?
    
    public init() { }
    
    public init(label: String) {
        self.label = label
    }
    
    public var attributes: String? {
        encodeAttributes([
            ("label", label),
            ("color", color),
            ("style", style),
            ("shape", shape),
        ])
    }
}

func encodeAttribute<T>(name: String, value: T?) -> String? {
    guard let value else {
        return nil
    }
    return "\(name)=\"\(value)\""
}

func encodeAttributes(_ attrs: [(String, Any?)]) -> String? {
    guard !attrs.isEmpty else {
        return nil
    }
    return attrs
        .compactMap { encodeAttribute(name: $0.0, value: $0.1) }
        .joined(separator: " ")
        .flanked("[", "]")
}
