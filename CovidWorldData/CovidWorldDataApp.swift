//
//  CovidWorldDataApp.swift
//  CovidWorldData
//
//  Created by Minseo Kim on 8/19/21.
//

import SwiftUI

@main
struct CovidWorldDataApp: App {
    
    @StateObject var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ModelData())
 
        }
    }
}
