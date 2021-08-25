//
//  CountryRow.swift
//  CovidWorldData
//
//  Created by Minseo Kim on 8/23/21.
//

import SwiftUI

struct CountryRow: View {
    
    var data = countryDatas
    var body: some View {
        
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(data.keys.sorted(),id:\.self) { key in
                    
                    CountryFrame(key: key).frame(width:150, height: 150)
                    
                }
            }
        }
    }
}

struct CountryRow_Previews: PreviewProvider {
    static var previews: some View {
        CountryRow(data: data2)
    }
}
