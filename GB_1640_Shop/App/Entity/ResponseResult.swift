//
//  ResponseResult.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 10.03.2022.
//

import Foundation

struct ResponseResult: Codable {
    let result: Int
    let user_message: String?
    let error_message: String?
}
