//
//  User.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 10.03.2022.
//

import Foundation

struct User: Codable {
    let id: Int?
    let login: String?
    let password: String?
    let name: String?
    let lastname: String?
    let biography: String?
    let creditcard: String?
    let email: String?
    let gender: String?

    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case login = "user_login"
        case password = "user_password"
        case name = "user_name"
        case lastname = "user_lastname"
        case biography = "user_biography"
        case creditcard, email, gender
    }
}

public struct DemoData {
   static func returnUser() -> User {
        return User(id: 123,
                    login: "Somebody",
                    password: "Password",
                    name: "Name",
                    lastname: "Lastname",
                    biography: "Bio bio bio bio bio bio bio bio bio bio bio bio",
                    creditcard: "1234-1234-1234",
                    email: "some@some.com",
                    gender: "X")
    }
}
