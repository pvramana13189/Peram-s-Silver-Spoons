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
            IncomeModel(name: "Food Sales", amount: 2500, summary: "Most popular item: Pizza"),
            IncomeModel(name: "Consulting", amount: 1000, summary: "Clients: ABC Corp, XYZ Corp"),
            IncomeModel(name: "Freelancing", amount: 800, summary: "Projects: Website development"),
            IncomeModel(name: "Rental Income", amount: 1200, summary: "Properties: Apartment A, Apartment B"),
            IncomeModel(name: "Online Courses", amount: 600, summary: "Courses: Programming, Design"),
            IncomeModel(name: "Investment Dividends", amount: 1500, summary: "Investments: Stocks, ETFs")
        ]
        
        urlIncome = "https://cdn4.vectorstock.com/i/1000x1000/72/08/money-cash-flat-long-shadow-square-icon-vector-7597208.jpg"
    }
    
    // Function to initialize expense data
    private func initializeExpenses() {
        expenseUtility = [
            ExpenseModel(name: "Rent", amount: 1500, summary: "Due on the 1st of every month"),
            ExpenseModel(name: "Utilities", amount: 200, summary: "Electricity, water, gas"),
            ExpenseModel(name: "Groceries", amount: 300, summary: "Weekly shopping"),
            ExpenseModel(name: "Transportation", amount: 100, summary: "Public transportation or fuel"),
            ExpenseModel(name: "Entertainment", amount: 200, summary: "Movies, dining out"),
            ExpenseModel(name: "Healthcare", amount: 150, summary: "Medical expenses"),
            ExpenseModel(name: "Insurance", amount: 250, summary: "Car, home, or health insurance"),
            ExpenseModel(name: "Debt Payments", amount: 500, summary: "Loan or credit card payments"),
            ExpenseModel(name: "Education", amount: 300, summary: "Tuition or course fees"),
            ExpenseModel(name: "Miscellaneous", amount: 200, summary: "Other expenses")
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
