import Foundation

class ServiceProvider: User {
    static var nextId: Int = 1
    let id: Int
    var name: String
    var password: String

    init(name: String, password: String) {
        self.id = ServiceProvider.nextId
        ServiceProvider.nextId += 1
        self.name = name
        self.password = password
    }

    func addTransport(
        from: Location,
        to: Location,
        type: TransportType,
        farePerTon: Double,
        timeHours: Double,
        graph: TransportGraph = transportGraph
    ) {
        let edge = TransportEdge(
            contactPersonId: self.id,
            from: from,
            to: to,
            type: type,
            farePerTon: farePerTon,
            travelTimeHours: timeHours
        )
        graph.addEdge(edge)
    }
}
