func listLocations() {
    if locations.isEmpty {
        print("No locations registered yet.")
        return
    }

    print("Registered Locations:")
    for loc in locations.values {
        print("• \(loc.code) - \(loc.name) (PIN: \(loc.pin))")
    }
}

func createAndAddTransport(by provider: ServiceProvider) {

    print("Enter Home location PIN: ", terminator: " ")
    let fromPin = IO.readInt()
    guard let fromLocation = locations[fromPin] else {
        print("Invalid Home location ❌")
        return
    }

    print("Enter Destination location PIN: ", terminator: " ")
    let toPin = IO.readInt()
    guard let toLocation = locations[toPin] else {
        print("Invalid Destination location ❌")
        return
    }

    print(
        """
        Select transport type:
        1. Truck
        2. Ship
        """
    )
    let choice = IO.readInt()
    
    if(choice <= 0 || choice > TransportType.allCases.count) {
        print("Invalid transport type ❌")
        return
    }

    let transportType = TransportType.allCases[choice - 1]

    print("Enter fare per ton: ", terminator: " ")
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

func addLocation(code: String, pin: Int, name: String) {

    if locations[pin] != nil {
        print("Invalid or duplicate PIN ❌")
        return
    }

    let location = Location(
        code: code,
        pin: pin,
        name: name
    )
    
    locations[pin] = location

    print("Location added successfully ✅")
}
