func registerBuyer(name: String) {
    
    let buyer = Buyer(name: name)
    buyers.append(buyer)
    print("Buyer registered successfully ✅")
    
}

func registerSeller(name: String) {
    
    let seller = Seller(name: name)
    sellers.append(seller)
    print("Seller registered successfully ✅")
    
}

func registerServiceProvider(name: String) {
    
    let provider = ServiceProvider(name: name)
    serviceProviders.append(provider)
    print("Service Provider registered successfully ✅")
    
}

func listAllItems() {

    for seller in sellers {
        print("\nSeller: \(seller.name) \(seller.id)")

        for item in seller.listItems() {
            print("Item ID : \(item.id)")
            print("Item : \(item.name)")
            print("Item Unit Price : \(item.pricePerUnit)")
        }
    }

}

func initiateItemPurchase(for buyer: Buyer, from seller: Seller) {

    print("Enter item id : ", terminator: " ")
    let itemId = IO.readInt()

    if !seller.hasItem(withId: itemId) {
        print(
            "Seller \(seller.name) is not the owner of item with id \(itemId)"
        )
        return
    }

    print("Enter Item Quantity : ", terminator: " ")
    let quantity = IO.readDouble()

    print("Enter pickup location pin : ", terminator: " ")
    let pickupPin = IO.readInt()
    guard let source = locations[pickupPin] else {
        print("Invalid pickup location ‼️")
        return
    }

    let deliveryPin = IO.readInt()
    guard let destination = locations[deliveryPin] else {
        print("Invalid delivery location ‼️")
        return
    }

    guard let item = seller.sellItemIfAvailable(itemId) else {
        print("Item is out of stock")
        return
    }

    let isCompleted = buyer.buyItem(
        item: item,
        quantity: quantity,
        from: seller,
        pickupLocation: source,
        dropLocation: destination
    )

    if !isCompleted {
        let _ = seller.addItem(item)
    }

}
