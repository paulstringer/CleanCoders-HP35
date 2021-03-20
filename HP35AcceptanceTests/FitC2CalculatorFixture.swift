//
//  Calculator.swift
//  HP35AcceptanceTests
//
//  Created by paulstringer on 18/03/2021.
//

import Foundation
import HP35

@objc(Calculator)

class FitC2CalculatorFixture: NSObject {

	// Calculator Outputs
	@objc var x: Int {
		return calculator.r[0]
	}
	@objc var y: Int {
		return calculator.r[1]
	}
	@objc var z: Int {
		return calculator.r[2]
	}
	@objc var t: Int {
		return calculator.r[3]
	}

	// Low Battery Inputs
	@objc var volts: NSNumber = 0.00
	@objc var watts: NSNumber = NSNumber(floatLiteral: 0.500)

	// System Under Test
	private let calculator = HP35CalculatorFitC2()

	@objc var key: String = "" {
		didSet {
			if let numeric = Int(key) {
				calculator.press(numeric)
			} else {
				calculator.press(key)
			}
		}
	}

	@objc var points: Bool {
		false
	}

	@objc var flash: Bool {
		false
	}



}

