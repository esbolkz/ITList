//
//  Employee.swift
//  ITList
//
//  Created by Yesbol Kulanbekov on 12/31/17.
//  Copyright © 2017 Yesbol Kulanbekov. All rights reserved.
//

import Foundation
import SwiftyJSON


struct Employee {
//    let id: Int
    let name: String
    let secondName: String
//    let gender: Gender
//    let ipAddress: String
//    let photoURL: URL
//    let employment: Employment
    
    
    init?(json : SwiftyJSON.JSON) {
        
        print("Employee json \(json)")
        
        guard let name = json["first_name"].string,
        let secondName = json["last_name"].string
        
        else {return nil}
        
        self.name = name
        self.secondName = secondName
    }
    
    
}
