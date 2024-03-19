//
//  OperationView.swift
//  SwiftBank
//
//  Created by Giovanna Moeller on 23/02/24.
//

import UIKit

class OperationView: UIView {
    
    let title: String
    let icon: String
    let action: Selector
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        label.textColor = Colors.darkGray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14.0)
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular, scale: .medium)
        let imageIcon = UIImage(systemName: self.icon, withConfiguration: configuration)?.withTintColor(.darkGray, renderingMode: .alwaysOriginal)
        button.setImage(imageIcon, for: .normal)
        button.backgroundColor = Colors.lightYellow
        button.layer.cornerRadius = 24
        button.addTarget(nil, action: self.action, for: .touchUpInside)
        return button
    }()
    
    init(title: String, icon: String, action: Selector) {
        self.title = title
        self.icon = icon
        self.action = action
        super.init(frame: .zero)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(button)
        addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 48),
            button.heightAnchor.constraint(equalToConstant: 48),
            
            titleLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 8),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}
