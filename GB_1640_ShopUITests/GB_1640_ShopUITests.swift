//
//  GB_1640_ShopUITests.swift
//  GB_1640_ShopUITests
//
//  Created by Vitaliy Talalay on 03.03.2022.
//

import XCTest

class GB_1640_ShopUITests: XCTestCase {

    var app: XCUIApplication!
    var scrollViewsQuery: XCUIElementQuery!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        scrollViewsQuery = app.scrollViews
    }

    override func tearDownWithError() throws {
        app = nil
        scrollViewsQuery = nil
    }

    func testLogin() throws {
        let loginTextField = scrollViewsQuery.textFields["loginTF"]
        loginTextField.tap()
        loginTextField.typeText("Somebody")
        
        let passwordTextField = scrollViewsQuery.secureTextFields["passwordTF"]
        passwordTextField.tap()
        passwordTextField.typeText("Password")
        
        let loginButton = scrollViewsQuery.buttons["loginButton"]
        loginButton.tap()
        
        let result = app.navigationBars["navBarCatalog"].staticTexts["Каталог товаров"].label
        XCTAssertEqual(result, "Каталог товаров")
    }
    
    func testFailLogin() throws {
        let loginTextField = scrollViewsQuery.textFields["loginTF"]
        loginTextField.tap()
        loginTextField.typeText("Somebody")
        
        let passwordTextField = scrollViewsQuery.secureTextFields["passwordTF"]
        passwordTextField.tap()
        passwordTextField.typeText("Pass")
        
        let loginButton = scrollViewsQuery.buttons["loginButton"]
        loginButton.tap()
        
        let result = app.alerts["Ошибка"]
        XCTAssertTrue(result.exists)
    }
    
    func testRegistration() throws {
        let registrationButton = scrollViewsQuery.buttons["registrationButton"]
        registrationButton.tap()
        
//        let result = scrollViewsQuery.staticTexts.element(matching: .any, identifier: "registration").label
        let result = scrollViewsQuery.textFields["nameTF"]
        XCTAssertTrue(result.exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
