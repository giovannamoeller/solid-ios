//
//  CheckingAccount.swift
//  SwiftBank
//
//  Created by Giovanna Moeller on 19/03/24.
//

import Foundation

class CheckingAccount: BankAccount, LoanableAccount, InterestingRate {
    func requestLoan(amount: Double) {
        // Solicitar empréstico
    }
    
    func calculateInterestRate() {
        // Calcular juros
    }
}
