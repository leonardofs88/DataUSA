//
//  EndPoint.swift
//  DataUSA
//
//  Created by Leonardo Soares on 06/10/24.
//

import Foundation

enum Endpoint {
    case state
    case nation
    
    private var url: String { Bundle.main.object(forInfoDictionaryKey: "API_URL") as? String ?? "" }
    private var api: String { Bundle.main.object(forInfoDictionaryKey: "API_V1") as? String ?? "" }
    
    func fullURLString() -> String {
        let dataType = switch self {
        case .state:
            "State"
        case .nation:
            "Nation"
        }
        
        return "\(url)\(api)data?drilldowns=\(dataType)&measures=Population&year=latest"
    }
}
