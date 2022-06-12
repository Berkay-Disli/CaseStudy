//
//  TabBarNavigator.swift
//  CaseStudy
//
//  Created by Berkay Disli on 25.05.2022.
//

import SwiftUI

struct TabBarNavigator: View {
    @EnvironmentObject var dataVM: DataViewModel
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
            case .cart:  // No function - page name is irrelevant
                CartView()
                    .padding(.top, 28)
                    .transition(AnyTransition.opacity.animation(.easeInOut))
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
                pageSelector
            }
            
            // When Side Menu is open, the rest of the view is slightly faded black with a smooth animation
            SlightDarker
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
            .environmentObject(DataViewModel())
    }
}



extension TabBarNavigator {
    var pageSelector: some View {
        VStack {
            HStack {
                // For home view
                Image(systemName: navigationController.mainTabSelection == .homeView ? "house.fill":"house")
                    .foregroundColor(navigationController.mainTabSelection == .homeView ? .black:.gray)
                    .onTapGesture {
                        navigationController.setHome()
                    }
                Spacer()
                // For second view (Cart)
                ZStack(alignment: .topTrailing) {
                    Image(systemName: navigationController.mainTabSelection == .cart ? "cart.fill":"cart")
                        .foregroundColor(navigationController.mainTabSelection == .cart ? .black:.gray)
                        .onTapGesture {
                            navigationController.setCart()
                    }
                    
                    if dataVM.cartItems.count != 0 {
                        Text("\(dataVM.cartItems.count)")
                            .bold()
                            .font(.callout).foregroundColor(.white)
                            .padding(5) // if bigger than 9, change the size..
                            .background(Circle().fill(.pink))
                            .offset(x: 10, y: -10)
                    }
                    
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
    
    var SlightDarker: some View {
        Rectangle().fill(.black.opacity(navigationController.sideMenuStatus == .menuOpen ? 0.2:0))
            .ignoresSafeArea()
    }
}
