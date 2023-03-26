//
//  TransactionModel.swift
//  BudgetControl
//
//  Created by Leonardo Gonçalves on 26/03/23.
//

import Foundation

struct Transaction {
    let name: String
    let description: String
    let amount: Double
    let type: TransactionType
    let category: TransactionCategory
}

enum TransactionType: String {
    case input = "greenTransaction"
    case output = "redTransaction"
}

enum TransactionCategory: String {
    case food = "comida"
    case transport = "transporte"
    case entertainment = "entretenimento"
}
