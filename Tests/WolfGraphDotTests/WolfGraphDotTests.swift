import XCTest
import WolfGraphDot

final class WolfGraphDotTests: XCTestCase {
    func testDot() throws {
        let graph = try DotTestGraph.makeDAG()
            .newNode("Z")
            .newEdge("AZ", tail: "A", head: "Z", data: .init(label: "AZ"))
            .withNodeData("Z")
        {
            $0.label = "Zebra"
            $0.shape = .pentagon
        }
        .withNodeData("A") {
            $0.color = .red
        }
        .withNodeData("J") {
            $0.style = .filled
        }
        .withEdgeData("AZ") {
            $0.label = "Green"
            $0.color = .green
        }
        .withEdgeData("JA") {
            $0.style = .bold
        }
        .withEdgeData("AC") {
            $0.arrowDirection = .both
        }
        .withEdgeData("IK") {
            $0.arrowHead = .box
        }
        .withEdgeData("IC") {
            $0.arrowDirection = .both
            $0.arrowTail = "olboxrbox"
        }

        print(graph.dotFormat)
    }
}
