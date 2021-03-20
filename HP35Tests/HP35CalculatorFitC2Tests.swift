//
//  HP35CalculatorFitTests.swift
//  HP35Tests
//
//  Created by paulstringer on 20/03/2021.
//

import XCTest
@testable import HP35

class HP35CalculatorFitC2Tests: XCTestCase {

	var calculator: HP35CalculatorFitC2!

    override func setUpWithError() throws {
        calculator =  HP35CalculatorFitC2()
    }

	func testNumericKeyPushesX() {
		calculator.press(100)
		XCTAssertEqual(calculator.r[0], 100)
	}

	func testRegisterCount() {
		XCTAssertEqual(calculator.r.count, 4)
	}

	func testPushRegisterLimit() {
		calculator.press(100)
		XCTAssertEqual(calculator.r.count, 4)
	}

	func testEnterKeyPushesY() {
		calculator.press(100)
		calculator.press("enter")
		XCTAssertEqual(calculator.r[1], 100)
	}

	func testEnterKeyPushesZ() {
		calculator.press(100)
		calculator.press("enter")
		calculator.press("enter")
		XCTAssertEqual(calculator.r[2], 100)
	}

	func testEnterKeyPushesT() {
		calculator.press(100)
		calculator.press("enter")
		calculator.press("enter")
		calculator.press("enter")
		XCTAssertEqual(calculator.r[3], 100)
	}

	func testChsFirstEntryNegativeNumbersBasic() {
		calculator.press("chs")
		XCTAssertEqual(calculator.r[0], 0)
		calculator.press(33)
		XCTAssertEqual(calculator.r[0], -33)
	}

	func testChsStartsNewNumberEntry() {
		calculator.press(33) // Number Entry Mode Started
		calculator.press("enter") // Number Entry Mode Stopped
		calculator.press("chs")
		XCTAssertEqual(calculator.r[0], 0)
	}

	func testChsFirstEntryNegativeNumbers() {
		calculator.press(33) // Number Entry Mode Started
		XCTAssertEqual(calculator.r[0], 33)
		calculator.press("chs")
		XCTAssertEqual(calculator.r[0], -33)
		calculator.press("enter") // Number Entry Mode Stopped
		XCTAssertEqual(calculator.r[1], -33)
		calculator.press("chs") // New number entry
		XCTAssertEqual(calculator.r[0],0)
		XCTAssertEqual(calculator.r[1], -33)
		calculator.press(4) // And may be used as the first entry when entering negative numbers - HP35 Instructions
		XCTAssertEqual(calculator.r[0], -4)
		XCTAssertEqual(calculator.r[1], -33) // As CHS only affects X nothing is pushed

	}

}
