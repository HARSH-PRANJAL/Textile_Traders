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
        orderItem: OrderItem,
        from seller: Seller,
        pickupLocation: Location,
        dropLocation: Location
    ) {
        guard
            let order = Order(
                buyer: self,
                seller: seller,
                item: orderItem,
                from: pickupLocation,
                to: dropLocation
            )
        else {
            print("Source or Destination is not reachable ")
            return
        }
        
        orders.append(order)
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
