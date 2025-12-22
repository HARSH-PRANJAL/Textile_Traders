class FareRouteCalculator {

    let graph = transportGraph

    func calculateFare(
        from source: Location,
        to destination: Location,
        cargoWeight: Double
    ) -> FareRouteResult? {

        var fareDistance: [Location: Double] = [:]
        var timeDistance: [Location: Double] = [:]
        var previous: [Location: Location] = [:]
        var visited: Set<Location> = []

        for location in graph.allLocations() {
            fareDistance[location] = Double.infinity
            timeDistance[location] = Double.infinity
        }

        fareDistance[source] = 0
        timeDistance[source] = 0

        while true {

            var current: Location? = nil
            var minValue = Double.infinity

            for (key, value) in fareDistance {
                if !visited.contains(key) && value < minValue {
                    minValue = value
                    current = key
                }
            }

            

            guard let currentLocation = current else {
                break
            }

            visited.insert(currentLocation)

            for edge in graph.edges(from: currentLocation) {

                let edgeFare = edge.farePerTon * cargoWeight
                let newFare = (fareDistance[currentLocation] ?? .infinity) + edgeFare
                let newTime = (timeDistance[currentLocation] ?? .infinity) + edge.travelTimeHours

                if newFare < (fareDistance[edge.to] ?? .infinity) {
                    fareDistance[edge.to] = newFare
                    timeDistance[edge.to] = newTime
                    previous[edge.to] = currentLocation
                }
            }
        }

        guard let finalFare = fareDistance[destination],
              let finalTime = timeDistance[destination],
              finalFare != Double.infinity else {
            return nil
        }

        var path: [Location] = []
        var current: Location? = destination

        while let loc = current {
            path.append(loc)
            current = previous[loc]
        }

        return FareRouteResult(
            totalFare: finalFare,
            totalTimeHours: finalTime,
            path: path.reversed()
        )
    }
}
