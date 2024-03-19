//
//  BankAccount.swift
//  SwiftBank
//
//  Created by Giovanna Moeller on 15/03/24.
//

import Foundation

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
    
    var notificationService = NotificationService()
    var transactionHistoryService = TransactionHistoryService()
    
    init(accountNumber: String) {
        self.accountNumber = accountNumber
    }
    
    func performOperation(operation: BankOperation, amount: Double) -> Bool {
        return operation.execute(in: self, amount: amount)
    }
    
    func requestLoan(amount: Double) {
        // Pedir um empréstimo
    }
    
    func calculateInterestRate() {
        // Calcular taxa de juros
    }
    
}
