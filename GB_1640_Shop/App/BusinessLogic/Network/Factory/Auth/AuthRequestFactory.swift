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
}
