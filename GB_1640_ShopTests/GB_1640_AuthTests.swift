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

    override func setUpWithError() throws {
        requestFactory = RequestFactory()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        requestFactory = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoginRequest() throws {
        let expectation = expectation(description: "Login complete, server returned 1")
        let request = requestFactory.makeAuthRequestFatory()
        var requestResult = 0
        
        request.login(username: "Somebody",
                      password: "Password") { response in
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
        let request = requestFactory.makeLogOutRequestFactory()
        var requestResult = 0
        
        request.logOut(userID: 1) { response in
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
        let request = requestFactory.makeRegistrationRequestFactory()
        var requestResult = 0
        
        request.registration(userID: 123,
                             username: "Somebody",
                             password: "mypassword",
                             email: "email",
                             gender: "m",
                             creditCard: "1234-5678-9876",
                             biography: "Smth") { response in
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
        let request = requestFactory.makeChangeUserDataFactory()
        var requestResult = 0
        
        request.changeUserData(userID: 123,
                               username: "Somebody2",
                               password: "mypassword2",
                               email: "email2") { response in
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
