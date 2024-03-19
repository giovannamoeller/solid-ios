//
//  FrozenAccount.swift
//  SwiftBank
//
//  Created by Giovanna Moeller on 19/03/24.
//

import Foundation

class FrozenAccount: BankAccount {
    override init(accountNumber: String) {
        super.init(accountNumber: accountNumber)
        isFrozen = true
    }
}
