import SwiftUI

struct CalcButtonStyle: ButtonStyle {
    let isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .lineLimit(1)
            .font(.title.bold())
            .minimumScaleFactor(0.5)
            .foregroundColor(
                .blue
                .opacity(
                    configuration.isPressed ?
                        0.8
                        :
                        isEnabled ? 1.0 : 0.4
                )
            )
    }
}

struct CalcButton: View {

    @Environment(\.isEnabled) var isEnabled
    @EnvironmentObject var calculator: HP35CalculatorPresenter

    let key: String

    init(_ key: String) {
        self.key = key
    }

    var body: some View {
        Button(key) {
            calculator.press(key)
        }
        .buttonStyle(
            CalcButtonStyle(isEnabled: isEnabled)
        )
    }
}

struct CalculatorView: View {

    @EnvironmentObject var calculator: HP35CalculatorPresenter

    var body: some View {

        VStack {

            HStack {
                Text(calculator.lhsDisplay)
                Spacer()
                Text(calculator.rhsDisplay ?? "")
            }
            .lineLimit(1).font(.largeTitle).foregroundColor(.red)

            Divider()

            Group {

                HStack {
                    CalcButton("x^y")
                    CalcButton("log").disabled(true)
                    CalcButton("ln").disabled(true)
                    CalcButton("ex")
                    CalcButton("clr")
                }

                HStack {
                    CalcButton("√x").disabled(true)
                    CalcButton("arc").disabled(true)
                    CalcButton("sin")
                    CalcButton("cos").disabled(true)
                    CalcButton("tan").disabled(true)
                }

                HStack {
                    CalcButton("1/x")
                    CalcButton("x⇄y")
                    CalcButton("R↓")
                    CalcButton("STO")
                    CalcButton("RCL")
                }.disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)

                HStack {
                    CalcButton("ENTER").fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/,
                                   vertical: false)
                    CalcButton("CH S")
                    CalcButton("E EX")
                    CalcButton("CL X")
                }

                HStack {
                    CalcButton("-")
                    CalcButton("7")
                    CalcButton("8")
                    CalcButton("9")
                }

                HStack {
                    CalcButton("+")
                    CalcButton("4")
                    CalcButton("5")
                    CalcButton("6")
                }

                HStack {
                    CalcButton("x")
                    CalcButton("1")
                    CalcButton("2")
                    CalcButton("3")
                }

                HStack {
                    CalcButton("÷")
                    CalcButton("0")
                    CalcButton(".")
                    CalcButton("π").disabled(true)
                }
            }

            Text("Grayed keys are unimplemented!")
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding()

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let presenter = HP35CalculatorPresenter()
        presenter.press("eex")
        presenter.press("6")
        return CalculatorView()
            .environmentObject(presenter)
    }
}
