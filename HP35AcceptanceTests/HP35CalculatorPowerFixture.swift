import Foundation

@objc(CalculatorPower)

class HP35CalculatorPowerFixture: NSObject {

    let power = DeviceBatterySimulator()
    let calc: Calculator

    override init() {
        calc = Calculator(batteryPower: power)
        super.init()
    }

    @objc var volts: NSNumber = 3.75 {
        didSet {
            power.volts = volts
        }
    }

    @objc var watts: NSNumber {
        return 0.500
    }

    /**
     Takes a string representing a battery level between 0-100 and sends the equivalent volts input to the calculator. (Strings may include percent sign '%' suffix as a decoration to support readability).
     */
    @objc var batteryLevel: String = "100%" {
        didSet {
            guard let batteryPower = BatteryPowerLevel(batteryLevel) else { return }
            power.volts = batteryPower.voltage.double as NSNumber
        }
    }

    @objc var showDecimalPoints: Bool {
        return calc.showDecimalPoints
    }
}
