//
//  AddIncomeView.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/15/24.
//

import SwiftUI

struct AddIncomeView: View {
    
    @State var incname: String = ""
    @State var incamount: Int = 0
    @State var incsummary: String = ""
    
    @ObservedObject var util: Utility1
    
    var body: some View {
        
        VStack{
            VStack{
                Text("Income Source Name:")
                    .font(.system(size: 28))
                    .bold()
                
                TextField("Enter the Income Name", text: $incname)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .frame(width: 300)
            }
            
            VStack{
                Text("Income Source Amount:")
                    .font(.system(size: 28))
                    .bold()
                
                TextField("Enter the Income Amount", text: Binding<String>(
                        get: { String(incamount) },
                        set: { if let value = Int($0) { incamount = value } }
                    ))
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .frame(width: 300)
            }
            
            VStack{
                Text("Income Source Summary:")
                    .font(.system(size: 28))
                    .bold()
                
                TextField("Enter the Income Summary", text: $incsummary)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .frame(width: 300)
            }
            
            Spacer()
            
            Button{
                saveIncome()
            }label: {
                Text("Save Income")
                    .textCase(.uppercase)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.black)
                    .bold()
                    .background(Color.red.opacity(0.4).cornerRadius(10))
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red.opacity(0.15))
    }
    
    func saveIncome(){
        let newInc : IncomeModel = IncomeModel(name: incname, amount: incamount, summary: incsummary)
        util.addIncome(inc: newInc)
        
        incname = ""
        incamount = 0
        incsummary = ""
        
    }
}

struct AddIncomeView_Previews: PreviewProvider {
    static var previews: some View{
        
        let util1 = Utility1(utilNum: 1, title: "View and Modify Income", incomeList: incomeUtility, url: urlIncome)
        AddIncomeView(util: util1)
    }
}
