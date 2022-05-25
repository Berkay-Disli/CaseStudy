//
//  SideMenu.swift
//  CaseStudy
//
//  Created by Berkay Disli on 25.05.2022.
//

import SwiftUI

struct SideMenu: View {
    @ObservedObject var sideMenuNav: NavigationVM
    @ObservedObject var dataVisual: DataVisuals
    @State private var pickerSelection = 0
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "line.3.horizontal")
                    .font(.title)
                    .rotationEffect(Angle(degrees: sideMenuNav.sideMenuStatus == .menuOpen ? 90:0))
                    .padding(.top, 13).padding(.trailing)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            sideMenuNav.closeMenu()
                        }
                    }
            }
            .padding(.top, 40)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Display Options")
                        .foregroundColor(.gray)
                    Picker(selection: $dataVisual.showSingleItems, label: Text("Picker")) {
                        Image(systemName: "square.grid.2x2").tag(false)
                        Image(systemName: "1.circle").tag(true)
                    }
                    .pickerStyle(.segmented)
                    
                    Text(dataVisual.showSingleItems ? "Single":"Grid")
                        .foregroundColor(.pink)
                    
                    
                    HStack {
                        Spacer()
                        Text("Subscribe")
                            .font(.title3).bold()
                            
                            .frame(width: 150, height: 50)
                            .foregroundColor(.pink)
                            .overlay(Rectangle().stroke(LinearGradient(colors: [.purple, .pink], startPoint: .top, endPoint: .bottom), lineWidth: 2))
                            .padding(.top)
                            .onTapGesture {
                                sideMenuNav.openSubsPage()
                                sideMenuNav.closeMenu()
                            }
                        Spacer()
                    }

                    
                }
                .padding(.horizontal)
                
                
                
                Spacer()
            }
            .padding(.top, 40)
            
            
            
            Spacer()
            
            Text("Berkay Dişli")
                .bold()
                .padding(.bottom, 40)
        }
        .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height)
        .background(.white)
        
        //.shadow(color:.gray.opacity(0.4), radius: sideMenuNav.sideMenuStatus == .menuOpen ? 5:0, x: 5, y: 0)
        .edgesIgnoringSafeArea(.horizontal)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu(sideMenuNav: NavigationVM(), dataVisual: DataVisuals())
    }
}
