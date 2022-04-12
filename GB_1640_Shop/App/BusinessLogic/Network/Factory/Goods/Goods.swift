//
//  Good.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 27.03.2022.
//

import Foundation
import Alamofire

class Goods: AbstractRequestFactory, GoodsRequestFactory {
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

// MARK: - Goods catalog

extension Goods {
    struct GetGoodsCatalog: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "getGoodsCatalog"
        
        let pageNumber: Int
        let categoryId: Int
        var parameters: Parameters? {
            return [
                "pageNumber": pageNumber,
                "categoryId": categoryId
            ]
        }
    }
    
    func getGoodsCatalog(pageNumber: Int,
                         categoryId: Int,
                         completionHandler: @escaping (AFDataResponse<GoodsList>) -> Void) {
        
        let requestModel = GetGoodsCatalog(baseUrl: baseUrl,
                                           pageNumber: pageNumber,
                                           categoryId: categoryId)
        request(request: requestModel,
                completionHandler: completionHandler)
    }
}

// MARK: - Good by id

extension Goods {
    struct GetGood: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "getGoodsById"
        
        let productId: Int
        var parameters: Parameters? {
            return [
                "productId": productId
            ]
        }
    }
    
    func getGoodByID(productId: Int,
                     completionHandler: @escaping (AFDataResponse<Good>) -> Void) {
        
        let requestModel = GetGood(baseUrl: baseUrl,
                                   productId: productId)
        request(request: requestModel,
                completionHandler: completionHandler)
    }
}
