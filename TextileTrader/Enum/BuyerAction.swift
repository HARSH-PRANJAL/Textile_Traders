enum BuyerAction: CaseIterable {
    case listItems
    case buyItem
    case displayAllBills
    case exit

    var description: String {

        switch self {
        case .listItems:
            return "List items"
        case .buyItem:
            return "Buy item"
        case .displayAllBills:
            return "Display all bills"
        case .exit:
            return "Exit"
        }

    }
}
