import Foundation
import WolfGraph

public struct EdgeAttributes: ElementData {
    public var label: String?
    public var color: Color?
    public var style: EdgeStyle?
    public var shape: String?
    public var arrowDirection: ArrowDirection?
    public var arrowHead: ArrowType?
    public var arrowTail: ArrowType?
    
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
            ("dir", arrowDirection),
            ("arrowhead", arrowHead),
            ("arrowtail", arrowTail),
        ])
    }
}
