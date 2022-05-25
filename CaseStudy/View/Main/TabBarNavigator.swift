//
//  TabBarNavigator.swift
//  CaseStudy
//
//  Created by Berkay Disli on 25.05.2022.
//

import SwiftUI

struct TabBarNavigator: View {
    
    @StateObject var navigationController = NavigationVM()
    @StateObject var dataVisual = DataVisuals()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Navigate through pages
            switch navigationController.mainTabSelection {
            case .homeView:
                ListingPage(sideMenuNav: navigationController, dataVisual: dataVisual)
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            case .newPost:
                VStack {
                    Spacer()
                    Text("New Post")
                        .transition(AnyTransition.opacity.animation(.easeInOut))
                    Spacer()
                }
            case .liked:
                VStack {
                    Spacer()
                    Text("Liked")
                        .transition(AnyTransition.opacity.animation(.easeInOut))
                    Spacer()
                }
            }
            
            // page selection
            if !navigationController.tabBarHidden {
                VStack {
                    HStack {
                        Image(systemName: navigationController.mainTabSelection == .homeView ? "house.fill":"house")
                            .foregroundColor(navigationController.mainTabSelection == .homeView ? .black:.gray)
                            .onTapGesture {
                                navigationController.setHome()
                            }
                        Spacer()
                        Image(systemName: navigationController.mainTabSelection == .newPost ? "square.grid.2x2.fill":"square.grid.2x2")
                            .foregroundColor(navigationController.mainTabSelection == .newPost ? .black:.gray)
                            .onTapGesture {
                                navigationController.setNewPost()
                            }
                        Spacer()
                        Image(systemName: navigationController.mainTabSelection == .liked ? "heart.fill":"heart")
                            .foregroundColor(navigationController.mainTabSelection == .liked ? .black:.gray)
                            .onTapGesture {
                                navigationController.setLiked()
                            }
                    }.padding(.bottom)
                }
                .font(.system(size: 30))
                .foregroundColor(.black)
                .padding(.horizontal, 50)
                .frame(width: UIScreen.main.bounds.width, height: 100)
                // Did not use materials since the guide screenshot looked like white color w/ opacity
                .background(.white.opacity(0.7))
                .cornerRadius(50)
                .transition(AnyTransition.scale.animation(.easeInOut))
            }
            
            Rectangle().fill(.black.opacity(navigationController.sideMenuStatus == .menuOpen ? 0.2:0))
                .ignoresSafeArea()
                .onTapGesture {
                    if navigationController.sideMenuStatus == .menuOpen {
                        withAnimation(.easeInOut) {
                            navigationController.closeMenu()
                            navigationController.showTabBar()
                        }
                    }
                }
            
            SideMenu(sideMenuNav: navigationController, dataVisual: dataVisual)
                .offset(x: navigationController.sideMenuStatus == .menuClosed ? -323:-107, y: 0)
        }
        .edgesIgnoringSafeArea(.bottom)
        
    }
}

struct TabBarNavigator_Previews: PreviewProvider {
    static var previews: some View {
        TabBarNavigator()
    }
}
