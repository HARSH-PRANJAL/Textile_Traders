import Foundation

class Buyer: User {
    static var nextId: Int = 1
    let id: Int
    var name: String
    var password: String
    var bills: [Bill] = []

    init(name: String, password: String) {
        self.id = Buyer.nextId
        Buyer.nextId += 1
        self.name = name
        self.password = password
    }

    func buyItem(
        _ item: Item,
        from seller: Seller,
        quantity: Double,
        pickupLocation: Location,
        dropLocation: Location
    ) {

        var orderItem = OrderItem(item: item, quantity: quantity)
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

        let newBill = Bill(order: order)
        self.bills.append(newBill)

    }

    func displayBills() {
        for bill in bills {
            print("\n Bill ID: \(bill.order.id)")
            print("Seller Name: \(bill.order.seller.name)")
            print("Total: \(bill.generateTotalAmount())")
            print("Path: \(bill.order.shipment.path)\n")
        }
    }

}
