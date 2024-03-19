//
//  TransactionHistoryService.swift
//  SwiftBank
//
//  Created by Giovanna Moeller on 19/03/24.
//

import Foundation

class TransactionHistoryService {
    var transactions: [String] = []
    
    func addTransaction(message: String) {
        transactions.insert(message, at: 0)
    }
}
