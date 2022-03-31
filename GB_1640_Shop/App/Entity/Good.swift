//
//  Good.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 27.03.2022.
//

import Foundation

struct Good: Codable {
    let id: Int?
    let result: Int?
    let productName: String
    let productPrice: Double
    let productDescription: String?
    let error_message: String?
    
    enum CodingKeys: String, CodingKey {
        case result
        case id = "id_product"
        case productName = "product_name"
        case productPrice = "product_price"
        case productDescription = "product_description"
        case error_message
    }
}
