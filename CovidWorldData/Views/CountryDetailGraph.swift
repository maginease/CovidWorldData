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
        
        ScrollView(.horizontal,showsIndicators:false) {
            HStack(alignment:.bottom,spacing:0) {
                
                ForEach(data,id:\.self) { country in
                    
                    CountryDetailGraphBar(height: CGFloat(barHeight(max: maxCases(data), data: country.Cases, frameHeight: height)), width: UIScreen.main.bounds.width / CGFloat(data.count))
                    
                }
                
            }
        }.frame(height:CGFloat(height))
    }
}

struct CountryDetailGraph_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailGraph(data:[
            Country(Country: "", Cases: 5000, Date: ""),
            Country(Country: "", Cases: 11000, Date: ""),
            Country(Country: "", Cases: 12000, Date: ""),
            Country(Country: "", Cases: 8000, Date: ""),
            Country(Country: "", Cases: 5000, Date: ""),
            Country(Country: "", Cases: 3000, Date: ""),
            Country(Country: "", Cases: 1200, Date: ""),
            Country(Country: "", Cases: 800, Date: ""),
            Country(Country: "", Cases: 500, Date: ""),
            Country(Country: "", Cases: 150, Date: ""),
            Country(Country: "", Cases: 100, Date: ""),
            Country(Country: "", Cases: 50, Date: ""),
            Country(Country: "", Cases: 30, Date: ""),
            Country(Country: "", Cases: 15, Date: "")
           
            
        ],height:200.0)
    }
}
