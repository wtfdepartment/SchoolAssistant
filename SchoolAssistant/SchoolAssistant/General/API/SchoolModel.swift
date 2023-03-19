//
//  SchoolModel.swift
//  SchoolAssistant
//
//  Created by Александра on 17.03.23.
//

import Foundation
import ObjectMapper

final class AuthInfoModel: Mappable {
    var success = false
    var accessToken: String?
    var user: UserInfoModel?
    var message: String?
    
    init?(map: ObjectMapper.Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        success     <- map["success"]
        accessToken <- map["accessToken"]
        user        <- map["user"]
        message     <- map["message"]
    }
}

final class UserInfoModel: Mappable {
    var id = ""
    var firstName = ""
    var lastName = ""
    var email = ""
    var password = ""
    var role = ""
    var `class` = ""
    var teacher: String?
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        id        <- map["id"]
        firstName <- map["firstName"]
        lastName  <- map["lastName"]
        email     <- map["email"]
        password  <- map["password"]
        role      <- map["userMetadata.role"]
        teacher   <- map["assignedTeacher"]
        if role == "student" {
            `class` <- map["userMetadata.classCode"]
        } else {
            `class` <- map["userMetadata.assignedClassCode"]
        }
        
    }
}
