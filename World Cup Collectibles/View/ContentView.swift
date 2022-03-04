//
//  ContentView.swift
//  World Cup Collectibles
//
//  Created by José Francisco Castillo Rodríguez on 21/02/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isInTheStickerbookView = false
    @State private var isInTheInterchangekView = false
    
    var body: some View {
        /*
        TabView{
            InterchangeView().tabItem{
                Image(systemName: "apps.ipad")
            }
            SwipeNavigation().tabItem{
                Image(systemName: "apps.ipad")
            }
            Text("Hello").tabItem{
                Image(systemName: "house.fill")
            }
        }
         */
        
        ZStack(alignment: .bottom){
            SwipeNavigation()
            HStack{
                Button(action: {
                    isInTheInterchangekView.toggle();
                }, label: {
                    Image(systemName: "circle").resizable().scaledToFit().frame(width: 25, height: 25, alignment: .center)
                }).sheet(isPresented: $isInTheInterchangekView) {
                    InterchangeView()
                }
                Spacer()
                Button(action: {
                    isInTheStickerbookView.toggle();
                }, label: {
                    Image(systemName: "circle.fill").resizable().scaledToFit().frame(width: 25, height: 25, alignment: .center)
                }).sheet(isPresented: $isInTheStickerbookView) {
                    StickerBookView()
                }
            }.padding(.bottom, 15).padding(.horizontal, 30)
        }
            
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SwipeNavigation: View{
    var body: some View{
        TabView {
            SectionView()
            SectionView()
            SectionView()
            Text("Second")
            Text("Third")
            Text("Fourth")
        }.tabViewStyle(.page).indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}
