//
//  LogOutRequestFactory.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 10.03.2022.
//

import Foundation
import Alamofire

protocol LogOutRequestFactory {
    func logOut(userID: Int,
                completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void)
}
