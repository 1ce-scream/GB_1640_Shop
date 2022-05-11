//
//  GoodsDetailViewModel.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 21.04.2022.
//

import Foundation
import Alamofire

final class GoodsDetailViewModel {
    
    private lazy var requestFactory = RequestFactory()
    
    func sendGoodsListRequest(productId: Int, completion :@escaping ([Reviews]) -> Void) {
        let request = requestFactory.makeReviewRequestFactory()
        var requestResult: [Reviews] = []
        
        request.getReviewListById(productId: productId) { response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let result):
                    print(result)
                    requestResult = result.reviewList ?? []
                case .failure(let error):
                    print(error.localizedDescription)
                }
                completion(requestResult)
            }
        }
    }
    
    func addProductToBasket(productId: Int) {
        let request = requestFactory.makeBasketRequestFactory()
        
        request.add(productId: productId, quantity: 1) { response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let result):
                    print(result)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func sendReview(userId: Int, text: String) {
        let request = requestFactory.makeReviewRequestFactory()
        
        request.addReview(userId: userId, text: text) { response in
            
            DispatchQueue.main.async {
                switch response.result {
                case .success(let result):
                    print(result)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
