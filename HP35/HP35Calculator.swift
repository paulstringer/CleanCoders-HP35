import Foundation

protocol CalculatorBatteryPower {
    var isLowBattery: Bool  { get }
}

class Calculator {

    private(set) var register = [0.0,0.0,0.0,0.0]

	var x: Double { register[0] }
	var y: Double { register[1] }
	var z: Double { register[2] }
	var t: Double { register[3] }
    var ex: String?

    var display: String {
        let formatted = displayFormatter.string(for: x) ?? ""
        return ( x == Double.zero ) ? formatted : formatted.trimmingCharacters(in: .init(charactersIn: "0"))
    }
    
	var flashError: Bool = false
	var showDecimalPoints: Bool {
        return batteryPower?.isLowBattery ?? false /*volts.doubleValue <= 3.30*/
	}

	private var enteringNumber = false
    private var enteringDecimal = false
    private var enterOnNext = false
    private var eex = false
	private var chs = false


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
        let roundedValue = round(value * 10000000000) / 10000000000;
		register[0] = roundedValue
	}

    func press(_ numeric: Double) {

        if chs {
            register[0] = -numeric
        } else if eex {
            ex(numeric)
        } else if enteringNumber {
            if (enterOnNext) { press("enter") }
            guard let concatenatedValue = Double("\(Int(pop()))" + "\(Int(numeric))") else { return }
            push( concatenatedValue )
        } else if enteringDecimal {
            guard let concatenatedValue = Double("\(Int(pop()))" + "." + "\(Int(numeric))") else { return }
            push( concatenatedValue )
        } else {
            if (enterOnNext) { press("enter") }
            register[0] = numeric
        }

        enteringDecimal = false
        enteringNumber = true

    }

	func press(_ key: String) {

		if let numeric = Double(key) {
            press(numeric)
            return
        }

		switch key {
		case "÷":
            fallthrough
        case "/":
			if (x == 0 ){
				flashError = true
			} else {
                let t = pop()
                push(pop() / t)
			}
            enterOnNext = true
        case "x":
            push(pop() * pop())
            enterOnNext = true
        case "+":
            push(pop() + pop());
            enterOnNext = true
        case "*":
            push(pop() * pop());
            enterOnNext = true
		case "clx":
			flashError = false
			push(0)
            enterOnNext = true
		case "enter":
			push()
            enterOnNext = false
		case "clr":
			register = [0.0,0.0,0.0,0.0]
		case "chs":
			if enteringNumber {
                register[0] = -x
			} else  {
				register[0] = 0
				chs = true
			}
        case "eex":
            if !enteringNumber {
                push(1)
                ex(0)
            }
            enterOnNext = true
            eex = true
        case "sin":
            push(sin(Double.toRadians(pop())))
        case "x^y":
            push(pow(pop(), pop()))
        case ".":
            enteringDecimal = true
		default:
            print("KEY NOT IMPLEMENTED YET")
            return
		}

        if (key != "chs") {
            enteringNumber = false
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

    private let displayFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 10
        formatter.alwaysShowsDecimalSeparator = true
        return formatter
    }()

    private let batteryPower: CalculatorBatteryPower?

    init(batteryPower: CalculatorBatteryPower? = nil) {
        self.batteryPower = batteryPower
    }

}

extension Double {

    static func toRadians(_ degrees: Double) -> Double {
        degrees * Double.pi / 180
    }
}
