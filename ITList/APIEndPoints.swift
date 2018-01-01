//
//  APIEndPoints.swift
//  ITList
//
//  Created by Yesbol Kulanbekov on 1/1/18.
//  Copyright © 2018 Yesbol Kulanbekov. All rights reserved.
//

import Foundation


import Foundation
import Moya

let provider = MoyaProvider<MyService>()

enum MyService {
    case listAllCategories
}


// MARK: - TargetType Protocol Implementation
extension MyService: TargetType {
    var baseURL: URL { return URL(string: "http://185.146.1.79/api/v1/")! }
    
    var path: String {
        switch self {
        case .listAllCategories:
            return "categories"
        }
        
    }
    
    var method: Moya.Method {
        switch self {
        case .listAllCategories:
            return .get

            
        }
    }
    
    var task: Task {
        switch self {
        case .listAllCategories:
            return .requestPlain
        }
        
        
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
    
    var sampleData: Data {
        switch self {
        case .listAllCategories:
            return "Half measures are as bad as nothing at all.".utf8Encoded
        }
        
    }
    
}




// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}


