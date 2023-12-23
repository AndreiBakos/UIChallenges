//
//  HeaderScoreInfoView.swift
//  UIChallenges
//
//  Created by Andrei Bakos on 17.12.2023.
//

import SwiftUI

struct HeaderScoreInfo: View {
    var body: some View {
        VStack {
            Text("Your Result")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.lightVioletGray)
                .padding(.top, 60)
            Circle()
                .frame(width: 180)
                .foregroundStyle(Gradient(colors: [.violetBlue, .persianBlue]))
                .shadow(radius: 0.2)
                .overlay {
                    VStack {
                        Text("76")
                            .font(.system(size: 64))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        Text("of 100")
                            .font(.subheadline)
                            .foregroundStyle(.darkGreyBlue)
                    }
                }
            VStack(spacing: 15) {
                Text("Great")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                Text("You scored higher than 65% of the people who have taken these tests.")
                    .fontWeight(.bold)
                    .font(.system(size: 17))
                    .foregroundStyle(.lighterBlue)
                    .padding(.bottom, 20)
            }
            .frame(width: .infinity)
            .padding(.horizontal, 70)
            .padding(.vertical, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: 410)
        .background(Gradient(colors: [.lightRoyalBlue, .lightSlateBlue]))
        .clipShape(.rect(cornerRadii: .init(bottomLeading: 40 , bottomTrailing: 40)))
        .shadow(radius: 3)
    }
}

#Preview {
    HeaderScoreInfo()
}
