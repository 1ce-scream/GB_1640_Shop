//
//  AuthRequestFactory.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 10.03.2022.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(user: User,
               completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void)
    
    func registration(user: User,
                      completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void)
    
    func logOut(user: User,
                completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void)
    
    func changeUserData(user: User,
                        completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void)
}
