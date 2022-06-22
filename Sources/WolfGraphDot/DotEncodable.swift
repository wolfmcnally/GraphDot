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

        result.append("digraph G {")
        
        for node in nodes {
            var lineComponents: [String] = ["\t"]
            lineComponents.append(node.description)
            lineComponents.append(" ")
            if let attributes = dotNodeAttributes(node)?.attributes {
                lineComponents.append(attributes)
            }
            result.append(lineComponents.joined())
        }
        
        for edge in edges {
            var lineComponents: [String] = ["\t"]
            try! lineComponents.append(edgeTail(edge).description)
            lineComponents.append(" -> ")
            try! lineComponents.append(edgeHead(edge).description)
            lineComponents.append(" ")
            if let attributes = dotEdgeAttributes(edge)?.attributes {
                lineComponents.append(attributes)
            }
            result.append(lineComponents.joined())
        }
        
        result.append("}")
        
        return result.joined(separator: "\n")
    }
}
