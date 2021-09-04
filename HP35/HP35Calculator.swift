import Foundation
import Foundation

class Calculator {

    private(set) var register = [0.0,0.0,0.0,0.0]

	var x: Double { register[0] }
	var y: Double { register[1] }
	var z: Double { register[2] }
	var t: Double { register[3] }
    var ex: String?
    var display: String {
        "\(x)".trimmingCharacters(in: CharacterSet(charactersIn: "0"))
    }
    
	var flashError: Bool = false
	var showDecimalPoints: Bool {
		return volts.doubleValue <= 3.30
	}

	private var enteringNumber = false
    private var eex = false
	private var chs = false

	var volts: NSNumber = 0

	private func push() {
        for i in (1...3).reversed() {
            register[i] = register[i-1]
        }
	}

    private func pop() -> Double {
        let value = register[0]
        for i in 0...2 {
            register[i] = register[i+1]
        }
        return value
    }


	private func push(_ value: Double) {
        push()
		register[0] = value
	}

	func press(_ key: String) {

		if let numeric = Double(key) {
			if chs {
				register[0] = -numeric
            } else if eex {
                ex(numeric)
            } else if enteringNumber {
				push(numeric)
            } else {
                register[0] = numeric
            }
			enteringNumber = true
		}

		switch key {
		case "/":
			if (x == 0 ){
				flashError = true
			} else {
                let t = pop()
                push(pop() / t)
			}
        case "x":
            push(pop() * pop())
        case "+":
            push(pop() + pop());
		case "clx":
			flashError = false
			push(0)
		case "enter":
			push()
			enteringNumber = false
		case "clr":
			register = [0.0,0.0,0.0,0.0]
		case "chs":
			if enteringNumber {
                register[0] = -x
			} else {
				register[0] = 0
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
