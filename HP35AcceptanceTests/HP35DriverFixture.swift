//
//  HP35DriverFixture.swift
//  HP35AcceptanceTests
//
//  Created by paulstringer on 27/02/2021.
//

import Foundation


@objc(HP35Driver)

class HP35Driver: NSObject {

	let calc = HP35Calculator()

	@objc
	var see: String {
		calc.display
	}

	@objc
	func press(_ key: String) {

		if let functionKey = HP35Calculator.FunctionKey(rawValue: key) {
			calc.press(functionKey)
		} else if let digit = Int(key) {
			calc.press(digit)
		}

	}

}
