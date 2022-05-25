//
//  SideMenu.swift
//  CaseStudy
//
//  Created by Berkay Disli on 25.05.2022.
//

import SwiftUI

struct SideMenu: View {
    @ObservedObject var sideMenuNav: NavigationVM
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "line.3.horizontal")
                    .font(.title)
                    .rotationEffect(Angle(degrees: sideMenuNav.sideMenuStatus == .menuOpen ? 90:0))
                    .padding(.top, 13)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            sideMenuNav.closeMenu()
                        }
                    }
            }
            .padding(.top, 40)
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height)
        .background(.white)
        .shadow(color:.gray.opacity(0.4), radius: sideMenuNav.sideMenuStatus == .menuOpen ? 5:0, x: 5, y: 0)
        .edgesIgnoringSafeArea(.horizontal)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu(sideMenuNav: NavigationVM())
    }
}
