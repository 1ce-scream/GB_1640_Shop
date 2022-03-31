//
//  GB_1640_AuthTests.swift
//  GB_1640_ShopTests
//
//  Created by Vitaliy Talalay on 27.03.2022.
//

import XCTest
@testable import GB_1640_Shop

class GB_1640_AuthTests: XCTestCase {
    
    let requestFactory = RequestFactory()
    let timeout: TimeInterval = 5

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoginRequest() throws {
        let expectation = expectation(description: "Login complete")
        let request = requestFactory.makeAuthRequestFatory()
        var requestResult = 0
        
        request.login(userName: "Somebody",
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
        let expectation = expectation(description: "Logout complete")
        let request = requestFactory.makeLogOutRequestFactory()
        
        request.logOut(userID: 1) { response in
            switch response.result {
            case .success(_):
                break
            case .failure(_):
               XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: timeout)
        
    }
    
    func testRegistrationRequest() throws {
        let expectation = expectation(description: "Registration complete")
        let request = requestFactory.makeRegistrationRequestFactory()
        
        request.registration(userID: 123,
                             userName: "Somebody",
                             password: "mypassword",
                             email: "email") { response in
            switch response.result {
            case .success(_):
                break
            case .failure(_):
                XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: timeout)
    }
    
    func testChangeUserDataRequest() throws {
        let expectation = expectation(description: "User data was changed")
        let request = requestFactory.makeChangeUserDataFactory()
        
        request.changeUserData(userID: 123,
                               userName: "Somebody2",
                               password: "mypassword2",
                               email: "email2") { response in
            switch response.result {
            case .success(_):
               break
            case .failure(_):
               XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: timeout)
    }

}
