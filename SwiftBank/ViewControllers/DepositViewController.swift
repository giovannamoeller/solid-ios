//
//  DepositViewController.swift
//  SwiftBank
//
//  Created by Giovanna Moeller on 23/02/24.
//

import UIKit

class DepositViewController: UIViewController {
    
    private var bankAccount: BankAccount
    weak var delegate: BankingServiceDelegate?
    
    init(bankAccount: BankAccount) {
        self.bankAccount = bankAccount
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var depositLabel: UILabel = {
        return SBTitleLabel(title: "Faça um depósito")
    }()
    
    private lazy var depositValueTextField: SBTextField = {
       return SBTextField(placeholderText: "Valor do depósito")
    }()
    
    private lazy var confirmDepositButton: UIButton = {
        let button = SBButton(title: "Confirmar depósito")
        button.addTarget(self, action: #selector(didTapConfirmDepositButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        title = "Depósito"
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(depositLabel)
        view.addSubview(depositValueTextField)
        view.addSubview(confirmDepositButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            depositLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32.0),
            depositLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32.0),
            
            depositValueTextField.topAnchor.constraint(equalTo: depositLabel.bottomAnchor, constant: 32.0),
            depositValueTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32.0),
            depositValueTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32.0),
            
            confirmDepositButton.topAnchor.constraint(equalTo: depositValueTextField.bottomAnchor, constant: 32),
            confirmDepositButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32.0),
            confirmDepositButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32.0),
            
            confirmDepositButton.heightAnchor.constraint(equalToConstant: 48.0)
        ])
    }
    
    @objc func didTapConfirmDepositButton() {
        guard let depositValueText = depositValueTextField.text,
              let depositValue = Double(depositValueText) else { return }
        
        if depositValue <= 0 { return }
        let depositValueFormatted = depositValue.formatCurrency()
        
        let depositOperation = DepositOperation()
        
        let depositSuccess = bankAccount.performOperation(operation: depositOperation, amount: depositValue)
        
        if depositSuccess {
            delegate?.didPerformOperation()
            showAlert(title: "Depósito efetuado", message: "Você depositou \(depositValueFormatted) com sucesso.")
        }
    }
}
