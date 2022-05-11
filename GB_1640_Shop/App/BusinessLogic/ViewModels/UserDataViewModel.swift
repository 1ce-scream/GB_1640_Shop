//
//  UserDataViewModel.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 14.04.2022.
//

import Foundation

final class UserDataViewModel {
    
    private lazy var requestFactory = RequestFactory()
    
    func sendChageUserDataRequest(user: User) {
        let request = requestFactory.makeAuthRequestFactory()
        request.changeUserData(user: user) { response in
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
    
    func sendLogoutRequest(user: User) {
        let request = requestFactory.makeAuthRequestFactory()
        request.logOut(user: user) { response in
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
