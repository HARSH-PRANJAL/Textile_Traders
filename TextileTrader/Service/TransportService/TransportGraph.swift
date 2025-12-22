class TransportGraph {

    private var adjacencyList: [Location: [TransportEdge]] = [:]

    func addLocation(_ location: Location) {
        if adjacencyList[location] == nil {
            adjacencyList[location] = []
        }
    }

    func addEdge(_ edge: TransportEdge) {
        addLocation(edge.from)
        addLocation(edge.to)

        guard let _ = adjacencyList[edge.from]?.append(edge) else {
            print("Failed to add new transport")
            return
        }

        let reverseEdge = TransportEdge(
            from: edge.to,
            to: edge.from,
            type: edge.type,
            farePerTon: edge.farePerTon,
            travelTimeHours: edge.travelTimeHours
        )

        guard let _ = adjacencyList[edge.to]?.append(reverseEdge) else {
            print("Failed to add rerouting to new transport")
            return
        }
    }

    func edges(from location: Location) -> [TransportEdge] {
        adjacencyList[location] ?? []
    }

    func allLocations() -> [Location] {
        Array(adjacencyList.keys)
    }
}
