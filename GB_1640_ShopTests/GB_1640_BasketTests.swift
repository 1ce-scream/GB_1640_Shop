//
//  GB_1640_BasketTests.swift
//  GB_1640_ShopTests
//
//  Created by Vitaliy Talalay on 11.04.2022.
//

import XCTest
@testable import GB_1640_Shop

class GB_1640_BasketTests: XCTestCase {

    let timeout: TimeInterval = 5
    var requestFactory: RequestFactory!
    
    override func setUpWithError() throws {
        requestFactory = RequestFactory()
    }

    override func tearDownWithError() throws {
        requestFactory = nil
    }

    func testAddToBasketRequest() throws {
        let expectation = expectation(description: "Good added to basket, server returned 1")
        let request = requestFactory.makeBasketRequestFactory()
        var requestResult: Int = 0
        
        request.add(productId: 123,
                    quantity: 1) { response in
            print(response)
            switch response.result {
            case .success(let result):
                requestResult = result.result
            case .failure:
                XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: timeout)
        XCTAssertEqual(requestResult, 1)
    }
    
    func testRemoveFromBasketRequest() throws {
        let expectation = expectation(description: "Good removed from basket, server returned 1")
        let request = requestFactory.makeBasketRequestFactory()
        var requestResult: Int = 0
        
        request.remove(productId: 123) { response in
            switch response.result {
            case .success(let result):
                requestResult = result.result
            case .failure:
                XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: timeout)
        XCTAssertEqual(requestResult, 1)
    }
    
    func testPayBasketRequest() throws {
        let expectation = expectation(description: "Server returned 1")
        let request = requestFactory.makeBasketRequestFactory()
        var requestResult: Int = 0
        
        request.pay() { response in
            switch response.result {
            case .success(let result):
                requestResult = result.result
            case .failure:
                XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: timeout)
        XCTAssertEqual(requestResult, 1)
    }
    
}
