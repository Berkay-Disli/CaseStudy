//
//  SubscriptionModel.swift
//  CaseStudy
//
//  Created by Berkay Disli on 25.05.2022.
//

import Foundation

enum Subscription: String, CaseIterable {
    case weekly, monthly, yearly
    
    var title: String {
        switch self {
        case .weekly:
            return "Weekly"
        case .monthly:
            return "Monthly"
        case .yearly:
            return "Yearly"
        }
    }
        var price: String {
            switch self {
            case .weekly:
                return "0,99"
            case .monthly:
                return "2,99"
            case .yearly:
                return "18,99"
            }
    }
}




