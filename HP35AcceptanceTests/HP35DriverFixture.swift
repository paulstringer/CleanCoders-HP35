//
//  HP35DriverFixture.swift
//  HP35AcceptanceTests
//
//  Created by paulstringer on 27/02/2021.
//

import Foundation

@objc(HP35Driver)

class HP35Driver: NSObject {

	let calc = HP35()

	@objc
	var see: String {
		calc.display
	}

	@objc
	func press(_ key: String) {

		if let functionKey = HP35FunctionKey(rawValue: key) {
			calc.press(functionKey)
		} else if let digit = Int(key) {
			calc.press(digit)
		}

	}

}
