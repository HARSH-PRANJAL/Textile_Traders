class Ship: Transport {
    let type = "Ship"

    func cost(distance: Double, weight: Double) -> Double {
        return distance * 3 + weight * 1
    }
}
