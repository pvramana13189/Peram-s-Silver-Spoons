//
//  ContentView.swift
//  Peram's Silver Spoons
//
//  Created by Ramana on 3/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack{
                NavigationLink(destination: FirstScreenView()){
                    Image("Restaurant_Image")
                }
                .navigationTitle("Perams's Silver Spoons")
                .toolbarColorScheme(.dark, for: .navigationBar)
                .toolbarBackground(
                    Color.clear,
                    for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            }
        }
    }
}


// Asynchronous image view
struct AsyncImageView: View{
    var urlString: String
    
    var body: some View{
        AsyncImage(url: URL(string: urlString)){phase in
            switch phase{
            case .empty:
                ProgressView()
            case .success(let returnedImage):
                returnedImage
                    .resizable ()
                    .scaledToFill()
                    .frame(width: 250, height: 250)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 2)
                    )
            case .failure:
                Image(systemName: "questionmark" )
                    .font (.headline)
            default:
                Image (systemName: "questionmark")
                    .font(.headline)
            }
        }
    }
}

#Preview {
    ContentView()
}
