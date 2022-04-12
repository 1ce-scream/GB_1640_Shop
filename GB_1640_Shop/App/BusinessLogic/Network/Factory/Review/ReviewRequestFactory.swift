//
//  ReviewRequestFactory.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 01.04.2022.
//

import Foundation
import Alamofire

protocol ReviewRequestFactory {
    func addReview(userId: Int,
                   text: String,
                   completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void)
    
    func approveReview(commentId: Int,
                       completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void)
    
    func removeReview(commentId: Int,
                      completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void)
    
    func getReviewListById(productId: Int,
                           completionHandler: @escaping (AFDataResponse<ReviewListResponseResult>) -> Void)
}
