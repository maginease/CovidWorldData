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


struct CountryDetailView: View {
    
    let key:String
    @State var countryData:[Country] = []
    var height = 200.0
    @State private var currentButton = GraphButton.totalCases
    @EnvironmentObject var modelData:ModelData
    @State private var country = World.CountryDataToday(Country: "", NewConfirmed: 0, TotalConfirmed: 0, NewDeaths: 0, TotalDeaths: 0)
    
    var body: some View {
        
        if countryData.isEmpty {
            
            Text("Loading...").onAppear {
                FetchAndDecode(url: returnLink(key: key), type: [Country].self) { res in
                    
                    if res.isEmpty {
                        countryData = [Country(Country: "\(key) not found", Cases: 1, Date: "")]
                    } else {
                        
                        countryData = res
                    }
                }
                
                if let existingCountry = modelData.summary.Countries.first(where: { $0.Country == key }) {
                    
                    country = existingCountry
                } else {
                    
                    country = World.CountryDataToday(Country: key, NewConfirmed: 0, TotalConfirmed: 0, NewDeaths: 0, TotalDeaths: 0)
                }
                
                
            }
        } else {
            
            VStack {
                
                Text("\(countryData[0].Country)")
                    .font(.system(size: 30,design: .serif))
                    .padding()
                    .truncationMode(.head)
               
                
                Text("Total Cases:")
                    .font(.system(size: 20).bold())
                Text("\(country.TotalConfirmed)")
                    .font(.system(size: 20).bold())
               
                Text("Total Deaths:")
                    .font(.system(size: 20).bold())
                Text("\(country.TotalDeaths)")
                    .font(.system(size: 20).bold())

                HStack {
                    Text("New Cases:")
                    Text("+\(country.NewConfirmed)").foregroundColor(.red)
                    Text("New Deaths:")
                    Text("+\(country.NewDeaths)").foregroundColor(.red)
                }
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
            CountryDetailView(key:"Germany").environmentObject(ModelData())
        }
    }
}

