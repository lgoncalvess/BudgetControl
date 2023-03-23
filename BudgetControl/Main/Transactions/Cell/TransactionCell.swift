//
//  TransactionCell.swift
//  BudgetControl
//
//  Created by Leonardo Gonçalves on 22/03/23.
//

import UIKit

enum TransactionType: String {
    case input = "greenTransaction"
    case output = "redTransaction"
}

struct TransactionModel {
    var transactionType: TransactionType
    var name: String
    var amount: Double
}

class TransactionCell: UITableViewCell {
    var model: TransactionModel?
    let circle = UIView()
    let label = UILabel()
    let amount = UILabel()
    static let reuseID = "TransactionCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.layer.cornerRadius =  7
        circle.clipsToBounds = true
        circle.backgroundColor = UIColor(named: model?.transactionType.rawValue ?? "greenTransaction")
        circle.layer.borderColor = UIColor.darkGray.cgColor
        circle.layer.borderWidth = 1.0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = model?.name ?? "Uber Eats the bestsdadasdasdasd"
        label.textColor = UIColor(named: "fontColor")
        label.textAlignment = .center
        
        amount.translatesAutoresizingMaskIntoConstraints = false
        amount.text = String(format: "%.2f", model?.amount ?? 0.0)
        
        contentView.addSubview(circle)
        contentView.addSubview(label)
        contentView.addSubview(amount)

        NSLayoutConstraint.activate([
            circle.heightAnchor.constraint(equalToConstant:13),
            circle.widthAnchor.constraint(equalToConstant: 13),
            circle.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            circle.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2)
        ])
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leadingAnchor.constraint(equalToSystemSpacingAfter: circle.trailingAnchor, multiplier: 4),
            //label.trailingAnchor.constraint(equalToSystemSpacingAfter: amount.leadingAnchor, multiplier: 2)
        ])
        
        NSLayoutConstraint.activate([
            trailingAnchor.constraint(equalToSystemSpacingAfter: amount.trailingAnchor, multiplier: 2),
            amount.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            amount.leadingAnchor.constraint(equalToSystemSpacingAfter: label.trailingAnchor, multiplier: 2)
        ])
        
//        circle.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
//        label.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
        
    }
}
