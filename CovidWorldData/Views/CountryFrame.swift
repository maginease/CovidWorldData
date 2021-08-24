//
//  CountryFrame.swift
//  CovidWorldData
//
//  Created by Minseo Kim on 8/23/21.
//

import SwiftUI

struct CountryFrame: View {
    
    @State private var isLoading = true
    
    let key:String
    var data:[Country] {
        print("data accessed")
        return decode(url: returnLink(key: key), type: [Country].self,isLoading: &isLoading)
    }
    
    
    
    var body: some View {
        
        VStack {
        
            if isLoading {
                
                Text("Loading...")
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
        CountryFrame(key: "Japan")
    }
}


