import SwiftUI

struct CalcButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .lineLimit(1)
            .font(.title.bold())
            .minimumScaleFactor(0.5)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
}

struct CalcButton: View {

    @EnvironmentObject var calculatorModel: HP35CalculatorModel

    let key: String

    init(_ key: String) {
        self.key = key
    }

    var body: some View {
        Button(key) {
            calculatorModel.press(key)
        }
        .buttonStyle(CalcButtonStyle())
    }
}

struct CalculatorView: View {

    @EnvironmentObject var calculatorModel: HP35CalculatorModel

    var body: some View {

        VStack {

            HStack {
                Text(calculatorModel.lhsDisplay)
                Spacer()
                Text(calculatorModel.rhsDisplay ?? "")
            }
            .lineLimit(1)
            .font(.largeTitle)
            .foregroundColor(.red)

            Divider()

            HStack() {
                CalcButton("ENTER")
                .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: false)
                CalcButton("CH S")
                CalcButton("E EX")
                CalcButton("CL X")
            }

            HStack() {
                CalcButton("-")
                CalcButton("7")
                CalcButton("8")
                CalcButton("9")
            }

            HStack() {
                CalcButton("+")
                CalcButton("4")
                CalcButton("5")
                CalcButton("6")
            }

            HStack() {
                CalcButton("x")
                CalcButton("1")
                CalcButton("2")
                CalcButton("3")
            }

            HStack() {
                CalcButton("÷")
                CalcButton("0")
                CalcButton(".")
                CalcButton("π")
                .disabled(true)
            }

        }
        .padding()

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let model = HP35CalculatorModel()
        model.press("eex")
        model.press("6")
        return CalculatorView()
            .environmentObject(model)
    }
}
