class Truck: Transport {
    let type = "Truck"

    func cost(distance: Double, weight: Double) -> Double {
        return distance * 5 + weight * 2
    }
}


