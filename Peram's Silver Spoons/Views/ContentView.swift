//
//  ContentView.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/5/24.
//

import SwiftUI

// Main content view of the application.
struct ContentView: View {
    
    var body: some View {
        VStack {
            HStack{
                // Navigation link to the first screen view.
                NavigationLink(destination: FirstScreenView()){
                    Image("Restaurant_Image") // Image representing the restaurant
                }
                .navigationTitle("Peram's Silver Spoons") // Navigation title for the view
                .toolbarColorScheme(.dark, for: .navigationBar) // Toolbar color scheme
                .toolbarBackground(Color.clear, for: .navigationBar) // Toolbar background color
                .toolbarBackground(.visible, for: .navigationBar) // Toolbar background visibility
            }
        }
        .onAppear {
            // Initialize income and expense data
            initializeIncome()
            initializeExpenses()
        }
    }
    
    // Function to initialize income data
    private func initializeIncome() {
        incomeUtility = [
            IncomeModel(name: "Food Sales", amount: 25000, summary: "Most popular menu items: Pizza, Pasta"),
            IncomeModel(name: "Catering Services", amount: 10000, summary: "Types of events catered: Weddings, Corporate Events"),
            IncomeModel(name: "Bar Revenue", amount: 8000, summary: "Popular cocktails: Mojito, Margarita"),
            IncomeModel(name: "Private Events/Function Bookings", amount: 15000, summary: "Types of events hosted: Birthday Parties, Business Luncheons"),
            IncomeModel(name: "Merchandise Sales", amount: 3500, summary: "Types of merchandise sold: T-shirts, Coffee Mugs"),
            IncomeModel(name: "Investment Dividends", amount: 1500, summary: "Investments: Stocks, ETFs")
        ]
        
        urlIncome = "https://cdn4.vectorstock.com/i/1000x1000/72/08/money-cash-flat-long-shadow-square-icon-vector-7597208.jpg"
    }
    
    // Function to initialize expense data
    private func initializeExpenses() {
        expenseUtility = [
            ExpenseModel(name: "Rent", amount: 6000, summary: "Lease terms: Monthly rent, Due date: 1st of each month"),
            ExpenseModel(name: "Utilities", amount: 1500, summary: "Breakdown: Electricity, Water, Gas"),
            ExpenseModel(name: "Food and Beverage Costs", amount: 15000, summary: "Supplier details: ABC Food Distributors, Ordering frequency: Weekly"),
            ExpenseModel(name: "Employee Wages", amount: 12000, summary: "Staff roles: Chef, Waitstaff, Payroll schedule: Bi-weekly"),
            ExpenseModel(name: "Equipment Maintenance/Repair", amount: 2500, summary: "Maintenance schedules: Quarterly, Service provider: XYZ Equipment Services"),
            ExpenseModel(name: "Miscellaneous", amount: 1200, summary: "Other expenses")
        ]
        
        urlExpense = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRqzM6BPlR48OR2nGRcGqpXH_ugcCtpfL6xA&usqp=CAU"
    }
}


// Asynchronous image view to load images from URL asynchronously.
struct AsyncImageView: View{
    
    // URL string for the image
    var urlString: String
    
    var body: some View{
        AsyncImage(url: URL(string: urlString)){phase in
            switch phase{
            case .empty:
                // Display progress view when image is empty
                ProgressView()
            case .success(let returnedImage):
                returnedImage // Display the image when successfully loaded
                    .resizable ()
                    .scaledToFill()
                    .frame(width: 250, height: 250)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2)
                    )
            case .failure:
                // Display question mark icon for failed loading
                Image(systemName: "questionmark" )
                    .font (.headline)
            default:
                // Display question mark icon for other cases
                Image (systemName: "questionmark")
                    .font(.headline)
            }
        }
    }
}

// Preview provider for ContentView.
#Preview {
    ContentView()
}
