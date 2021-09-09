public struct Identifier<Tag, RawValue> {
    fileprivate let rawValue: RawValue
}

enum _Voltage {}
typealias Voltage = Identifier<_Voltage, Double>
extension Voltage {
    static func -(lhs: Voltage, rhs: Voltage) -> Voltage{
        return Voltage(rawValue: lhs.rawValue - rhs.rawValue)
    }
    static func +(lhs: Voltage, rhs: Voltage) -> Voltage{
        return Voltage(rawValue: lhs.rawValue + rhs.rawValue)
    }
    var float: Float {
        Float(self.rawValue)
    }
    var double: Double {
        self.rawValue
    }
}

enum _BatteryPowerLevel {}
typealias BatteryPowerLevel = Identifier<_BatteryPowerLevel, Float>

extension BatteryPowerLevel {

    init?(_ string: String) {
        let intValue = Int(string.replacingOccurrences(of: "%", with: "")) ?? 0
        self.init(intValue)
    }

    init?(_ int: Int) {
        self.init(Float(int) / 100.0)
    }

    init?(_ float: Float) {
        guard (0.0 ... 1.0).contains(float) else {
            return nil
        }
        self = Self(rawValue: float)
    }

    var voltage: Voltage {
        let zeroPower = Voltage(rawValue: 3.276)
        let fullPower = Voltage(rawValue: 3.75)
        let powerDifference: Voltage = { fullPower - zeroPower }()
        let voltageStep = Voltage(rawValue: Double(powerDifference.float * self.rawValue))
        return zeroPower + voltageStep
    }

    var string: String {
        return "\(Int(self.rawValue * 100))" + "%"
    }
}
