import SwiftUI

@main
struct HP35App: App {

    @StateObject private var calculator = HP35CalculatorPresenter()
    
    var body: some Scene {
        WindowGroup {
            CalculatorView()
                .environmentObject(calculator)
        }
    }
}
