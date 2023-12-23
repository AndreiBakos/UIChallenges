//
//  ThankYouView.swift
//  UIChallenges
//
//  Created by Andrei Bakos on 20.12.2023.
//

import SwiftUI

struct ThankYouView: View {
    var screenWidth: CGFloat

    var body: some View {
        VStack(spacing: 20) {
            Image("ThankYou")
                .resizable()
                .frame(width: 70, height: 70)
            VStack(spacing: 10) {
                Text("Thank You!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color("DarkBlue"))
                Text("Thank for confirming your subscription! We hope you have fun using our new platform. If you ever need support, please feel free to email us at support@loremgaming.com")
                    .foregroundStyle(Color("SoftGray"))
            }
        }
        .frame(maxWidth: screenWidth)
        .padding(30)
        .padding(.bottom, 100)
        .padding(.top, 100)
    }
}

#Preview {
    ThankYouView(screenWidth: 934)
}
