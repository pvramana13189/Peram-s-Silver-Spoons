//
//  MenuListView.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import SwiftUI

struct MenuListView: View {
    
    @ObservedObject var util: Utility3
    
    var body: some View {
        VStack{
            List{
                ForEach(util.menuList){inc in
                    VStack{
                        MenuView(name: inc.name, amount: inc.amount)
                    }
                    .background(.brown.opacity(0.3))
                }
            }
            .listStyle(PlainListStyle())
            .frame(maxWidth: .infinity)
        }
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View{
        
        let util3 = Utility3(utilNum: 3, title: "Menu", menuList: menuUtility)
        MenuListView(util: util3)
    }
}
