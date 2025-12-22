import Foundation

class ServiceProvider: User {
    static var nextId: Int = 1
    let id: Int
    var name: String
    let graph: TransportGraph
    var password: String

    init(name: String, graph: TransportGraph, password: String) {
        self.id = ServiceProvider.nextId
        ServiceProvider.nextId += 1
        self.name = name
        self.graph = graph
        self.password = password
    }

    func registerLocation(code: String, pin: Int, name: String) {
        let location = Location(code: code, pin: pin, name: name)
        graph.addLocation(location)
    }

    func addTransport(
        from: Location,
        to: Location,
        type: TransportType,
        farePerTon: Double,
        timeHours: Double
    ) {
        let edge = TransportEdge(
            from: from,
            to: to,
            type: type,
            farePerTon: farePerTon,
            travelTimeHours: timeHours
        )
        graph.addEdge(edge)
    }
}
