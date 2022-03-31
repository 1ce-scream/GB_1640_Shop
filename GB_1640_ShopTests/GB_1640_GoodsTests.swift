//
//  GB_1640_GoodsTests.swift
//  GB_1640_ShopTests
//
//  Created by Vitaliy Talalay on 27.03.2022.
//

import XCTest
@testable import GB_1640_Shop

class GB_1640_GoodsTests: XCTestCase {

    let timeout: TimeInterval = 5
    var requestFactory: RequestFactory!
    
    override func setUpWithError() throws {
        requestFactory = RequestFactory()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        requestFactory = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetGoodsCatalogRequest() throws {
        let expectation = expectation(description: "Have a catalog with 2 goods")
        let request = requestFactory.makeGoodsCatalogRequestFactory()
        var requestResult: [Good] = []
        
        request.getGoodsCatalog(pageNumber: 1,
                                categoryId: 1) { response in
            print(response)
            switch response.result {
            case .success(let result):
                requestResult = result.products
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
        
        request.getGoodByID(productId: 123) { response in
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

