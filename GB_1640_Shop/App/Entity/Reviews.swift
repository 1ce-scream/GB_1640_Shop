//
//  Reviews.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 21.04.2022.
//

import Foundation

struct Reviews: Codable {
    let author: String
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case author
        case text
    }
}
