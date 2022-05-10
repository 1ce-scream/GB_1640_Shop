//
//  Auth.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 10.03.2022.
//

import Foundation
import Alamofire

class Auth: AbstractRequestFactory, AuthRequestFactory {
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
        let user: User
        
        var parameters: Parameters? {
            return [
                "username": user.login,
                "password": user.password
            ]
        }
    }
    
    func login(user: User,
               completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void) {
        
        let requestModel = Login(baseUrl: baseUrl,
                                 user: user)
        
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
        let user: User
        
        var parameters: Parameters? {
            return ["id_user": user.id,
                    "username": user.login,
                    "password": user.password,
                    "email": user.email,
                    "gender": user.gender,
                    "credit_card": user.creditcard,
                    "bio": user.biography
            ]
        }
    }
    
    func registration(user: User,
                      completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void) {
        
        let requestModel = Registration(baseUrl: baseUrl,
                                        user: user)
        
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
        let user: User
        
        var parameters: Parameters? {
            return [
                "userID": user.id
            ]
        }
    }
    
    func logOut(user: User,
                completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void) {
        
        let requestModel = LogOut(baseUrl: baseUrl,
                                  user: user)
        
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
        let user: User
        
        var parameters: Parameters? {
            return ["userID": user.id,
                    "userName": user.login,
                    "password": user.password,
                    "email": user.email
            ]
        }
    }
    
    func changeUserData(user: User,
                        completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void) {
        
        let requestModel = ChangeUserData(baseUrl: baseUrl,
                                          user: user)
        
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
}
