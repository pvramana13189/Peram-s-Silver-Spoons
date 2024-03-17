//
//  MenuModel.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import Foundation

// Definition of the MenuModel struct representing menu items
struct MenuModel: Identifiable{
    // Unique identifier for the menu item
    var id: String = UUID().uuidString
    
    // Name and Amount of the menu item
    var name: String
    var amount: Double
}
