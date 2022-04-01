//
//  GB_1640_ReviewTests.swift
//  GB_1640_ShopTests
//
//  Created by Vitaliy Talalay on 01.04.2022.
//

import XCTest
@testable import GB_1640_Shop

class GB_1640_ReviewTests: XCTestCase {
    
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
    
    func testAddReviewRequest() throws {
        let expectation = expectation(description: "Review added, server returned 1")
        let request = requestFactory.makeAddReviewRequestFactory()
        var requestResult: Int = 0
        
        request.addReview(userId: 123,
                          text: "Это отзыв") { response in
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
    
    func testApproveReviewRequest() throws {
        let expectation = expectation(description: "Review approved, server returned 1")
        let request = requestFactory.makeApproveReviewRequestFactory()
        var requestResult: Int = 0
        
        request.approveReview(commentId: 123) { response in
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
    
    func testRemoveReviewRequest() throws {
        let expectation = expectation(description: "Review removed, server returned 1")
        let request = requestFactory.makeRemoveReviewRequestFactory()
        var requestResult: Int = 0
        
        request.removeReview(commentId: 123) { response in
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
    
    func testGetReviewListByIdRequest() throws {
        let expectation = expectation(description: "Review list received, amount of reviews more than 1")
        let request = requestFactory.makeGetReviewListByIdFactory()
        var requestResult: Int = 0
        
        request.getReviewListById(productId: 123) { response in
            switch response.result {
            case .success(let result):
                requestResult = result.reviewList?.count ?? 0
            case .failure:
                XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: timeout)
        XCTAssertGreaterThan(requestResult, 1)
    }
}
