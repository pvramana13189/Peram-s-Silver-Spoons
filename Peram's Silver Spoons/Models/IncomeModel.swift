//
//  IncomeModel.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import Foundation

// Definition of the IncomeModel struct representing income items
struct IncomeModel: Identifiable{
    // Unique identifier for the income item
    var id: String = UUID().uuidString
    
    // Name, Amount and Summary of the income source
    var name: String
    var amount: Int
    var summary: String
}
