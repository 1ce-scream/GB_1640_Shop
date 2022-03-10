//
//  ErrorParser.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 10.03.2022.
//

import Foundation

class ErrorParser: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return result
    }
    
    func parse(response _: HTTPURLResponse?,
               data _: Data?,
               error: Error?) -> Error? {
        return error
    }
}
