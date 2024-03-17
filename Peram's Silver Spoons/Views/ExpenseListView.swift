//
//  ExpenseListView.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import SwiftUI

// View for displaying a list of expenses.
struct ExpenseListView: View {
    
    // Utility object to handle expense data.
    @ObservedObject var util: Utility2
    
    var body: some View {
        VStack{
            // Header section with expense source and amount labels.
            VStack{
                HStack{
                    Text("Expense Source")
                        .padding()
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Amount($)")
                        .padding()
                        .bold()
                        .frame(alignment: .trailing)
                }
                .background(Color.orange.opacity(0.5).cornerRadius(10))
            }
            
            // List of expenses.
            List{
                ForEach(util.expenseList){inc in
                    VStack{
                        // Display each expense using the ExpenseView.
                        ExpenseView(util: util, name: inc.name, amount: inc.amount, summary: inc.summary)
                    }
                    .background(.brown.opacity(0.3))
                }
            }
            .listStyle(PlainListStyle())
            .frame(maxWidth: .infinity)
            // Navigation link to add new expense.
            .navigationBarItems(trailing: NavigationLink("Add New Expense", destination: AddExpenseView(util: util)))
        }
        .background(Color.red.opacity(0.15))
        
        // Section displaying total amount of all expenses.
        HStack(spacing:20) {
            Text("Total Amount:")
                .bold()
                .foregroundColor(.orange)
            Text(String(calculateTotalAmount()))
                .bold()
                .foregroundColor(.green)
        }
        .frame(maxWidth: .infinity)
    }
    
    // Function to calculate the total amount of all expenses.
    func calculateTotalAmount() -> Int {
        let totalAmount = util.expenseList.reduce(0) { $0 + $1.amount }
        return totalAmount
    }
}

// PreviewProvider for ExpenseListView.
struct ExpenseListView_Previews: PreviewProvider {
    static var previews: some View{
        // Preview an instance of ExpenseListView with a sample utility object.
        let util2 = Utility2(utilNum: 2, title: "View and Modify Expense", expenseList: expenseUtility, url: urlExpense)
        ExpenseListView(util: util2)
    }
}
