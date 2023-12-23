//
//  ContentView.swift
//  UIChallenges
//
//  Created by Andrei Bakos on 13.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var currentScreen: Screens = .Home
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        switch currentScreen {
        case .Home:
            List {
                Button(action: {
                    withAnimation(.easeIn(duration: 0.1)) {
                        currentScreen = .Crypto
                    }
                }) {
                    HStack {
                        Text("Crypto App")
                            .foregroundStyle(colorScheme == .dark ? .white : .black)
                            .fontWeight(.bold)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.gray)
                    }
                }

                Button(action: {
                    withAnimation(.easeIn(duration: 0.1)) {
                        currentScreen = .ResultsSummary
                    }
                }) {
                    HStack {
                        Text("Results Summary App")
                            .foregroundStyle(colorScheme == .dark ? .white : .black)
                            .fontWeight(.bold)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.gray)
                    }
                }

                Button(action: {
                    withAnimation(.easeIn(duration: 0.1)) {
                        currentScreen = .MultiStepForm
                    }
                }) {
                    HStack {
                        Text("Multi Step Form App")
                            .foregroundStyle(colorScheme == .dark ? .white : .black)
                            .fontWeight(.bold)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.gray)
                    }
                }
            }
        case .Crypto:
            CryptoHomeView(currentScreen: $currentScreen)
        case .ResultsSummary:
            ResultsSummaryView(currentScreen: $currentScreen)
        case .MultiStepForm:
            MultiStepFormView(currentScreen: $currentScreen)
            
        }
    }
}



#Preview {
    ContentView()
}
