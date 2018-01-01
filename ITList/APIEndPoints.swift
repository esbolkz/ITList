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

struct Constants {
    static let serverURL = "http://www.mocky.io/v2/5a488f243000004c15c3c57e"
}

let provider = MoyaProvider<MyService>()

enum MyService {
    case listAllEmployees
}


// MARK: - TargetType Protocol Implementation

extension MyService: TargetType {
    var baseURL: URL { return URL(string: Constants.serverURL)! }
    
    var path: String {
        switch self {
        case .listAllEmployees:
            return ""
        }
        
    }
    
    var method: Moya.Method {
        switch self {
        case .listAllEmployees:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .listAllEmployees:
            return .requestPlain
        }
        
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
    
    var sampleData: Data {
        switch self {
        case .listAllEmployees:
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


