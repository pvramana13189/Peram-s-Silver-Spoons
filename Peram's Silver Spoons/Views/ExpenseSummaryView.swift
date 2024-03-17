//
//  ExpenseSummaryView.swift
//  Peram's Silver Spoons
//
//  Created by OSU APP CENTER on 3/15/24.
//

import SwiftUI

struct ExpenseSummaryView: View {
    
    var exp: ExpenseModel
    @State private var editedSummary: String
    @ObservedObject var util: Utility2
    
    @Environment(\.presentationMode) var presentationMode
    
    init(exp: ExpenseModel, util: Utility2) {
        self.exp = exp
        self.util = util
        self._editedSummary = State(initialValue: exp.summary)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Additional Information")
                .font(.title)
                .padding()
            
            TextEditor(text: $editedSummary)
                .padding()
                .border(Color.gray, width: 1)
                .frame(minHeight: 200)
        }
        .padding()
        .frame(height: 300)
        .background(Color.gray.opacity(0.23))
        
        VStack{
            Button{
                updateExpenseSummary()
                presentationMode.wrappedValue.dismiss()
            }label: {
                Text("Save")
                    .textCase(.uppercase)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.black)
                    .bold()
                    .background(Color.green.opacity(0.4).cornerRadius(10))
            }
            
        }
    }
    
    func updateExpenseSummary(){
        if exp.summary != editedSummary{
            print("Before update income")
            let updateExp : ExpenseModel = ExpenseModel(name: exp.name, amount: exp.amount, summary: editedSummary)
            util.updateExpense(updatedExpense: updateExp)
        }
    }
}

struct ExpenseSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseSummaryView(exp: ExpenseModel(name: "Rent", amount: 1500, summary: "Due on the 1st of every month"), util: Utility2(utilNum: 2, title: "View and Modify Expense", expenseList: expenseUtility, url: urlExpense))
    }
}
