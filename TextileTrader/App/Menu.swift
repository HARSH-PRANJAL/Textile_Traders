func registerUserMenu() {
    while true {
        print(
            """
            Welcome to registration window 

            1. Register Buyer
            2. Register Seller
            3. Register Service Provider
            4. Exit
            """
        )
        let choice = readLine() ?? ""

        switch choice {
        case "1":
            registerBuyer()
        case "2":
            registerSeller()
        case "3":
            registerServiceProvider()
        case "4":
            print("Exiting Registration menu 👋\n")
            return
        default:
            print("Invalid choice ❌\n")
        }
    }
}

func serviceProviderMenu(provider: ServiceProvider) {

    while true {
        print(
            """
            ==========================
            Service Provider Menu
            ==========================
            1. Add New Location
            2. Add Transport Route
            3. View All Locations
            4. Exit
            """
        )

        print("Enter choice:")
        let choice = readLine() ?? ""

        switch choice {
        case "1":
            addLocation()
        case "2":
            addTransport(provider: provider)
        case "3":
            listLocations()
        case "4":
            print("Exiting Service Provider Menu 👋\n")
            return
        default:
            print("Invalid choice ❌\n")
        }
    }
}

func buyerMenu(buyer: Buyer) {

    while true {
        print(
            """
            ==========================
            Buyer Menu
            ==========================
            1. List all items
            2. Buy item
            3. View All Bills
            4. Exit
            """
        )

        print("Enter choice:")
        let choice = readLine() ?? ""

        switch choice {
        case "1":
            listAllItems()
        case "2":
            buyItem(buyer: buyer)
        case "3":
            buyer.displayBills()
        case "4":
            print("Exiting Buyer Menu 👋\n")
            return
        default:
            print("Invalid choice ❌\n")
        }
    }

}

func sellerMenu(seller: Seller) {

    while true {
        print(
            """
            ==========================
            Seller Menu
            ==========================
            1. Add New Item
            2. View Inventory
            3. Exit
            """
        )

        print("Enter choice:")
        let choice = readLine() ?? ""

        switch choice {
        case "1":
            print("Item name : ", terminator: " ")
            let name = readLine()!
            print("Item price : ", terminator: " ")
            let price = IO.readDouble()
            seller.addItem(Item(name: name, pricePerUnit: price))
        case "2":
            print("\(seller.listItems())")
        case "3":
            print("Exiting Service Provider Menu 👋\n")
            return
        default:
            print("Invalid choice ❌\n")
        }
    }
}
