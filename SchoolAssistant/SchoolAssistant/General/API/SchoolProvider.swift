//
//  SchoolProvider.swift
//  SchoolAssistant
//
//  Created by Александра on 17.03.23.
//

import Foundation
import Moya_ObjectMapper
import Moya

final class Provider {
    private static let provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
    
    static func getUserInfo(email: String, password: String, success: @escaping((AuthInfoModel) -> Void), failure: @escaping((String) -> Void)) {
        provider.request(.getUserInfo(email: email, password: password)) { result in
            switch result {
                case .success(let response):
                    guard let authInfo = try? response.mapObject(AuthInfoModel.self) else { return }
                    
                    if response.statusCode == 201 {
                        success(authInfo)
                        return
                    }
                    
                    guard let message = authInfo.message else { return }
                    
                    failure(message)
                case .failure(_):
                    break
            }
        }
    }
    
    static func getHomework(success: @escaping((HomeworkResponseModel) -> Void), failure: @escaping((Bool) -> Void)) {
        provider.request(.getHomework(classCode: SaveManager.classCode, accessToken: SaveManager.accessToken)) { result in
            switch result {
                case .success(let response):
                    guard let homeworkResponse = try? response.mapObject(HomeworkResponseModel.self) else { return failure(false) }
                    
                    success(homeworkResponse)
                case .failure(_):
                    failure(false)
            }
        }
    }
    
    static func addHomework(classCode: String, date: String, paragraph: Int, exercise: Int, success: @escaping(() -> Void), failure: @escaping(() -> Void)) {
        provider.request(.addHomework(classCode: classCode, date: date, paragraph: paragraph, exercise: exercise, accessToken: SaveManager.accessToken)) { result in
            print(classCode)
            switch result {
                case .success(let response):
                    guard (try? response.mapObject(HomeworkResponseModel.self)) != nil else {
                        failure()
                        return
                    }
                    
                    success()
                case .failure(_):
                    failure()
            }
        }
    }
}
