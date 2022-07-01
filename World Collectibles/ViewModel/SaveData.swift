//
//  AddCollectible.swift
//  World Collectibles
//
//  Created by José Francisco Castillo Rodríguez on 14/03/22.
//

import Foundation

class SaveData {
    let teamsEmojis: [String: String] = [
        "Specials": "🏆",
        "Stadiums": "🏟",
        "Posters": "🌉",
        "Qatar": "🇶🇦",
        "Ecuador": "🇪🇨",
        "Senegal": "🇸🇳",
        "Netherlands": "🇳🇱",
        "England": "🏴󠁧󠁢󠁥󠁮󠁧󠁿",
        "Iran": "🇮🇷",
        "USA": "🇺🇸",
        "Wales": "🏴󠁧󠁢󠁷󠁬󠁳󠁿",
        "Argentina": "🇦🇷",
        "Saudi Arabia": "🇸🇦",
        "Mexico": "🇲🇽",
        "Poland": "🇵🇱",
        "France": "🇫🇷",
        "Australia": "🇦🇺",
        "Denmark": "🇩🇰",
        "Tunisia": "🇹🇳",
        "Spain": "🇪🇸",
        "Costa Rica": "🇨🇷",
        "Germany": "🇩🇪",
        "Japan": "🇯🇵",
        "Belgium": "🇧🇪",
        "Canada": "🇨🇦",
        "Morocco": "🇲🇦",
        "Croatia": "🇭🇷",
        "Brazil": "🇧🇷",
        "Serbia": "🇷🇸",
        "Switzerland": "🇨🇭",
        "Cameroon": "🇨🇲",
        "Portugal": "🇵🇹",
        "Ghana": "🇬🇭",
        "Uruguay": "🇺🇾",
        "South Korea": "🇰🇷",
        "Legends": "⭐️"
    ]
    func isDataLoaded() -> Bool {
        return UserDefaults.standard.bool(forKey: "stickerAlbum")
    }
    
    
    

    
    func changeStatus(iHaveIt: Bool) {
        
    }
    
    
    
}


