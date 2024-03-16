//
//  IncomeListView.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import SwiftUI

struct IncomeListView: View {
    
    @ObservedObject var util: Utility1
    
    var body: some View {
        VStack{
            List{
                ForEach(util.incomeList){inc in
                    VStack{
                        IncomeView(util: util, name: inc.name, amount: inc.amount, summary: inc.summary)
                    }
                    .background(.brown.opacity(0.3))
                }
            }
            .listStyle(PlainListStyle())
            .frame(maxWidth: .infinity)
            .navigationBarItems(trailing: NavigationLink("Add New Income", destination: AddIncomeView(util: util)))
        }
        .background(Color.red.opacity(0.15))
        
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

    func calculateTotalAmount() -> Int {
        let totalAmount = util.incomeList.reduce(0) { $0 + $1.amount }
        return totalAmount
    }
}

struct IncomeListView_Previews: PreviewProvider {
    static var previews: some View{
        
        let util1 = Utility1(utilNum: 1, title: "View and Modify Income", incomeList: incomeUtility, url: urlIncome)
        IncomeListView(util: util1)
    }
}
