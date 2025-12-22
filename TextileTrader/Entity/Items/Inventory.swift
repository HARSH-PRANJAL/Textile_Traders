import Foundation

class Inventory {
    private var items: [UUID: Item] = [:]

    func add(_ item: Item) {
        items[item.id] = item
    }

    func getItem(id: UUID) -> Item? {
        items[id]
    }

    func listAll() -> [Item] {
        Array(items.values)
    }
}
