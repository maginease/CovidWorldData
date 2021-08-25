//
//  CountryFrame.swift
//  CovidWorldData
//
//  Created by Minseo Kim on 8/23/21.
//

import SwiftUI

struct CountryFrame: View {
    
  
    let key:String
    @State private var data:[Country] = []

    
    var body: some View {
        
        VStack {
            
            if data.isEmpty {

                Text("Loading...").onAppear {
                   data = decode(url: returnLink(key: key), type: [Country].self)
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
        CountryFrame(key: "Japan")
    }
}


