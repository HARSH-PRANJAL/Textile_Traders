import Foundation

protocol User {
    var id: Int { get }
    var name: String { get set }
    var password: String { get set }
}
