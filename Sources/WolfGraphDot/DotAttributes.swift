import Foundation
import WolfGraph

public struct DotAttributes: ElementData {
    var attrs: [String: String] = [:]
    
    public init() { }
    
    public init(label: String) {
        attrs["label"] = label
    }
    
    public var label: String? {
        get {
            attrs["label"]
        }
        
        set {
            attrs["label"] = newValue
        }
    }
    
    public var color: String? {
        get {
            attrs["color"]
        }
        
        set {
            attrs["color"] = newValue
        }
    }
    
    public var style: String? {
        get {
            attrs["style"]
        }
        
        set {
            attrs["style"] = newValue
        }
    }
    
    public var shape: String? {
        get {
            attrs["shape"]
        }
        
        set {
            attrs["shape"] = newValue
        }
    }

    enum CodingKeys: CodingKey {
        case label
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(label, forKey: .label)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        var result: [String: String] = [:]
        
        if let label = try container.decodeIfPresent(String.self, forKey: .label) {
            result["label"] = label
        }
        
        self.attrs = result
    }
}
