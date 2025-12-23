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

        if var sourceEdge = adjacencyList[edge.from] {
            sourceEdge.append(edge)
        } else {
            print("Failed to add new transport")
            return
        }

        let reverseEdge = TransportEdge(
            contactPersonId: edge.contactPersonId,
            from: edge.to,
            to: edge.from,
            type: edge.type,
            farePerTon: edge.farePerTon,
            travelTimeHours: edge.travelTimeHours
        )

        if var destinationEdge = adjacencyList[edge.to] {
            destinationEdge.append(reverseEdge)
        } else {
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
