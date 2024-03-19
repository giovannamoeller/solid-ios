//: [Previous](@previous)

//: ### OCP - Sistema de pedidos (Bom)

import Foundation

class Product {
    let name: String
    let price: Double

    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
}

protocol DiscountStrategy {
  func calculateDiscount(for product: Product) -> Double
}

class ElectronicsDiscount: DiscountStrategy {
  func calculateDiscount(for product: Product) -> Double {
    return product.price * 0.1
  }
}

class RegularPrice: DiscountStrategy {
  func calculateDiscount(for product: Product) -> Double {
    return 0.0
  }
}

class Order {
    var items: [Product]
    var discountStrategy: DiscountStrategy

    init(items: [Product], 
         discountStrategy: DiscountStrategy = RegularPrice()) {
        self.items = items
        self.discountStrategy = discountStrategy
    }

  func calculateTotal() -> Double {
      var total: Double = 0.0
    for product in items {
      total += product.price - discountStrategy.calculateDiscount(for: product)
    }
    return total
  }
}

let orderItems: [Product] = [
    Product(name: "Macbook", price: 8500),
    Product(name: "iPhone", price: 3000)
]
let order = Order(items: orderItems)
print(order.calculateTotal())

//: [Next](@next)
