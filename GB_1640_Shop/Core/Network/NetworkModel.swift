//
//  NetworkModel.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 14.04.2022.
//

import Foundation

protocol NetworkModel {
    associatedtype T
    func send(_: T)
}
