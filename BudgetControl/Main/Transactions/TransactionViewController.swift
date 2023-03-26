//
//  TransactionViewController.swift
//  BudgetControl
//
//  Created by Leonardo Gonçalves on 22/03/23.
//

import UIKit

class TransactionViewController: UIViewController {
    let tableView = UITableView()
    var transactions: [Transaction] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        populateTransactions()
        setupTableView()
    }
    
    func setupTableView() {
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        tableView.delegate = self
        tableView.backgroundColor = UIColor(named: "backgroundColor")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tintColor = .systemBackground
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
        
        tableView.register(TransactionCell.self, forCellReuseIdentifier: TransactionCell.reuseID)
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 2),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: 2),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension TransactionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransactionCell.reuseID, for: indexPath) as! TransactionCell
        cell.configure(with: transactions[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
}

extension TransactionViewController {
    func populateTransactions() {
        transactions.append(Transaction(name: "iFood", description: "Lasanha a bolonhesa", amount: 26.00, type: .output, category: .food))
        transactions.append(Transaction(name: "Rappi", description: "Sorvete de creme", amount: 51.00, type: .output, category: .food))
        transactions.append(Transaction(name: "iPhone 14 Pro Max", description: "iPhone comprado para fins de estudo", amount: 6000.00, type: .output, category: .entertainment))
        transactions.append(Transaction(name: "Salário", description: "mensal", amount: 9500, type: .input, category: .entertainment))
    }
}


extension TransactionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellDetail = CellDetailViewController(with: transactions[indexPath.row])
        navigationController?.pushViewController(cellDetail, animated: true)
    }
}
