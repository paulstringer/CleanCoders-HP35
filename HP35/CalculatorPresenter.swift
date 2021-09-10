import Foundation

class HP35CalculatorPresenter: ObservableObject {

    let calculator = Calculator()
    @Published var lhsDisplay: String = ""
    @Published var rhsDisplay: String?

    init() {
        self.readDisplay()
    }

    func press(_ key: String) -> Void {
        let keyNormalised = key.lowercased().replacingOccurrences(of: " ", with: "")
        calculator.press(keyNormalised)
        readDisplay()
    }

    func readDisplay() {
        lhsDisplay = calculator.display
        rhsDisplay = calculator.ex
    }

}

