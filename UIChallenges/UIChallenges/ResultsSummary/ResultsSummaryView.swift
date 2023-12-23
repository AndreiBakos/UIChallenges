//
//  ResultsSummaryView.swift
//  UIChallenges
//
//  Created by Andrei Bakos on 15.12.2023.
//

import SwiftUI

struct ResultsSummaryView: View {
    @Binding var currentScreen: Screens
    var body: some View {
        ScrollView {
            HeaderScoreInfo()
            VStack(alignment: .leading, spacing: 25) {
                Text("Summary")
                    .foregroundStyle(.black)
                    .font(.title2)
                    .fontWeight(.bold)
                VStack(spacing: 15) {
                    InfoContainer(icon: "lightning", title: "Reaction", score: "80", bgColor: "LightPink", fontColor: "LightRed")
                    InfoContainer(icon: "memory", title: "Memory", score: "92", bgColor: "LighterYellow", fontColor: "LightYellow")
                    InfoContainer(icon: "verbal", title: "Verbal", score: "61", bgColor: "LightGreenTeal", fontColor: "GreenTeal")
                    InfoContainer(icon: "visual", title: "Visual", score: "71", bgColor: "LightViolet", fontColor: "RoyalPurple")
                }
                GeometryReader { proxy in
                    Button(action: {
                        withAnimation(.easeIn(duration: 0.1)) {
                            currentScreen = .Home
                        }
                    }) {
                        
                        Text("Continue")
                            .frame(maxWidth: proxy.size.width - 50)
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .padding(.vertical, 20)
                            .clipShape(.rect(cornerRadius: 30))
                    }
                    .frame(maxWidth: proxy.size.width)
                    .background(.veryDarkBlue)
                    .clipShape(.rect(cornerRadius: 30))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding(.horizontal, 30)
            .padding(.top)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea()
        .background(.white)
    }
}

#Preview {
    ResultsSummaryView(currentScreen: .constant(.ResultsSummary))
}
