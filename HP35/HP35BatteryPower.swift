import Foundation
import UIKit

struct DeviceBatteryPower: CalculatorBatteryPower {

    private let device: UIDevice

    var isLowBattery: Bool {
        return device.batteryLevel > 0.05
    }
}

class DeviceBatterySimulator: CalculatorBatteryPower {

    var volts: NSNumber = 3.70

    var isLowBattery: Bool {
        volts.doubleValue <= 3.30
    }
}
