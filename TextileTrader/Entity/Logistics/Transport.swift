protocol Transport {
    var type: String { get }
    func cost(distance: Double, weight: Double) -> Double
}
