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
    let gender: String
    let ipAddress: String
    let photoURL: String
    let employment: Employment
    let email: String
    
    init?(json : SwiftyJSON.JSON) {
        
        guard let name = json["first_name"].string,
        let secondName = json["last_name"].string
        
        else {return nil}
        
        let companyName = json["employment"]["name"].stringValue
        let position = json["employment"]["position"].stringValue
        let fullPhotoURL = json["photo"].stringValue
        let photoURLWithoutBase = fullPhotoURL.components(separatedBy: ".com")[1]
        let ip = json["ip_address"].stringValue
        let gender = json["gender"].stringValue
        let email = json["email"].stringValue
        
        self.employment = Employment(companyName: companyName, position: position)
        self.name = name
        self.secondName = secondName
        self.photoURL = photoURLWithoutBase
        self.ipAddress = ip
        self.gender = gender
        self.email = email
    }
    
    
}



