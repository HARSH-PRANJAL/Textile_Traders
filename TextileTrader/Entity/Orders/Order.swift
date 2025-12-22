import Foundation

class Order {
    static var nextId: Int = 1
    let id: Int
    let buyer: Buyer
    let seller: Seller
    let items: [OrderItem]
    let shipment: Shipment

    init?(buyer: Buyer, seller: Seller, items: [OrderItem], from: Location, to: Location) {
        self.id = Order.nextId
        Order.nextId += 1
        self.buyer = buyer
        self.seller = seller
        self.items = items
        
        var cargoWeight: Double = 0
        
        for item in items {
            cargoWeight += item.quantity
        }
        
        guard let newShipment = AppFactory.createShipment(from: from, to: to,cargoWeight: cargoWeight)
        else {
            print("\n Error in creating new order. Shipment is not possible to this location ‼️\n")
                        return nil
        }
        
        self.shipment = newShipment
        
    }
}
