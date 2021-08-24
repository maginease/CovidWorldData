//
//  DataManage.swift
//  CovidWorldData
//
//  Created by Minseo Kim on 8/23/21.
//

import Foundation

func findNewCases(_ country:[Country])->Int {
    
    let lastIndex = country.count - 1
    
    return country[lastIndex].Cases - country[lastIndex - 1].Cases
}

func returnLink(key:String)->String {
    
    guard let linkName = countryDatas[key] else { return "" }
    
    return "https://api.covid19api.com/total/dayone/country/" + linkName + "/status/confirmed"
}


