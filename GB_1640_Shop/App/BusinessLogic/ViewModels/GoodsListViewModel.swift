//
//  GoodsListViewModel.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 18.04.2022.
//

import Foundation
import Alamofire

final class GoodsListViewModel {
    
    private lazy var requestFactory = RequestFactory()
    
    func sendGoodsListRequest(completion: @escaping ([Good]) -> Void) {
        let request = requestFactory.makeGoodsRequestFactory()
        var requestResult: [Good] = []
        
        request.getGoodsCatalog(pageNumber: 1,
                                categoryId: 1) { response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let result):
                    print(result)
                    requestResult = result.products
                case .failure(let error):
                    print(error.localizedDescription)
                }
                completion(requestResult)
            }
        }
    }
}
