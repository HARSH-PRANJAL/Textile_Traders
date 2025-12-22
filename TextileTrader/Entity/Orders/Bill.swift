class Bill {

    let order: Order

    init(order: Order) {
        self.order = order
    }

    func generateTotalAmount() -> Double {

        let itemsCost = order.item.quantity * order.item.item.pricePerUnit

        let transportCost = order.shipment.totalFare

        return itemsCost + transportCost
    }
}
