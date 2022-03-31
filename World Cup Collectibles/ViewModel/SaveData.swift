//
//  AddCollectible.swift
//  World Cup Collectibles
//
//  Created by José Francisco Castillo Rodríguez on 14/03/22.
//

import Foundation

class SaveData {
    func isDataLoaded() -> Bool {
        return UserDefaults.standard.bool(forKey: "stickerAlbum")
    }
    

    
    func changeStatus(iHaveIt: Bool) {
        
    }
    
    
    
}


