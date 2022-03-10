//
//  InterchangeView.swift
//  World Cup Collectibles
//
//  Created by José Francisco Castillo Rodríguez on 25/02/22.
//

import SwiftUI

struct InterchangeView: View {
    
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach((1...690), id: \.self) {index in
                    Button(action: {
                        print(index)
                    }, label: {
                        Text(String(index)).foregroundColor(Color.white).frame(height: 50)
                    }).frame(minWidth: 0,maxWidth: .infinity, maxHeight: 60,   alignment: .center ).background(Color("Qatar")).cornerRadius(5)
                }
            }.padding(.horizontal, 30)
        }
    }
}

struct InterchangeView_Previews: PreviewProvider {
    static var previews: some View {
        InterchangeView()
    }
}
