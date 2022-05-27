//
//  SideMenu.swift
//  CaseStudy
//
//  Created by Berkay Disli on 25.05.2022.
//

import SwiftUI

struct SideMenu: View {
    @ObservedObject var navigationController: NavigationVM
    @ObservedObject var dataVisual: DataVisuals
    // Grid-Single Toggle Selection
    @State private var pickerSelection = 0
    
    var body: some View {
        VStack {
            menuButton
            
            main
            
            Spacer()
            
            Text("Berkay Dişli")
                .bold()
                .padding(.bottom, 40)
        }
        .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height)
        .background(.white)
        .edgesIgnoringSafeArea(.horizontal)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu(navigationController: NavigationVM(), dataVisual: DataVisuals())
    }
}




extension SideMenu {
    var menuButton: some View {
        HStack {
            Spacer()
            Image(systemName: "line.3.horizontal")
                .font(.title)
                .rotationEffect(Angle(degrees: navigationController.sideMenuStatus == .menuOpen ? 90:0))
                .padding(.top, 13).padding(.trailing)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        navigationController.closeMenu()
                        navigationController.showTabBar()
                    }
                }
        }
        .padding(.top, 40)
    }
    
    var main: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Display Options")
                    .foregroundColor(.gray)
                Picker(selection: $dataVisual.showSingleItems, label: Text("Picker")) {
                    Image(systemName: "square.grid.2x2").tag(false)
                    Image(systemName: "1.circle").tag(true)
                }
                .pickerStyle(.segmented)
                
                // Tells the user which option is selected along with symbols
                Text(dataVisual.showSingleItems ? "Single":"Grid")
                    .foregroundColor(.pink)
                
                
                HStack {
                    Spacer()
                    // Directs to SubscriptionPage but it is NOT a NavigationLink
                    // Once clicked, it activates the switch to navigate FROM ListingPage instead of SideMenu. Therefore on return, user will return to ListingPage
                    Text("Subscribe")
                        .font(.title3).bold()
                        .frame(width: 150, height: 50)
                        .foregroundColor(.pink)
                        .overlay(Rectangle().stroke(LinearGradient(colors: [.purple, .pink], startPoint: .top, endPoint: .bottom), lineWidth: 2))
                        .padding(.top)
                        .onTapGesture {
                            // Navigation switches activated
                            navigationController.openSubsPage()
                            navigationController.closeMenu()
                        }
                    Spacer()
                }
            }
            .padding(.horizontal)
            Spacer()
        }
        .padding(.top, 40)
    }
}
