import Foundation

class HP35CalculatorPresenter: ObservableObject {

    let calculator = Calculator()
    @Published var lhsDisplay: String = ""
    @Published var rhsDisplay: String?

    init() {
        self.readDisplay()
    }

    func press(_ key: String) -> Void {
        let key = calculatorKeyPress(for: key)
        calculator.press(key)
        readDisplay()
    }

    func readDisplay() {
        lhsDisplay = calculator.display
        rhsDisplay = calculator.ex
    }

    private func calculatorKeyPress(for key: String) -> String {
        key.lowercased().replacingOccurrences(of: " ", with: "")
    }
}

