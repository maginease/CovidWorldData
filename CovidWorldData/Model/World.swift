//
//  World.swift
//  CovidWorldData
//
//  Created by Minseo Kim on 8/25/21.
//

import Foundation

struct World:Hashable,Codable {
    
    var Global:Global
    
    struct Global:Hashable,Codable {
        var NewConfirmed:Int
        var TotalConfirmed:Int
        var NewDeaths:Int
        var TotalDeaths:Int
    }
    
    struct CountryDataToday:Hashable,Codable {
        
        var Country:String
        var NewConfirmed:Int
        var TotalConfirmed:Int
        var NewDeaths:Int
        var TotalDeaths:Int
    }
    
    var Countries:[CountryDataToday]
}
