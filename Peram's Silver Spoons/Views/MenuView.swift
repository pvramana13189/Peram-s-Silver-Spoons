//
//  MenuView.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import SwiftUI

struct MenuView: View {
        var name: String
        var amount: Double
        
        var body: some View {
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

    struct MenuView_Previews: PreviewProvider {
        static var previews: some View{
            MenuView(name: "Cheeseburger", amount: 10.99)
        }
    }
