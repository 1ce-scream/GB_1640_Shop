//
//  UserDataViewModel.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 14.04.2022.
//

import Foundation

class UserDataViewModel {
    
    private let requestFactory = RequestFactory()
    
    func sendChageUserDataRequest(email: String) {
        let request = requestFactory.makeAuthRequestFactory()
        request.changeUserData(userID: 123,
                               username: "Somebody",
                               password: "Password",
                               email: email) { response in
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
