//
//  AlbumView.swift
//  World Collectibles
//
//  Created by José Francisco Castillo Rodríguez on 25/02/22.
//

import SwiftUI

struct StickerBookView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @State private var allTheTeams: TeamData = TeamData(team: [Team](repeating: Team(id: 0, name: "Test", sectionStart: 0, sectionFinish: 10), count: 30))
    
    
    var onDismiss: ((_ model: Int) -> Void)?
    @Binding var selectedPage: Int
    
    
    func dismissScreen(index:Int) -> Void {
        selectedPage = index
        onDismiss?(selectedPage)
        presentationMode.wrappedValue.dismiss()
    }
    var body: some View {
        
        VStack(alignment: .leading){
            
            ScrollView{
                HStack{
                    Text("Teams").font(.title).fontWeight(.bold).foregroundColor(colorScheme == .dark ? Color("QatarWhite") :  Color("Qatar")).frame(alignment: Alignment.leading).padding(.vertical, 10).padding(.leading, 30)
                    Spacer()
                }.padding(.top, 20)
                
                ForEach((0...allTheTeams.team.count - 1), id: \.self) {index in
                    VStack{
                        Card(name: "\(allTheTeams.team[index].name)", team: index, progress: "", action: {
                            dismissScreen(index: index)
                        })
                        Divider().background(colorScheme == .dark ? Color("QatarWhite") :  Color("Blue"))
                    }
                    
                }
                
            }
        }.padding(.bottom, 5).padding(.horizontal, 30).onAppear{
            
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

struct StickerBookView_Previews: PreviewProvider {
    static var previews: some View {
        StickerBookView(selectedPage: .constant(0))
    }
}

struct Card:View{
    
    var name:String
    var team:Int
    var progress:String
    var action: () -> Void
    let teamsEmojis: [String] = [
        "🏆",
        "🏟",
        "🌉",
        "🇶🇦",
        "🇪🇨",
        "🇸🇳",
        "🇳🇱",
        "🏴󠁧󠁢󠁥󠁮󠁧󠁿",
        "🇮🇷",
        "🇺🇸",
        "🏴󠁧󠁢󠁷󠁬󠁳󠁿",
        "🇦🇷",
        "🇸🇦",
        "🇲🇽",
        "🇵🇱",
        "🇫🇷",
        "🇦🇺",
        "🇩🇰",
        "🇹🇳",
        "🇪🇸",
        "🇨🇷",
        "🇩🇪",
        "🇯🇵",
        "🇧🇪",
        "🇨🇦",
        "🇲🇦",
        "🇭🇷",
        "🇧🇷",
        "🇷🇸",
        "🇨🇭",
        "🇨🇲",
        "🇵🇹",
        "🇬🇭",
        "🇺🇾",
        "🇰🇷",
        "⭐️",
        "🇲🇽",
        "⭐️",
        "⭐️",
        "🇲🇽",
        "⭐️",
        "⭐️",
        "🇲🇽",
        "⭐️",
        "⭐️",
        "🇲🇽",
        "⭐️",
        "⭐️",
        "🇲🇽",
        "⭐️",
        "⭐️",
        "🇲🇽",
        "⭐️",
        "⭐️",
        "🇲🇽",
        "⭐️",
        "⭐️",
        "🇲🇽",
        "⭐️"
    ]
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View{

        Button(action: action, label: {
            HStack{
                ZStack{
                    //Image(systemName: "circle.fill").resizable().scaledToFit().frame(width: 50, height: 50, alignment: .center).foregroundColor(colorScheme == .dark ? Color("Qatar") : Color("QatarWhite"))
                    Text(teamsEmojis[team]).font(.system(size: 40))
                }.padding(.trailing, 20)
                Divider().background(colorScheme == .dark ? Color("QatarWhite") :  Color("Qatar")).padding(.trailing, 20)
                VStack{
                    
                    Text("\(name)").foregroundColor(colorScheme == .dark ? Color("QatarWhite") : Color("Qatar")).fontWeight(.bold)
                    //Text("4/12")
                }
                Spacer()
                //Text("See more").frame(alignment: .bottomTrailing)
            }.frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal, 30)
        })

        
    }
}
