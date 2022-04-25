//
//  GB_1640_ShopUITestsAfterLogin.swift
//  GB_1640_ShopUITests
//
//  Created by Vitaliy Talalay on 25.04.2022.
//

import XCTest

class GB_1640_ShopUITestsAfterLogin: XCTestCase {

    var app: XCUIApplication!
    var scrollViewsQuery: XCUIElementQuery!
    
    private let sleepTime: UInt32 = 2
    
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
    
    func testGoodsCatalog() throws {
        login()
        
        let goodsTable = app.tables.matching(identifier: "goodsListTable")
        
        sleep(sleepTime)
        
        let goodsCell = goodsTable.cells.element(matching: .cell, identifier: "goodsCell_0")
        
        let productNameLabelInCell = goodsCell.staticTexts["productNameLabel"].label
        goodsCell.tap()
        
        let productNameLabelInDetailView = scrollViewsQuery.staticTexts["productName"].label
        
        XCTAssertEqual(productNameLabelInCell, productNameLabelInDetailView)
    }

    private func login() {
        let loginTextField = scrollViewsQuery.textFields["loginTF"]
        loginTextField.tap()
        loginTextField.typeText("Somebody")
        
        let passwordTextField = scrollViewsQuery.secureTextFields["passwordTF"]
        passwordTextField.tap()
        passwordTextField.typeText("Password")
        
        let loginButton = scrollViewsQuery.buttons["loginButton"]
        loginButton.tap()
    }
}
