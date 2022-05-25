//
//  NavigationViewModel.swift
//  CaseStudy
//
//  Created by Berkay Disli on 25.05.2022.
//

import Foundation


class NavigationVM: ObservableObject {
    @Published var sideMenuStatus: SideMenuNav = .menuClosed
    
    func openMenu() {
        sideMenuStatus = .menuOpen
    }
    
    func closeMenu() {
        sideMenuStatus = .menuClosed
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
