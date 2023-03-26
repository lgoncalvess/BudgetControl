//
//  TransactionCell.swift
//  BudgetControl
//
//  Created by Leonardo Gonçalves on 22/03/23.
//

import UIKit

class TransactionCell: UITableViewCell {
    var model: Transaction?
    let circle = UIView()
    let label = UILabel()
    let amount = UILabel()
    let chevron = UIImageView()
    let border = UIView()
    
    static let reuseID = "TransactionCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        styleElements()
        styleConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func styleElements() {
        
        backgroundColor = UIColor(named: "backgroundColor")
        
        border.translatesAutoresizingMaskIntoConstraints = false
        border.backgroundColor = .gray
        
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.layer.cornerRadius =  3
        circle.clipsToBounds = true
        circle.backgroundColor = UIColor(named: model?.type.rawValue ?? "greenTransaction")
        circle.layer.borderColor = UIColor.darkGray.cgColor
        circle.layer.borderWidth = 1.0

        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = model?.name ?? "Uber Eats teste teste teste teste teste testetestetesteteste teste teste"
        label.textColor = UIColor(named: "fontColor")
        label.textAlignment = .center
        label.contentMode = .scaleToFill
        label.numberOfLines = 2
        
        amount.translatesAutoresizingMaskIntoConstraints = false
        amount.text = String(format: "R$ %.2f", model?.amount ?? 765765756.0)
        amount.adjustsFontSizeToFitWidth = true

        chevron.translatesAutoresizingMaskIntoConstraints = false
        chevron.image = UIImage(systemName: "chevron.forward.circle")!.withTintColor(UIColor(named: "fontColor") ?? .gray, renderingMode: .alwaysOriginal)
        
        contentView.addSubview(circle)
        contentView.addSubview(label)
        contentView.addSubview(amount)
        contentView.addSubview(chevron)
        contentView.addSubview(border)
        
    }
    
    private func styleConstraints() {
        NSLayoutConstraint.activate([
            border.heightAnchor.constraint(equalToConstant: 1),
            border.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 2),
            border.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            circle.heightAnchor.constraint(equalToConstant: 30),
            circle.widthAnchor.constraint(equalToConstant: 5),
            circle.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
            circle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: circle.trailingAnchor, constant: 12),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.trailingAnchor.constraint(equalTo: amount.leadingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            amount.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 3),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: amount.trailingAnchor, multiplier: 2)
        ])
        
        NSLayoutConstraint.activate([
            chevron.topAnchor.constraint(equalToSystemSpacingBelow: amount.bottomAnchor, multiplier: 0.5),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: chevron.trailingAnchor, multiplier: 2)
        ])
        
        chevron.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }
    
    func configure(with transaction: Transaction) {
        circle.backgroundColor = UIColor(named: transaction.type.rawValue)
        label.text = transaction.name
        amount.text = String(format: "R$ %.2f", transaction.amount)
    }
}
