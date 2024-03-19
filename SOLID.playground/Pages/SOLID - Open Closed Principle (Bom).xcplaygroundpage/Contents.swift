//: [Previous](@previous)

//: ### OCP - Sistema de pagamento (Bom)
import Foundation

enum PaymentType {
    case creditCard, debitCard, paypal
}

protocol PaymentMethod {
    func processPayment(amount: Double)
}

class CreditCardPayment: PaymentMethod {
    func processPayment(amount: Double) {
        print("Processando pagamento com cartão de crédito")
    }
}

class DebitCardPayment: PaymentMethod {
    func processPayment(amount: Double) {
        print("Processando pagamento com cartão de débito")
    }
}

class PayPalPayment: PaymentMethod {
    func processPayment(amount: Double) {
        print("Processando pagamento com paypal")
    }
}

class PaymentProcessor {
    
    let paymentMethod: PaymentMethod
    
    init(paymentMethod: PaymentMethod) {
        self.paymentMethod = paymentMethod
    }
    
    func processPayment(amount: Double) {
        paymentMethod.processPayment(amount: amount)
    }
}

let paymentMethod = CreditCardPayment()
let paymentProcessor = PaymentProcessor(paymentMethod: paymentMethod)
paymentProcessor.processPayment(amount: 30)

//: [Next](@next)
