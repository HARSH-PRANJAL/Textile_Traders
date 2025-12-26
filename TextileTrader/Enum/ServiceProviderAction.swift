enum ServiceProviderAction: CaseIterable {
    case addLocation
    case createAndAddTransport
    case viewLocations
    case exit
    
    var description: String {
        
        switch self {
        case .addLocation:
            return "Add Location"
        case .createAndAddTransport:
            return "Create and Add Transport"
        case .viewLocations:
            return "View Locations"
        case .exit:
            return "Exit"
        }
    }
}
