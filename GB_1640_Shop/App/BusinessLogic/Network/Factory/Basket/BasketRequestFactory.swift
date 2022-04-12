//
//  AddToBasketRequestFactory.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 11.04.2022.
//

import Foundation
import Alamofire

protocol BasketRequestFactory {
    func add(productId: Int,
             quantity: Int,
             completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void)
    
    func remove(productId: Int,
                completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void)
    
    func pay(completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void)
}
