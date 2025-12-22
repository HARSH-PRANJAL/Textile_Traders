struct BillService {
    static func createBill(buyer: Buyer, seller: Seller, products: [Item]) -> Bill? {
        
        print("Enter Source PIN code: ",terminator: " ")
        let sourcePin = IO.readInt()
        
        print("Enter Destination PIN code: ",terminator: " ")
        let destinationPin = IO.readInt()
        
        guard let source = locations[sourcePin],
              let destination = locations[destinationPin]
        else {
            print(" Failed to create bill ‼️ ")
            return nil
        }
        
        var orderItems: [OrderItem] = []
        
        for item in products {
            print(" Enter the quantity of \(item.name): ",terminator: " ")
            let quantity = IO.readDouble()
            
            
            orderItems.append(OrderItem(item: item, quantity: quantity))
        }
        
        guard let order = AppFactory.createOrder(buyer: buyer, seller: seller, items: orderItems, from: source, to: destination) else {
            return nil
        }
        
        let newBill = Bill(order: order)
        if(newBill.order.shipment.path.isEmpty){
            return nil
        }
        
        return newBill
        
    }
}
