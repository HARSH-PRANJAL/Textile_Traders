struct MenuService {
    
    static func registerBuyer() {
        print("Enter buyer name: ",terminator: " ")
        let name = readLine() ?? "Unknown Buyer"
        print("Enter buyer password: ",terminator: " ")
        let password = readLine() ?? "123"
        
        if(password == "123"){
            print("You are using default password")
        }
        
        let buyer = AppFactory.createBuyer(name: name,password: password)
        buyers.append(buyer)
        print("Buyer registered successfully ✅")
    }

    static func registerSeller() {
        print("Enter seller name: ",terminator: " ")
        let name = readLine() ?? "Unknown Seller"
        print("Enter seller password: ",terminator: " ")
        let password = readLine() ?? "123"
        
        if(password == "123"){
            print("You are using default password")
        }
        
        let seller = AppFactory.createSeller(name: name,password: password)
        sellers.append(seller)
        print("Seller registered successfully ✅")
    }

    static func registerServiceProvider() {
        print("Enter service provider name: ",terminator: " ")
        let name = readLine() ?? "Unknown Provider"
        print("Enter service provider password: ",terminator: " ")
        let password = readLine() ?? "123"
        
        if(password == "123"){
            print("You are using default password")
        }

        let provider = AppFactory.createServiceProvider(
            name: name,
            graph: transportGraph,
            password: password
        )

        serviceProviders.append(provider)
        print("Service Provider registered successfully ✅")
    }
    
    static func listAllItems() {
        
        for seller in sellers {
            print("\nSeller: \(seller.name) \(seller.id)")
            print("\nItems : \n \(seller.inventory.listAll())")
        }
        
    }
    
}
