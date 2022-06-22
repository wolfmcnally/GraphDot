import Foundation
import WolfGraph

public struct NodeAttributes: ElementData {
    public var label: String?
    public var color: String?
    public var style: String?
    public var shape: String?
    public var arrowDirection: ArrowDirection?
    
    public init() { }
    
    public init(label: String) {
        self.label = label
    }
}

public struct EdgeAttributes: ElementData {
    public var label: String?
    public var color: String?
    public var style: String?
    public var shape: String?
    public var arrowDirection: ArrowDirection?
    
    public init() { }

    public init(label: String) {
        self.label = label
    }
}
