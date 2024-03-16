//
//  ExpenseListView.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import SwiftUI

struct ExpenseListView: View {
    
    @ObservedObject var util: Utility2
    
    var body: some View {
        VStack{
            List{
                ForEach(util.expenseList){inc in
                    VStack{
                        ExpenseView(name: inc.name, amount: inc.amount, summary: inc.summary)
                    }
                    .background(.brown.opacity(0.3))
                }
            }
            .listStyle(PlainListStyle())
            .frame(maxWidth: .infinity)
            .navigationBarItems(trailing: NavigationLink("Add", destination: AddExpenseView(util: util)))
        }
        .background(Color.red.opacity(0.15))
        
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

    func calculateTotalAmount() -> Int {
        let totalAmount = util.expenseList.reduce(0) { $0 + $1.amount }
        return totalAmount
    }
}

struct ExpenseListView_Previews: PreviewProvider {
    static var previews: some View{
        
        let util2 = Utility2(utilNum: 2, title: "View and Modify Expense", expenseList: expenseUtility, url: urlExpense)
        ExpenseListView(util: util2)
    }
}