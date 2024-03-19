//
//  Date+.swift
//  SwiftBank
//
//  Created by Giovanna Moeller on 27/02/24.
//

import Foundation

extension Date {
    func formatCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.dateFormat = "dd/MM/yyyy '-' HH:mm"
        return dateFormatter.string(from: self)
    }
}
