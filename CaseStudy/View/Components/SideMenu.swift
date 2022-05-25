//
//  SideMenu.swift
//  CaseStudy
//
//  Created by Berkay Disli on 25.05.2022.
//

import SwiftUI

struct SideMenu: View {
    @Binding var showSideMenu: SideMenuNav
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "line.3.horizontal")
                    .font(.title)
                    .rotationEffect(Angle(degrees: showSideMenu == .menuOpen ? 90:0))
                    .padding(.top, 13)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            showSideMenu = .menuClosed
                        }
                    }
            }
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height - 80)
        .background(.white)
        .shadow(color: .gray.opacity(0.4), radius: 5, x: 5, y: 0)
        .edgesIgnoringSafeArea(.horizontal)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu(showSideMenu: .constant(.menuClosed))
    }
}
