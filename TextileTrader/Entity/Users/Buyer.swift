import Foundation

class Buyer: User {
    static var nextId: Int = 1
    let id: Int
    var name: String
    var bills: [Bill] = []

    init(name: String) {
        self.id = Buyer.nextId
        Buyer.nextId += 1
        self.name = name
    }

    func buyItem(
        _ item: Item,
        from seller: Seller,
        quantity: Double,
        pickupLocation: Location,
        dropLocation: Location
    ) {

        let orderItem = OrderItem(item: item, quantity: quantity)
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
        
        seller.inventory.sellItem(id: item.id)
        let newBill = Bill(order: order)
        self.bills.append(newBill)
    }

    func displayBills() {
        for bill in bills {
            print("\n Bill ID: \(bill.order.id)")
            print("Seller Name: \(bill.order.seller.name)")
            print("Total Amount: \(bill.generateTotalAmount())")
            print("Path: \(bill.order.shipment.displayPath())\n")
        }
    }

}
