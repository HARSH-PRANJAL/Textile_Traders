class Shipment {
    
    let path: [Location]
    let totalFare: Double
    let expectedTimeHours: Double
    
    init(
        path: [Location],
        totalFare: Double,
        expectedTimeHours: Double
    ) {
        self.path = path
        self.totalFare = totalFare
        self.expectedTimeHours = expectedTimeHours
    }
    
    func displayPath() -> String {
        var path = ""
        
        for location in self.path {
            path.append("\(location.name) -> ")
        }
        
        return "Path: \(path)"
    }
    
    var source : Location {
        return self.path[0]
    }
    
    var destination : Location {
        return self.path[self.path.count - 1]
    }
    
}
