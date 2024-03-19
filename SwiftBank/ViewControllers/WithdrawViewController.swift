//
//  WithdrawViewController.swift
//  SwiftBank
//
//  Created by Giovanna Moeller on 23/02/24.
//

import UIKit

class WithdrawViewController: UIViewController {
    
    private var bankAccount: BankAccount
    weak var delegate: BankingServiceDelegate?
    
    init(bankAccount: BankAccount) {
        self.bankAccount = bankAccount
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var withdrawLabel: UILabel = {
        return SBTitleLabel(title: "Faça um saque")
    }()
    
    private lazy var withdrawValueTextField: SBTextField = {
       return SBTextField(placeholderText: "Valor do saque")
    }()
    
    private lazy var confirmWithdrawButton: UIButton = {
        let button = SBButton(title: "Confirmar saque")
        button.addTarget(self, action: #selector(didTapConfirmWithdrawButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        title = "Saque"
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(withdrawLabel)
        view.addSubview(withdrawValueTextField)
        view.addSubview(confirmWithdrawButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            withdrawLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32.0),
            withdrawLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32.0),
            
            withdrawValueTextField.topAnchor.constraint(equalTo: withdrawLabel.bottomAnchor, constant: 32.0),
            withdrawValueTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32.0),
            withdrawValueTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32.0),
            
            confirmWithdrawButton.topAnchor.constraint(equalTo: withdrawValueTextField.bottomAnchor, constant: 32),
            confirmWithdrawButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32.0),
            confirmWithdrawButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32.0),
            
            confirmWithdrawButton.heightAnchor.constraint(equalToConstant: 48.0)
        ])
    }
    
    @objc func didTapConfirmWithdrawButton() {
        guard let withdrawValueText = withdrawValueTextField.text,
              let withdrawValue = Double(withdrawValueText) else { return }
        
        if withdrawValue <= 0 { return }
        let withdrawValueFormatted = withdrawValue.formatCurrency()
        
        let withdrawSuccess = bankAccount.performOperation(operation: .withdraw, amount: withdrawValue)
        
        if withdrawSuccess {
            delegate?.didPerformOperation()
            showAlert(title: "Saque efetuado", message: "Você sacou \(withdrawValueFormatted) com sucesso.")
        }
    }
}
