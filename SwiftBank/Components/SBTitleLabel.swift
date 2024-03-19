//
//  SBTitleLabel.swift
//  SwiftBank
//
//  Created by Giovanna Moeller on 23/02/24.
//

import UIKit

class SBTitleLabel: UILabel {
    
    var title: String

    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLabel() {
        translatesAutoresizingMaskIntoConstraints = false
        text = title
        textColor = Colors.graphite
        font = .systemFont(ofSize: 22.0, weight: .bold)
    }

}
