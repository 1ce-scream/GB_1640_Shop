//
//  GB_1640_AuthTests.swift
//  GB_1640_ShopTests
//
//  Created by Vitaliy Talalay on 27.03.2022.
//

import XCTest
@testable import GB_1640_Shop

class GB_1640_AuthTests: XCTestCase {
    
    let timeout: TimeInterval = 5
    var requestFactory: RequestFactory!
    var user: User!

    override func setUpWithError() throws {
        requestFactory = RequestFactory()
        user = User(id: 1)
    }

    override func tearDownWithError() throws {
        requestFactory = nil
        user = nil
    }

    func testLoginRequest() throws {
        let expectation = expectation(description: "Login complete, server returned 1")
        let request = requestFactory.makeAuthRequestFactory()
        var requestResult = 0
        
        request.login(user: self.user) { response in
            switch response.result {
            case .success(let result):
                requestResult = result.result
            case .failure(_):
                XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: timeout)
        XCTAssertEqual(requestResult, 1)
    }
    
    func testLogoutRequest() throws {
        let expectation = expectation(description: "Logout complete, server returned 1")
        let request = requestFactory.makeAuthRequestFactory()
        var requestResult = 0
        
        request.logOut(user: self.user) { response in
            switch response.result {
            case .success(let result):
                requestResult = result.result
            case .failure(_):
               XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: timeout)
        XCTAssertEqual(requestResult, 1)
        
    }
    
    func testRegistrationRequest() throws {
        let expectation = expectation(description: "Registration complete, server returned 1")
        let request = requestFactory.makeAuthRequestFactory()
        var requestResult = 0
        
        request.registration(user: self.user) { response in
            switch response.result {
            case .success(let result):
                requestResult = result.result
            case .failure(_):
                XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: timeout)
        XCTAssertEqual(requestResult, 1)
    }
    
    func testChangeUserDataRequest() throws {
        let expectation = expectation(description: "User data was changed, server  returned 1")
        let request = requestFactory.makeAuthRequestFactory()
        var requestResult = 0
        
        request.changeUserData(user: self.user) { response in
            switch response.result {
            case .success(let result):
                requestResult = result.result
            case .failure(_):
               XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: timeout)
        XCTAssertEqual(requestResult, 1)
    }

}
