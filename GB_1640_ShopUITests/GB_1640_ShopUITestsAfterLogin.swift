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

    func testTabBar() throws {
        login()
        
        let tabBar = app.tabBars.matching(identifier: "mainTabBar")
        tabBar.buttons.element(boundBy: 1).tap()
        
        let navBarBasket = app.navigationBars["navBarBasket"].staticTexts["Корзина"]
        XCTAssertTrue(navBarBasket.exists)
        
        tabBar.buttons.element(boundBy: 2).tap()
        let userNameTV = scrollViewsQuery.textViews["userNameTV"]
        XCTAssertTrue(userNameTV.exists)
        
        tabBar.buttons.element(boundBy: 0).tap()
        let navBarCatalog = app.navigationBars["navBarCatalog"].staticTexts["Каталог товаров"]
        XCTAssertTrue(navBarCatalog.exists)
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
