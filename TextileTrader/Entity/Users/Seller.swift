import Foundation

class Seller: User {
    static var nextId: Int = 1
    let id: Int
    var name: String
    private(set) var inventory = Inventory()
    
    init(name: String) {
        self.id = Seller.nextId
        Seller.nextId += 1
        self.name = name
    }
    
    func addItem(_ item: Item) {
        inventory.add(item)
    }
    
    func listItem() -> [Item] {
        return inventory.listAll()
    }
}
