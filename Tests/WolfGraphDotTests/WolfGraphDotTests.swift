import XCTest
import WolfGraphDot

// Docs: https://graphviz.org/doc/info/lang.html
// Editor: http://magjac.com/graphviz-visual-editor/

final class WolfGraphDotTests: XCTestCase {
    func testDot() throws {
        var graph = DotTestGraph.makeDAG()
        try graph.newNode("Z")
        try graph.newEdge("AZ", tail: "A", head: "Z", data: .init(label: "AZ"))
        try graph.withNodeData("Z") {
            $0.label = "Zebra"
            $0.shape = .pentagon
        }
        try graph.withNodeData("A") {
            $0.color = .red
        }
        try graph.withNodeData("J") {
            $0.style = .filled
        }
        try graph.withEdgeData("AZ") {
            $0.label = "Green"
            $0.color = .green
        }
        try graph.withEdgeData("JA") {
            $0.style = .bold
        }
        try graph.withEdgeData("AC") {
            $0.arrowDirection = .both
        }
        try graph.withEdgeData("BA") {
            $0.style = .bold
        }
        try graph.withEdgeData("IK") {
            $0.arrowHead = .box
        }
        try graph.withEdgeData("IC") {
            $0.arrowDirection = .both
            $0.arrowTail = "olboxrbox"
        }

        let dot = """
        digraph G {
            A [label="A" color="red"]
            B [label="B"]
            C [label="C"]
            D [label="D"]
            E [label="E"]
            F [label="F"]
            G [label="G"]
            H [label="H"]
            I [label="I"]
            J [label="J" style="filled"]
            K [label="K"]
            Z [label="Zebra" shape="pentagon"]
            A -> C [label="AC" dir="both"]
            A -> D [label="AD"]
            A -> E [label="AE"]
            A -> Z [label="Green" color="green"]
            B -> A [label="BA" style="bold"]
            B -> C [label="BC"]
            B -> G [label="BG"]
            C -> D [label="CD"]
            E -> D [label="ED"]
            F -> D [label="FD"]
            F -> E [label="FE"]
            I -> G [label="GI"]
            H -> J [label="HJ"]
            B -> I [label="IB"]
            I -> C [label="IC" dir="both" arrowtail="olboxrbox"]
            I -> K [label="IK" arrowhead="box"]
            J -> A [label="JA" style="bold"]
            J -> E [label="JE"]
            J -> F [label="JF"]
        }
        """
        XCTAssertEqual(graph.dotFormat, dot)
    }
}
