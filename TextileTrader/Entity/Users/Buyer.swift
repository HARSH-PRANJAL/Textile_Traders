import Foundation

class Buyer: User {
    let id = UUID()
    let name: String
    var password: String

    init(name: String, password: String) {
        self.name = name
        self.password = password
    }
}
