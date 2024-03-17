//
//  IncomeSummaryView.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import SwiftUI

// View for editing and saving income summary.
struct IncomeSummaryView: View {
    
    var inc: IncomeModel // Income model to be edited.
    @State private var editedSummary: String // State variable to track edited summary.
    @ObservedObject var util: Utility1 // Utility object to handle income data.
    
    // Environment variable to manage presentation mode.
    @Environment(\.presentationMode) var presentationMode
    
    // Initializer to set initial values.
    init(inc: IncomeModel, util: Utility1) {
        self.inc = inc
        self.util = util
        self._editedSummary = State(initialValue: inc.summary)
    }
    
    var body: some View {
        VStack{
            VStack{
                Text(inc.name)
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
                    updateIncomeSummary()
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
    
    // Function to update the income summary.
    func updateIncomeSummary(){
        if inc.summary != editedSummary{
            print("Before update income")
            let updateInc : IncomeModel = IncomeModel(name: inc.name, amount: inc.amount, summary: editedSummary)
            util.updateIncome(updatedIncome: updateInc) // Update the summary in the utility object.
        }
    }
}

// PreviewProvider for IncomeSummaryView.
struct IncomeSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        // Preview an instance of IncomeSummaryView with sample income data.
        IncomeSummaryView(inc: IncomeModel(name: "Test", amount: 100, summary: "Testing Summary"), util: Utility1(utilNum: 1, title: "View and Modify Income", incomeList: incomeUtility, url: urlIncome))
    }
}
