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
    let baseUrl = URL(string: "https://ancient-ravine-42236.herokuapp.com/")!
    
    init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

// MARK: - Login

extension Auth {
    struct Login: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "login"
        let login: String
        let password: String
        
        var parameters: Parameters? {
            return [
                "username": login,
                "password": password
            ]
        }
    }
}

extension Auth: AuthRequestFactory {
    func login(username: String,
               password: String,
               completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void) {
        
        let requestModel = Login(baseUrl: baseUrl,
                                 login: username,
                                 password: password)
        
        request(request: requestModel,
                completionHandler: completionHandler)
    }
}

// MARK: - Registration

extension Auth {
    struct Registration: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "register"
        let userID: Int
        let login: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let biography: String
        
        var parameters: Parameters? {
            return ["id_user": userID,
                    "username": login,
                    "password": password,
                    "email": email,
                    "gender": gender,
                    "credit_card": creditCard,
                    "bio": biography
            ]
        }
    }
}

extension Auth: RegistrationRequestFactory {
    // swiftlint:disable function_parameter_count
    func registration(userID: Int,
                      username: String,
                      password: String,
                      email: String,
                      gender: String,
                      creditCard: String,
                      biography: String,
                      completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void) {
        
        let requestModel = Registration(baseUrl: baseUrl,
                                        userID: userID,
                                        login: username,
                                        password: password,
                                        email: email,
                                        gender: gender,
                                        creditCard: creditCard,
                                        biography: biography)
        
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
}

// MARK: - LogOut

extension Auth {
    struct LogOut: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "logout"
        let userID: Int
        
        var parameters: Parameters? {
            return [
                "userID": userID
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

// MARK: - Change user data

extension Auth {
    struct ChangeUserData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "changeUserData"
        let userID: Int
        let username: String
        let password: String
        let email: String
        
        var parameters: Parameters? {
            return ["userID": userID,
                    "userName": username,
                    "password": password,
                    "email": email
            ]
        }
    }
}

extension Auth: ChangeUserDataRequestFactory {
    func changeUserData(userID: Int,
                        username: String,
                        password: String,
                        email: String,
                        completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void) {
        
        let requestModel = ChangeUserData(baseUrl: baseUrl,
                                          userID: userID,
                                          username: username,
                                          password: password,
                                          email: email)
        
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
}
