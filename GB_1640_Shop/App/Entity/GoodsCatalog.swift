//
//  GoodsCatalog.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 27.03.2022.
//

import Foundation

struct GoodsCatalog: Codable {
    let id = UUID()
    let result: Int?
    let page_number: Int?
    let products: [Good]
    let error_message: String?
    
    
    enum CodingKeys: String, CodingKey {
        case result, page_number
        case products
        case error_message
    }
}
