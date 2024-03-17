//
//  AddIncomeView.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import SwiftUI

// View for adding new income.
struct AddIncomeView: View {
    
    // State variables for income name, amount, and summary.
    @State var incname: String = ""
    @State var incamount: Int = 0
    @State var incsummary: String = ""
    
    @ObservedObject var util: Utility1 // Utility object to handle income data.
    
    // Environment variable to manage presentation mode.
    @Environment(\.presentationMode) var presentationMode
    
    // State variable to control error alert.
    @State private var showError = false
    
    var body: some View {
        
        VStack{
            // Text field for entering income name.
            VStack{
                Text("Income Source Name:")
                    .font(.system(size: 28))
                    .bold()
                
                TextField("Enter the Income Name", text: $incname)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .frame(width: 300)
            }
            
            // Text field for entering income amount.
            VStack{
                Text("Income Source Amount:")
                    .font(.system(size: 28))
                    .bold()
                
                TextField("Enter the Income Amount", text: Binding<String>(
                    get: { String(incamount) },
                    set: { if let value = Int($0) { incamount = value } }
                ))
                .padding()
                .background(Color.gray.opacity(0.3).cornerRadius(10))
                .frame(width: 300)
            }
            
            // Text field for entering income summary.
            VStack{
                Text("Income Source Summary:")
                    .font(.system(size: 28))
                    .bold()
                
                TextField("Enter the Income Summary", text: $incsummary)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .frame(width: 300)
            }
            
            Spacer()
            
            // Button to save the income.
            Button{
                saveIncome()
            }label: {
                Text("Save Income")
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
        // Alert to show error if income name or amount is not provided.
        .alert(isPresented: $showError) {
            Alert(
                title: Text("Error"),
                message: Text("Please enter both Income Source and Amount"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
    // Function to save the income.
    func saveIncome(){
        if (incname == "" || incamount == 0) {
            showError = true // Show error alert if name or amount is missing.
        }
        else{
            // Create a new IncomeModel object with provided data.
            let newInc : IncomeModel = IncomeModel(name: incname, amount: incamount, summary: incsummary)
            util.addIncome(inc: newInc) // Add the new income to the utility object.
            
            // Reset input fields.
            incname = ""
            incamount = 0
            incsummary = ""
            
            // Dismiss the view after saving.
            presentationMode.wrappedValue.dismiss()
        }
    }
}

// PreviewProvider for AddIncomeView.
struct AddIncomeView_Previews: PreviewProvider {
    static var previews: some View{
        // Preview an instance of AddIncomeView with a sample utility object.
        let util1 = Utility1(utilNum: 1, title: "View and Modify Income", incomeList: incomeUtility, url: urlIncome)
        AddIncomeView(util: util1)
    }
}
