//
//  World_CollectiblesApp.swift
//  World Collectibles
//
//  Created by José Francisco Castillo Rodríguez on 21/02/22.
//

import SwiftUI

@main
struct World_CollectiblesApp: App {
    
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
        let numberOfStickers = 680
        var stickers: [Bool] = []
        for _ in 0...numberOfStickers{
            stickers.append(false)
        }
        let teams: [Team] = [
            Team(id: 0, name: "Specials", sectionStart: 0, sectionFinish: 6),
            Team(id: 1, name: "Stadiums", sectionStart: 7, sectionFinish: 18),
            Team(id: 2, name: "Posters", sectionStart: 19, sectionFinish: 30),
            Team(id: 3, name: "Qatar", sectionStart: 31, sectionFinish: 50),
            Team(id: 4, name: "Ecuador", sectionStart: 51, sectionFinish: 70),
            Team(id: 5, name: "Senegal", sectionStart: 71, sectionFinish: 90),
            Team(id: 6, name: "Netherlands", sectionStart: 91, sectionFinish: 110),
            Team(id: 7, name: "England", sectionStart: 111, sectionFinish: 130),
            Team(id: 8, name: "Iran", sectionStart: 131, sectionFinish: 150),
            Team(id: 9, name: "USA", sectionStart: 151, sectionFinish: 170),
            Team(id: 10, name: "Wales", sectionStart: 171, sectionFinish:190),
            Team(id: 11, name: "Argentina", sectionStart: 191, sectionFinish: 210),
            Team(id: 12, name: "Saudi Arabia", sectionStart: 211, sectionFinish: 230),
            Team(id: 13, name: "Mexico", sectionStart: 231, sectionFinish: 250),
            Team(id: 14, name: "Poland", sectionStart: 251, sectionFinish: 270),
            Team(id: 15, name: "France", sectionStart: 271, sectionFinish: 290),
            Team(id: 16, name: "Australia", sectionStart: 291, sectionFinish: 310),
            Team(id: 17, name: "Denmark", sectionStart: 311, sectionFinish: 330),
            Team(id: 18, name: "Tunisia", sectionStart: 331, sectionFinish: 350),
            Team(id: 19, name: "Spain", sectionStart: 351, sectionFinish: 370),
            Team(id: 20, name: "Costa Rica", sectionStart: 371, sectionFinish: 390),
            Team(id: 21, name: "Germany", sectionStart: 391, sectionFinish: 410),
            Team(id: 22, name: "Japan", sectionStart: 411, sectionFinish: 430),
            Team(id: 23, name: "Belgium", sectionStart: 431, sectionFinish: 450),
            Team(id: 24, name: "Canada", sectionStart: 451, sectionFinish: 470),
            Team(id: 25, name: "Morocco", sectionStart: 471, sectionFinish: 490),
            Team(id: 26, name: "Croatia", sectionStart: 491, sectionFinish: 510),
            Team(id: 27, name: "Brazil", sectionStart: 511, sectionFinish: 530),
            Team(id: 28, name: "Serbia", sectionStart: 531, sectionFinish: 550),
            Team(id: 29, name: "Switzerland", sectionStart: 551, sectionFinish: 570),
            Team(id: 30, name: "Cameroon", sectionStart: 571, sectionFinish: 590),
            Team(id: 31, name: "Portugal", sectionStart: 591, sectionFinish: 610),
            Team(id: 32, name: "Ghana", sectionStart: 611, sectionFinish: 630),
            Team(id: 33, name: "Uruguay", sectionStart: 631, sectionFinish: 650),
            Team(id: 34, name: "South Korea", sectionStart: 651, sectionFinish: 670),
            Team(id: 35, name: "Legends", sectionStart: 671, sectionFinish: 680)
            
        ]
        
        let stickerAlbum = Sticker(iHaveIt: stickers)
        let allTeams = TeamData(team: teams)
        
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

