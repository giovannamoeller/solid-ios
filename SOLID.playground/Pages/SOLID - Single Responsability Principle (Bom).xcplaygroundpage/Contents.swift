//: [Previous](@previous)

//: ### SRP - Um sistema de gerenciamento de pedidos (Bom)
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
    
    let databaseManager: OrderDatabaseManager
    let emailService: EmailService
    
    init(databaseManager: OrderDatabaseManager, emailService: EmailService) {
        self.databaseManager = databaseManager
        self.emailService = emailService
    }
    
    func createOrder(product: String, quantity: Int, customerEmail: String) {
        // Lógica para criar um pedido
        print("Pedido para \(product), quantidade \(quantity) criado.")
        let order = Order(product: product, quantity: quantity, customerEmail: customerEmail)
        databaseManager.saveOrder(order: order)
        emailService.sendOrderConfirmationEmail(to: customerEmail)
    }
}

class OrderDatabaseManager {
    func saveOrder(order: Order) {
        print("Pedido para \(order.product), quantidade \(order.quantity) salvo no banco de dados.")
    }
}

class EmailService {
    func sendOrderConfirmationEmail(to email: String) {
        print("Enviando email para \(email)")
    }
}

let orderDatabaseManager = OrderDatabaseManager()
let emailService = EmailService()
let orderManager = OrderManager(databaseManager: orderDatabaseManager, emailService: emailService)

orderManager.createOrder(product: "Livro Swift", quantity: 1, customerEmail: "cliente@exemplo.com")

//: [Next](@next)
