//
//  RegistrationViewModel.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 14.04.2022.
//

import UIKit

final class RegistrationViewModel {
    
    private lazy var requestFactory = RequestFactory()

    func sendRegistrationRequest(user: User) {
        let request = requestFactory.makeAuthRequestFactory()
        request.registration(user: user) { response in
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
