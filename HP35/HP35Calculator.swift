import Foundation
import Foundation

class Calculator {

    public private(set) var register = [0.0,0.0,0.0,0.0]

	var x: Double { register[0] }
	var y: Double { register[1] }
	var z: Double { register[2] }
	var t: Double { register[3] }
    var ex: String?

	var flashError: Bool = false
	var showDecimalPoints: Bool {
		return volts.doubleValue <= 3.30
	}

	private var enteringNumber = false
    private var eex = false
	private var chs = false

	var volts: NSNumber = 0

	private func push(_ value: Double) {
		register.insert(value, at: 0)
		register.removeLast()
	}

	private func replace(_ value: Double) {
		register[0] = value
	}

	func press(_ key: String) {

		if let value = Double(key) {
			if chs {
				replace(-value)
            } else if eex {
                ex(value)
            } else {
				push(value)
			}
			enteringNumber = true
		}

		switch key {
		case "/":
			if (x == 0 ){
				flashError = true
			} else {
				push(y / x)
			}
		case "clx":
			flashError = false
			push(0)
		case "enter":
			push(x)
			enteringNumber = false
		case "clr":
			register = [0.0,0.0,0.0,0.0]
		case "chs":
			if enteringNumber {
				replace(-x)
			} else {
				replace(0)
				chs = true
			}
        case "eex":
            if !enteringNumber {
                push(1)
                ex(0)
            }
            eex = true
		default:
			return
		}
	}

    private let exFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimumIntegerDigits = 2
        return formatter
    }()

    private func ex(_ value: Double) {
        ex = exFormatter.string(for: value)
    }

}
