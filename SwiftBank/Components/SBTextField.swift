//
//  SBTextField.swift
//  SwiftBank
//
//  Created by Giovanna Moeller on 23/02/24.
//

import UIKit

class SBTextField: UITextField {
    
    var placeholderText: String
    
    init(placeholderText: String) {
        self.placeholderText = placeholderText
        super.init(frame: .zero)
        configureTextField()
    }
    
    func configureTextField() {
        translatesAutoresizingMaskIntoConstraints = false
        placeholder = placeholderText
        backgroundColor = Colors.lightYellow
        textColor = .darkGray
        keyboardType = .decimalPad
        layer.borderColor = Colors.darkGray?.cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 12.0
        setLeftPaddingPoints(15)
        heightAnchor.constraint(equalToConstant: 48.0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
