//
//  GoodsList.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 27.03.2022.
//

import Foundation

struct GoodsList: Codable {
    let id = UUID()
    let result: Int?
    let pageNumber: Int?
    let products: [Good]
    let errorMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case result
        case pageNumber = "page_number"
        case products
        case errorMessage = "error_message"
    }
}
