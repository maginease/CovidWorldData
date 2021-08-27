//
//  CountryDetailGraph.swift
//  CovidWorldData
//
//  Created by Minseo Kim on 8/27/21.
//

import SwiftUI

struct CountryDetailGraph: View {
    
    let data:[Country]
    var height:Double
    
    var body: some View {
       
        HStack(alignment:.bottom) {
            
            ForEach(NewCasesArray(data:data),id:\.self) { newCase in
                
                VStack {
                CountryDetailGraphBar(height: CGFloat(barHeight(max: NewCasesArray(data:data).max()!, data: newCase, frameHeight: height)), width: 10.0)
                 
                }
            }
            
            
        }.frame(height:CGFloat(height))
        
    }
}

struct CountryDetailGraph_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailGraph(data:[
            Country(Country: "", Cases: 150, Date: ""),
            Country(Country: "", Cases: 100, Date: ""),
            Country(Country: "", Cases: 50, Date: ""),
            Country(Country: "", Cases: 30, Date: ""),
            Country(Country: "", Cases: 15, Date: "")
        ],height:200.0)
    }
}
