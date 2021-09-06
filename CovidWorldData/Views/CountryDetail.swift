//
//  CountryDetail.swift
//  CovidWorldData
//
//  Created by Minseo Kim on 8/25/21.
//

import SwiftUI

enum GraphButton {
    
    case totalCases
    case newCases
}


struct CountryDetail: View {
    
    let key:String
    @State var countryData:[Country] = []
    var height = 200.0
    @State private var currentButton = GraphButton.totalCases
    
    var body: some View {
        
        if countryData.isEmpty {
            
            Text("Loading...").onAppear {
                decode(url: returnLink(key: key), type: [Country].self) { res in
                    countryData = res
                }
            }
        } else {
            
            VStack {
                
                Text("\(countryData[0].Country)")
                    .font(.system(size: 50,design: .serif))
                    .padding()
                
                
                Text("Total Cases:")
                    .font(.system(size: 30).bold())
                Text("\(countryData.last!.Cases)")
                    .font(.system(size: 30).bold())
                Text("New Cases:")
                Text("+\(findNewCases(countryData))").foregroundColor(.red)
                
                CountryDetailGraph(data: countryData,height:height,buttonState: currentButton).frame(height:CGFloat(height))
                
                HStack {
                    
                    Button(action: { currentButton = .totalCases },label: { Text("Total Cases") } )
                        .foregroundColor(currentButton == .totalCases ? .blue:.gray)
                    
                    Button(action: { currentButton = .newCases },label: { Text("New Cases") } )
                        .foregroundColor(currentButton == .newCases ? .blue:.gray)
                }
                
            }
        }
    
}
}
struct CountryDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CountryDetail(key:"Japan")
        }
    }
}

