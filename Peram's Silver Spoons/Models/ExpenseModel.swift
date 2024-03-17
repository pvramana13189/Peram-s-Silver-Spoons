//
//  ExpenseModel.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import Foundation

// Definition of the ExpenseModel struct representing expense items
struct ExpenseModel: Identifiable{
    // Unique identifier for the expense item
    var id: String = UUID().uuidString
    
    // Name, Amount and Summary of the expense
    var name: String
    var amount: Int
    var summary: String
}
