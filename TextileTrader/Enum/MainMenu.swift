enum MainMenu: CaseIterable {
    case registerUser
    case buyerOperations
    case sellerOperations
    case serviceProviderOperations
    case exit
    
    var description: String {
        
        switch self {
        case .registerUser:
            return "Register a user"
        case .buyerOperations:
            return "Buyer operations"
        case .sellerOperations:
            return "Seller operations"
        case .serviceProviderOperations:
            return "Service provider operations"
        case .exit:
            return "Exit"
        }
        
    }
}
