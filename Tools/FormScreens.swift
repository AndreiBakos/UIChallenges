//
//  FormScreens.swift
//  UIChallenges
//
//  Created by Andrei Bakos on 18.12.2023.
//

import Foundation

enum FormScreens {
    case PersonalInfo
    case PlanSelect
    case AddOns
    case FinishingUp
    case ThankYou
}

struct MultiStepForm {
    var id: Int
    var formScreen: FormScreens

    init(id: Int, formScreen: FormScreens) {
        self.id = id
        self.formScreen = formScreen
    }
}


enum PlanType {
    case Arcade
    case Advanced
    case Pro
}

struct Plan {
    var title: String
    var amount: Int
    var plan: PlanType
    var yearly: Bool
    var addOns: [AddOn]

    init(
        title: String,
        amount: Int,
        plan: PlanType,
        yearly: Bool,
        addOns: [AddOn] = []) {
            self.title = title
            self.amount = amount
            self.plan = plan
            self.yearly = yearly
            self.addOns = addOns
    }
}

struct AddOn {
    var title: String
    var type: AddOnType
    var amount: Int
    
    init(
        title: String,
        type: AddOnType,
        amount: Int) {
            self.title = title
            self.type = type
            self.amount = amount
    }
}

enum AddOnType {
    case OnlineService
    case LargerStorage
    case CustomProfile
}

func ChangeAmountSubscription(plan: Plan, isYearly: Bool) -> Plan {
    var newAddOnsList: [AddOn] = []
    var newAmount: Int = plan.amount

    plan.addOns.forEach { addOn in
        newAddOnsList.append(AddOn(title: addOn.title, type: addOn.type, amount: isYearly ? addOn.amount * 10 : addOn.amount / 10))
    }

    if(isYearly) {
        newAmount = plan.amount * 10
    } else {
        newAmount = plan.amount / 10
    }

    return Plan(
        title: plan.title,
        amount: newAmount,
        plan: plan.plan,
        yearly: plan.yearly,
        addOns: newAddOnsList)
}

