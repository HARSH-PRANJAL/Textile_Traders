import Foundation

class Buyer: User {
    static var nextId: Int = 1
    let id: Int
    let name: String
    var password: String
    var bills: [Bill] = []

    init(name: String, password: String) {
        self.id = Buyer.nextId
        Buyer.nextId += 1
        self.name = name
        self.password = password
    }
    
    func buyItem(_ itemId: Int,from sellerId: Int) {
        
        var seller: Seller?
        
        for element in sellers {
            if(element.id == sellerId){
                seller = element
                break
            }
        }
        
        guard let item = seller?.inventory.sellItem(id: itemId),
        let newBill = BillService.createBill(buyer: self, seller: seller!,products: [item])
        else {
            print("\n Error in completing the buy sell transaction ‼️\n")
            return
        }
        
        bills.append(newBill)
        
    }
    
    func displayBills(){
        for bill in bills {
            print("\n Bill ID: \(bill.order.id)")
            print("Seller Name: \(bill.order.seller.name)")
            print("Total: \(bill.generateTotalAmount())")
            print("Path: \(bill.order.shipment.path)\n")
        }
    }
    
    
}
