import Foundation

struct AppFactory {
    
    static func createBuyer(name: String, password: String) -> Buyer {
        return Buyer(name: name, password: password)
    }

    static func createSeller(name: String, password: String) -> Seller {
        return Seller(name: name, password: password)
    }

    static func createServiceProvider( name: String, graph: TransportGraph,
                                       password: String) -> ServiceProvider
    {
        return ServiceProvider(name: name,graph: graph,
                               password: password)
    }

    static func createItem(name: String, price: Double) -> Item {
        return Item(
            name: name,
            pricePerUnit: price
        )
    }

    static func createLocation(code: String, pin: Int, name: String) -> Location {
            return Location(code: code, pin: pin, name: name)
    }

    static func createTruck() -> Transport {
        return Truck()
    }

    static func createShip() -> Transport {
        return Ship()
    }

    static func createShipment(from: Location,to: Location,
                               cargoWeight: Double,
                               graph: TransportGraph = transportGraph) -> Shipment?
    {

        let calculator = FareRouteCalculator()

        guard let route = calculator.calculateFare(from: from,to: to,
                                                   cargoWeight: cargoWeight)
        else {
            return nil
        }

        return Shipment(
            from: from,
            to: to,
            path: route.path,
            totalFare: route.totalFare,
            expectedTimeHours: route.totalTimeHours
        )
    }
    
    static func createOrder(buyer: Buyer, seller: Seller,
                            items: [OrderItem],from source: Location,
                            to destination: Location) -> Order?
    {
        
        let order = Order(buyer: buyer,seller: seller,
                          items: items,from: source,
                          to: destination)
        return order
    }

}
