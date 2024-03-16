//
//  ExpenseView.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import SwiftUI

struct ExpenseView: View {
    
    var name: String
    var amount: Int
    var summary: String
    
    var body: some View {
        NavigationLink(destination: ExpenseSummaryView(summary: summary)) {
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

struct ExpenseView_Previews: PreviewProvider {
    static var previews: some View{
        ExpenseView(name: "Rent", amount: 1500, summary: "Due on the 1st of every month")
    }
}
