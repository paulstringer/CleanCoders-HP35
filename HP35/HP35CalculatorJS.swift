import Foundation
import JavaScriptCore

class HP35CalculatorJS {

	let context: JSContext

	init() {
		self.context = JSContext(virtualMachine: JSVirtualMachine())
		self.context.exceptionHandler = exceptionHandler
		loadJS()
	}

	fileprivate func loadJS() {
		let script = HP35CalculatorJS.js()
		self.context.evaluateScript(script)
	}

	// JavascriptCore

	private static func js() -> String {
		let sourceURL = Bundle.main.url(forResource: "HP35", withExtension: ".js")!
		return try! String(contentsOf: sourceURL)
	}

	private func exceptionHandler(context: JSContext?, exception: JSValue?) {
		print("Exception occured: \(exception?.toString() ?? "UNKNOWN")")
	}


}

extension HP35CalculatorJS: HP35Calculator {

	// HP35 Calculator

	var display: String {
		let value = context.evaluateScript("d")
		return value?.toString()?.trimmingCharacters(in: .whitespaces) ?? "."
	}

	func press(_ digit: Int) {
		let script = "key_num(\(digit))"
		context.evaluateScript(script)
	}

	func press(_ key: HP35FunctionKey) {
		let name = scriptName(for: key)
		let script = "key_\(name)()"
		context.evaluateScript(script)
	}

	// Javascript Script Function Mapping

	private func scriptName(for key: HP35FunctionKey) -> String {
		switch key {
		case .ADD:
			return "add"
		case .MINUS:
			return "subtract"
		case .MULTIPLY:
			return "multiply"
		case .DIVIDE:
			return "divide"
		case .ENTER:
			return "enter"
		}
	}

}
