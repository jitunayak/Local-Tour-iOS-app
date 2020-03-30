//
//  ContentView.swift
//  My Tour guide
//
//  Created by jitu Nayak on 3/25/20.
//  Copyright © 2020 jitu Nayak. All rights reserved.
//

import SwiftUI

struct ImageOverlay: View {
    var name: String
    init(n: String)
    {
        name = n
    }
    var body: some View {
        ZStack {
            Text(name)
    
                .font(.headline)
                .padding(6)
                .foregroundColor(.white)
        }.background(Color.black)
        .opacity(0.8)
        .cornerRadius(10.0)
        .padding(6)
    }
}
struct ListInfo: Identifiable{
    var id:Int
    var image:String
    var name:String
}
struct ContentView: View {
     
    var mLists: [ListInfo]=[.init(id: 0, image: "manali", name: "Manali"),
                           .init(id: 1, image: "Varanasi", name: "Varanasi"),
                            .init(id: 2, image: "Khajjar", name: "Khajjar"),
                            .init(id: 3, image: "Dudhsagar-Falls", name: "Dudhasagar"),
                            .init(id: 4, image: "Ooty-2", name: "Ooty"),
                            .init(id: 5, image: "Udaipur-1", name: "Udaipur"),
                            .init(id: 6, image: "Jaisalme", name: "Jaisalme")]
    var body: some View {
        NavigationView
            {
        List{
            ForEach(mLists, id: \.id){
                list in
                VStack(alignment: .leading){
                    Image(list.image)
                    .resizable()
                    .cornerRadius(12)
                    .scaledToFit()
                        .overlay(ImageOverlay(n: list.name),alignment: .bottomLeading)
                    
                    HStack{
                    Text(list.name)
                        .font(.headline)
                        Spacer()
                        HStack{
                            Image(systemName: "heart.fill").foregroundColor(Color.red).padding(12)
                        }
                    }
                }
            }
        
        }.navigationBarTitle("Incredible India").font(.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
