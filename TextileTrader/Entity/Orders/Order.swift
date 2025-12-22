import Foundation

class Order {
    static var nextId: Int = 1
    let id: Int
    let buyer: Buyer
    let seller: Seller
    let item: OrderItem
    let shipment: Shipment

    init?(
        buyer: Buyer,
        seller: Seller,
        item: OrderItem,
        from: Location,
        to: Location
    ) {
        self.id = Order.nextId
        Order.nextId += 1
        self.buyer = buyer
        self.seller = seller
        self.item = item

        var cargoWeight = item.quantity

        let calculator = FareRouteCalculator()
        guard
            let route = calculator.calculateFare(
                from: from,
                to: to,
                cargoWeight: cargoWeight
            )
        else {
            print(
                "\n Error in creating new order. Shipment is not possible to this location ‼️\n"
            )
            return nil
        }

        let newShipment = Shipment(
            from: from,
            to: to,
            path: route.path,
            totalFare: route.totalFare,
            expectedTimeHours: route.totalTimeHours
        )

        self.shipment = newShipment

    }
}
