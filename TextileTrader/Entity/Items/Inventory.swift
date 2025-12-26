import Foundation

class Inventory {
    private var items: [Int: Item] = [:]

    func add(_ item: Item) -> Bool{
        
        items[item.id] = item
        return self.hasItem(id: item.id)
        
    }

    func getItem(id: Int) -> Item? {
        return items[id]
    }

    func listAll() -> [Item] {
        return Array(items.values)
    }
    
    func sellItem(id: Int) -> Item? {
        return items.removeValue(forKey: id)
    }
    
    func hasItem(id: Int) -> Bool {
        return items.keys.contains(id)
    }
}
