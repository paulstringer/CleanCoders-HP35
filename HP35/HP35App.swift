//
//  HP35App.swift
//  HP35
//

import SwiftUI

@main
struct HP35App: App {

    @StateObject private var calculatorModel = HP35CalculatorModel()
    
    var body: some Scene {
        WindowGroup {
            CalculatorView()
                .environmentObject(calculatorModel)
        }
    }
}
