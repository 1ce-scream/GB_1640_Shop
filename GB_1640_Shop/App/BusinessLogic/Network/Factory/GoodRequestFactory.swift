//
//  GoodRequestFactory.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 27.03.2022.
//

import Foundation
import Alamofire

protocol GoodRequestFactory {
     func getGoodByID(productId: Int,
                      completionHandler: @escaping (AFDataResponse<Good>) -> Void)
 }
