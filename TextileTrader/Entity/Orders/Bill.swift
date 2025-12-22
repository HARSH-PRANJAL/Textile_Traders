class Bill {

    let order: Order

    init(order: Order) {
        self.order = order
    }

    func generateTotalAmount() -> Double {

        let itemsCost = order.items.reduce(0.0) {
            $0 + Double($1.quantity) * $1.item.pricePerUnit
        }

        let transportCost = order.shipment.totalFare

        return itemsCost + transportCost
    }
}
