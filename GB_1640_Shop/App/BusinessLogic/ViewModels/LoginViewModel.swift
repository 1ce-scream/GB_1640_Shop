//
//  LoginViewModel.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 14.04.2022.
//

import UIKit
import Firebase

final class LoginViewModel {
    
    private lazy var requestFactory = RequestFactory()
    
    func sendLoginRequest(user: User, completion: @escaping (Int) -> Void) {
        let request = requestFactory.makeAuthRequestFactory()
        var requestResult: Int = 0
        
        request.login(user: user) { response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let result):
                    print(result)
                    requestResult = result.result
                case .failure(let error):
                    print(error.localizedDescription)
                }
                completion(requestResult)
            }
        }
    }
}
