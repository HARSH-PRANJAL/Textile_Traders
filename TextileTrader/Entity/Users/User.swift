import Foundation

protocol User {
    var id: UUID { get }
    var name: String { get }
    var password: String { get set }
}
