//
//  NavigationViewModel.swift
//  CaseStudy
//
//  Created by Berkay Disli on 25.05.2022.
//

import Foundation
import SwiftUI


class NavigationVM: ObservableObject {
    @Published var sideMenuStatus: SideMenuNav = .menuClosed
    @Published var subscriptionPage = false
    @Published var detailsPage = false
    @Published var mainTabSelection: Navigation = .homeView
    @Published var tabBarHidden = false
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
    
    func setNewPost() {
        mainTabSelection = .newPost
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
    case homeView, newPost, liked
    
    
    var selectedPage: Int {
        switch self {
        case .homeView:
            return 0
        case .newPost:
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

class DataVisuals: ObservableObject {
    @Published var showSingleItems = false
    
    func setItemsToSingle() {
        showSingleItems = true
    }
    
    func setItemsToDefault() {
        showSingleItems = false
    }
}
