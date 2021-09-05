import SwiftUI

struct CalcButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .lineLimit(1)
            .font(.title.bold())
            .minimumScaleFactor(0.5)
    }
}

struct CalcButton: View {

    let label: String
    let action: () -> Void

    init(_ label: String, action: @escaping () -> Void) {
        self.label = label
        self.action = action
    }

    var body: some View {
        Button(label) {
            action()
        }
        .buttonStyle(CalcButtonStyle())
    }
}

struct ContentView: View {
    var body: some View {

        let ROWSPACING: CGFloat = 20.0

        VStack {

            HStack {
                Text("-1.23456789")
                .lineLimit(1)
                .font(.largeTitle)
                .foregroundColor(.red)

                Spacer()

                Text("-35")
                .lineLimit(1)
                    .font(.largeTitle)
                .foregroundColor(.red)
                .padding()
            }

            Spacer()

            HStack(spacing:ROWSPACING) {

                CalcButton("ENTER ⬆️") {
                    //
                }.fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: false)

                CalcButton("CH S") {
                    //
                }

                CalcButton("E EX") {
                    //
                }

                CalcButton("CL X") {
                    //
                }

            }

            HStack(spacing:ROWSPACING) {

                CalcButton("-") {
                    //
                }

                CalcButton("7") {
                    //
                }

                CalcButton("8") {
                    //
                }

                CalcButton("9") {
                    //
                }
            }

            HStack(spacing:ROWSPACING) {

                CalcButton("+") {
                    //
                }

                CalcButton("4") {
                    //
                }

                CalcButton("5") {
                    //
                }

                CalcButton("6") {
                    //
                }
            }

            HStack(spacing:ROWSPACING) {
                CalcButton("x") {
                    //
                }

                CalcButton("1") {
                    //
                }

                CalcButton("2") {
                    //
                }

                CalcButton("3") {
                    //
                }
            }


            HStack(spacing:ROWSPACING) {
                CalcButton("÷") {
                    //
                }

                CalcButton("0") {
                    //
                }

                CalcButton(".") {
                    //
                }

                CalcButton("π") {
                    //
                }
                .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            }

        }
        .padding(.all)
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
