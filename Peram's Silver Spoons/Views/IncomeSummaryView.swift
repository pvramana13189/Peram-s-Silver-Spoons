//
//  IncomeSummaryView.swift
//  Peram's Silver Spoons
//
//  Created by OSU APP CENTER on 3/15/24.
//

import SwiftUI

struct IncomeSummaryView: View {
    
    var inc: IncomeModel
    @State private var editedSummary: String
    @ObservedObject var util: Utility1
    
    init(inc: IncomeModel, util: Utility1) {
        self.inc = inc
        self.util = util
        self._editedSummary = State(initialValue: inc.summary)
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
                updateIncomeSummary()
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
    
    func updateIncomeSummary(){
        if inc.summary != editedSummary{
            print("Before update income")
            let updateInc : IncomeModel = IncomeModel(name: inc.name, amount: inc.amount, summary: editedSummary)
            //util.updateIncome(updatedIncome: updateInc)
            util.updateIncome(updatedIncome: updateInc)
        }
    }
}

struct IncomeSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        IncomeSummaryView(inc: IncomeModel(name: "Test", amount: 100, summary: "Testing Summary"), util: Utility1(utilNum: 1, title: "View and Modify Income", incomeList: incomeUtility, url: urlIncome))
    }
}
