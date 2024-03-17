//
//  IncomeView.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import SwiftUI

// View for displaying an individual income.
struct IncomeView: View {
    
    // Utility object to handle income data.
    @ObservedObject var util: Utility1
    
    //Name, Amount(price) and Summary of the income
    var name: String
    var amount: Int
    var summary: String
    
    var body: some View {
        // Navigation link to navigate to the income summary view.
        NavigationLink(destination: IncomeSummaryView(inc: IncomeModel(name: name, amount: amount, summary: summary), util: util)) {
            VStack{
                HStack{
                    // Display the name of the income, aligning it to the leading edge.
                    Text(name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Display the amount of the income, aligning it to the trailing edge.
                    Text(String(describing: amount))
                        .frame(alignment: .trailing)
                }
            }
        }
    }
}

// PreviewProvider for IncomeView.
struct IncomeView_Previews: PreviewProvider {
    static var previews: some View{
        // Preview an instance of IncomeView with sample data.
        IncomeView(util: Utility1(utilNum: 1, title: "View and Modify Income", incomeList: incomeUtility, url: urlIncome), name: "Food Sales", amount: 500, summary: "Most popular item: Pizza")
    }
}

