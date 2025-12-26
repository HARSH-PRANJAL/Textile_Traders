import Foundation

class Order {
    static var nextId: Int = 1
    let id: Int
    let buyer: Buyer
    let seller: Seller
    let item: OrderItem
    let shipment: Shipment

    init(
        buyer: Buyer,
        seller: Seller,
        item: OrderItem,
        shipment: Shipment
    ) {
        
        self.id = Order.nextId
        Order.nextId += 1
        self.buyer = buyer
        self.seller = seller
        self.item = item
        self.shipment = shipment
        

    }
    
    var totalItemValue: Double {
        return item.quantity * item.item.pricePerUnit
    }
    
    var totalAmount: Double {
        return self.totalItemValue + self.shipment.totalFare
    }
}
