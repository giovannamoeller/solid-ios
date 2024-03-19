//
//  BankAccount.swift
//  SwiftBank
//
//  Created by Giovanna Moeller on 15/03/24.
//

import Foundation

enum BankOperation {
    case withdraw, deposit
}

protocol BankingServiceDelegate: AnyObject {
    func didPerformOperation()
}

protocol AccountServices {
    func performOperation(operation: BankOperation, amount: Double) -> Bool
    func requestLoan(amount: Double)
    func calculateInterestRate()
}

class BankAccount: AccountServices {
    
    var balance: Double = 0.0
    var accountNumber: String
    var transactionsHistory: [String] = []
    
    init(accountNumber: String) {
        self.accountNumber = accountNumber
    }
    
    func performOperation(operation: BankOperation, amount: Double) -> Bool {
        switch operation {
        case .withdraw:
            if amount <= balance {
                balance -= amount
                sendNotification(message: "Saque no valor de \(amount.formatCurrency()) realizado!")
                transactionsHistory.insert("Saque no valor de \(amount.formatCurrency())", at: 0)
                return true
            }
            return false
        case .deposit:
            balance += amount
            sendNotification(message: "Depósito no valor de \(amount.formatCurrency()) realizado!")
            transactionsHistory.insert("Depósito no valor de \(amount.formatCurrency())", at: 0)
            return true
        }
    }
    
    func sendNotification(message: String) {
        // Enviar notificação para o usuário
        print(message)
    }
    
    func requestLoan(amount: Double) {
        // Pedir um empréstimo
    }
    
    func calculateInterestRate() {
        // Calcular taxa de juros
    }
    
}
