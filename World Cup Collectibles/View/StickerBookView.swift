//
//  AlbumView.swift
//  World Cup Collectibles
//
//  Created by José Francisco Castillo Rodríguez on 25/02/22.
//

import SwiftUI

struct StickerBookView: View {
    var body: some View {
        
        VStack(alignment: .leading){
            Text("World Cup\nCollectibles").font(.largeTitle).fontWeight(.bold).foregroundColor(.black).padding(.horizontal, 25)
            ScrollView{
                Card()
                Card()
                Card()
                Card()
                Card()
                
            }
        }
    }
}

struct StickerBookView_Previews: PreviewProvider {
    static var previews: some View {
        StickerBookView()
    }
}

struct Card:View{
    var body: some View{
        
        Button(action: {
            print("hello")
        }, label: {
            HStack{
                Text("+")
                Divider()
                
                VStack{
                    Text("Team")
                    Text("4/12")
                }
                Spacer()
                Text("See more").frame(alignment: .bottomTrailing)
            }.frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal, 50)
        })
        
    }
}
