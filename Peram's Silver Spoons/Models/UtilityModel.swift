//
//  UtilityModel.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import Foundation

// Definition of the Utility1 class which manages income data
class Utility1: Identifiable, ObservableObject{
    // Unique identifier for the utility
    var id: String = UUID().uuidString
    
    var utilNum: Int // Identifier for the utility
    var title: String // Title of the utility
    
    // Array to store income data
    @Published var incomeList: [IncomeModel]
    
    // URL for the first screen view
    var urlFirstScreen: String
    
    // Initialization method for the Utility1 class
    init(utilNum: Int, title: String, incomeList: [IncomeModel], url: String) {
        self.utilNum = utilNum
        self.title = title
        self.incomeList = incomeList
        self.urlFirstScreen = url
    }
    
    // Method to add a new income to the income list
    func addIncome(inc: IncomeModel){
        incomeList.append(inc)
    }
    
    // Method to update an existing income in the income list
    func updateIncome(updatedIncome: IncomeModel) {
        guard let index = incomeList.firstIndex(where: { $0.name == updatedIncome.name }) else {
            return
        }
        incomeList[index] = updatedIncome
    }
}

// Definition of the Utility2 class which manages expense data
class Utility2: Identifiable, ObservableObject{
    // Unique identifier for the utility
    var id: String = UUID().uuidString
    
    var utilNum: Int // Identifier for the utility
    var title: String // Title of the utility
    
    // Array to store expense data
    @Published var expenseList: [ExpenseModel]
    
    // URL for the first screen view
    var urlFirstScreen: String
    
    // Initialization method for the Utility2 class
    init(utilNum: Int, title: String, expenseList: [ExpenseModel], url: String) {
        self.utilNum = utilNum
        self.title = title
        self.expenseList = expenseList
        self.urlFirstScreen = url
    }
    
    // Method to add a new expense to the expense list
    func addExpense(exp: ExpenseModel){
        expenseList.append(exp)
    }
    
    // Method to update an existing expense in the expense list
    func updateExpense(updatedExpense: ExpenseModel) {
        guard let index = expenseList.firstIndex(where: { $0.name == updatedExpense.name }) else {
            return
        }
        expenseList[index] = updatedExpense
    }
}

// Definition of the Utility3 class which manages menu data
class Utility3: Identifiable, ObservableObject{
    // Unique identifier for the utility
    var id: String = UUID().uuidString
    
    var utilNum: Int // Identifier for the utility
    var title: String // Title of the utility
    
    // Array to store menu data
    @Published var menuList: [MenuModel]
    
    // Initialization method for the Utility3 class
    init(utilNum: Int, title: String, menuList: [MenuModel]) {
        self.utilNum = utilNum
        self.title = title
        self.menuList = menuList
    }
}
