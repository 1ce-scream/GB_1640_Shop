//
//  RegistrationRequestFactory.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 10.03.2022.
//

import Foundation
import Alamofire

protocol RegistrationRequestFactory {
    // swiftlint:disable function_parameter_count
    func registration(userID: Int,
                      username: String,
                      password: String,
                      email: String,
                      gender: String,
                      creditCard: String,
                      biography: String,
                      completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void)
}
