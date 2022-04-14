//
//  RegistrationViewModel.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 14.04.2022.
//

import UIKit

class RegistrationViewModel {
    
    private let requestFactory = RequestFactory()
    
    func sendRegistrationRequest(login: String,
                                 password: String,
                                 email: String,
                                 biography: String) {
        let request = requestFactory.makeAuthRequestFactory()
        request.registration(userID: 123,
                             username: login,
                             password: password,
                             email: email,
                             gender: "X",
                             creditCard: "1234-1234-1234",
                             biography: biography) { response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let login):
                    print(login)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
