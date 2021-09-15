//
//  CountryDetail.swift
//  CovidWorldData
//
//  Created by Minseo Kim on 8/25/21.
//

import SwiftUI

enum GraphButton {
    
    case confirmedTotal
    case confirmedNew
    case deathTotal
    case deathNew
    
}


struct CountryDetailView: View {
    
    let key:String
    @State var confirmedData:[Country] = []
    @State var deathData:[Country] = []
    var height = 200.0
    @State private var currentButton = GraphButton.confirmedTotal
    @EnvironmentObject var modelData:ModelData
    @State private var country = World.CountryDataToday(Country: "", NewConfirmed: 0, TotalConfirmed: 0, NewDeaths: 0, TotalDeaths: 0)
    
    var body: some View {
        
        if confirmedData.isEmpty {
            
            Text("Loading...").onAppear {
                FetchAndDecode(url: confirmedCasesLink(key: key), type: [Country].self) { res in
                    
                    if res.isEmpty {
                        confirmedData = [Country(Country: "\(key) not found", Cases: 1, Date: "")]
                    } else {
                        
                        confirmedData = res
                    }
                }
                
                FetchAndDecode(url: deathCasesLink(key: key), type: [Country].self) { res in
                    
                    if res.isEmpty {
                        deathData = [Country(Country: "\(key) not found", Cases: 1, Date: "")]
                    } else {
                        
                        deathData = res
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
                
                Text("\(confirmedData[0].Country)")
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
                CountryDetailGraph(confirmedData: confirmedData,deathData: deathData,height:height,buttonState: currentButton).frame(height:CGFloat(height))
                
                HStack {
                    
                    Button(action: { currentButton = .confirmedTotal },label: { Text("Total Cases") } )
                        .foregroundColor(currentButton == .confirmedTotal ? .blue:.gray)
                    
                    Button(action: { currentButton = .confirmedNew },label: { Text("New Cases") } )
                        .foregroundColor(currentButton == .confirmedNew ? .blue:.gray)
                    
                    Button(action: { currentButton = .deathTotal },label: { Text("Total Deaths") } )
                        .foregroundColor(currentButton == .deathTotal ? .blue:.gray)
                    
                    Button(action: { currentButton = .deathNew },label: { Text("New Deaths") } )
                        .foregroundColor(currentButton == .deathNew ? .blue:.gray)
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

