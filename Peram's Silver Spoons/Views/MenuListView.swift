//
//  MenuListView.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import SwiftUI

// This struct represents a view displaying a list of menu items.
struct MenuListView: View {
    
    // ObservedObject property to observe changes in the Utility3 object.
    @ObservedObject var util: Utility3
    
    var body: some View {
        VStack{
            // Header section with menu item and amount labels.
            VStack{
                HStack{
                    Text("Menu Item")
                        .padding()
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Amount($)")
                        .padding()
                        .bold()
                        .frame(alignment: .trailing)
                }
                .background(Color.orange.opacity(0.5).cornerRadius(10))
            }
            
            // List of menu items.
            List{
                ForEach(util.menuList){inc in
                    VStack{
                        // Display each menu item using the MenuView.
                        MenuView(name: inc.name, amount: inc.amount)
                    }
                    // Apply background color to each row.
                    .background(.brown.opacity(0.3))
                }
            }
            // Set list style to plain list style and stretch to fill width.
            .listStyle(PlainListStyle())
            .frame(maxWidth: .infinity)
        }
        .background(Color.red.opacity(0.15))
    }
}

// PreviewProvider for MenuListView.
struct MenuListView_Previews: PreviewProvider {
    static var previews: some View{
        
        // Initialize a Utility3 object with some dummy data.
        let util3 = Utility3(utilNum: 3, title: "Menu", menuList: menuUtility)
        
        // Preview MenuListView with the Utility3 object.
        MenuListView(util: util3)
    }
}
