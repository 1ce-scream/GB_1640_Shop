//
//  GB_1640_GoodsTests.swift
//  GB_1640_ShopTests
//
//  Created by Vitaliy Talalay on 27.03.2022.
//

import XCTest
@testable import GB_1640_Shop

class GB_1640_GoodsTests: XCTestCase {

    let requestFactory = RequestFactory()
    let timeout: TimeInterval = 5
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetGoodsCatalogRequest() throws {
        let expectation = expectation(description: "Have a catalog with 2 goods")
        let request = requestFactory.makeGoodsCatalogRequestFactory()
        var requestResult: [GoodsCatalog] = []
        
        request.getGoodsCatalog(pageNumber: 1,
                                categoryId: 1) { response in
            
            switch response.result {
            case .success(let result):
                requestResult = result
            case .failure:
                XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: timeout)
        
        XCTAssertEqual(requestResult.count, 2)
    }
    
    func testGetGoodByIDRequests() throws {
        let expectation = expectation(description: "Have a good")
        let request = requestFactory.makeGoodRequestFactory()
        var productName = ""
        
        request.getGoodByID(productId: 1) { response in
            switch response.result {
            case let .success(result):
                productName = result.productName
            case .failure:
                XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: timeout)
        
        XCTAssertEqual(productName, "Ноутбук")
    }
}

