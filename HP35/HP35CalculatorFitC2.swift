import Foundation

final public class HP35CalculatorFitC2 {

	private var mode: Mode?
	private(set) var r = [Int]()

	init() {
		clear()
	}

	func press(_ key: Int) {
		switch mode {
		case .chs: chs(key)
		default: pushOnStack(key)
		}
		mode = .entering

	}

	func press(_ key: String) {

		switch key {
		case "enter":
			enter()
		case "clr":
			clear()
		case "clx":
			clx()
		case "chs":
			chs()
		case "+":
			add()
		case "*":
			multiply()
		default:
			return
		}

	}

	fileprivate func add() {
		let newValue = r[0] + r[1]
		pushOnStack(newValue)
	}

	fileprivate func multiply() {
		let newValue = r[0] * r[1]
		pushOnStack(newValue)
	}

	fileprivate func pushOnStack(_ value: Int? = nil) {
		switch value {
		case .none:
			r.insert(r[0], at: 0)
		case .some(let value):
			r.insert(value, at: 0)
		}
		r.removeLast()
	}

	fileprivate func clear() {
		r = Array(repeating: 0, count: 4)
	}

	fileprivate func clx() {
		r[0] = 0
	}

	fileprivate func enter() {
		mode = nil
		pushOnStack()
	}

	fileprivate func chs(_ value: Int? = nil) {
		switch mode {
		case .none:
			clx()
			mode = .chs
		default:
			r[0] = -(value ?? r[0])
		}
	}


	enum Mode {
		case entering, chs
	}
}
