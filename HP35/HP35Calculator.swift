//
//  HP35Calculator.swift
//  HP35
//
//  Created by paulstringer on 27/02/2021.
//

import Foundation

class HP35Calculator {

	enum FunctionKey: String {
		case ENTER, PLUS = "+", MINUS = "-", MULTIPLY = "x", DIVIDE = "÷"
	}

	var display: String {
		return "\(x)."
	}

	var x: Int = 0
	var y: Int?

	func press(_ digit: Int) {
		if (y == nil) {
			x = Int("\(x)\(digit)") ?? 0
		} else {
			x = digit
		}
	}

	func press(_ key: FunctionKey) {
		
		switch key {
		case .ENTER:
			y = x
		case .PLUS:
			x = (y ?? 0) + x
		case .MINUS:
			x = (y ?? 0) - x
		case .MULTIPLY:
			x = (y ?? 0) * x
		case .DIVIDE:
			x = (y ?? 0) / x
		}
	}

	
}
