import Foundation

internal class HP35CalculatorSwift: HP35Calculator {

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

	func press(_ key: HP35FunctionKey) {
		
		switch key {
		case .ENTER:
			y = x
		case .ADD:
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
