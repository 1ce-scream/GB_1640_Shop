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
    
    func testBasket() throws {
        login()
        
        let goodsTable = app.tables.matching(identifier: "goodsListTable")
        sleep(sleepTime)
        let goodsCell = goodsTable.cells.element(matching: .cell, identifier: "goodsCell_0")
        goodsCell.tap()
        let addTobasketButton = scrollViewsQuery.buttons["addToBasket"]
        addTobasketButton.tap()
        let alert = app.alerts["Корзина"]
        XCTAssertTrue(alert.exists)
        
        let tabBar = app.tabBars.matching(identifier: "mainTabBar")
        tabBar.buttons.element(boundBy: 1).tap()
        
        let basketTable = app.tables.matching(identifier: "basketTable")
        let basketCell = basketTable.cells.element(matching: .cell, identifier: "basketCell_0")
        let productNameLabelInCell = basketCell.staticTexts["productNameLabel"]
        basketCell.swipeLeft()
        basketCell.buttons["Delete"].tap()
        
        XCTAssertFalse(productNameLabelInCell.exists)
        
        tabBar.buttons.element(boundBy: 0).tap()
        addTobasketButton.tap()
        tabBar.buttons.element(boundBy: 1).tap()
        let anotherProductNameLabelInCell = basketCell.staticTexts["productNameLabel"]
        let cleanButton = app.navigationBars.children(matching: .button).firstMatch
        cleanButton.tap()
        
        XCTAssertFalse(anotherProductNameLabelInCell.exists)
        
        let footerButton = basketTable.children(matching: .other)["basketFooter"].children(matching: .button)["payButton"]
        footerButton.tap()
        let payAlert = app.alerts["Ошибка"]
        
        XCTAssertTrue(payAlert.exists)
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
