//
//  PersonalInfoView.swift
//  UIChallenges
//
//  Created by Andrei Bakos on 18.12.2023.
//

import SwiftUI

struct PersonalInfoView: View {
    @State var name = ""
    @State var email = ""
    @State var phone = ""
    var screenWidth: CGFloat

    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            VStack(alignment: .leading, spacing: 15) {
                Text("Personal info")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.darkBlue)
                Text("Please provide your name, email address and phone number")
                    .frame(width: 300, height: 50, alignment: .leading)
                    .foregroundStyle(.softGray)
                    .fontWeight(.bold)
            }
            VStack(alignment: .leading, spacing: 25) {
                VStack(alignment: .leading) {
                    Text("Name")
                        .foregroundStyle(Color.darkBlue)
                        .fontWeight(.semibold)
                    TextField("\(Text("e.g. Stephen King").fontWeight(.bold).foregroundStyle(.softGray))", text: $name)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.softGray, lineWidth: 2)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                }

                VStack(alignment: .leading) {
                    Text("Email")
                        .foregroundStyle(Color.darkBlue)
                        .fontWeight(.semibold)
                    TextField("\(Text("e.g.\("stephenking@lorem.com")").fontWeight(.bold).foregroundStyle(.softGray))", text: $email)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.softGray, lineWidth: 2)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                }

                VStack(alignment: .leading) {
                    Text("Phone Number")
                        .foregroundStyle(Color.darkBlue)
                        .fontWeight(.semibold)
                    TextField("\(Text("e.g. +1 234 567 890").fontWeight(.bold).foregroundStyle(.softGray))", text: $phone)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.softGray, lineWidth: 2)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                }
            }
        }
        .frame(maxWidth: screenWidth)
        .padding(30)
    }
}

#Preview {
    PersonalInfoView(screenWidth: 300)
}
