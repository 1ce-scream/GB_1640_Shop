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
        
        let result = scrollViewsQuery.textFields["nameTF"]
        XCTAssertTrue(result.exists)
        
        let loginTextField = scrollViewsQuery.textFields["loginTF"]
        loginTextField.tap()
        loginTextField.typeText("Login")
        
        let passwordTextField = scrollViewsQuery.secureTextFields["passwordTF"]
        passwordTextField.tap()
        passwordTextField.typeText("Pass")
        
        let nameTextField = scrollViewsQuery.textFields["nameTF"]
        nameTextField.tap()
        nameTextField.typeText("Name")
        
        let lastnameTextField = scrollViewsQuery.textFields["lastnameTF"]
        lastnameTextField.tap()
        lastnameTextField.typeText("Lastname")
        
        let emailTextField = scrollViewsQuery.textFields["emailTF"]
        emailTextField.tap()
        emailTextField.typeText("some@some.com")
        
        let regButton = scrollViewsQuery.buttons["regButton"]
        regButton.tap()
        
        XCTAssertTrue(registrationButton.exists)
    }
}
