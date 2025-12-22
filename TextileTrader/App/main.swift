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
            1. Register User
            2. Buyer Operations
            3. Seller Operations
            4. Service Provider Operations
            5. Exit 
        """
    )
    let option = readLine()!
    switch option {
    case "1":
        registerUserMenu()
    case "2":
        buyerMenu(buyer: buyers[0])
    case "3":
        sellerMenu(seller: sellers[0])
    case "4":
        serviceProviderMenu(provider: serviceProviders[0])
    case "5":
        break mainMenu
    default:
        print("Invalid Option")
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
