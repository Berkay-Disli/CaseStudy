//
//  NavigationViewModel.swift
//  CaseStudy
//
//  Created by Berkay Disli on 25.05.2022.
//

import Foundation

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
