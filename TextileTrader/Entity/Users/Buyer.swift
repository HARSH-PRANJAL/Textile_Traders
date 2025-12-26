import Foundation

class Buyer: User {
    static var nextId: Int = 1
    let id: Int
    var name: String
    var orders: [Order] = []

    init(name: String) {
        
        self.id = Buyer.nextId
        Buyer.nextId += 1
        self.name = name
        
    }

    func buyItem(
        item: Item,
        quantity: Double,
        from seller: Seller,
        pickupLocation: Location,
        dropLocation: Location
    ) -> Bool {

        let orderItem = OrderItem(item: item, quantity: quantity)

        guard
            let shipment = createShipment(
                from: pickupLocation,
                to: dropLocation,
                cargoWight: orderItem.quantity
            )
        else {
            return false
        }

        let order = Order(
            buyer: self,
            seller: seller,
            item: orderItem,
            shipment: shipment
        )

        orders.append(order)
        return true
        
    }

    func displayBills() {
        
        for order in orders {
            print("\n Bill ID: \(order.id)")
            print("Seller Name: \(order.seller.name)")
            print("Total Amount: \(order.totalAmount)")
            print("Path: \(order.shipment.displayPath())\n")
        }
        
    }

}
