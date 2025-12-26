enum SellerAction: CaseIterable {
    case addItem
    case viewInventory
    case exit
    
    var description: String {
        
        switch self {
        case .addItem:
            return "Add Item"
        case .viewInventory:
            return "View Inventory"
        case .exit:
            return "Exit"
     
        }
    }
}
