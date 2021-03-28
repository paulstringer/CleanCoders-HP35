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

	@objc var x: NSNumber { calc.x as NSNumber }
	@objc var y: NSNumber { calc.y as NSNumber }
	@objc var z: NSNumber { calc.z as NSNumber }
	@objc var t: NSNumber { calc.t as NSNumber }

	@objc var flash: Bool { calc.flashError }
}

