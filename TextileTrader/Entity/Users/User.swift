import Foundation

protocol User {
    var id: Int { get }
    var name: String { get }
    var password: String { get set }
}
