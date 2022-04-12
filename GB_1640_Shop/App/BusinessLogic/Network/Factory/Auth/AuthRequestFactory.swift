//
//  AuthRequestFactory.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 10.03.2022.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(username: String,
               password: String,
               completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void)
    
    // swiftlint:disable function_parameter_count
    func registration(userID: Int,
                      username: String,
                      password: String,
                      email: String,
                      gender: String,
                      creditCard: String,
                      biography: String,
                      completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void)
    
    func logOut(userID: Int,
                completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void)
    
    func changeUserData(userID: Int,
                        username: String,
                        password: String,
                        email: String,
                        completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void)
}
