//
//  MenuView.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import SwiftUI

// This struct represents a view for displaying individual menu items.
struct MenuView: View {
    
    var name: String // Name of the menu item.
    var amount: Double // Amount (price) of the menu item.
    
    var body: some View {
        VStack{
            HStack{
                // Display the name of the menu item, aligning it to the leading edge.
                Text(name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // Display the amount (price) of the menu item, aligning it to the trailing edge.
                Text(String(describing: amount))
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}

// PreviewProvider for MenuView.
struct MenuView_Previews: PreviewProvider {
    static var previews: some View{
        // Preview an instance of MenuView with a sample name and amount.
        MenuView(name: "Cheeseburger", amount: 10.99)
    }
}
