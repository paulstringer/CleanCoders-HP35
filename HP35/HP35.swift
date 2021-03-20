import Foundation

func HP35() -> HP35Calculator {
	return HP35CalculatorJS()
}


protocol HP35Calculator {
	var display: String { get }
	func press(_ digit: Int)
	func press(_ key: HP35FunctionKey)
}

public enum HP35FunctionKey: String {
	case ENTER, ADD = "+", MINUS = "-", MULTIPLY = "x", DIVIDE = "÷"
}
