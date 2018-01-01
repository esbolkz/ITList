//
//  NetworkManager.swift
//  ITList
//
//  Created by Yesbol Kulanbekov on 1/1/18.
//  Copyright © 2018 Yesbol Kulanbekov. All rights reserved.
//

import Foundation
import SwiftyJSON

class NetworkService {
    static let shared = NetworkService()
    
    func listEmployees(onCompletion: @escaping (_ employees: [Employee]) -> Void ){
        
        provider.request(MyService.listAllEmployees) { (result) in
            
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                
                
                do {
                    let json = try JSON(data: data)
                    
                    let employees = json.map{ (element) -> Employee in
                        let jsonItem = element.1
                        let employee = Employee(json: jsonItem)!
                        return employee
                    }
                    
                    onCompletion(employees)
                    
                } catch {
                    print("Swifty Json Error")
                }
                
            case let .failure(error):
                print("MoyaFail",error.errorDescription ?? "MoyaFail")
                
            }
            
        }
        
        
    }
    
}
