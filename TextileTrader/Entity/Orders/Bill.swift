class Bill {

    let order: Order

    init(order: Order) {
        self.order = order
    }

    func generateTotalAmount() -> Double {
        return order.totalAmount()
    }
}
