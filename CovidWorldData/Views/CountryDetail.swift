//
//  CountryDetail.swift
//  CovidWorldData
//
//  Created by Minseo Kim on 8/25/21.
//

import SwiftUI

struct CountryDetail: View {
    
    let key:String
    @State var countryData:[Country] = []
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
        CountryDetail(key:"Japan")
    }
}
