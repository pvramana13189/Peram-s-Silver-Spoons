//
//  ExpenseView.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import SwiftUI

// View for displaying an individual expense.
struct ExpenseView: View {
    
    // Utility object to handle expense data.
    @ObservedObject var util: Utility2
    
    //Name, Amount(price) and Summary of the expense
    var name: String
    var amount: Int
    var summary: String
    
    var body: some View {
        // Navigation link to navigate to the expense summary view.
        NavigationLink(destination: ExpenseSummaryView(exp: ExpenseModel(name: name, amount: amount, summary: summary), util: util)) {
            VStack{
                HStack{
                    // Display the name of the expense, aligning it to the leading edge.
                    Text(name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Display the amount of the expense, aligning it to the trailing edge.
                    Text(String(describing: amount))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
        }
    }
}

// PreviewProvider for ExpenseView.
struct ExpenseView_Previews: PreviewProvider {
    static var previews: some View{
        // Preview an instance of ExpenseView with sample data.
        ExpenseView(util:Utility2(utilNum: 2, title: "View and Modify Expense", expenseList: expenseUtility, url: urlExpense) ,name: "Rent", amount: 1500, summary: "Due on the 1st of every month")
    }
}
