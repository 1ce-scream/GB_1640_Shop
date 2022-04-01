//
//  Review.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 01.04.2022.
//

import Foundation
import Alamofire

class Review: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://ancient-ravine-42236.herokuapp.com/")!
    
    init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

// MARK: - Add review

extension Review {
    struct AddReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "addReview"
        let userId: Int
        let reviewText: String
        
        var parameters: Parameters? {
            return [
                "id_user": userId,
                "text": reviewText
            ]
        }
    }
}

extension Review: AddReviewRequestFactory {
    func addReview(userId: Int,
                   text: String,
                   completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void) {
        
        let requestModel = AddReview(baseUrl: baseUrl,
                                     userId: userId,
                                     reviewText: text)
        request(request: requestModel,
                completionHandler: completionHandler)
        
    }

}

// MARK: - Approve review

extension Review {
    struct ApproveReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "approveReview"
        let commentId: Int
        
        var parameters: Parameters? {
            return [
                "id_comment": commentId
            ]
        }
    }
}

extension Review: ApproveReviewRequestFactory {
    func approveReview(commentId: Int,
                       completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void) {
        
        let requestModel = ApproveReview(baseUrl: baseUrl,
                                         commentId: commentId)
        request(request: requestModel,
                completionHandler: completionHandler)
    }
    
}

// MARK: - Remove review

extension Review {
    struct RemoveReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "removeReview"
        let commentId: Int
        
        var parameters: Parameters? {
            return [
                "id_comment": commentId
            ]
        }
    }
}

extension Review: RemoveReviewRequestFactory {
    func removeReview(commentId: Int,
                      completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void) {
        
        let requestModel = ApproveReview(baseUrl: baseUrl,
                                         commentId: commentId)
        request(request: requestModel,
                completionHandler: completionHandler)
    }
    
}
