import Foundation

struct Item {
    static var nextId: Int = 1
    let id: Int
    let name: String
    let pricePerUnit: Double
    
    init(name: String, pricePerUnit: Double) {
        self.id = Item.nextId
        self.name = name
        self.pricePerUnit = pricePerUnit
        Item.nextId += 1
    }
}
