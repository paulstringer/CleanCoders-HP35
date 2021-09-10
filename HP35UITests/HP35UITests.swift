//
//  HP35UITests.swift
//  HP35UITests
//
//  Created by paulstringer on 10/09/2021.
//

import XCTest

class HP35UITests: XCTestCase {

    func testExample() throws {

        let app = XCUIApplication()
        app.launch()
        continueAfterFailure = false

        XCTAssertTrue(app.staticTexts["0."].exists)
        
        app.buttons["2"].tap()
        app.buttons["ENTER"].tap()
        app.buttons["3"].tap()
        app.buttons["+"].tap()
        XCTAssertTrue(app.staticTexts["5."].exists)

        app.buttons["4"].tap()
        app.buttons["x"].tap()
        XCTAssertTrue(app.staticTexts["20."].exists)

        app.buttons["5"].tap()
        app.buttons["÷"].tap()
        XCTAssertTrue(app.staticTexts["4."].exists)

        app.buttons["3"].tap()
        app.buttons["0"].tap()
        app.buttons["sin"].tap()
        XCTAssertTrue(app.staticTexts[".5"].exists)

        app.buttons["÷"].tap()
        XCTAssertTrue(app.staticTexts["8."].exists)

        app.buttons["1"].tap()
        app.buttons["."].tap()
        app.buttons["5"].tap()
        app.buttons["CH S"].tap()
        app.buttons["ENTER"].tap()
        XCTAssertTrue(app.staticTexts["-1.5"].exists)

        app.buttons["4"].tap()
        app.buttons["x^y"].tap()
        XCTAssertTrue(app.staticTexts[".125"].exists)

        app.buttons["x"].tap()
        XCTAssertTrue(app.staticTexts["1."].exists)
    }

}
