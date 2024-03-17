//
//  IncomeView.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import SwiftUI

struct IncomeView: View {
    
    @ObservedObject var util: Utility1
    
    var name: String
    var amount: Int
    var summary: String
    
    var body: some View {
        NavigationLink(destination: IncomeSummaryView(inc: IncomeModel(name: name, amount: amount, summary: summary), util: util)) {
            VStack{
                HStack{
                    Text(name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(String(describing: amount))
                        .frame(alignment: .trailing)
                }
            }
        }
    }
}

struct IncomeView_Previews: PreviewProvider {
    static var previews: some View{
        IncomeView(util: Utility1(utilNum: 1, title: "View and Modify Income", incomeList: incomeUtility, url: urlIncome), name: "Food Sales", amount: 500, summary: "Most popular item: Pizza")
    }
}

