func registerBuyer() {
    print("Enter buyer name: ", terminator: " ")
    let name = readLine() ?? "Unknown Buyer"

    let buyer = Buyer(name: name)
    buyers.append(buyer)
    print("Buyer registered successfully ✅")
}

func registerSeller() {
    print("Enter seller name: ", terminator: " ")
    let name = readLine() ?? "Unknown Seller"

    let seller = Seller(name: name)
    sellers.append(seller)
    print("Seller registered successfully ✅")
}

func registerServiceProvider() {
    print("Enter service provider name: ", terminator: " ")
    let name = readLine() ?? "Unknown Provider"

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

    if let sellPerson = seller {
        if !sellPerson.hasItem(withId: itemId) {
            print(
                "Seller \(sellPerson.name) is not the owner of item with id \(itemId)"
            )
            return
        }
    } else {
        print("Invalid seller id ‼️")
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
        itemId,
        from: seller!,
        quantity: quantity,
        pickupLocation: source,
        dropLocation: destination
    )

}
