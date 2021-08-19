import Foundation

@objc(Calculator)

class CalculatorFixture: NSObject {

	let calc = Calculator()

	@objc var volts: NSNumber = 0 {
		didSet { calc.volts = volts }
	}

	@objc var watts: NSNumber {
		return 0.500
	}

	@objc var points: Bool {
		return calc.showDecimalPoints
	}

	@objc var key: String = "" {
		didSet { calc.press(key) }
	}

	@objc var x: Double { calc.x }
	@objc var y: Double { calc.y }
	@objc var z: Double { calc.z }
	@objc var t: Double { calc.t }
    @objc var ex: String? {
        return calc.ex
    }

	@objc var flash: Bool { calc.flashError }

}

