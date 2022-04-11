//
//  Basket.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 11.04.2022.
//

import Foundation
import Alamofire

class Basket: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://ancient-ravine-42236.herokuapp.com/")!
    var basket: [Int : Int] = [:]
    
    init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

// MARK: - Add goods to basket

extension Basket {
    struct AddGood: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "addToBasket"
        
        var productId: Int
        var quantity: Int
        var parameters: Parameters? {
            return [
                "id_product": productId,
                "quantity": quantity
            ]
        }
    }
}

extension Basket: AddToBasketRequestFactory {
    func add(productId: Int,
             quantity: Int,
             completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void) {
        
        let requestModel = AddGood(baseUrl: baseUrl,
                               productId: productId,
                               quantity: quantity)
        request(request: requestModel,
                completionHandler: completionHandler)
        basket.updateValue(quantity, forKey: productId)
    }
}

// MARK: - Remove from basket

extension Basket {
    struct Remove: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "removeFromBasket"
        
        var productId: Int
        var parameters: Parameters? {
            return [
                "id_product": productId
            ]
        }
    }
}

extension Basket: RemoveFromBasketRequestFactory {
    func remove(productId: Int,
                completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void) {
        
        let requestModel = Remove(baseUrl: baseUrl,
                                  productId: productId)
        request(request: requestModel,
                completionHandler: completionHandler)
        basket[productId] = nil
    }
}

// MARK: - Pay basket

extension Basket {
    struct PayBasket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "payBasket"
        
        var parameters: Parameters? {
            return nil
        }
    }
}

extension Basket: PayBasketRequestFactory {
    func pay(completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void) {
        
        let requestModel = PayBasket(baseUrl: baseUrl)
        request(request: requestModel,
                completionHandler: completionHandler)
        basket = [:]
    }
}
