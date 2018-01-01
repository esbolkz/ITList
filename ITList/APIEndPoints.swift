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
    static let imageURL = "http://dummyimage.com"
}

let provider = MoyaProvider<MyService>()

enum MyService {
    case listAllEmployees
    case downloadImage(url: String)
}


// MARK: - TargetType Protocol Implementation

extension MyService: TargetType {
    var baseURL: URL {
        
        switch self {
        case .downloadImage:
            return URL(string: Constants.imageURL)!
        default:
            return URL(string: Constants.serverURL)!
        }
        
    }
    
    var path: String {
        switch self {
        case .listAllEmployees:
            return ""
        case .downloadImage(let url):
            return url
        }
        
    }
    
    var method: Moya.Method {
        switch self {
        case .listAllEmployees, .downloadImage:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .listAllEmployees, .downloadImage:
            return .requestPlain
        }
        
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
    
    var sampleData: Data {
        switch self {
        case .listAllEmployees, .downloadImage:
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


