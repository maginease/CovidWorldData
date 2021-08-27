//
//  CountryDetailGraphBar.swift
//  CovidWorldData
//
//  Created by Minseo Kim on 8/27/21.
//

import SwiftUI

struct CountryDetailGraphBar: View {
    
    var height:CGFloat
    var width:CGFloat
    
    var body: some View {
        
        Rectangle()
            .size(CGSize(width: width, height: height))
            .foregroundColor(.blue)
            .frame(width:width,height:height)
            .border(Color.black, width: 2)
            
    }
}

struct CountryDetailGraphBar_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailGraphBar(height:50.0,width:10.0)
    }
}
