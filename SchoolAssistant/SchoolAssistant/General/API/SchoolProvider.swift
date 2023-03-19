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
    private static let provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin()])
    
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
}
