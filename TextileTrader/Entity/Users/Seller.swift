import Foundation

class Seller: User {
    let id = UUID()
    let name: String
    var password: String
    private(set) var inventory = Inventory()

    init(name: String, password: String) {
        self.name = name
        self.password = password
    }

    func listItem(_ item: Item) {
        inventory.add(item)
    }
}
