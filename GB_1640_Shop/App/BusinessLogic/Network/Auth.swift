//
//  Auth.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 10.03.2022.
//

import Foundation
import Alamofire

class Auth: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

//MARK: -Login

extension Auth {
    struct Login: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "login.json"
        let login: String
        let password: String
        
        var parameters: Parameters? {
            return [
                "username": login,
                "password": password,
            ]
        }
    }
}

extension Auth: AuthRequestFactory {
    func login(userName: String,
               password: String,
               completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void) {
        
        let requestModel = Login(baseUrl: baseUrl,
                                 login: userName,
                                 password: password)
        
        request(request: requestModel,
                completionHandler: completionHandler)
    }
}

// MARK: -Registration

extension Auth {
    struct Registration: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "registerUser.json"
        let userID: Int
        let login: String
        let password: String
        let email: String
        
        var parameters: Parameters? {
            return ["id_user": userID,
                    "username": login,
                    "password": password,
                    "email": email
            ]
        }
    }
}

extension Auth: RegistrationRequestFactory {
    func registration(userID: Int,
                      userName: String,
                      password: String,
                      email: String,
                      completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void) {
        let requestModel = Registration(baseUrl: baseUrl,
                                        userID: userID,
                                        login: userName,
                                        password: password,
                                        email: email)
        
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
}

// MARK: -LogOut

extension Auth {
    struct LogOut: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "logout.json"
        let userID: Int
        
        var parameters: Parameters? {
            return [
                "id_user": userID,
            ]
        }
    }
}

extension Auth: LogOutRequestFactory {
    func logOut(userID: Int,
                completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void) {
        
        let requestModel = LogOut(baseUrl: baseUrl,
                                  userID: userID)
        
        request(request: requestModel,
                completionHandler: completionHandler)
    }
}

// MARK: -Change user data

extension Auth {
    struct ChangeUserData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "changeUserData.json"
        let userID: Int
        let login: String
        let password: String
        let email: String
        
        var parameters: Parameters? {
            return ["id_user": userID,
                    "username": login,
                    "password": password,
                    "email": email
            ]
        }
    }
}

extension Auth: ChangeUserDataRequestFactory {
    func changeUserData(userID: Int,
                        userName: String,
                        password: String,
                        email: String,
                        completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void) {
        
        let requestModel = ChangeUserData(baseUrl: baseUrl,
                                          userID: userID,
                                          login: userName,
                                          password: password,
                                          email: email)
        
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
}
