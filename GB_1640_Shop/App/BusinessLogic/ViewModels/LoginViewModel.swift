//
//  LoginViewModel.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 14.04.2022.
//

import UIKit

class LoginViewModel {
    
    private lazy var requestFactory = RequestFactory()
    
    func sendLoginRequest(user: User) {
        let request = requestFactory.makeAuthRequestFactory()
        request.login(user: user) { response in
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
    
    func checkUserData(login: String, password: String) -> Bool {
        guard login == "Somebody" && password == "Password"
        else { return false }
        return true
    }
}
