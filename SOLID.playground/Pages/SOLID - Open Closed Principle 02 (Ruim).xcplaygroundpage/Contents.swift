//: [Previous](@previous)

//: ### OCP - Sistema de pedidos (Ruim)
class Product {
    let name: String
    let price: Double

    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
}

class Order {
    var items: [Product]
    
    init(items: [Product]) {
        self.items = items
    }
    
    func calculateTotal() -> Double {
        var total = 0.0
        for product in items {
            total += product.price
        }
        return total
    }
}

let orderItems: [Product] = [
    Product(name: "Macbook", price: 8.000),
    Product(name: "iPhone", price: 3.000)
]
let order = Order(items: orderItems)
print(order.calculateTotal())

//: [Next](@next)
