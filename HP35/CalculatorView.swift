import SwiftUI

struct CalculatorView: View {

    @EnvironmentObject var calculator: HP35CalculatorPresenter

    var body: some View {

        VStack {

            HStack {
                Text(calculator.lhsDisplay)
                Spacer()
                Text(calculator.rhsDisplay ?? "")
            }
            .modifier(CalculatorDisplay())

            Group {

                HStack {
                    CalcButton("x^y", .math)
                    CalcButton("log", .math)
                    CalcButton("ln", .math)
                    CalcButton("ex", .math)
                    CalcButton("CLR", .stack)
                }

                HStack {
                    CalcButton("√x", .math).disabled(true)
                    CalcButton("arc", .trig).disabled(true)
                    CalcButton("sin", .trig)
                    CalcButton("cos", .trig).disabled(true)
                    CalcButton("tan", .trig).disabled(true)
                }

                HStack {
                    CalcButton("1/x", .math)
                    CalcButton("x⇄y", .math)
                    CalcButton("R↓", .math)
                    CalcButton("STO", .math)
                    CalcButton("RCL", .math)
                }.disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)

                HStack(alignment: .bottom) {
                    CalcButton("ENTER", .enter)
                    CalcButton("CH S", .stack)
                    CalcButton("E EX", .stack)
                    CalcButton("CL X", .stack)
                }

                HStack {
                    CalcButton("-", .arithmetic)
                    CalcButton("7", .number)
                    CalcButton("8", .number)
                    CalcButton("9", .number)
                }

                HStack {
                    CalcButton("+", .arithmetic)
                    CalcButton("4", .number)
                    CalcButton("5", .number)
                    CalcButton("6", .number)
                }

                HStack {
                    CalcButton("x", .arithmetic)
                    CalcButton("1", .number)
                    CalcButton("2", .number)
                    CalcButton("3", .number)
                }

                HStack {
                    CalcButton("÷", .arithmetic)
                    CalcButton("0", .number)
                    CalcButton(".", .number)
                    CalcButton("π", .number).disabled(true)
                }
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
        }
        .padding(.vertical, 60)
        .padding(.horizontal)
        .background(Color("Background"))
        .ignoresSafeArea(.container, edges: .vertical)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let presenter = HP35CalculatorPresenter()
        presenter.press("eex")
        presenter.press("6")
        return CalculatorView()
            .environment(\.sizeCategory, .extraExtraExtraLarge)
            .environmentObject(presenter)
    }
}

//MARK: - Calculator Display

struct CalculatorDisplay: ViewModifier {

    func body(content: Content) -> some View {
        content.font(Font.largeTitle.bold())
        .background(
            Rectangle()
            .foregroundColor(.white)
            .padding(-15)
        )
        .padding(15)
        .padding(.bottom, 30)
    }
}


//MARK: - Calculator Button

enum CalcButtonAppearance {
    case number, math, trig, stack, enter, arithmetic
    var color: Color {
        switch self {
        case .number:
            return Color.white
        case .math:
            return Color("FKey")
        case .trig:
            return Color("TKey")
        default:
            return Color("BKey")
        }
    }
    var labelTop: Bool {
        switch self {
        case .number:
            fallthrough
        case .arithmetic:
            fallthrough
        case .enter:
            return false
        default:
            return true
        }
    }
    var textColor: Color {
        switch self {
        case .arithmetic:
            return .white
        case .enter:
            return .white
        default:
            return .black
        }
    }
}

struct CalcButtonStyle: ButtonStyle {

    let appearance: CalcButtonAppearance

    func makeBody(configuration: Configuration) -> some View {

        Group {
            if appearance.labelTop {
                VStack(spacing: 3) {
                    configuration.label
                    .font(
                        .footnote.bold()
                    )
                    backgroundView(
                        configuration.isPressed,
                        appearance.color)
                }
            } else {
                backgroundView(
                    configuration.isPressed,
                    appearance.color)
                .overlay(configuration.label)
                .font(.body)
            }
        }
        .foregroundColor(appearance.textColor)

    }

    func backgroundView(_ isPressed: Bool, _ color: Color) -> some View  {
        Rectangle()
        .foregroundColor(color)
        .shadow(
            color: .black,
            radius: 0,
            x: isPressed ? 3 : 5,
            y: isPressed ? 3 : 5
        )
        .frame(maxHeight:30)
        .padding(.horizontal, 10)
        .opacity(
            isPressed ? 0.5 : 1.0
        )
        .offset(
            x: isPressed ? 2 : 0,
            y: isPressed ? 2 : 0
        )
    }

}

struct CalcButton: View {

    @EnvironmentObject var calculator: HP35CalculatorPresenter

    let key: String
    let appearance: CalcButtonAppearance

    init(_ key: String, _ appearance: CalcButtonAppearance) {
        self.key = key
        self.appearance = appearance
    }

    var body: some View {
        Button(key) {
            calculator.press(key)
        }
        .buttonStyle(
            CalcButtonStyle(appearance: appearance)
        )
        .frame(minWidth: (appearance == .enter) ? 138 : 0)
    }

}
