struct MenuService {
    static func registerBuyer() {
        print("Enter buyer name:")
        let name = readLine() ?? "Unknown Buyer"
        let buyer = AppFactory.createBuyer(name: name)
        buyers.append(buyer)
        print("Buyer registered successfully ✅")
    }

    static func registerSeller() {
        print("Enter seller name:")
        let name = readLine() ?? "Unknown Seller"
        let seller = AppFactory.createSeller(name: name)
        sellers.append(seller)
        print("Seller registered successfully ✅")
    }

    static func registerServiceProvider() {
        print("Enter service provider name:")
        let name = readLine() ?? "Unknown Provider"
        let provider = AppFactory.createServiceProvider(
            name: name,
            network: transportNetwork
        )
        serviceProviders.append(provider)
        print("Service Provider registered successfully ✅")
    }
}
