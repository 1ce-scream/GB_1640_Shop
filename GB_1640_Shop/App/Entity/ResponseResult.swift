//
//  ResponseResult.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 10.03.2022.
//

import Foundation

struct ResponseResult: Codable {
    let result: Int
    let userMessage: String?
    let errorMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case result
        case userMessage = "user_message"
        case errorMessage = "error_message"
    }
}
