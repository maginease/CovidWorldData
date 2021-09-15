//
//  CountryDetailGraph.swift
//  CovidWorldData
//
//  Created by Minseo Kim on 8/27/21.
//

import SwiftUI

struct CountryDetailGraph: View {
    
    let confirmedData:[Country]
    let deathData:[Country]
    var height:Double
    let buttonState:GraphButton
    var numberArray:[Int] {
        
        switch buttonState {
        
        case .confirmedTotal:
            return confirmedData.map { $0.Cases }
            
        case .confirmedNew:
            return NewCasesArray(data: confirmedData)
            
        case .deathTotal:
            return deathData.map { $0.Cases }
            
        case .deathNew:
            return NewCasesArray(data: deathData)
            
        }
    }
    
    var body: some View {
        let max = numberArray.max()!
        ScrollView(.horizontal,showsIndicators:false) {
            HStack(alignment:.bottom,spacing:0) {
                
                ForEach(numberArray,id:\.self) { num in
                 
                    CountryDetailGraphBar(height: CGFloat(barHeight(max: max, data: num, frameHeight: height)), width: UIScreen.main.bounds.width / CGFloat(confirmedData.count))
               
                }
                
            }
        }.frame(height:CGFloat(height))
    }
}

struct CountryDetailGraph_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailGraph(confirmedData:[
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


        ],deathData: [
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


        ],height:200.0,buttonState: .confirmedNew)
    }
}
