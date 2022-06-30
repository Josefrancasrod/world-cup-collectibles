//
//  Team.swift
//  World Collectibles
//
//  Created by José Francisco Castillo Rodríguez on 25/02/22.
//

import Foundation

struct Team: Codable{
    var id: Int
    var name: String
    var sectionStart: Int
    var sectionFinish: Int
}

struct TeamData: Codable{
    var team: [Team]
}
