//
//  AddCollectible.swift
//  World Collectibles
//
//  Created by JosÃ© Francisco Castillo RodrÃ­guez on 14/03/22.
//

import Foundation

class SaveData {
    let teamsEmojis: [String: String] = [
        "Specials": "ð",
        "Stadiums": "ð",
        "Posters": "ð",
        "Qatar": "ð¶ð¦",
        "Ecuador": "ðªð¨",
        "Senegal": "ð¸ð³",
        "Netherlands": "ð³ð±",
        "England": "ð´ó §ó ¢ó ¥ó ®ó §ó ¿",
        "Iran": "ð®ð·",
        "USA": "ðºð¸",
        "Wales": "ð´ó §ó ¢ó ·ó ¬ó ³ó ¿",
        "Argentina": "ð¦ð·",
        "Saudi Arabia": "ð¸ð¦",
        "Mexico": "ð²ð½",
        "Poland": "ðµð±",
        "France": "ð«ð·",
        "Australia": "ð¦ðº",
        "Denmark": "ð©ð°",
        "Tunisia": "ð¹ð³",
        "Spain": "ðªð¸",
        "Costa Rica": "ð¨ð·",
        "Germany": "ð©ðª",
        "Japan": "ð¯ðµ",
        "Belgium": "ð§ðª",
        "Canada": "ð¨ð¦",
        "Morocco": "ð²ð¦",
        "Croatia": "ð­ð·",
        "Brazil": "ð§ð·",
        "Serbia": "ð·ð¸",
        "Switzerland": "ð¨ð­",
        "Cameroon": "ð¨ð²",
        "Portugal": "ðµð¹",
        "Ghana": "ð¬ð­",
        "Uruguay": "ðºð¾",
        "South Korea": "ð°ð·",
        "Legends": "â­ï¸"
    ]
    func isDataLoaded() -> Bool {
        return UserDefaults.standard.bool(forKey: "stickerAlbum")
    }
    
    
    

    
    func changeStatus(iHaveIt: Bool) {
        
    }
    
    
    
}


