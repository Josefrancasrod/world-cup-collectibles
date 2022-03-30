//
//  World_Cup_CollectiblesApp.swift
//  World Cup Collectibles
//
//  Created by José Francisco Castillo Rodríguez on 21/02/22.
//

import SwiftUI

@main
struct World_Cup_CollectiblesApp: App {
    
    init(){
        
        if(!UserDefaults.standard.bool(forKey: "isDataLoaded") || UserDefaults.standard.object(forKey: "isDataLoaded") == nil){
            startData()
        }
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    func startData(){
        let numberOfStickers = 300
        var stickers: [Bool] = []
        for _ in 0...numberOfStickers{
            stickers.append(false)
        }
        let teams: [Team] = [
            Team(id: 0, name: "Specials", sectionStart: 0, sectionFinish: 10),
            Team(id: 1, name: "Stadiums", sectionStart: 11, sectionFinish: 20),
            Team(id: 2, name: "Posters", sectionStart: 21, sectionFinish: 30),
            Team(id: 3, name: "Alemania", sectionStart: 31, sectionFinish: 40),
            Team(id: 4, name: "Francia", sectionStart: 41, sectionFinish: 50),
            Team(id: 5, name: "Belgica", sectionStart: 51, sectionFinish: 60),
            Team(id: 6, name: "Portugal", sectionStart: 61, sectionFinish: 70),
            Team(id: 7, name: "Polonia", sectionStart: 71, sectionFinish: 80),
            Team(id: 9, name: "Canada", sectionStart: 81, sectionFinish: 90),
            Team(id: 10, name: "Brasil", sectionStart: 91, sectionFinish: 100),
            Team(id: 11, name: "Mexico", sectionStart: 101, sectionFinish: 150),
            Team(id: 12, name: "Legends", sectionStart: 151, sectionFinish: 300)
        ]
        
        let stickerAlbum = Sticker(iHaveIt: stickers)
        let allTeams = TeamData(team: teams)
        
        print(teams)
        
        do {
            let encoder = JSONEncoder()
            let encoder2 = JSONEncoder()
            let stickers = try encoder.encode(stickerAlbum)
            let teamsData = try encoder2.encode(allTeams)
            UserDefaults.standard.set(stickers, forKey: "stickerAlbum")
            UserDefaults.standard.set(teamsData, forKey: "teamsData")
            UserDefaults.standard.set(true, forKey: "isDataLoaded")

        } catch {
            print("Unable to Encode the sticker album (\(error))")
        }
    }
}
