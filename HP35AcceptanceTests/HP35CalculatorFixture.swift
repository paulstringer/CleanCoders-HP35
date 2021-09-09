import Foundation

@objc(Calculator)

class CalculatorFixture: NSObject {

	let calc = Calculator()

	@objc var key: String = "" {
		didSet { calc.press(key) }
	}

    @objc var see: String { calc.display }
    @objc var x: Double { calc.x }
	@objc var y: Double { calc.y }
	@objc var z: Double { calc.z }
	@objc var t: Double { calc.t }
    @objc var ex: String? { calc.ex }

	@objc var flash: Bool { calc.flashError }

}

