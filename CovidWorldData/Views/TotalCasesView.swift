//
//  TotalCases.swift
//  CovidWorldData
//
//  Created by Minseo Kim on 8/25/21.
//

import SwiftUI

struct TotalCasesView: View {
    
    @EnvironmentObject var worldData:ModelData
    
    var body: some View {
        
        VStack(alignment:.center,spacing:10) {
            
            Text("Total Cases: \(worldData.summary.Global.TotalConfirmed)")
                .font(.system(.largeTitle))
            Text("New Cases:+\(worldData.summary.Global.NewConfirmed)")
                .font(.subheadline)
                .foregroundColor(.green)
            Text("Total Deaths: \(worldData.summary.Global.TotalDeaths)")
                .font(.title2)
            Text("New Deaths: +\(worldData.summary.Global.NewDeaths)")
                .font(.subheadline)
                .foregroundColor(.red)
            
        }
        
        
        
    }
}

struct TotalCases_Previews: PreviewProvider {
    static var previews: some View {
        TotalCasesView().environmentObject(ModelData())
    }
}
