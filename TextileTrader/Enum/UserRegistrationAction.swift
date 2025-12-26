enum UserRegistrationAction: CaseIterable {
    case registerBuyer
    case registerSeller
    case registerServiceProvider
    case exit
    
    var description: String {
        
        switch self {
        case .registerBuyer:
            return "Register as a buyer"
        case .registerSeller:
            return "Register as a seller"
        case .registerServiceProvider:
            return "Register as a service provider"
        case .exit:
            return "Exit"
        }
        
    }
}
