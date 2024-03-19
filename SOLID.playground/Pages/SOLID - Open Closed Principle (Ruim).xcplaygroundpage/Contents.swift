//: [Previous](@previous)

//: ### OCP - Sistema de pagamentos (Ruim)
import Foundation

enum PaymentType {
    case creditCard, debitCard, paypal
}

class PaymentProcessor {
    func processPayment(amount: Double, method: PaymentType) {
        switch method {
        case .creditCard:
            print("Processando pagamento com cartão de crédito")
        case .debitCard:
            print("Processando pagamento com cartão de débito")
        case .paypal:
            print("Processando pagamento com paypal")
        }
    }
}

let paymentProcessor = PaymentProcessor()
paymentProcessor.processPayment(amount: 30, method: .creditCard)

//: [Next](@next)
