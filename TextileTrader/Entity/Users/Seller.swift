import Foundation

class Seller: User {
    let id = UUID()
    let name: String
    private(set) var inventory = Inventory()

    init(name: String) {
        self.name = name
    }

    func listItem(_ item: Item) {
        inventory.add(item)
    }
}
