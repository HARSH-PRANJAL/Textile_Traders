import Foundation

class Seller: User {
    static var nextId: Int = 1
    let id: Int
    var name: String
    private var inventory = Inventory()
    
    init(name: String) {
        self.id = Seller.nextId
        Seller.nextId += 1
        self.name = name
    }
    
    func addItem(_ item: Item) {
        inventory.add(item)
    }
    
    func hasItem(withId id: Int) -> Bool {
        return inventory.hasItem(id: id)
    }
    
    func listItems() -> [Item] {
        return inventory.listAll()
    }
    
    func sellItemIfAvailable(_ itemId: Int) -> Item? {
        return inventory.sellItem(id: itemId)
    }
}
