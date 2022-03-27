//
//  GoodsCatalog.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 27.03.2022.
//

import Foundation

struct GoodsCatalog: Codable {
    let id: Int
    let productName: String
    let productPrice: Double
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case productName = "product_name"
        case productPrice = "price"
    }
}
