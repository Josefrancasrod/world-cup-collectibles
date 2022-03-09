//
//  AlbumView.swift
//  World Cup Collectibles
//
//  Created by José Francisco Castillo Rodríguez on 25/02/22.
//

import SwiftUI

struct StickerBookView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var onDismiss: ((_ model: Int) -> Void)?
    @Binding var selectedPage: Int
    
    
    func dismissScreen(index:Int) -> Void {
        selectedPage = index
        onDismiss?(selectedPage)
        presentationMode.wrappedValue.dismiss()
    }
    var body: some View {
        
        VStack(alignment: .leading){
            Text("World Cup\nCollectibles").font(.largeTitle).fontWeight(.bold).foregroundColor(.black).padding(.horizontal, 25)
            ScrollView{
                ForEach((1...34), id: \.self) {index in
                    Card(name: "México", page: index, progress: "4/12", action: {
                        dismissScreen(index: index)
                    })
                }
                
            }
        }
    }
}

struct StickerBookView_Previews: PreviewProvider {
    static var previews: some View {
        StickerBookView(selectedPage: .constant(0))
    }
}

struct Card:View{
    
    var name:String
    var page:Int
    var progress:String
    var action: () -> Void
    
    
    var body: some View{
        
        Button(action: action, label: {
            HStack{
                Text("+")
                Divider()
                
                VStack{
                    Text("PAGE: \(page)")
                    Text("4/12")
                }
                Spacer()
                Text("See more").frame(alignment: .bottomTrailing)
            }.frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal, 50)
        })
        
    }
}
