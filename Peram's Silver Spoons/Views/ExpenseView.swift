//
//  ExpenseView.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import SwiftUI

struct ExpenseView: View {
    
    @ObservedObject var util: Utility2
    
    var name: String
    var amount: Int
    var summary: String
    
    var body: some View {
        NavigationLink(destination: ExpenseSummaryView(exp: ExpenseModel(name: name, amount: amount, summary: summary), util: util)) {
            VStack{
                HStack{
                    Text(name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(String(describing: amount))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
        }
    }
}

struct ExpenseView_Previews: PreviewProvider {
    static var previews: some View{
        ExpenseView(util:Utility2(utilNum: 2, title: "View and Modify Expense", expenseList: expenseUtility, url: urlExpense) ,name: "Rent", amount: 1500, summary: "Due on the 1st of every month")
    }
}
