//
//  UtilityViewModel.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import Foundation

// Utility array to store income data
var incomeUtility: [IncomeModel] = []

// URL string for income images
var urlIncome = ""

// Utility array to store expense data
var expenseUtility: [ExpenseModel] = []

// URL string for expense images
var urlExpense = ""

// Utility array to store menu data
var menuUtility: [MenuModel] = [
    MenuModel(name: "Cheeseburger", amount: 10.99),
    MenuModel(name: "Margherita Pizza", amount: 12.99),
    MenuModel(name: "Caesar Salad", amount: 8.99),
    MenuModel(name: "Grilled Salmon", amount: 16.99),
    MenuModel(name: "Pasta Carbonara", amount: 14.99)
]
