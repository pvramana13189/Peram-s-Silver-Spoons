//
//  IncomeListView.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import SwiftUI

// View for displaying a list of incomes.
struct IncomeListView: View {
    
    // Utility object to handle income data.
    @ObservedObject var util: Utility1
    
    var body: some View {
        VStack{
            // Header section with income source and amount labels.
            VStack{
                HStack{
                    Text("Income Source")
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
            // List of incomes.
            List{
                ForEach(util.incomeList){inc in
                    VStack{
                        // Display each income using the IncomeView.
                        IncomeView(util: util, name: inc.name, amount: inc.amount, summary: inc.summary)
                    }
                    .background(.brown.opacity(0.3))
                }
            }
            .listStyle(PlainListStyle())
            .frame(maxWidth: .infinity)
            // Navigation link to add new income.
            .navigationBarItems(trailing: NavigationLink("Add New Income", destination: AddIncomeView(util: util)))
        }
        .background(Color.red.opacity(0.15))
        
        // Section displaying total amount of all incomes.
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
    
    // Function to calculate the total amount of all incomes.
    func calculateTotalAmount() -> Int {
        let totalAmount = util.incomeList.reduce(0) { $0 + $1.amount }
        return totalAmount
    }
}

// PreviewProvider for IncomeListView.
struct IncomeListView_Previews: PreviewProvider {
    static var previews: some View{
        // Preview an instance of IncomeListView with a sample utility object.
        let util1 = Utility1(utilNum: 1, title: "View and Modify Income", incomeList: incomeUtility, url: urlIncome)
        IncomeListView(util: util1)
    }
}
