import Foundation

var buyers: [Buyer] = []
var sellers: [Seller] = []
var serviceProviders: [ServiceProvider] = []
let transportGraph = TransportGraph()
var locations: [Int: Location] = [:]

func registerUserMenu() {
    while true {
        print("""
            Welcome to registration window 
            
            1. Register Buyer
            2. Register Seller
            3. Register Service Provider
            4. Exit
            """)
        let choice = readLine() ?? ""

        switch choice {
        case "1":
            MenuService.registerBuyer()
        case "2":
            MenuService.registerSeller()
        case "3":
            MenuService.registerServiceProvider()
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
        print("""
        ==========================
        Service Provider Menu
        ==========================
        1. Add New Location
        2. Add Transport Route
        3. View All Locations
        4. Exit
        """)

        print("Enter choice:")
        let choice = readLine() ?? ""

        switch choice {
        case "1":
            TransportService.addLocation(provider: provider)
        case "2":
            TransportService.addTransport(provider: provider)
        case "3":
            TransportService.listLocations()
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
        print("""
        ==========================
        Buyer Menu
        ==========================
        1. List all items
        2. Buy item
        3. View All Bills
        4. Exit
        """)

        print("Enter choice:")
        let choice = readLine() ?? ""

        switch choice {
        case "1":
            MenuService.listAllItems()
        case "2":
            print("Enter item id : ",terminator: " ")
            let itemId =  IO.readInt()
            print("Enter seller id : ",terminator: " ")
            let sellerId = IO.readInt()
            buyer.buyItem(itemId, from: sellerId)
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
           print("""
           ==========================
           Seller Menu
           ==========================
           1. Add New Item
           2. View Inventory
           3. Exit
           """)

           print("Enter choice:")
           let choice = readLine() ?? ""

           switch choice {
           case "1":
               print("Item name : ",terminator: " ")
               let name = readLine()!
               print("Item price : ",terminator: " ")
               let price = IO.readDouble()
               seller.addItem(AppFactory.createItem(name: name, price: price))
           case "2":
               print("\(seller.inventory.listAll())")
           case "3":
               print("Exiting Service Provider Menu 👋\n")
               return
           default:
               print("Invalid choice ❌\n")
           }
       }
}

print("""
      ==============================
      Textile Import-Export Platform
      ==============================
      """)

registerUserMenu()
sellerMenu(seller: sellers[0])
MenuService.listAllItems()
serviceProviderMenu(provider: serviceProviders[0])
buyerMenu(buyer: buyers[0])




//let A = AppFactory.createLocation(code: "A", pin: 1001, name: "Alpha")
//let B = AppFactory.createLocation(code: "B", pin: 1002, name: "Beta")
//let C = AppFactory.createLocation(code: "C", pin: 1003, name: "Gamma")
//
//transportGraph.addEdge(TransportEdge(from: A, to: B, transportType: .truck, farePerTon: 10, travelTimeHours: 5))
//transportGraph.addEdge(TransportEdge(from: B, to: C, transportType: .truck, farePerTon: 8, travelTimeHours: 4))
//transportGraph.addEdge(TransportEdge(from: A, to: C, transportType: .ship, farePerTon: 25, travelTimeHours: 10))
//
//let calculator = FareRouteCalculator()
//
//print("Graph locations:", transportGraph.allLocations().map { $0.code })
//
//if let result = calculator.calculateFare(from: A, to: C, cargoWeight: 2) {
//    print("Fare:", result.totalFare)
//    print("Path:", result.path.map { $0.code })
//} else {
//    print("No route available")
//}

