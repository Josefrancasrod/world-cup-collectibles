//
//  SectionView.swift
//  World Collectibles
//
//  Created by José Francisco Castillo Rodríguez on 03/03/22.
//

import SwiftUI

struct SectionView: View {
    var team: Team
    let data:SaveData = SaveData()
    
    init(team: Team){
        self.team = team
    }

    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @State private var allTheStickers: Sticker = getstickers()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack (alignment: .leading) {
            
        ScrollView{
            HStack{
                Text("\(team.name)").font(.title).fontWeight(.bold).foregroundColor(colorScheme == .dark ? Color("QatarWhite") :  Color("Qatar")).frame(alignment: Alignment.leading).padding(.vertical, 20).padding(.leading, 30)
                Spacer()
                Text("\(data.teamsEmojis[team.name]! )").font(.title).fontWeight(.bold).padding(.trailing, 30)
            }
            
                    LazyVGrid(columns: gridItemLayout, spacing: 20) {
                        ForEach((team.sectionStart...team.sectionFinish), id: \.self) {index in
                            Button(action: {
                                self.allTheStickers.iHaveIt[index] = !allTheStickers.iHaveIt[index]
                                
                                savestickers(allTheStickers: allTheStickers)
                            }, label: {
                                Text(String(index)).foregroundColor(Color.white).frame(height: 70).frame(minWidth: 0,maxWidth: .infinity, maxHeight: 70,   alignment: .center ).background(allTheStickers.iHaveIt[index] ? Color("Qatar") : Color("Blue")).cornerRadius(5)
                            })
                        }
                    }.padding(.horizontal, 30)
        }/*.onAppear{
            if let data = UserDefaults.standard.data(forKey: "stickerAlbum") {
                do {
                    let decoder = JSONDecoder()
                    let stickers = try decoder.decode(Sticker.self, from: data)
                    allTheStickers = stickers
                } catch {
                    print("Unable to Decode Note (\(error))")
                }
            }
    }*/
        }
        
    }
}
func getstickers() -> Sticker{
    var allTheStickers: Sticker = Sticker(iHaveIt: [Bool](repeating: false, count:10));
    
    if let data = UserDefaults.standard.data(forKey: "stickerAlbum") {
        do {
            let decoder = JSONDecoder()
            let stickers = try decoder.decode(Sticker.self, from: data)
            allTheStickers = stickers
        } catch {
            print("Unable to Decode Note (\(error))")
        }
    }
    
    return allTheStickers
}

func savestickers(allTheStickers: Sticker){
    do {
        let encoder = JSONEncoder()
        let data = try encoder.encode(allTheStickers)
        UserDefaults.standard.set(data, forKey: "stickerAlbum")

    } catch {
        print("Unable to Encode the sticker album (\(error))")
    }
}


struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(team: Team(id: 0, name: "Mexico", sectionStart: 0, sectionFinish: 10))
    }
}
