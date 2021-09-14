//
//  CountryFrame.swift
//  CovidWorldData
//
//  Created by Minseo Kim on 8/23/21.
//

import SwiftUI

struct CountryFrameView: View {
    
    
    let key:String
    @State private var data:[Country] = []
    
    
    var body: some View {
        
        VStack {
            
            if data.isEmpty {
                
                Text("Loading...").onAppear {
                    FetchAndDecode(url: returnLink(key: key), type: [Country].self) { res in
                        if res.isEmpty {
                            data = [Country(Country: "Data for \(key) not found", Cases: 0, Date: "")]
                        } else {
                            
                            data = res
                            
                        }
                    }
                }
            } else {
                
                Text("\(data[0].Country)").font(.headline)
                Text("New Cases: +\(findNewCases(data))")
            }
            
            
            
        }
        .padding()
        .frame(width:150,height:150)
        .clipShape(Rectangle())
        .overlay(Rectangle().stroke(Color.gray,lineWidth:6))
        .cornerRadius(5)
    }
    
    
}

struct CountryFrame_Previews: PreviewProvider {
    static var previews: some View {
        CountryFrameView(key: "Japan")
    }
}


