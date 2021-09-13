//
//  JSONDecoder.swift
//  CovidWorldData
//
//  Created by Minseo Kim on 8/19/21.
//

import Foundation
import SwiftUI

func FetchAndDecode<T: Decodable>(url: String, type: T.Type, _ completion: @escaping (T) -> Void) {
    
    let endPoint = NSMutableURLRequest(url: URL(string:url)!)
    
    URLSession.shared.dataTask(with: endPoint as URLRequest) { data,response,error in
        
        guard error == nil else { return }
 
        if let data = data, let decodedData = try? JSONDecoder().decode(type, from: data) {
            
            completion(decodedData)
        }
        
    }.resume()
}

func FetchAndDecode<T: Decodable>(url: String, type: T.Type)->T {
    
    let endPoint = NSMutableURLRequest(url: URL(string:url)!)
    let k = DispatchSemaphore.init(value: 0)
    var result:T?
    
    URLSession.shared.dataTask(with: endPoint as URLRequest) { data,response,error in
        
        guard error == nil else { return }
 
        defer { k.signal() }
        if let data = data, let decodedData = try? JSONDecoder().decode(type, from: data) {
            
        result = decodedData
        }
        
    }.resume()
    
    k.wait()
    
    return result!
}
