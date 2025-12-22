struct FareRouteResult {
    let totalFare: Double
    let totalTimeHours: Double
    let path: [Location]
    
    var description: String {
        var path = ""
        
        for location in self.path {
            path.append("\(location.name) -> ")
        }
        
        return "Total Fare: \(totalFare), Total Time: \(totalTimeHours) hours, Path: \(path)"
    }
}
