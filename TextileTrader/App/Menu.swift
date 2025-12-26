func registerUserMenu() {
    
    while true {
        print(
            """
            ==========================
              User Registration Menu
            ==========================
            """
        )

        let menu = UserRegistrationAction.allCases

        for (index, action) in menu.enumerated() {
            print("\(index + 1). \(action.description)")
        }

        print("Enter choice")
        let choice = IO.readInt()

        if choice <= 0 || choice > UserRegistrationAction.allCases.count {
            print("Invalid choice")
            return
        }

        let option = UserRegistrationAction.allCases[choice - 1]

        switch option {
            
        case .registerBuyer:
            print("Enter buyer name : ", terminator: " ")
            guard let name = readLine() else {
                print("Buyer needs a name")
                return
            }
            registerBuyer(name: name)
            
        case .registerSeller:
            print("Enter seller name : ", terminator: " ")
            guard let name = readLine() else {
                print("Seller needs a name")
                return
            }
            registerSeller(name: name)
            
        case .registerServiceProvider:
            print("Enter service provider name : ", terminator: " ")
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
            """
        )

        for (index, action) in ServiceProviderAction.allCases.enumerated() {
            print("\(index + 1). \(action.description)")
        }

        print("Enter choice : ")
        let choice = IO.readInt()

        if choice <= 0 || choice > ServiceProviderAction.allCases.count {
            print("Invalid input try again")
            continue
        }

        let option = ServiceProviderAction.allCases[choice - 1]

        switch option {
            
        case .addLocation:
            print("Enter location code : ", terminator: " ")
            let code = readLine() ?? ""

            print("Enter location name : ", terminator: " ")
            let name = readLine() ?? ""

            print("Enter PIN code : ", terminator: " ")
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
            """
        )

        for (index, action) in BuyerAction.allCases.enumerated() {
            print("\(index + 1). \(action.description)")
        }

        print("Enter choice : ")
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
            print("Enter seller id : ", terminator: " ")
            let sellerId = IO.readInt()

            var seller: Seller? = nil

            for s in sellers {
                if s.id == sellerId {
                    seller = s
                }
            }

            guard let sellPerson = seller else {
                print("Invalid seller id ‼️")
                return
            }
            initiateItemPurchase(for: buyer, from: sellPerson)
            
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
            """
        )

        for (index, action) in SellerAction.allCases.enumerated() {
            print("\(index + 1). \(action.description)")
        }

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
