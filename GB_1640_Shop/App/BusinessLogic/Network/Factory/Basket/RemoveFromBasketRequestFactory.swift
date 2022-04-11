//
//  RemoveFromBasketRequestFactory.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 11.04.2022.
//

import Foundation
import Alamofire

protocol RemoveFromBasketRequestFactory {
    func remove(productId: Int,
                completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void)
}
