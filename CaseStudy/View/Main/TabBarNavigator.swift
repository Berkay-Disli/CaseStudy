//
//  TabBarNavigator.swift
//  CaseStudy
//
//  Created by Berkay Disli on 25.05.2022.
//

import SwiftUI

struct TabBarNavigator: View {
    @State private var selectedPage: Navigation = .homeView
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Navigate through pages
            switch selectedPage {
            case .homeView:
                ListingPage()
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
            VStack {
                HStack {
                    Image(systemName: selectedPage == .homeView ? "house.fill":"house")
                        .foregroundColor(selectedPage == .homeView ? .black:.gray)
                        .onTapGesture {
                            selectedPage = .homeView
                        }
                    Spacer()
                    Image(systemName: selectedPage == .newPost ? "square.grid.2x2.fill":"square.grid.2x2")
                        .foregroundColor(selectedPage == .newPost ? .black:.gray)
                        .onTapGesture {
                            selectedPage = .newPost
                        }
                    Spacer()
                    Image(systemName: selectedPage == .liked ? "heart.fill":"heart")
                        .foregroundColor(selectedPage == .liked ? .black:.gray)
                        .onTapGesture {
                            selectedPage = .liked
                        }
                }.padding(.bottom)
            }
            .font(.system(size: 30))
            .foregroundColor(.black)
            .padding(.horizontal, 50)
            .frame(width: UIScreen.main.bounds.width, height: 100)
            // Did not use materials since the guide screenshots looked like white color w/ opacity
            .background(.white.opacity(0.7))
            .cornerRadius(50)
            
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TabBarNavigator_Previews: PreviewProvider {
    static var previews: some View {
        TabBarNavigator()
    }
}
