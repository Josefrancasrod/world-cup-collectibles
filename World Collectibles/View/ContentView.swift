//
//  ContentView.swift
//  World Collectibles
//
//  Created by José Francisco Castillo Rodríguez on 21/02/22.
//

import SwiftUI

struct ContentView: View {
    @State private var allTheTeams: TeamData = TeamData(team: [Team](repeating: Team(id: 0, name: "Test", sectionStart: 0, sectionFinish: 10), count: 30))
    @State private var isInTheStickerbookView = false
    @State private var isInTheInterchangekView = false
    @Environment(\.colorScheme) var colorScheme
    //@State private var isDataInitialized: Bool
    
    
    @State public var selectedTab = 0
    @State var selectedPage = 0
    
    
    var body: some View {
        
        
        ZStack(alignment: .bottom){
            if !isInTheInterchangekView{
                TabView(selection: $selectedPage) {
                    ForEach(0...allTheTeams.team.count - 1, id: \.self) { index in
                        SectionView(team: allTheTeams.team[index])
                    }
                    
                }.tabViewStyle(.page).indexViewStyle(.page(backgroundDisplayMode: .always))
            }else{
                VStack{
                    Spacer()
                    Circle()
                        .trim(from: 0, to: 0.7)
                        .stroke(Color("Qatar"), lineWidth: 5)
                        .frame(width: 100, height: 100)
                        .rotationEffect(Angle(degrees: isInTheInterchangekView ? 360 : 0))
                        .animation(Animation.default.repeatForever(autoreverses: false), value: 10)
                    Spacer()
                }
                
                
            }
            HStack{
                Button(action: {
                    isInTheInterchangekView.toggle()
                }, label: {
                    ZStack{
                        Image(systemName: "person.crop.rectangle.stack").resizable().scaledToFit().frame(width: 35, height: 35, alignment: .center).foregroundColor(colorScheme != .dark ? Color("QatarWhite") :  Color("Blue"))
                        Image(systemName: "person.crop.rectangle.stack.fill").resizable().scaledToFit().frame(width: 35, height: 35, alignment: .center).foregroundColor(colorScheme == .dark ? Color("QatarWhite") :  Color("Blue"))
                    }
                    
                    
                }).sheet(isPresented: $isInTheInterchangekView) {
                    InterchangeView()
                }
                Spacer()
                Button(action: {
                    isInTheStickerbookView.toggle();
                }, label: {
                    ZStack{
                        Image(systemName: "circle.fill").resizable().scaledToFit().frame(width: 35, height: 35, alignment: .center).foregroundColor(colorScheme != .dark ? Color("QatarWhite") :  Color("Blue"))
                        Image(systemName: "globe.americas.fill").resizable().scaledToFit().frame(width: 35, height: 35, alignment: .center).foregroundColor(colorScheme == .dark ? Color("QatarWhite") :  Color("Blue"))
                    }
                }).sheet(isPresented: $isInTheStickerbookView) {
                    StickerBookView(selectedPage: $selectedPage)
                }
            }.padding(.bottom, 15).padding(.horizontal, 30).onAppear{
                
                if let data = UserDefaults.standard.data(forKey: "teamsData") {
                    do {
                        let decoder = JSONDecoder()
                        let teamsData = try decoder.decode(TeamData.self, from: data)
                        allTheTeams = teamsData
                    } catch {
                        print("Unable to Decode Note (\(error))")
                    }
                }
                
            }
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//-- ITS BETTER IF THIS PART COULD BE MODULAR, BUT AT THE MOMENT
//-- IT WILL BE IN THE CONTENTVIEW ZSTACK
/**struct SwipeNavigation: View{
 
 
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
 */
