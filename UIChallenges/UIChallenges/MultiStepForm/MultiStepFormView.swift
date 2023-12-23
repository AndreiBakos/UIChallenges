//
//  MultiStepFormView.swift
//  UIChallenges
//
//  Created by Andrei Bakos on 17.12.2023.
//

import SwiftUI

struct MultiStepFormView: View {
    @Binding var currentScreen: Screens
    @State var multiStepForm = MultiStepForm(id: 0, formScreen: .PersonalInfo)
    @State var currentSelectedPlan: Plan = Plan(title: "Arcade", amount: 90, plan: .Arcade, yearly: true)

    var body: some View {
        GeometryReader { proxy in
            VStack {
                ScrollView(showsIndicators: false) {
                    ZStack {
                        Image("HeaderBackground")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxHeight: 250)
                        HStack(spacing: 15) {
                            ForEach(0..<4) { index in
                                Circle()
                                    .stroke(Color.oceanBlue)
                                    .frame(width: 50, height: 50)
                                    .overlay(
                                        Circle()
                                            .frame(width: 50, height: 50)
                                            .foregroundStyle((multiStepForm.id == index || multiStepForm.id == 4 && index == 3) ? Color("OceanBlue") : Color.clear)
                                    )
                                    .overlay {
                                        Text("\(index + 1)")
                                            .foregroundStyle((multiStepForm.id == index || multiStepForm.id == 4 && index == 3) ? .black : .white)
                                            .fontWeight(.bold)
                                    }
                            }
                        }
                    }
                    .frame(maxWidth: proxy.size.width, maxHeight: 250)
                    VStack {
                        GenerateFormView(multiStepForm: multiStepForm, proxy: proxy, currentSelectedPlan: $currentSelectedPlan)
                    }
                    .frame(width: proxy.size.width - 30)
                    .background(.white)
                    .clipShape(.rect(cornerRadius: 10))
                    .shadow(radius: 2)
                    .offset(CGSize(width: 0, height: -60.0))
                }
                .scrollDisabled(proxy.size.height > 860 ? true : false)

                HStack {
                    Button(action: {
                        withAnimation(.easeIn(duration: 0.1)) {
                            if(multiStepForm.id > 0) {
                                let newCurrentIndex = (multiStepForm.id - 1) % 5
                                multiStepForm = MultiStepForm(id: newCurrentIndex, formScreen: handleFormScreenChange(index: newCurrentIndex))
                            } else {
                                currentScreen = .Home
                            }
                        }
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                                .foregroundStyle(.gray)
                            Text(multiStepForm.id > 0 ? "Go Back" : "Home")
                                .foregroundStyle(.gray)
                                .fontWeight(.bold)
                        }
                    }
                    Spacer()
                    Button(action: {
                        withAnimation(.easeIn(duration: 0.1)) {
                            let newCurrentIndex = multiStepForm.id == 4 ? 4 : multiStepForm.id + 1
                            multiStepForm = MultiStepForm(id: newCurrentIndex, formScreen: handleFormScreenChange(index: newCurrentIndex))
                        }
                    }) {
                        Text("\(multiStepForm.formScreen == .FinishingUp ? "Confirm" : "Next Step")")
                            .padding(20)
                            .foregroundStyle(Color("OceanBlue"))
                            .fontWeight(.bold)
                            .background(Color("DarkerBlue"))
                    }
                    .clipShape(.rect(cornerRadius: 10))
                    .disabled(multiStepForm.formScreen != .ThankYou ? false : true)
                    .opacity(multiStepForm.formScreen != .ThankYou ? 1 : 0)
                }
                .frame(maxWidth: proxy.size.width)
                .padding(25)
                .background(.white)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("SoftBlueBgColor"))
        .ignoresSafeArea()
    }

    func handleFormScreenChange(index: Int) -> FormScreens {
        switch index {
        case 0: return .PersonalInfo
        case 1: return .PlanSelect
        case 2: return .AddOns
        case 3: return .FinishingUp
        case 4: return .ThankYou
        default:
            return .PersonalInfo
        }
    }
}

struct GenerateFormView: View {
    var multiStepForm: MultiStepForm
    var proxy: GeometryProxy
    @Binding var currentSelectedPlan: Plan

    var body: some View {
        switch multiStepForm.formScreen {
        case .PersonalInfo: PersonalInfoView(screenWidth: proxy.size.width)
        case .PlanSelect: PlanSelectView(screenWidth: proxy.size.width, currentSelectedPlan: $currentSelectedPlan)
        case .AddOns: AddOnsSelectView(screenWidth: proxy.size.width, currentSelectedPlan: $currentSelectedPlan)
        case .FinishingUp: FinishingUpView(screenWidth: proxy.size.width, currentSelectedPlan: $currentSelectedPlan)
        case .ThankYou: ThankYouView(screenWidth: proxy.size.width)
        }
    }
}

#Preview {
    MultiStepFormView(
        currentScreen: .constant(.MultiStepForm),
        currentSelectedPlan: Plan(
            title: "Arcade",
            amount: 9,
            plan: .Arcade,
            yearly: true
        )
    )
}
