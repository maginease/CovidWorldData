//
//  CountryDetail.swift
//  CovidWorldData
//
//  Created by Minseo Kim on 8/25/21.
//

import SwiftUI

struct CountryDetail: View {
    
    @Binding var countryData:[Country]
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct CountryDetail_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetail()
    }
}
