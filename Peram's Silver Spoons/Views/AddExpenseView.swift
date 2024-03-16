//
//  AddIncomeView.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import SwiftUI

struct AddExpenseView: View {
    
    @State var expname: String = ""
    @State var expamount: Int = 0
    @State var expsummary: String = ""
    
    @ObservedObject var util: Utility2
    
    var body: some View {
        
        VStack{
            VStack{
                Text("Expense Source Name:")
                    .font(.system(size: 28))
                    .bold()
                
                TextField("Enter the Expense Name", text: $expname)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .frame(width: 300)
            }
            
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
            
            Button{
                saveExpense()
            }label: {
                Text("Save Expense Source")
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
    }
    
    func saveExpense(){
        let newExp : ExpenseModel = ExpenseModel(name: expname, amount: expamount, summary: expsummary)
        util.addExpense(exp: newExp)
        
        expname = ""
        expamount = 0
        expsummary = ""
        
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View{
        
        let util2 = Utility2(utilNum: 1, title: "View and Modify Expense", expenseList: expenseUtility, url: urlExpense)
        AddExpenseView(util: util2)
    }
}
