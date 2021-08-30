//
//  CountryDetail.swift
//  CovidWorldData
//
//  Created by Minseo Kim on 8/25/21.
//

import SwiftUI

struct CountryDetail: View {
    
    let key:String
    @State var countryData:[Country] = [
//        Country(Country: "", Cases: 12000, Date: ""),
//        Country(Country: "", Cases: 8000, Date: ""),
//        Country(Country: "", Cases: 5000, Date: ""),
//        Country(Country: "", Cases: 3000, Date: ""),
//        Country(Country: "", Cases: 1200, Date: ""),
//        Country(Country: "", Cases: 800, Date: ""),
//        Country(Country: "", Cases: 500, Date: ""),
//        Country(Country: "", Cases: 150, Date: ""),
//        Country(Country: "", Cases: 100, Date: ""),
//        Country(Country: "", Cases: 50, Date: ""),
//        Country(Country: "", Cases: 30, Date: ""),
//        Country(Country: "", Cases: 15, Date: "")
    ]
    var height = 200.0
    
    var body: some View {
        
        if countryData.isEmpty {
            
            Text("Loading...").onAppear {
                countryData = decode(url: returnLink(key: key), type: [Country].self)
            }
        } else {
            
            VStack {
                Text("Total Cases:")
                CountryDetailGraph(data: countryData,height:height)
                
            }.frame(height:CGFloat(height))
        }
    
}
}
struct CountryDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CountryDetail(key:"Albania")
        }
    }
}

