//
//  GoodsCatalogRequestFactory.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 27.03.2022.
//

import Foundation
import Alamofire

protocol GoodsCatalogRequestFactory {
     func getGoodsCatalog(pageNumber: Int,
                          categoryId: Int,
                          completionHandler: @escaping (AFDataResponse<[GoodsCatalog]>) -> Void)
 }
