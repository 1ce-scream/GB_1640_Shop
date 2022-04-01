//
//  AddReviewRequestFactory.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 01.04.2022.
//

import Foundation
import Alamofire

protocol AddReviewRequestFactory {
    func addReview(userId: Int,
                   text: String,
                   completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void)
}
