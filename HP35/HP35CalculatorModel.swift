import Foundation

class HP35CalculatorModel: ObservableObject {

    let calculator = Calculator()
    @Published var lhsDisplay: String = ""
    @Published var rhsDisplay: String?

    func press(_ key: String) -> Void {
        let keyNormalised = key.lowercased().replacingOccurrences(of: " ", with: "")
        print("Press \(keyNormalised)")
        calculator.press(keyNormalised)
        lhsDisplay = calculator.display
        rhsDisplay = calculator.ex
    }

}

