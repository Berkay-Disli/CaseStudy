//
//  NavigationViewModel.swift
//  CaseStudy
//
//  Created by Berkay Disli on 25.05.2022.
//

import Foundation
import SwiftUI


class NavigationVM: ObservableObject {
    // Side Menu State
    @Published var sideMenuStatus: SideMenuNav = .menuClosed
    // Subscription Page State
    @Published var subscriptionPage = false
    // Details Page State
    @Published var detailsPage = false
    // Main Tab page selection
    @Published var mainTabSelection: Navigation = .homeView
    // To hide tabBar if neccesary
    @Published var tabBarHidden = false
    // Image frame size info popup
    @Published var showBottomPopup = false
    
    // SideMenu
    func openMenu() {
        sideMenuStatus = .menuOpen
    }
    
    func closeMenu() {
        sideMenuStatus = .menuClosed
    }
    
    // Subscription
    func openSubsPage() {
        subscriptionPage = true
    }
    
    func closeSubsPage() {
        subscriptionPage = false
    }
    
    // DetailsPage
    func openDetailsPage() {
        detailsPage = true
    }
    
    func closeDetailsPage() {
        detailsPage = false
    }
    
    // TabNavigation
    func setHome() {
        mainTabSelection = .homeView
    }
    
    func setCart() {
        mainTabSelection = .cart
    }
    
    func setLiked() {
        mainTabSelection = .liked
    }
    
    func hideTabBar() {
        withAnimation(.easeInOut) {
            tabBarHidden = true
        }
    }
    
    func showTabBar() {
        withAnimation(.easeInOut) {
            tabBarHidden = false
        }
    }
    
    // Details Page Bottom Popup
    func changePopupMenu() {
        withAnimation(.easeInOut) {
            showBottomPopup.toggle()
        }
    }
    
    
}



enum Navigation: Int, CaseIterable {
    case homeView, cart, liked
    
    // There are 3 tabBar pages
    var selectedPage: Int {
        switch self {
        case .homeView:
            return 0
        case .cart:
            return 1
        case .liked:
            return 2
        }
    }
}

enum SideMenuNav {
    case menuOpen, menuClosed
    
    var state: Bool {
        switch self {
        case .menuOpen:
            return true
        case .menuClosed:
            return false
        }
    }
}

// This is for toggling between 2x2 grid or single item for page @ListingPage
// Toggle can be changed @SideMenu
class DataVisuals: ObservableObject {
    @Published var showSingleItems = false
    
    func setItemsToSingle() {
        showSingleItems = true
    }
    
    func setItemsToDefault() {
        showSingleItems = false
    }
}
