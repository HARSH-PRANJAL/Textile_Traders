struct Location: Hashable {
    let code: String
    let pin: Int
    let name: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(pin)
    }

    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.pin == rhs.pin
    }
}

