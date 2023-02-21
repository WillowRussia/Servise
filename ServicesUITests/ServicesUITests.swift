//
//  ServicesUITests.swift
//  ServicesUITests
//
//  Created by Willow on 18.02.2023.
//

import XCTest

final class ServicesUITests: XCTestCase {

    override func setUpWithError() throws {
        
        
        continueAfterFailure = false

       
    }

    override func tearDownWithError() throws {
       
    }

    func testExample() throws {
        // Проверка приложения на переход по ссылке
        let app = XCUIApplication()
        app.launch()
        
        app.tables.cells.staticTexts["ВКонтакте"].tap()
        app.buttons.staticTexts["https://vk.com/"].tap()
        
        XCTAssert(app.staticTexts["ВКонтакте"].exists)

        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
          
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
