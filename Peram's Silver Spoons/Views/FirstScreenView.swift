//
//  FirstScreenView.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import SwiftUI

struct FirstScreenView: View {
    
    @State private var profitOrLossPercentage: Int = 0
    @State private var isProfitable: Bool = true
    
    @StateObject var util1 = Utility1(utilNum: 1, title: "View and Modify Income", incomeList: incomeUtility, url: urlIncome)
    @StateObject var util2 = Utility2(utilNum: 2, title: "View and Modify Expense", expenseList: expenseUtility, url: urlExpense)
    @StateObject var util3 = Utility3(utilNum: 3, title: "Menu", menuList: menuUtility)
    
    var totalIncome: Int {
        util1.incomeList.reduce(0) { $0 + $1.amount }
    }
    
    var totalExpenses: Int {
        util2.expenseList.reduce(0) { $0 + $1.amount }
    }
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                Text("\(profitOrLossPercentage)%")
                    .font(.title)
                    .padding()
                    .foregroundColor(profitOrLossColor)
                
                Text("View Menu")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.system(size: 25))
                
                NavigationLink(destination: MenuListView(util: util3)){
                    Image("menu")
                        .resizable ()
                        .scaledToFit()
                        .frame(width: 250, height: 200)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black, lineWidth: 2)
                        )
                }
                
                Text(util1.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.system(size: 25))
                
                NavigationLink(destination: IncomeListView(util: util1)){
                    AsyncImageView(urlString: util1.urlFirstScreen)
                }
                
                Text(util2.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.system(size: 25))
                
                NavigationLink(destination: ExpenseListView(util: util2)){
                    AsyncImageView(urlString: util2.urlFirstScreen)
                }
            }
        }
        .background(Color.black.opacity(0.15))
        .onAppear {
            if totalIncome < totalExpenses{
                isProfitable = false
            }
            else{
                isProfitable = true
            }
            profitOrLossPercentage = Int(profitOrLossCalculation())
        }
    }
    
    private var profitOrLossColor: Color {
        
        if profitOrLossPercentage == 0  {
            return .blue
        } else if isProfitable {
            return .green
        } else {
            return .red
        }
    }
    
    func profitOrLossCalculation() -> Double {
        let currentTotalIncome = totalIncome
        let currentTotalExpenses = totalExpenses
        
        if currentTotalIncome > currentTotalExpenses {
            return (Double(currentTotalIncome - currentTotalExpenses) / Double(currentTotalExpenses)) * 100.0
        } else {
            return (Double(currentTotalExpenses - currentTotalIncome) / Double(currentTotalExpenses)) * 100.0
        }
    }
    
}

#Preview {
    FirstScreenView()
}
