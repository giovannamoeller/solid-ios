//: [Previous](@previous)

//: ### OCP - Sistema de E-commerce (Bom)

import Foundation

class Product {
    let name: String
    let price: Double
    
    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
}

class Invoice {
    var products: [Product]
    
    init(products: [Product]) {
        self.products = products
    }

    var total: Double {
        var total = 0.0
        for product in products {
            total += product.price
        }
        return total
    }
}

protocol InvoicePersistenceProtocol {
    func save(invoice: Invoice)
}

class InvoicePersistence {
    let persistence: InvoicePersistenceProtocol
    
    init(persistence: InvoicePersistenceProtocol) {
        self.persistence = persistence
    }
    
    func saveInvoice(invoice: Invoice) {
        persistence.save(invoice: invoice)
    }
}

class CoreDataPersistence: InvoicePersistenceProtocol {
    func save(invoice: Invoice) {
        print("Salvando nota fiscal no core data")
    }
}

struct DatabasePersistence: InvoicePersistenceProtocol {
    func save(invoice: Invoice) {
        print("Saving nota fiscal no banco de dados")
    }
}

let products = [
    Product(name: "Macbook", price: 8000),
    Product(name: "iPhone", price: 3200)
]
let invoice = Invoice(products: products)
let invoicePersistence = InvoicePersistence(persistence: CoreDataPersistence())
invoicePersistence.saveInvoice(invoice: invoice)

//: [Next](@next)
