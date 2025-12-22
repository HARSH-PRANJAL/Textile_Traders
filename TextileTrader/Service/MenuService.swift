func registerBuyer() {
    print("Enter buyer name: ", terminator: " ")
    let name = readLine() ?? "Unknown Buyer"
    print("Enter buyer password: ", terminator: " ")
    let password = readLine() ?? "123"

    if password == "123" {
        print("You are using default password")
    }

    let buyer = Buyer(name: name, password: password)
    buyers.append(buyer)
    print("Buyer registered successfully ✅")
}

func registerSeller() {
    print("Enter seller name: ", terminator: " ")
    let name = readLine() ?? "Unknown Seller"
    print("Enter seller password: ", terminator: " ")
    let password = readLine() ?? "123"

    if password == "123" {
        print("You are using default password")
    }

    let seller = Seller(name: name, password: password)
    sellers.append(seller)
    print("Seller registered successfully ✅")
}

func registerServiceProvider() {
    print("Enter service provider name: ", terminator: " ")
    let name = readLine() ?? "Unknown Provider"
    print("Enter service provider password: ", terminator: " ")
    let password = readLine() ?? "123"

    if password == "123" {
        print("You are using default password")
    }

    let provider = ServiceProvider(
        name: name,
        password: password
    )

    serviceProviders.append(provider)
    print("Service Provider registered successfully ✅")
}

func listAllItems() {

    for seller in sellers {
        print("\nSeller: \(seller.name) \(seller.id)")

        for item in seller.inventory.listAll() {
            print("Item ID : \(item.id)")
            print("Item : \(item.name)")
            print("Item Unit Price : \(item.pricePerUnit)")
        }
    }

}

func buyItem(buyer: Buyer) {
    print("Enter item id : ", terminator: " ")
    let itemId = IO.readInt()
    print("Enter seller id : ", terminator: " ")
    let sellerId = IO.readInt()
    print("Enter Item Quantity : ", terminator: " ")
    let quantity = IO.readDouble()

    var seller: Seller? = nil

    for s in sellers {
        if s.id == sellerId {
            seller = s
        }
    }

    if seller == nil {
        print(" Seller not found ‼️ ")
        return
    }

    guard let item = seller!.inventory.getItem(id: itemId) else {
        print(" Item not found ‼️ ")
        return
    }

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

    buyer.buyItem(
        item,
        from: seller!,
        quantity: quantity,
        pickupLocation: source,
        dropLocation: destination
    )

}
