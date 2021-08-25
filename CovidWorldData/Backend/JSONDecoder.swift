//
//  JSONDecoder.swift
//  CovidWorldData
//
//  Created by Minseo Kim on 8/19/21.
//

import Foundation
import SwiftUI

func decode<T:Decodable>(url:String,type:T.Type)->T {
    
    let endPoint = NSMutableURLRequest(url: URL(string:url)!)
    let sem = DispatchSemaphore.init(value: 0)
    
    var result:T?
    
    URLSession.shared.dataTask(with: endPoint as URLRequest) { data,response,error in
        
        guard let data = data, error == nil else { return }
 
        defer { sem.signal() }
        do {
            result = try JSONDecoder().decode(type,from:data)
          
        } catch let error { print(error.localizedDescription) }
          
    }.resume()
        
    sem.wait()

    while result == nil {}
    
    return result!
}


