//
//  ReviewListResponseResult.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 01.04.2022.
//

import Foundation

struct ReviewListResponseResult: Codable {
    let result: Int
    let reviewList: [Reviews]?
    let errorMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case result
        case reviewList
        case errorMessage = "error_message"
    }
}
