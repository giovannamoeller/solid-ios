//
//  SBButton.swift
//  SwiftBank
//
//  Created by Giovanna Moeller on 23/02/24.
//

import UIKit

class SBButton: UIButton {
    
    var title: String

    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureButton() {
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(title, for: .normal)
        backgroundColor = Colors.graphite
        setTitleColor(Colors.lightGray, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 18.0, weight: .bold)
        layer.cornerRadius = 12.0
    }
}
