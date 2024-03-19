//: [Previous](@previous)

//: ### SRP - Um sistema de gerenciamento de pedidos (Ruim)
import Foundation

class Order {
    let product: String
    let quantity: Int
    let customerEmail: String

    init(product: String, quantity: Int, customerEmail: String) {
        self.product = product
        self.quantity = quantity
        self.customerEmail = customerEmail
    }
}

class OrderManager {
    func createOrder(product: String, quantity: Int, customerEmail: String) {
        // Lógica para criar um pedido
        print("Pedido para \(product), quantidade \(quantity) criado.")
        let order = Order(product: product, quantity: quantity, customerEmail: customerEmail)
        saveOrderToDatabase(order: order)
        sendConfirmationEmail(to: customerEmail)
    }
    
    func saveOrderToDatabase(order: Order) {
        // Salvar pedido no banco de dados
        print("Pedido salvo no banco de dados.")
    }
    
    func sendConfirmationEmail(to email: String) {
        print("Enviando email para \(email)")
    }
}

let orderManager = OrderManager()
orderManager.createOrder(product: "Livro Swift", quantity: 1, customerEmail: "giovanna@gmail.com")

//: [Next](@next)
