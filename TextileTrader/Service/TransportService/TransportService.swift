struct TransportService {
    
    static func listLocations() {
        if locations.isEmpty {
            print("No locations registered yet.")
            return
        }

        print("Registered Locations:")
        for loc in locations.values {
            print("• \(loc.code) - \(loc.name) (PIN: \(loc.pin))")
        }
    }
    
    static func addTransport(provider: ServiceProvider) {

        print("Enter Home location PIN: ",terminator: " ")
        let fromPin = IO.readInt()
        guard let fromLocation = locations[fromPin] else {
            print("Invalid Home location ❌")
            return
        }

        print("Enter Destination location PIN: ",terminator: " ")
        let toPin = IO.readInt()
        guard let toLocation = locations[toPin] else {
            print("Invalid Destination location ❌")
            return
        }

        print("""
        Select transport type:
        1. Truck
        2. Ship
        """)
        let transportChoice = readLine() ?? ""

        let transportType: TransportType
        
        switch transportChoice {
        case "1": transportType = .truck
        case "2": transportType = .ship
        default:
            print("Invalid transport type ❌")
            return
        }

        print("Enter fare per ton: ",terminator: " ")
        let fare = IO.readDouble()

        print("Enter expected travel time (hours):")
        let time = IO.readDouble()

        provider.addTransport(
            from: fromLocation,
            to: toLocation,
            type: transportType,
            farePerTon: fare,
            timeHours: time
        )

        print("Transport route added successfully ✅")
    }
    
    static func addLocation(provider: ServiceProvider) {

        print("Enter location code: ",terminator: " ")
        let code = readLine() ?? ""

        print("Enter location name: ",terminator: " ")
        let name = readLine() ?? ""

        print("Enter PIN code: ",terminator: " ")
        let pin = IO.readInt()
        
        if locations[pin] != nil {
            print("Invalid or duplicate PIN ❌")
            return
        }

        let location = Location(
            code: code,
            pin: pin,
            name: name
        )

        provider.registerLocation(code:location.code, pin: location.pin, name: location.name)
        locations[pin] = location

        print("Location added successfully ✅")
    }


    
}
