//
//  TransactionHistoryService.swift
//  SwiftBank
//
//  Created by Giovanna Moeller on 19/03/24.
//

import Foundation

protocol TransactionHistoryProtocol {
    func addTransaction(message: String)
}

class TransactionHistoryService: TransactionHistoryProtocol {
    var transactions: [String] = []
    
    func addTransaction(message: String) {
        transactions.insert(message, at: 0)
    }
}
