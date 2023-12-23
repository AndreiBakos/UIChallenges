//
//  InfoContainer.swift
//  UIChallenges
//
//  Created by Andrei Bakos on 17.12.2023.
//

import SwiftUI

struct InfoContainer: View {
    var icon: String
    var title: String
    var score: String
    var bgColor: String
    var fontColor: String

    var body: some View {
        ZStack {
            HStack {
                HStack {
                    Image(icon)
                    Text(title)
                        .foregroundStyle(Color(fontColor))
                        .fontWeight(.bold)
                }
                Spacer()
                Text("\(score) \(Text("/ 100").foregroundStyle(.gray))")
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
            }
            .padding(25)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(bgColor))
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    InfoContainer(icon: "lightning", title: "Reaction", score: "80", bgColor: "LightPink", fontColor: "LightRed")
}
