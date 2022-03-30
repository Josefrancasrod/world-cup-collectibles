//
//  InterchangeView.swift
//  World Cup Collectibles
//
//  Created by José Francisco Castillo Rodríguez on 25/02/22.
//

import SwiftUI

struct InterchangeView: View {
    
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    
    @State private var allTheStickers: Sticker = Sticker(iHaveIt: [Bool](repeating: false, count: 300))

    var body: some View {
        ScrollView{
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                    
                    ForEach((0...allTheStickers.iHaveIt.count - 1), id: \.self) {index in

                        Button(action: {
                            self.allTheStickers.iHaveIt[index] = !allTheStickers.iHaveIt[index]
                            
                            do {
                                let encoder = JSONEncoder()
                                let data = try encoder.encode(allTheStickers)
                                UserDefaults.standard.set(data, forKey: "stickerAlbum")

                            } catch {
                                print("Unable to Encode the sticker album (\(error))")
                            }
                            

                        }, label: {
                            Text(String(index)).foregroundColor(Color.white).frame(height: 50)
                        }).frame(minWidth: 0,maxWidth: .infinity, maxHeight: 60,   alignment: .center ).background(allTheStickers.iHaveIt[index] ? Color("Qatar") : Color("Blue") ).cornerRadius(5)
                    }

            }.padding(.horizontal, 30)
        }.onAppear{
           
                if let data = UserDefaults.standard.data(forKey: "stickerAlbum") {
                    do {
                            let decoder = JSONDecoder()
                            let stickers = try decoder.decode(Sticker.self, from: data)
                            allTheStickers = stickers
                        } catch {
                            print("Unable to Decode Note (\(error))")
                        }
                }
    
        }
    }
}

struct InterchangeView_Previews: PreviewProvider {
    static var previews: some View {
        InterchangeView()
    }
}
