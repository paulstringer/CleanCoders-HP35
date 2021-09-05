import Foundation


class HP35CalculatorModel: ObservableObject {

    let calculator = Calculator()
    @Published var lhsDisplay: String = ""
    @Published var rhsDisplay: String = ""

    func press(_ key: String) -> Void {
        calculator.press(key)
        lhsDisplay = calculator.display
        rhsDisplay = calculator.ex
    }

}

