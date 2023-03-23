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
        teacher   <- map["userMetadata.assignedTeacher"]
        if role == "student" {
            `class` <- map["userMetadata.classCode"]
        } else {
            `class` <- map["userMetadata.assignedClassCode"]
        }
        
    }
}

final class HomeworkResponseModel: Mappable {
    var success = false
    var homework = [HomeworkModel]()
    
    init?(map: ObjectMapper.Map) {
        mapping(map: map)
    }
    
    func mapping(map: ObjectMapper.Map) {
        success  <- map["success"]
        homework <- map["homework"]
    }
}

final class HomeworkModel: Mappable {
    var subject = ""
    var assignment = [AssignmentModel]()
    
    init?(map: ObjectMapper.Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        subject    <- map["subject"]
        assignment <- map["assignment"]
    }
}

final class AssignmentModel: Mappable {
    var date = ""
    var paragraph = 0
    var exercise = 0
    
    init?(map: ObjectMapper.Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        date      <- map["date"]
        paragraph <- map["paragraph"]
        exercise  <- map["exercise"]
    }
}
