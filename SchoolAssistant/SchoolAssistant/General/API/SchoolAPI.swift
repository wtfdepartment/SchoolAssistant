//
//  SchoolAPI.swift
//  SchoolAssistant
//
//  Created by Александра on 17.03.23.
//

import Foundation
import Moya

enum API {
    case getUserInfo(email: String, password: String)
}

extension API: TargetType {
    var baseURL: URL {
        return URL(string: "https://school-assistant-be.fly.dev/api")!
    }
    
    var path: String {
        switch self {
            case .getUserInfo(_, _):
                return "/auth"
        }
    }
    
    var method: Moya.Method {
        switch self {
            case .getUserInfo:
                return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Moya.Task {
        guard let parameters else { return .requestPlain }
        
        switch self {
            case .getUserInfo(_, _):
                return .requestParameters(parameters: parameters, encoding: encoding)
        }
    }
    
    var headers: [String : String]? {
        switch self {
            case .getUserInfo(_, _):
                return nil
        }
    }
    
    var parameters: [String : Any]? {
        var parameters = [String : Any]()
        switch self {
            case .getUserInfo(let email, let password):
                parameters["email"] = email
                parameters["password"] = password
        }
        
        return parameters
    }
    
    var encoding: ParameterEncoding {
        switch self {
            case .getUserInfo(_, _):
                return JSONEncoding.default
        }
    }
}
