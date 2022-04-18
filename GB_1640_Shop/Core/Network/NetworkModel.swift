//
//  NetworkModel.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 14.04.2022.
//

import Foundation
import Alamofire

protocol NetworkModel {
    associatedtype T
    associatedtype U
    func send(_: T, completion: @escaping (AFDataResponse<U>) -> Void)
}
