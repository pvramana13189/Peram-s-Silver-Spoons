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
    MenuModel(name: "Pizza", amount: 12.99),
    MenuModel(name: "Pasta", amount: 14.99),
    MenuModel(name: "Party Platter", amount: 100),
    MenuModel(name: "Corporate Buffet", amount: 25),
    MenuModel(name: "Mojito", amount: 8),
    MenuModel(name: "Margarita", amount: 10),
    MenuModel(name: "Birthday Cake", amount: 50),
    MenuModel(name: "Business Luncheon Buffet", amount: 30),
    MenuModel(name: "Branded T-shirts", amount: 20),
    MenuModel(name: "Coffee Mugs", amount: 15)
]
