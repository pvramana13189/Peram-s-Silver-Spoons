//
//  AddIncomeView.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import SwiftUI

// View for adding new expenses.
struct AddExpenseView: View {
    
    // State variables for expense name, amount, and summary.
    @State var expname: String = ""
    @State var expamount: Int = 0
    @State var expsummary: String = ""
    
    // Utility object to handle expense data.
    @ObservedObject var util: Utility2
    
    // Environment variable to manage presentation mode.
    @Environment(\.presentationMode) var presentationMode
    
    // State variable to control error alert.
    @State private var showError = false
    
    var body: some View {
        
        VStack{
            // Text field for entering expense name.
            VStack{
                Text("Expense Source Name:")
                    .font(.system(size: 28))
                    .bold()
                
                TextField("Enter the Expense Name", text: $expname)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .frame(width: 300)
            }
            
            // Text field for entering expense amount.
            VStack{
                Text("Expense Source Amount:")
                    .font(.system(size: 28))
                    .bold()
                
                TextField("Enter the Expense Amount", text: Binding<String>(
                    get: { String(expamount) },
                    set: { if let value = Int($0) { expamount = value } }
                ))
                .padding()
                .background(Color.gray.opacity(0.3).cornerRadius(10))
                .frame(width: 300)
            }
            
            // Text field for entering expense summary.
            VStack{
                Text("Expense Source Summary:")
                    .font(.system(size: 28))
                    .bold()
                
                TextField("Enter the Expense Summary", text: $expsummary)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .frame(width: 300)
            }
            
            Spacer()
            
            // Button to save the expense.
            Button{
                saveExpense()
            }label: {
                Text("Save Expense")
                    .textCase(.uppercase)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.black)
                    .bold()
                    .background(Color.red.opacity(0.4).cornerRadius(10))
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red.opacity(0.15))
        // Alert to show error if expense name or amount is not provided.
        .alert(isPresented: $showError) {
            Alert(
                title: Text("Error"),
                message: Text("Please enter both Expense Source and Amount"),
                dismissButton: .default(Text("Okay"))
            )
        }
    }
    
    // Function to save the expense.
    func saveExpense(){
        if (expname == "" || expamount == 0) {
            // Show error alert if name or amount is missing.
            showError = true
        }
        else{
            // Create a new ExpenseModel object with provided data.
            let newExp : ExpenseModel = ExpenseModel(name: expname, amount: expamount, summary: expsummary)
            
            // Add the new expense to the utility object.
            util.addExpense(exp: newExp)
            
            // Reset input fields.
            expname = ""
            expamount = 0
            expsummary = ""
            
            // Dismiss the view after saving.
            presentationMode.wrappedValue.dismiss()
        }
    }
}

// PreviewProvider for AddExpenseView.
struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View{
        // Preview an instance of AddExpenseView with a sample utility object.
        let util2 = Utility2(utilNum: 1, title: "View and Modify Expense", expenseList: expenseUtility, url: urlExpense)
        AddExpenseView(util: util2)
    }
}
