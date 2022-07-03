import XCTest
import GraphDot

// Docs: https://graphviz.org/doc/info/lang.html
// Editor: http://magjac.com/graphviz-visual-editor/

final class GraphDotTests: XCTestCase {
    func testDotGraph() throws {
        let graph = DotTestGraph.makeGraph()
        let dot = """
        digraph G {
            A [label="A"]
            B [label="B"]
            C [label="C"]
            D [label="D"]
            E [label="E"]
            F [label="F"]
            G [label="G"]
            H [label="H"]
            I [label="I"]
            J [label="J"]
            K [label="K"]
            A -> C [label="AC"]
            A -> D [label="AD"]
            A -> E [label="AE"]
            B -> A [label="BA"]
            B -> C [label="BC"]
            B -> G [label="BG"]
            C -> D [label="CD"]
            E -> D [label="ED"]
            F -> D [label="FD"]
            F -> E [label="FE"]
            G -> I [label="GI"]
            H -> J [label="HJ"]
            I -> B [label="IB"]
            I -> C [label="IC"]
            I -> K [label="IK"]
            J -> A [label="JA"]
            J -> E [label="JE"]
            J -> F [label="JF"]
        }
        """
        XCTAssertEqual(graph.dotFormat, dot)
    }

    func testDotDAG() throws {
        let graph = DotTestGraph.makeDAG()
        let dot = """
        digraph G {
            A [label="A"]
            B [label="B"]
            C [label="C"]
            D [label="D"]
            E [label="E"]
            F [label="F"]
            G [label="G"]
            H [label="H"]
            I [label="I"]
            J [label="J"]
            K [label="K"]
            A -> C [label="AC"]
            A -> D [label="AD"]
            A -> E [label="AE"]
            B -> A [label="BA"]
            B -> C [label="BC"]
            B -> G [label="BG"]
            C -> D [label="CD"]
            E -> D [label="ED"]
            F -> D [label="FD"]
            F -> E [label="FE"]
            I -> G [label="GI"]
            H -> J [label="HJ"]
            B -> I [label="IB"]
            I -> C [label="IC"]
            I -> K [label="IK"]
            J -> A [label="JA"]
            J -> E [label="JE"]
            J -> F [label="JF"]
        }
        """
        XCTAssertEqual(graph.dotFormat, dot)
    }

    func testDotTree() throws {
        let graph = DotTestGraph.makeTree()
        let dot = """
        digraph G {
            A [label="A"]
            B [label="B"]
            C [label="C"]
            D [label="D"]
            E [label="E"]
            F [label="F"]
            G [label="G"]
            H [label="H"]
            I [label="I"]
            J [label="J"]
            K [label="K"]
            L [label="L"]
            M [label="M"]
            N [label="N"]
            O [label="O"]
            A -> B [label="AB"]
            A -> C [label="AC"]
            A -> D [label="AD"]
            B -> I [label="BI"]
            C -> H [label="CH"]
            D -> E [label="DE"]
            D -> F [label="DF"]
            D -> G [label="DG"]
            E -> M [label="EM"]
            E -> N [label="EN"]
            E -> O [label="EO"]
            F -> L [label="FL"]
            H -> J [label="HJ"]
            H -> K [label="HK"]
        }
        """
        XCTAssertEqual(graph.dotFormat, dot)
    }

    func testDotAttributes() throws {
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
