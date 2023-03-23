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
    case getHomework(classCode: String, accessToken: String)
    case addHomework(classCode: String, date: String, paragraph: Int, exercise: Int, accessToken: String)
}

extension API: TargetType {
    var baseURL: URL {
        return URL(string: "https://school-assistant-be.fly.dev/api")!
    }
    
    var path: String {
        switch self {
            case .getUserInfo:
                return "/auth"
            case .getHomework(let classCode, _):
                return "/homework/\(classCode)"
            case .addHomework:
                return "/homework"
        }
    }
    
    var method: Moya.Method {
        switch self {
            case .getUserInfo, .addHomework:
                return .post
            case .getHomework:
                return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Moya.Task {
        guard let parameters else { return .requestPlain }
        
        switch self {
            case .getUserInfo, .addHomework:
                return .requestParameters(parameters: parameters, encoding: encoding)
            case .addHomework(let classCode, let date, let paragraph, let exercise, let accessToken):
                return .requestParameters(parameters: parameters, encoding: encoding)
                
                let homework = Homework(classCode: classCode, subject: "maths", assignment: [Assignment(date: date, paragraph: paragraph, exercise: exercise)])
                return .requestJSONEncodable(homework)
            default:
                return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        var headers = [String : String]()
        switch self {
            case .getHomework(_, let accessToken):
                headers["Authorization"] = "Bearer \(accessToken)"
            case .addHomework(_, _, _, _, let accessToken):
                headers["Content-type"] = "application/json; charset=UTF-8"
                headers["Authorization"] = "Bearer \(accessToken)"
            default:
                break
        }
        
        return headers
    }
    
    var parameters: [String : Any]? {
        var parameters = [String : Any]()
        switch self {
            case .getUserInfo(let email, let password):
                parameters["email"] = email
                parameters["password"] = password
            case .addHomework(let classCode, let date, let paragraph, let exercise, _):
                parameters["classCode"] = classCode.replacingOccurrences(of: "\"", with: "")
                parameters["subject"] = "maths"
                parameters["assignment"] = [[
                    "date": date,
                    "paragraph": paragraph,
                    "exercise": exercise
                ]]
            default:
                break
        }
        
        return parameters
    }
    
    var encoding: ParameterEncoding {
        switch self {
            case .getUserInfo, .addHomework:
                return JSONEncoding.default
            case .getHomework:
                return URLEncoding.queryString
        }
    }
}

struct Homework: Codable {
    enum CodingKeys: String, CodingKey {
        case classCode = "classCode"
        case subject = "subject"
        case assignment = "assignment"
    }
    
    let classCode: String
    let subject: String
    let assignment: [Assignment]
}

struct Assignment: Codable {
    enum CodingKeys: String, CodingKey {
        case date = "date"
        case paragraph = "paragraph"
        case exercise = "exercise"
    }
    
    let date: String
    let paragraph: Int
    let exercise: Int
}
