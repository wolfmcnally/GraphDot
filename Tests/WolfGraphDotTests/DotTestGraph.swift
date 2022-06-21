import Foundation
import WolfGraph
import WolfGraphDot

struct DotTestGraph: EditableGraph, JSONCodable {
    typealias NodeID = String
    typealias EdgeID = String
    typealias NodeData = DotAttributes
    typealias EdgeData = DotAttributes

    typealias InnerGraph = Graph<NodeID, EdgeID, NodeData, EdgeData>
    let innerGraph: InnerGraph

    init() {
        innerGraph = InnerGraph()
    }
    
    init(_ innerGraph: InnerGraph) {
        self.innerGraph = innerGraph
    }

    init(edges: [(String, String, String)]) throws {
        var graph = InnerGraph()
        
        for edge in edges {
            let (label, tail, head) = edge
            if graph.hasNoNode(tail) {
                graph = try graph.newNode(tail, data: .init(label: tail))
            }
            if graph.hasNoNode(head) {
                graph = try graph.newNode(head, data: .init(label: head))
            }
            graph = try graph.newEdge(label, tail: tail, head: head, data: .init(label: label))
        }
        
        self.innerGraph = graph
    }
}

extension DotTestGraph {
    static func makeDAG() -> Self {
        try! Self(edges: [
            ("AC", "A", "C"),
            ("AD", "A", "D"),
            ("AE", "A", "E"),
            ("BA", "B", "A"),
            ("BC", "B", "C"),
            ("BG", "B", "G"),
            ("CD", "C", "D"),
            ("ED", "E", "D"),
            ("FD", "F", "D"),
            ("FE", "F", "E"),
            ("HJ", "H", "J"),
            ("IC", "I", "C"),
            ("IK", "I", "K"),
            ("JA", "J", "A"),
            ("JE", "J", "E"),
            ("JF", "J", "F"),
            ("GI", "I", "G"),
            ("IB", "B", "I"),
        ])
    }
    
    static func makeGraph() -> Self {
        try! Self(edges: [
            ("AC", "A", "C"),
            ("AD", "A", "D"),
            ("AE", "A", "E"),
            ("BA", "B", "A"),
            ("BC", "B", "C"),
            ("BG", "B", "G"),
            ("CD", "C", "D"),
            ("ED", "E", "D"),
            ("FD", "F", "D"),
            ("FE", "F", "E"),
            ("HJ", "H", "J"),
            ("IC", "I", "C"),
            ("IK", "I", "K"),
            ("JA", "J", "A"),
            ("JE", "J", "E"),
            ("JF", "J", "F"),
            ("GI", "G", "I"), // back edge
            ("IB", "I", "B"), // back edge
        ])
    }
    
    static func makeTree() -> Self {
        try! Self(edges: [
            ("AB", "A", "B"),
            ("AC", "A", "C"),
            ("AD", "A", "D"),
            ("DE", "D", "E"),
            ("DF", "D", "F"),
            ("DG", "D", "G"),
            ("CH", "C", "H"),
            ("BI", "B", "I"),
            ("HJ", "H", "J"),
            ("HK", "H", "K"),
            ("FL", "F", "L"),
            ("EM", "E", "M"),
            ("EN", "E", "N"),
            ("EO", "E", "O"),
        ])
    }
}

extension DotTestGraph: DotEncodable {
    func dotNodeLabel(_ node: NodeID) -> String? {
        try! nodeData(node).label
    }
    
    func dotNodeColor(_ node: NodeID) -> String? {
        try! nodeData(node).color
    }
    
    func dotNodeStyle(_ node: NodeID) -> String? {
        try! nodeData(node).style
    }
    
    func dotNodeShape(_ node: NodeID) -> String? {
        try! nodeData(node).shape
    }

    
    func dotEdgeLabel(_ edge: EdgeID) -> String? {
        try! edgeData(edge).label
    }
    
    func dotEdgeColor(_ edge: EdgeID) -> String? {
        try! edgeData(edge).color
    }
    
    func dotEdgeStyle(_ edge: EdgeID) -> String? {
        try! edgeData(edge).style
    }
}
