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
        // Since i've created a CUSTOM tab bar, Zstack is used
        ZStack(alignment: .bottom) {
            
            // View changes according to switched variable below
            switch navigationController.mainTabSelection {  // switches between different cases of pages
            case .homeView:
                ListingPage(navigationController: navigationController, dataVisual: dataVisual)
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            case .newPost:  // No function - page name is irrelevant
                VStack {
                    Spacer()
                    Text("New Post")
                        .transition(AnyTransition.opacity.animation(.easeInOut))
                    Spacer()
                }
            case .liked:    // No function - page name is irrelevant
                VStack {
                    Spacer()
                    Text("Liked")
                        .transition(AnyTransition.opacity.animation(.easeInOut))
                    Spacer()
                }
            }
            
            // User page selection is done here
            if !navigationController.tabBarHidden {
                VStack {
                    HStack {
                        // For home view
                        Image(systemName: navigationController.mainTabSelection == .homeView ? "house.fill":"house")
                            .foregroundColor(navigationController.mainTabSelection == .homeView ? .black:.gray)
                            .onTapGesture {
                                navigationController.setHome()
                            }
                        Spacer()
                        // For second view (addPage)
                        Image(systemName: navigationController.mainTabSelection == .newPost ? "square.grid.2x2.fill":"square.grid.2x2")
                            .foregroundColor(navigationController.mainTabSelection == .newPost ? .black:.gray)
                            .onTapGesture {
                                navigationController.setNewPost()
                            }
                        Spacer()
                        // For third view (liked)
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
                .background(.white.opacity(0.7)) // or .ultraThinMaterial >> for a different look maybe?
                .cornerRadius(50)
                .transition(AnyTransition.scale.animation(.easeInOut))  // The TabBar scales to hide/show itself
            }
            
            // When Side Menu is open, the rest of the view is slightly faded black with a smooth animation
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
            
            // SideMenu is offsetted on x coordinate to show/hide itself
            SideMenu(navigationController: navigationController, dataVisual: dataVisual)
                .offset(x: navigationController.sideMenuStatus == .menuClosed ? -323:-107, y: 0)
                
        }
        .onAppear(perform: {
            navigationController.showTabBar()
        })
        .edgesIgnoringSafeArea(.bottom)
        
    }
}

struct TabBarNavigator_Previews: PreviewProvider {
    static var previews: some View {
        TabBarNavigator()
    }
}
