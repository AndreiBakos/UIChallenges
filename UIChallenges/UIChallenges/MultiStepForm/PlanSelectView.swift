//
//  PlanSelectView.swift
//  UIChallenges
//
//  Created by Andrei Bakos on 19.12.2023.
//

import SwiftUI

struct PlanSelectView: View {
    var screenWidth: CGFloat
    @State var isYearPicked = true
    @Binding var currentSelectedPlan: Plan

    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            VStack(alignment: .leading, spacing: 15) {
                Text("Select your plan")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.darkBlue)
                Text("You have the option for monthly or yearly billing")
                    .frame(width: 300, height: 50, alignment: .leading)
                    .foregroundStyle(.softGray)
                    .fontWeight(.bold)
            }
            VStack(spacing: 20) {
                PlanView(
                    screenWidth: screenWidth,
                    selected: currentSelectedPlan.plan == .Arcade,
                    title: "Arcade",
                    amount: currentSelectedPlan.yearly ? 90 : 9,
                    planType: .Arcade,
                    currentSelectedPlan: $currentSelectedPlan)

                PlanView(
                    screenWidth: screenWidth,
                    selected: currentSelectedPlan.plan == .Advanced,
                    title: "Advanced",
                    amount: currentSelectedPlan.yearly ? 120 : 12,
                    planType: .Advanced,
                    currentSelectedPlan: $currentSelectedPlan)

                PlanView(
                    screenWidth: screenWidth,
                    selected: currentSelectedPlan.plan == .Pro,
                    title: "Pro",
                    amount: currentSelectedPlan.yearly ? 150 : 15,
                    planType: .Pro,
                    currentSelectedPlan: $currentSelectedPlan)

                HStack {
                    Text("Monthly")
                        .fontWeight(.bold)
                        .foregroundStyle(!currentSelectedPlan.yearly ? Color("DarkBlue") : .gray)
                    Toggle(isOn: $currentSelectedPlan.yearly.animation(.easeIn(duration: 0.1))) {
                        Text("Yearly Plan")
                    }
                    .labelsHidden()
                    .onChange(of: currentSelectedPlan.yearly) {
                        currentSelectedPlan = ChangeAmountSubscription(plan: currentSelectedPlan, isYearly: currentSelectedPlan.yearly)                        
                    }
                    Text("Yearly")
                        .fontWeight(.bold)
                        .foregroundStyle(currentSelectedPlan.yearly ? Color("DarkBlue") : .gray)
                }
                .frame(maxWidth: screenWidth)
                .padding()
                .background(Color("SofterGray"))
                .clipShape(.rect(cornerRadius: 10))
            }
        }
        .frame(maxWidth: screenWidth)
        .padding(30)
    }
}


#Preview {
    PlanSelectView(
        screenWidth: 945,
        currentSelectedPlan: .constant(
            Plan(
                title: "Arcade",
                amount: 9,
                plan: .Advanced,
                yearly: true
            )
        )
    )
}
