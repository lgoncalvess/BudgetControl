//
//  CellDetailViewController.swift
//  BudgetControl
//
//  Created by Leonardo Gonçalves on 26/03/23.
//

import UIKit

class CellDetailViewController: UIViewController {
    let stackView = UIStackView()
    let namelabel = UILabel()
    let amountLabel = UILabel()
    let descriptionLabel = UILabel()
    let typeLabel = UILabel()
    let categoryLabel = UILabel()
    
    let transaction: Transaction
    
    init(with transaction: Transaction) {
        self.transaction = transaction
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        stackView.addArrangedSubview(namelabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(amountLabel)
        stackView.addArrangedSubview(typeLabel)
        stackView.addArrangedSubview(categoryLabel)
        
        view.addSubview(stackView)
        
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.alignment = .leading
        stackView.distribution = .fill
        
        namelabel.text = "Name: \(transaction.name)"
        styleLabel(to: namelabel)
        
        descriptionLabel.text = "Description: \(transaction.description)"
        styleLabel(to: descriptionLabel)

        amountLabel.text = "Description: \(String(format: "R$ %.2f", transaction.amount))"
        styleLabel(to: amountLabel)

        typeLabel.text = "Description: \(transaction.type.rawValue)"
        styleLabel(to: typeLabel)

        categoryLabel.text = "Description: \(transaction.category.rawValue)"
        styleLabel(to: categoryLabel)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func styleLabel(to label: UILabel) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "fontColor")
        label.layer.borderWidth = 0.3
        
        label.layer.borderColor = UIColor(named: "fontColor")!.cgColor
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.adjustsFontSizeToFitWidth = true
        
        NSLayoutConstraint.activate([
            label.heightAnchor.constraint(equalToConstant: 80),
            label.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -14)
        ])
    }
}
