//
//  DataManage.swift
//  CovidWorldData
//
//  Created by Minseo Kim on 8/23/21.
//

import Foundation

func findNewCases(_ country:[Country])->Int {
    
    let lastIndex = country.count - 1
    
    guard lastIndex > 0 else { return country[0].Cases }
    
    return country[lastIndex].Cases - country[lastIndex - 1].Cases
}

func maxCases(_ data:[Country])->Int {
    
    guard data.isEmpty == false else { return 1 }
    
    var arr = [Int]()
    
    for i in 0..<data.count {
        arr.append(data[i].Cases)
    }
    
    return arr.max()!
}

func returnLink(key:String)->String {
    
    guard let linkName = countryDatas[key] else { return "" }
    
    return "https://api.covid19api.com/total/dayone/country/" + linkName + "/status/confirmed"
}

func barHeight(max:Int,data:Int,frameHeight:Double)->Double {
    
    return Double(data) * frameHeight / Double(max)
}

func NewCasesArray(data:[Country])->[Int] {
    
    var result = [Int]()
    var targetArray = Array(data.reversed())
    
    for _ in 0..<targetArray.count - 1 {
        
        result.append(targetArray[1].Cases - targetArray[0].Cases)
        targetArray.remove(at: 0)
    }
    result.append(targetArray[0].Cases)
    
    return result
}
