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
    
    var source : Location? {
        
        if let source = self.path.first {
            return source
        } else {
            return nil
        }
        
    }
    
    var destination : Location? {
        
        if let destination = self.path.last {
            return destination
        } else {
            return nil
        }
        
    }
}
