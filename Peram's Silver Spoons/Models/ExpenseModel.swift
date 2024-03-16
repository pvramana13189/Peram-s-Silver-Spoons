//
//  ExpenseModel.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import Foundation

struct ExpenseModel: Identifiable{
    var id: String = UUID().uuidString
    
    var name: String
    var amount: Int
    var summary: String
}
