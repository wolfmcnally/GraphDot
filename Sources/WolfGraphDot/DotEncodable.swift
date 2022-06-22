import Foundation
import WolfGraph

public protocol DotEncodable: ViewableGraph {
    func dotNodeAttributes(_ node: NodeID) -> NodeAttributes?
    func dotEdgeAttributes(_ edge: EdgeID) -> EdgeAttributes?
}

public extension DotEncodable {
    func dotNodeAttributes(_ node: NodeID) -> NodeAttributes? {
        nil
    }
    
    func dotEdgeAttributes(_ edge: EdgeID) -> EdgeAttributes? {
        nil
    }
}

public extension DotEncodable {
    var dotFormat: String {
        var result: [String] = []
        
        func attribute(name: String, value: String) -> String {
            """
            [\(name)="\(value)"]
            """
        }

        result.append("digraph G {")
        
        for node in nodes {
            let attributes = dotNodeAttributes(node)
            var line: [String] = ["\t"]
            line.append(node.description)
            if let label = attributes?.label {
                line.append(attribute(name: "label", value: label))
            }
            if let color = attributes?.color {
                line.append(attribute(name: "color", value: color))
            }
            if let style = attributes?.style {
                line.append(attribute(name: "style", value: style))
            }
            if let shape = attributes?.shape {
                line.append(attribute(name: "shape", value: shape))
            }
            line.append(";")
            result.append(line.joined())
        }
        
        for edge in edges {
            var line: [String] = ["\t"]
            try! line.append(edgeTail(edge).description)
            line.append(" -> ")
            try! line.append(edgeHead(edge).description)
            if let attributes = dotEdgeAttributes(edge) {
                if let label = attributes.label {
                    line.append(attribute(name: "label", value: label))
                }
                if let color = attributes.color {
                    line.append(attribute(name: "color", value: color))
                }
                if let style = attributes.style {
                    line.append(attribute(name: "style", value: style))
                }
                if let dir = attributes.arrowDirection {
                    line.append(attribute(name: "dir", value: dir.rawValue))
                }
            }
            line.append(";")
            result.append(line.joined())
        }
        
        result.append("}")
        
        return result.joined(separator: "\n")
    }
}
