//
//  deletesoon.swift
//  CovidWorldData
//
//  Created by Minseo Kim on 8/24/21.
//

import SwiftUI

struct deletesoon: View {
    
    @State private var hey:Bool = false
    
    var body: some View {
        
        VStack {
        
        Button("toggle hey") {
            hey.toggle()
        }
        
        if hey == false {
            
            Text("hey is false")
        } else {
            Text("hey is true")
        }
        
        }
    }
}

struct deletesoon_Previews: PreviewProvider {
    static var previews: some View {
        deletesoon()
    }
}
