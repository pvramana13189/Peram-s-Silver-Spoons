//
//  FirstScreenView.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import SwiftUI

// View for the first screen of the application.
struct FirstScreenView: View {
    
    // State variables to track profit or loss percentage and profitability status.
    @State private var profitOrLossPercentage: Double = 0
    @State private var isProfitable: Bool = true
    
    // State objects for managing utility objects for income, expenses, and menu.
    @StateObject var util1 = Utility1(utilNum: 1, title: "View and Modify Income", incomeList: incomeUtility, url: urlIncome)
    @StateObject var util2 = Utility2(utilNum: 2, title: "View and Modify Expense", expenseList: expenseUtility, url: urlExpense)
    @StateObject var util3 = Utility3(utilNum: 3, title: "Menu", menuList: menuUtility)
    
    // Computed property to calculate total income.
    var totalIncome: Int {
        util1.incomeList.reduce(0) { $0 + $1.amount }
    }
    
    // Computed property to calculate total expenses.
    var totalExpenses: Int {
        util2.expenseList.reduce(0) { $0 + $1.amount }
    }
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                // Display profit or loss percentage with appropriate color.
                Text("\(profitOrLossPercentage)%")
                    .font(.title)
                    .padding()
                    .foregroundColor(profitOrLossColor)
                
                // Button to view the menu.
                Text("View Menu")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.system(size: 25))
                
                // Navigation link to the menu list view.
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
                
                // Display title for income section.
                Text(util1.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.system(size: 25))
                
                // Navigation link to the income list view.
                NavigationLink(destination: IncomeListView(util: util1)){
                    AsyncImageView(urlString: util1.urlFirstScreen)
                }
                
                // Display title for expense section.
                Text(util2.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.system(size: 25))
                
                // Navigation link to the expense list view.
                NavigationLink(destination: ExpenseListView(util: util2)){
                    AsyncImageView(urlString: util2.urlFirstScreen)
                }
            }
        }
        .navigationBarBackButtonHidden() // Hide back button to prevent data loss.
        .background(Color.black.opacity(0.15))
        .onAppear {
            // Calculate profit or loss percentage and determine profitability.
            if totalIncome < totalExpenses{
                isProfitable = false
            }
            else{
                isProfitable = true
            }
            profitOrLossPercentage = Double(profitOrLossCalculation())
        }
    }
    
    // Computed property to determine text color based on profit or loss percentage.
    private var profitOrLossColor: Color {
        
        if profitOrLossPercentage == 0  {
            return .blue
        } else if isProfitable {
            return .green
        } else {
            return .red
        }
    }
    
    // Function to determine profit or loss percentage.
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

// Preview provider for FirstScreenView.
#Preview {
    FirstScreenView()
}
