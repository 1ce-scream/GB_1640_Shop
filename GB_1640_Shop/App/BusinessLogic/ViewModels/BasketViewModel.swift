//
//  BasketViewModel.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 25.04.2022.
//

import Foundation
import Alamofire

class BasketViewModel {
    
    private lazy var requestFactory = RequestFactory()
    
    func sendRemoveFromBasketRequest(productId: Int) {
        let request = requestFactory.makeBasketRequestFactory()
        
        request.remove(productId: productId) { response in
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
    
    func payBasket() {
        let request = requestFactory.makeBasketRequestFactory()
        
        request.pay(completionHandler: ) { response in
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
