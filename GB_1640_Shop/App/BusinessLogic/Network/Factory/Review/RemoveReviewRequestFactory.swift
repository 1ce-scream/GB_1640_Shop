//
//  RemoveReviewRequestFactory.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 01.04.2022.
//

import Foundation
import Alamofire

protocol RemoveReviewRequestFactory {
    func removeReview(commentId: Int,
                      completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void)
}
