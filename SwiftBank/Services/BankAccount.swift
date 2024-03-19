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

protocol InterestingRate {
    func calculateInterestRate()
}

protocol LoanableAccount {
    func requestLoan(amount: Double)
}

class BankAccount {
    
    var balance: Double = 0.0
    var accountNumber: String
    var isFrozen: Bool = false
    
    var notificationService = NotificationService()
    var transactionHistoryService = TransactionHistoryService()
    
    init(accountNumber: String) {
        self.accountNumber = accountNumber
    }
    
    func performOperation(operation: BankOperation, amount: Double) -> Bool {
        guard !isFrozen else {
            notificationService.sendNotification(message: "Operação falhou! Conta congelada não pode realizar operações")
            return false
        }
        return operation.execute(in: self, amount: amount)
    }
    
}
