//
//  FinishingUpView.swift
//  UIChallenges
//
//  Created by Andrei Bakos on 20.12.2023.
//

import SwiftUI

struct FinishingUpView: View {
    var screenWidth: CGFloat
    @Binding var currentSelectedPlan: Plan
    @State var planTotal = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            VStack(alignment: .leading, spacing: 15) {
                Text("Finishing up")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.darkBlue)
                Text("Double-check everything looks OK before confirming")
                    .frame(width: 300, height: 50, alignment: .leading)
                    .foregroundStyle(.softGray)
                    .fontWeight(.bold)
            }
            VStack(alignment: .leading, spacing: 15) {
                VStack(alignment: .leading) {
                    Text("\(currentSelectedPlan.title) (\(currentSelectedPlan.yearly ? "Yearly" : "Monthly"))")
                        .fontWeight(.bold)
                        .font(.subheadline)
                        .foregroundStyle(Color("DarkBlue"))
                    Button(action: {
                        currentSelectedPlan.yearly = !currentSelectedPlan.yearly
                        currentSelectedPlan = ChangeAmountSubscription(plan: currentSelectedPlan, isYearly: currentSelectedPlan.yearly)
                        planTotal = CalculateTotal()
                    }) {
                        Text("Change")
                            .fontWeight(.semibold)
                            .foregroundStyle(Color("SoftGray"))
                            .underline()
                    }
                }
                if(currentSelectedPlan.addOns.count > 0) {
                    RoundedRectangle(cornerRadius: 50)
                        .frame(height: 1)
                        .foregroundStyle(Color("SoftGray"))
                    ForEach(currentSelectedPlan.addOns, id: \.type) { addOn in
                        HStack {
                            Text(addOn.title)
                                .foregroundStyle(Color("SoftGray"))
                            Spacer()
                            Text("+$\(addOn.amount)/\(currentSelectedPlan.yearly ? "yr" : "mo")")
                                .foregroundStyle(Color("DarkBlue"))
                        }
                    }
                }
            }
            .frame(maxWidth: screenWidth, alignment: .leading)
            .padding()
            .background(Color("SoftBlueBgColor"))
            .clipShape(.rect(cornerRadius: 8))
            HStack {
                Text("Total (per \(currentSelectedPlan.yearly ? "year" : "month"))")
                    .foregroundStyle(Color("SoftGray"))
                    .fontWeight(.bold)
                Spacer()
                Text("$\(planTotal)/\(currentSelectedPlan.yearly ? "yr" : "mo")")
                    .fontWeight(.bold)
                    .foregroundStyle(Color("LightPurple"))
            }
            .padding()
        }
        .frame(maxWidth: screenWidth)
        .padding(30)
        .onAppear {
            planTotal = CalculateTotal()
        }
    }
    func CalculateTotal() -> Int {
        var total = 0
        currentSelectedPlan.addOns.forEach { addOn in
            total += addOn.amount
        }

        total += currentSelectedPlan.amount
        return total
    }
}

#Preview {
    FinishingUpView(
        screenWidth: 934,
        currentSelectedPlan: .constant(
            Plan(
                title: "Arcade",
                amount: 90,
                plan: .Arcade,
                yearly: true,
                addOns: [
                    AddOn(
                        title: "Online Service",
                        type: .OnlineService,
                        amount: 10
                    ),
                    AddOn(
                        title: "Larger Storage",
                        type: .LargerStorage,
                        amount: 30
                    )
                ]
            )
        )
    )
}
