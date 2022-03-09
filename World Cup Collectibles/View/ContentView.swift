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
    
    
    @State public var selectedTab = 0
    @State var selectedPage = 0
    
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
            TabView(selection: $selectedPage) {
                ForEach(1...34, id: \.self) { index in
                    SectionView(id: String(index))
                }
            }.tabViewStyle(.page).indexViewStyle(.page(backgroundDisplayMode: .always))
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
                    StickerBookView(selectedPage: $selectedPage)
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
    
    
    let screenData = [
        Group(id: "1",name: "Specials",teams: []),
        Group(id: "2",name: "Specials",teams: []),
        Group(id: "3",name: "Specials",teams: [])
    ]
    @State public var selectedTab = 0
    
    var body: some View{
        TabView(selection: $selectedTab) {
            ForEach(0...34, id: \.self) { index in
                SectionView(id: String(index))
            }
        }.tabViewStyle(.page).indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}
