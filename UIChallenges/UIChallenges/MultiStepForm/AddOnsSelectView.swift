//
//  AddOnsSelectView.swift
//  UIChallenges
//
//  Created by Andrei Bakos on 19.12.2023.
//

import SwiftUI

struct AddOnsSelectView: View {
    var screenWidth: CGFloat
    @Binding var currentSelectedPlan: Plan
    @State var selected: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            VStack(alignment: .leading, spacing: 15) {
                Text("Pick add-ons")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.darkBlue)
                Text("Add-ons help enhance your gaming experience.")
                    .frame(width: 300, height: 50, alignment: .leading)
                    .foregroundStyle(.softGray)
                    .fontWeight(.bold)
            }
            VStack(spacing: 20) {
                AddOnContainerView(
                    screenWidth: screenWidth,
                    currentSelectedPlan: $currentSelectedPlan,
                    selected: currentSelectedPlan.addOns.contains(where: { $0.type == .OnlineService }),
                    description: "Access to multiplayer games",
                    selectedAddOn: AddOn(title: "Online service", type: .OnlineService, amount: 1))
                AddOnContainerView(
                    screenWidth: screenWidth,
                    currentSelectedPlan: $currentSelectedPlan,
                    selected: currentSelectedPlan.addOns.contains(where: { $0.type == .LargerStorage }),
                    description: "Extra 1TB of cloud save",
                    selectedAddOn: AddOn(title: "Larger storage", type: .LargerStorage, amount: 3))
                AddOnContainerView(
                    screenWidth: screenWidth,
                    currentSelectedPlan: $currentSelectedPlan,
                    selected: currentSelectedPlan.addOns.contains(where: { $0.type == .CustomProfile }),
                    description: "Custom theme on your profile",
                    selectedAddOn: AddOn(title: "Customizable profile", type: .CustomProfile, amount: 5))
            }
        }
        .frame(maxWidth: screenWidth)
        .padding(30)
    }
}

#Preview {
    AddOnsSelectView(
        screenWidth: 934,
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
