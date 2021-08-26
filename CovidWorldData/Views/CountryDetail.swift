//
//  CountryDetail.swift
//  CovidWorldData
//
//  Created by Minseo Kim on 8/25/21.
//

import SwiftUI

struct CountryDetail: View {
    
    @Binding var key:String
    @Binding var countryData:[Country]
    
    var body: some View {
        Text("Total Cases:\(countryData.reversed()[0].Cases)")
    }
}

//struct CountryDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        CountryDetail(countryData: [Country(Country: "", Cases: 0, Date: "")])
//    }
//}
