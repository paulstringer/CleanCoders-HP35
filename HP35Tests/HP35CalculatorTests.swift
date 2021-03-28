//
//  HP35CalculatorFitTests.swift
//  HP35Tests
//
//  Created by paulstringer on 20/03/2021.
//

import XCTest
@testable import HP35

class HP35CalculatorTests: XCTestCase {

	var calc: Calculator!

	override func setUp() {
		calc = Calculator()
	}

	func testEnteringNumbers() {
		calc.press("100")
		XCTAssertEqual(calc.x, 100)
	}

	func testDivideByZero() {
		calc.press("100")
		calc.press("enter")
		calc.press("0")
		calc.press("/")
		XCTAssertTrue(calc.flashError)
	}

	func testDivideByZeroClx() {
		calc.press("100")
		calc.press("enter")
		calc.press("0")
		calc.press("/")
		calc.press("clx")
		XCTAssertFalse(calc.flashError)
	}

	func testDivideByNumber() {
		calc.press("100")
		calc.press("enter")
		calc.press("1")
		calc.press("/")
		XCTAssertFalse(calc.flashError)
	}

	func testDivide() {
		calc.press("100")
		calc.press("enter")
		calc.press("2")
		calc.press("/")
		XCTAssertEqual(calc.x, 50)
	}

	func testDivideByZeroXZero() {
		calc.press("100")
		calc.press("enter")
		calc.press("0")
		calc.press("/")
		XCTAssertEqual(calc.x, 0)
	}

	func testRegisterSize() {
		XCTAssertEqual(calc.register.count, 4)
		calc.press("100")
		XCTAssertEqual(calc.register.count, 4)
	}

}
