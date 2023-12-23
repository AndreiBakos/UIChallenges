//
//  PlanView.swift
//  UIChallenges
//
//  Created by Andrei Bakos on 19.12.2023.
//

import SwiftUI

struct PlanView: View {
    var screenWidth: CGFloat
    var selected: Bool
    var title: String
    var amount: Int
    var planType: PlanType
    @Binding var currentSelectedPlan: Plan

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 20) {
                Image(title)
                    .resizable()
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading, spacing: 5) {
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(Color("DarkBlue"))
                        Text(!currentSelectedPlan.yearly ? "$\(amount)/mo" : "$\(amount)/yr")
                            .foregroundStyle(Color("SoftGray"))
                    }
                    if(currentSelectedPlan.yearly) {
                        Text("2 months free")
                            .foregroundStyle(Color("DarkBlue"))
                    }
                }
                .frame(maxWidth: screenWidth, alignment: .leading)
            }
            .frame(maxWidth: screenWidth, alignment: .leading)
            .padding(20)
        }
        .buttonStyle(PlainButtonStyle())
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(selected ? Color("SoftPurple") : .gray, lineWidth: 2)
                .background(selected ? Color("SofterPurple") : .white)
        )
        .contentShape(RoundedRectangle(cornerRadius: 10))
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.1)){
                currentSelectedPlan = Plan(title: title ,amount: amount, plan: planType, yearly: currentSelectedPlan.yearly)
            }
        }
    }
}

#Preview {
    PlanView(screenWidth: 945, selected: true, title: "Arcade", amount: 90, planType: .Arcade, currentSelectedPlan: .constant(Plan(title: "Arcade", amount: 9, plan: .Arcade, yearly: true)))
}
