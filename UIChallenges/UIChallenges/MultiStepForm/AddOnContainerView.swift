//
//  AddOnContainerView.swift
//  UIChallenges
//
//  Created by Andrei Bakos on 19.12.2023.
//

import SwiftUI

struct AddOnContainerView: View {
    var screenWidth: CGFloat
    @Binding var currentSelectedPlan: Plan
    var selected: Bool
    var description: String
    var selectedAddOn: AddOn

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center, spacing: 11) {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(selected ? Color("LightPurple") : .gray, lineWidth: 2)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundStyle(selected ? Color("LightPurple") : .white)
                    )
                    .frame(width: 30, height: 30)
                    .overlay {
                        if(selected) {
                            Image(systemName: "checkmark")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundStyle(.white)
                        }
                    }
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text(selectedAddOn.title)
                            .font(.system(size: 19))
                            .fontWeight(.bold)
                            .foregroundStyle(Color("DarkBlue"))
                        Text(description)
                            .frame(maxWidth: screenWidth, alignment: .leading)
                            .foregroundStyle(Color("SoftGray"))
                            .fontWeight(.bold)
                            .font(.system(size: 12))
                    }
                    .frame(maxWidth: screenWidth, alignment: .leading)
                }
                .frame(maxWidth: screenWidth, alignment: .leading)
                Text("+$\(currentSelectedPlan.yearly ? "\(selectedAddOn.amount * 10)/yr" : "\(selectedAddOn.amount)/mo")")
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
                let existingAddOn = currentSelectedPlan.addOns.firstIndex(where: { $0.type == selectedAddOn.type })
                if(existingAddOn == nil) {
                    let newAddOn: AddOn = AddOn(title: selectedAddOn.title, type: selectedAddOn.type, amount: currentSelectedPlan.yearly ? selectedAddOn.amount * 10 : selectedAddOn.amount)
                    currentSelectedPlan.addOns.append(newAddOn)
                } else {
                    currentSelectedPlan.addOns = currentSelectedPlan.addOns.filter({ $0.type != selectedAddOn.type })
                }
            }
        }
    }
}

#Preview {
    AddOnContainerView(
        screenWidth: 934,
        currentSelectedPlan: .constant(
            Plan(
                title: "Arcade",
                amount: 9,
                plan: .Advanced,
                yearly: true)
        ),
        selected: true,    
        description: "Access to multiplayer games",
        selectedAddOn: AddOn(
            title: "Online Service",
            type: .OnlineService,
            amount: 1)
    )
}
