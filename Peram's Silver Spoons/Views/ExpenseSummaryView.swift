//
//  ExpenseSummaryView.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import SwiftUI

// View for editing and saving expense summary.
struct ExpenseSummaryView: View {
    
    var exp: ExpenseModel // Expense model to be edited.
    @State private var editedSummary: String // State variable to track edited summary.
    @ObservedObject var util: Utility2 // Utility object to handle expense data.
    
    // Environment variable to manage presentation mode.
    @Environment(\.presentationMode) var presentationMode
    
    // Initializer to set initial values.
    init(exp: ExpenseModel, util: Utility2) {
        self.exp = exp
        self.util = util
        self._editedSummary = State(initialValue: exp.summary)
    }
    
    var body: some View {
        VStack{
            VStack{
                Text(exp.name)
                    .bold()
                    .font(.largeTitle)
            }
            VStack(spacing: 20) {
                // Title for the section.
                Text("Additional Information")
                    .font(.title)
                    .padding()
                
                // TextEditor for editing the summary.
                TextEditor(text: $editedSummary)
                    .padding()
                    .border(Color.gray, width: 1)
                    .frame(minHeight: 200)
            }
            .padding()
            .frame(height: 300)
            .background(Color.gray.opacity(0.23))
            
            VStack{
                // Save button to update the summary.
                Button{
                    updateExpenseSummary()
                    presentationMode.wrappedValue.dismiss() // Dismiss the view after saving.
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red.opacity(0.15))
    }
    
    // Function to update the expense summary.
    func updateExpenseSummary(){
        if exp.summary != editedSummary{
            print("Before update income")
            let updateExp : ExpenseModel = ExpenseModel(name: exp.name, amount: exp.amount, summary: editedSummary)
            util.updateExpense(updatedExpense: updateExp) // Update the summary in the utility object.
        }
    }
}

// PreviewProvider for ExpenseSummaryView.
struct ExpenseSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        // Preview an instance of ExpenseSummaryView with sample expense data.
        ExpenseSummaryView(exp: ExpenseModel(name: "Rent", amount: 1500, summary: "Due on the 1st of every month"), util: Utility2(utilNum: 2, title: "View and Modify Expense", expenseList: expenseUtility, url: urlExpense))
    }
}
