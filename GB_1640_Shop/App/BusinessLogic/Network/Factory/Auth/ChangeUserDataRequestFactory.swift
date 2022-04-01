//
//  ChangeUserDataRequestFactory.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 10.03.2022.
//

import Foundation
import Alamofire

protocol ChangeUserDataRequestFactory {
    func changeUserData(userID: Int,
                        username: String,
                        password: String,
                        email: String,
                        completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void)
}
