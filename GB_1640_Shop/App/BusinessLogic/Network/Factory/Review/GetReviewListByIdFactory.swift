//
//  GetReviewListByIdFactory.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 01.04.2022.
//

import Foundation
import Alamofire

protocol GetReviewListByIdFactory {
    func getReviewListById(productId: Int,
                           completionHandler: @escaping (AFDataResponse<ReviewListResponseResult>) -> Void)
}
