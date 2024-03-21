//: [Previous](@previous)

//: ### OCP - Sistema de E-commerce (Ruim)

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

class InvoicePersistence {
    let invoice: Invoice
    
    init(invoice: Invoice) {
        self.invoice = invoice
    }

    func saveInvoiceToCoreData() {
        print("Salvando nota fiscal no core data")
    }

    func saveInvoiceToDatabase() {
        print("Saving nota fiscal no banco de dados")
    }
}

let products = [
    Product(name: "Macbook", price: 8000),
    Product(name: "iPhone", price: 3200)
]
let invoice = Invoice(products: products)
let invoicePersistence = InvoicePersistence(invoice: invoice)
invoicePersistence.saveInvoiceToCoreData()

//: [Next](@next)
