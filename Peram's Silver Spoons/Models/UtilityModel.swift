//
//  UtilityModel.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import Foundation

class Utility1: Identifiable, ObservableObject{
    var id: String = UUID().uuidString
    
    var utilNum: Int
    var title: String
    
    @Published var incomeList: [IncomeModel]
    
    var urlFirstScreen: String
    
    init(utilNum: Int, title: String, incomeList: [IncomeModel], url: String) {
        self.utilNum = utilNum
        self.title = title
        self.incomeList = incomeList
        self.urlFirstScreen = url
    }
    
    func addIncome(inc: IncomeModel){
        incomeList.append(inc)
    }
}

class Utility2: Identifiable, ObservableObject{
    var id: String = UUID().uuidString
    
    var utilNum: Int
    var title: String
    
    @Published var expenseList: [ExpenseModel]
    
    var urlFirstScreen: String
    
    init(utilNum: Int, title: String, expenseList: [ExpenseModel], url: String) {
        self.utilNum = utilNum
        self.title = title
        self.expenseList = expenseList
        self.urlFirstScreen = url
    }
    
    func addExpense(exp: ExpenseModel){
        expenseList.append(exp)
    }
}

class Utility3: Identifiable, ObservableObject{
    var id: String = UUID().uuidString
    
    var utilNum: Int
    var title: String
    
    @Published var menuList: [MenuModel]
    
    init(utilNum: Int, title: String, menuList: [MenuModel]) {
        self.utilNum = utilNum
        self.title = title
        self.menuList = menuList
    }
}
