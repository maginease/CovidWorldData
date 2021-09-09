//
//  CountryRow.swift
//  CovidWorldData
//
//  Created by Minseo Kim on 8/23/21.
//

import SwiftUI

struct CountryRow: View {
    
    var data = countryDatas
    @State private var search = ""
    
    var body: some View {
        
        VStack {
            
            TextField("Search Countries...", text: $search).padding()
            
            ScrollView(.horizontal,showsIndicators:false) {
                
                LazyHStack {
                    
                    if search.isEmpty {
                        
                        ForEach(data.keys.sorted(),id:\.self) { key in
                            
                            NavigationLink(destination:CountryDetailView(key: key)) {
                                
                                CountryFrameView(key: key).frame(width:150, height: 150)
                            }.foregroundColor(.black)
                        }
                        
                    } else {
                        
                        ForEach(findCountry(search, data: data).keys.sorted(),id:\.self) { key in
                            
                            NavigationLink(destination:CountryDetailView(key: key)) {
                                
                                CountryFrameView(key: key).frame(width:150, height: 150)
                            }.foregroundColor(.black)
                            
                        }
                        
                    }
                    
                    
                }
            }.frame(height:150)
        }
    }
}

struct CountryRow_Previews: PreviewProvider {
    static var previews: some View {
        CountryRow(data: data2)
    }
}
