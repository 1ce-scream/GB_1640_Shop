//
//  BasketSingleton.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 25.04.2022.
//

import Foundation

final class BasketSingleton {
    public static let shared = BasketSingleton()
    
    var basket = [Good]()
    
    private init() {}
}
