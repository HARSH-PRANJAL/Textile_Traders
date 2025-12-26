import Foundation

var buyers: [Buyer] = []
var sellers: [Seller] = []
var serviceProviders: [ServiceProvider] = []
let transportGraph = TransportGraph()
var locations: [Int: Location] = [:]

print(
    """
    ==============================
    Textile Import-Export Platform
    ==============================
    """
)

print("Select Operations : ")
mainMenu: while true {
    print(
        """

        ==========================
                 Main Menu
        ==========================

        """
    )

    for (index, option) in MainMenu.allCases.enumerated() {
        print("\(index + 1). \(option.description)")
    }

    print("Enter choice")
    let choice = IO.readInt()

    if choice <= 0 || choice > MainMenu.allCases.count {
        print("Invalid choice")
        continue mainMenu
    }

    let option = MainMenu.allCases[choice - 1]
    
    switch option {
        
    case .registerUser:
        registerUserMenu()
        
    case .buyerOperations:
        guard let buyer = buyers.first else {
            print("Registered buyer not found")
            continue mainMenu
        }
        buyerMenu(buyer: buyer)
        
    case .sellerOperations:
        guard let seller = sellers.first else {
            print("Registered seller not found")
            continue mainMenu
        }
        sellerMenu(seller: seller)
        
    case .serviceProviderOperations:
        guard let provider = serviceProviders.first else {
            print("Registered service provider not found")
            continue mainMenu
        }
        serviceProviderMenu(provider: provider)
        
    case .exit:
        break mainMenu
        
    }
}

//let A = Location(code: "A", pin: 1001, name: "Alpha")
//let B = Location(code: "B", pin: 1002, name: "Beta")
//let C = Location(code: "C", pin: 1003, name: "Gamma")
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
