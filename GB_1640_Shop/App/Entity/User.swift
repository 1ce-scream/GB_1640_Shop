//
//  User.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 10.03.2022.
//

import Foundation

struct User: Codable {
    let id: Int
    let login: String
    let password: String
    let name: String
    let lastname: String
    let biography: String
    let creditcard: String
    let gender: String
    var email: String

    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case login = "user_login"
        case password = "user_password"
        case name = "user_name"
        case lastname = "user_lastname"
        case biography = "user_biography"
        case creditcard, email, gender
    }
    
    init(id: Int = 123,
         login: String = "Somebody",
         password: String = "Password",
         name: String = "Name",
         lastname: String = "Lastname",
         biography: String = "Bio bio bio bio bio bio bio bio bio bio bio bio",
         creditcard: String = "1234-1234-1234",
         email: String = "some@some.com",
         gender: String = "X") {
        
        self.id = id
        self.login = login
        self.password = password
        self.name = name
        self.lastname = lastname
        self.biography = biography
        self.creditcard = creditcard
        self.email = email
        self.gender = gender
    }
}

// public struct DemoData {
//   static func returnUser() -> User {
//        return User(id: 123,
//                    login: "Somebody",
//                    password: "Password",
//                    name: "Name",
//                    lastname: "Lastname",
//                    biography: "Bio bio bio bio bio bio bio bio bio bio bio bio",
//                    creditcard: "1234-1234-1234",
//                    email: "some@some.com",
//                    gender: "X")
//    }
// }
