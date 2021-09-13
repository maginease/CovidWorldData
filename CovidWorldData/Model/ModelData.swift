//
//  ModelData.swift
//  CovidWorldData
//
//  Created by Minseo Kim on 9/10/21.
//

import Foundation

final class ModelData:ObservableObject {
    
    @Published var summary:World = FetchAndDecode(url: "https://api.covid19api.com/summary", type: World.self)
    
}
