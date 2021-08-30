//
//  TotalCases.swift
//  CovidWorldData
//
//  Created by Minseo Kim on 8/25/21.
//

import SwiftUI

struct TotalCases: View {
    
    @State private var worldData:[World] = []
    
    var body: some View {
       
        if worldData.isEmpty {
            Text("Loading...").onAppear {
                decode(url: "https://api.covid19api.com/summary", type: World.self) { res in
                    
                    worldData = [res]
                }
            }
        } else {
            
            VStack(alignment:.center,spacing:10) {
                
                Text("Total Cases: \(worldData[0].Global.TotalConfirmed)").font(.system(.largeTitle))
                Text("New Cases:+\(worldData[0].Global.NewConfirmed)").font(.subheadline).foregroundColor(.green)
                Text("Total Deaths: \(worldData[0].Global.TotalDeaths)").font(.title2)
                Text("New Deaths: +\(worldData[0].Global.NewDeaths)").font(.subheadline).foregroundColor(.red)
                
                
            }
            
        }
        
    }
}

struct TotalCases_Previews: PreviewProvider {
    static var previews: some View {
        TotalCases()
    }
}
