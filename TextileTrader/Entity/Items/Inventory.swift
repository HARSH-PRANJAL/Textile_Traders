import Foundation

class Inventory {
    private var items: [Int: Item] = [:]

    func add(_ item: Item) {
        items[item.id] = item
    }

    func getItem(id: Int) -> Item? {
        items[id]
    }

    func listAll() -> [Item] {
        Array(items.values)
    }
    
    func sellItem(id: Int) {
        items.removeValue(forKey: id)
    }
    
    func hasItem(id: Int) -> Bool {
        items.keys.contains(id)
    }
}
