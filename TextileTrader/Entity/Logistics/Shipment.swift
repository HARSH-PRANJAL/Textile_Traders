class Shipment {

    let from: Location
    let to: Location
    let path: [Location]
    let totalFare: Double
    let expectedTimeHours: Double

    init(
        from: Location,
        to: Location,
        path: [Location],
        totalFare: Double,
        expectedTimeHours: Double
    ) {
        self.from = from
        self.to = to
        self.path = path
        self.totalFare = totalFare
        self.expectedTimeHours = expectedTimeHours
    }
    
}
