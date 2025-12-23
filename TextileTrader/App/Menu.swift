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

        print("Enter choice")
        let choice = IO.readInt()

        if choice <= 0 || choice > UserRegistrationAction.allCases.count {
            print("Invalid choice")
            return
        }

        let option = UserRegistrationAction.allCases[choice - 1]

        switch option {
        case .registerBuyer:
            print("Enter buyer name: ", terminator: " ")
            guard let name = readLine() else {
                print("Buyer needs a name")
                return
            }
            registerBuyer(name: name)
        case .registerSeller:
            print("Enter seller name: ", terminator: " ")
            guard let name = readLine() else {
                print("Seller needs a name")
                return
            }
            registerSeller(name: name)
        case .registerServiceProvider:
            print("Enter service provider name: ", terminator: " ")
            guard let name = readLine() else {
                print("Service Provider needs a name")
                return
            }
            registerServiceProvider(name: name)
        case .exit:
            print("Exiting Registration menu 👋\n")
            return
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
        let choice = IO.readInt()

        if choice <= 0 || choice > ServiceProviderAction.allCases.count {
            print("Invalid input try again.")
            continue
        }

        let option = ServiceProviderAction.allCases[choice - 1]

        switch option {
        case .addLocation:
            print("Enter location code: ", terminator: " ")
            let code = readLine() ?? ""

            print("Enter location name: ", terminator: " ")
            let name = readLine() ?? ""

            print("Enter PIN code: ", terminator: " ")
            let pin = IO.readInt()

            addLocation(code: code, pin: pin, name: name)
        case .createAndAddTransport:
            createAndAddTransport(by: provider)
        case .viewLocations:
            listLocations()
        case .exit:
            print("Exiting Service Provider Menu 👋\n")
            return
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
            3. View all bills
            4. Exit
            """
        )

        print("Enter choice:")
        let choice = IO.readInt()

        if choice <= 0 || choice > BuyerAction.allCases.count {
            print("Invalid input try again")
            continue
        }

        let option = BuyerAction.allCases[choice - 1]

        switch option {
        case .listItems:
            listAllItems()
        case .buyItem:
            buyingItem(for: buyer)
        case .displayAllBills:
            buyer.displayBills()
        case .exit:
            print("Exiting Buyer Menu 👋\n")
            return
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
        let choice = IO.readInt()

        if choice <= 0 || choice > SellerAction.allCases.count {
            print("Invalid input try again")
            continue
        }

        let option = SellerAction.allCases[choice - 1]

        switch option {
        case .addItem:
            print("Item name : ", terminator: " ")
            let name = readLine()!
            print("Item price : ", terminator: " ")
            let price = IO.readDouble()
            seller.addItem(Item(name: name, pricePerUnit: price))
        case .viewInventory:
            print("\(seller.listItems())")
        case .exit:
            print("Exiting Service Provider Menu 👋\n")
            return
        }
    }
}
