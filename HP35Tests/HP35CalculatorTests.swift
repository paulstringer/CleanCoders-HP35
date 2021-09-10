import XCTest
@testable import HP35

class HP35CalculatorTests: XCTestCase {

	var calc: Calculator!

	override func setUp() {
		calc = Calculator()
	}

    func testInitialDisplay() {
        XCTAssertEqual(calc.display, "0.")
    }

	func testEnteringNumbers() {
		calc.press("100")
		XCTAssertEqual(calc.x, 100)
	}

	func testDivideByZero() {
		calc.press("100")
		calc.press("enter")
		calc.press("0")
		calc.press("÷")
		XCTAssertTrue(calc.flashError)
	}

	func testDivideByZeroClx() {
		calc.press("100")
		calc.press("enter")
		calc.press("0")
		calc.press("÷")
		calc.press("clx")
		XCTAssertFalse(calc.flashError)
	}

	func testDivideByNumber() {
		calc.press("100")
		calc.press("enter")
		calc.press("1")
		calc.press("÷")
		XCTAssertFalse(calc.flashError)
	}

	func testDivide() {
		calc.press("100")
		calc.press("enter")
		calc.press("2")
		calc.press("÷")
		XCTAssertEqual(calc.x, 50)
	}

	func testDivideByZeroXZero() {
		calc.press("100")
		calc.press("enter")
		calc.press("0")
		calc.press("÷")
		XCTAssertEqual(calc.x, 0)
	}

	func testRegisterSize() {
		XCTAssertEqual(calc.register.count, 4)
		calc.press("100")
		XCTAssertEqual(calc.register.count, 4)
	}

    func testRPNStack() {
        calc.press("4")
        calc.press("enter")
        calc.press("3")
        calc.press("enter")
        calc.press("2")
        calc.press("enter")
        calc.press("1")
        assertStack(1, 2, 3, 4)
        calc.press("enter")
        calc.press("5")
        assertStack(5, 1, 2, 3)
        calc.press("enter")
        assertStack(5, 5, 1, 2)
        calc.press("8")
        assertStack(8, 5, 1, 2)
    }

    func testRPNStackAddition() {
        calc.press("4")
        calc.press("enter")
        calc.press("3")
        calc.press("enter")
        calc.press("2")
        calc.press("enter")
        calc.press("1")
        calc.press("enter")
        calc.press("5")
        calc.press("enter")
        calc.press("8")
        calc.press("+")
        assertStack(13, 1, 2, 2)
    }

    func testRPNStackProductsDivision() {
        calc.press("4")
        assertStack(4, 0, 0, 0)
        calc.press("enter")
        assertStack(4, 4, 0, 0)
        calc.press("5")
        assertStack(5, 4, 0, 0)
        calc.press("+")
        assertStack(9, 0, 0, 0)
        calc.press("6")
        assertStack(6, 9, 0, 0)
        calc.press("enter")
        assertStack(6, 6, 9, 0)
        calc.press("7")
        calc.press("+")
        calc.press("÷")
        assertStack(0.6923076923, 0, 0, 0)
        XCTAssertEqual(calc.display, ".6923076923")
    }

    func testDecimalLeadingZeroDisplay() {
        calc.press(".54")
        XCTAssertEqual(".54", calc.display)
    }

    func testDecimalTrailingZeroDisplay() {
        calc.press(".5400000")
        XCTAssertEqual(".54", calc.display)
    }

    func testMultipleNumberKeyPresses() {
        calc.press("1")
        calc.press("2")
        assertStack(12, 0, 0, 0)
    }

    func testMultipleNumberDecimalKeyPresses() {
        calc.press("1")
        calc.press(".")
        calc.press("5")
        assertStack(1.5, 0, 0, 0)
    }

    func testPowerKey() {
        calc.press("1")
        calc.press(".")
        calc.press("5")
        calc.press("chs")
        calc.press("enter")
        assertStack(-1.5, -1.5, 0, 0)
        calc.press("4")
        calc.press("x^y")
        assertStack(0.125, 0, 0, 0)
    }

    func assertStack(_ x: Double, _ y: Double, _ z: Double, _ t: Double) {
        XCTAssertEqual(x, calc.x, accuracy: 0.01, "X")
        XCTAssertEqual(y, calc.y, accuracy: 0.01, "Y")
        XCTAssertEqual(z, calc.z, accuracy: 0.01, "Z")
        XCTAssertEqual(t, calc.t, accuracy: 0.01, "T")
    }

}
