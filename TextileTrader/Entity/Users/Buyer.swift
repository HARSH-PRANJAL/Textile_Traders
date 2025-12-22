import Foundation

class Buyer: User {
    let id = UUID()
    let name: String

    init(name: String) {
        self.name = name
    }
}
