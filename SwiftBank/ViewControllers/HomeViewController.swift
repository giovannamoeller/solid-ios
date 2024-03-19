//
//  HomeViewController.swift
//  SwiftBank
//
//  Created by Giovanna Moeller on 23/02/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var bankAccount = BankAccount(accountNumber: "10001")
            
    private var withdrawAmount: String {
        return bankAccount.balance.formatCurrency() ?? ""
    }
    
    private lazy var welcomeLabel: UILabel = {
        return SBTitleLabel(title: "Bem-vindo!")
    }()
    
    private lazy var accountCardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 16.0
        view.layer.shadowRadius = 8.0
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        return view
    }()
    
    private lazy var withdrawTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.graphite
        label.text = "Conta"
        return label
    }()
    
    private lazy var withdrawAmountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 22.0, weight: .bold)
        label.text = withdrawAmount
        return label
    }()
    
    private lazy var operationsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [depositOperationView, withdrawOperationView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var depositOperationView: OperationView = {
        return OperationView(title: "Depósito", icon: "dollarsign.arrow.circlepath", action: #selector(depositButtonTapped))
    }()
    
    private lazy var withdrawOperationView: OperationView = {
        return OperationView(title: "Saque", icon: "dollarsign.circle", action: #selector(withdrawButtonTapped))
    }()
    
    private lazy var transactionsLabel: UILabel = {
        return SBTitleLabel(title: "Últimas transações")
    }()
    
    private lazy var transactionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "extractCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 16.0
        tableView.layer.shadowRadius = 8.0
        tableView.layer.shadowColor = UIColor.black.cgColor
        tableView.layer.shadowOpacity = 0.1
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        configureBackButton()
        addSubviews()
        setupConstraints()
    }
    
    private func configureBackButton() {
        let backItem = UIBarButtonItem()
        backItem.title = "Home"
        backItem.tintColor = Colors.graphite
        navigationItem.backBarButtonItem = backItem
    }
    
    private func addSubviews() {
        view.addSubview(welcomeLabel)
        view.addSubview(accountCardView)
        accountCardView.addSubview(withdrawTextLabel)
        accountCardView.addSubview(withdrawAmountLabel)
        accountCardView.addSubview(operationsStackView)
        view.addSubview(transactionsLabel)
        view.addSubview(transactionsTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16.0),
            
            accountCardView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 32),
            accountCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            accountCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            withdrawTextLabel.topAnchor.constraint(equalTo: accountCardView.topAnchor, constant: 16),
            withdrawTextLabel.leadingAnchor.constraint(equalTo: accountCardView.leadingAnchor, constant: 16),
            
            withdrawAmountLabel.topAnchor.constraint(equalTo: withdrawTextLabel.bottomAnchor, constant: 8),
            withdrawAmountLabel.leadingAnchor.constraint(equalTo: accountCardView.leadingAnchor, constant: 16),
            
            operationsStackView.topAnchor.constraint(equalTo: withdrawAmountLabel.bottomAnchor, constant: 16),
            operationsStackView.leadingAnchor.constraint(equalTo: accountCardView.leadingAnchor, constant: 8),
            operationsStackView.trailingAnchor.constraint(equalTo: accountCardView.trailingAnchor, constant: -8),
            operationsStackView.bottomAnchor.constraint(equalTo: accountCardView.bottomAnchor),
            
            transactionsLabel.topAnchor.constraint(equalTo: accountCardView.bottomAnchor, constant: 32.0),
            transactionsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            
            transactionsTableView.topAnchor.constraint(equalTo: transactionsLabel.bottomAnchor, constant: 16.0),
            transactionsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32.0),
            transactionsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32.0),
            transactionsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32.0)
        ])
    }
    
    @objc func depositButtonTapped() {
        let depositVC = DepositViewController(bankAccount: bankAccount)
        depositVC.delegate = self
        navigationController?.pushViewController(depositVC, animated: true)
    }
    
    @objc func withdrawButtonTapped() {
        let withdrawVC = WithdrawViewController(bankAccount: bankAccount)
        withdrawVC.delegate = self
        navigationController?.pushViewController(withdrawVC, animated: true)
    }
}

extension HomeViewController: BankingServiceDelegate {
    func didPerformOperation() {
        withdrawAmountLabel.text = withdrawAmount
        transactionsTableView.reloadData()
    }
}

// MARK: - UITableViewDelegate e UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bankAccount.transactionsHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "extractCell", for: indexPath)
        var configuration = cell.defaultContentConfiguration()
        configuration.text = bankAccount.transactionsHistory[indexPath.row]
        configuration.secondaryText = Date().formatCurrentDate()
        configuration.textProperties.numberOfLines = 0
        configuration.textProperties.color = Colors.graphite ?? .graphite
        configuration.textProperties.font = .boldSystemFont(ofSize: 16.0)
        cell.contentConfiguration = configuration
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
