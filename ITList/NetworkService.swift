//
//  NetworkManager.swift
//  ITList
//
//  Created by Yesbol Kulanbekov on 1/1/18.
//  Copyright © 2018 Yesbol Kulanbekov. All rights reserved.


import Foundation
import SwiftyJSON

class NetworkService {
    static let shared = NetworkService()
    
    
    func getData(with service: MyService, onCompletion: @escaping (_ response: JSON) -> Void ){
        
        provider.request(service) { (result) in
            
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                
                do {
                    let json = try JSON(data: data)
                    
                    onCompletion(json)
                    
                } catch {
                    print("Swifty Json Error")
                }
                
            case let .failure(error):
                print("MoyaFail",error.errorDescription ?? "MoyaFail")
                
            }
            
        }
        
    }
    
    
    
}

