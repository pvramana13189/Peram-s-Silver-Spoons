//
//  IncomeView.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import SwiftUI

struct IncomeView: View {
    
    var name: String
    var amount: Int
    var summary: String
    
    var body: some View {
        NavigationLink(destination: IncomeSummaryView(summary: summary)) {
            VStack{
                HStack{
                    Text(name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(String(describing: amount))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
        }
    }
}

struct IncomeView_Previews: PreviewProvider {
    static var previews: some View{
        IncomeView(name: "Food Sales", amount: 500, summary: "Most popular item: Pizza")
    }
}

