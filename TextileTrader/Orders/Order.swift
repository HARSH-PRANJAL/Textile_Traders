import Foundation

class Order {
    let id = UUID()
    let buyer: Buyer
    let seller: Seller
    let items: [OrderItem]
    let shipment: Shipment

    init(buyer: Buyer, seller: Seller, items: [OrderItem], shipment: Shipment) {
        self.buyer = buyer
        self.seller = seller
        self.items = items
        self.shipment = shipment
    }
}
