//
//  ListingPage.swift
//  CaseStudy
//
//  Created by Berkay Disli on 25.05.2022.
//

import SwiftUI

struct ListingPage: View {
    @StateObject var dataVM = DataViewModel()
    @State private var selectedCategory = "Birthday"
    @ObservedObject var sideMenuNav: NavigationVM
    @ObservedObject var dataVisual: DataVisuals
    
    let columns: [GridItem] = [GridItem(.flexible(), spacing: -20, alignment: .center),
                               GridItem(.flexible(), spacing: -20, alignment: .center)]
    
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .leading) {
                
                NavigationLink(destination: Text("subsc"), isActive: $sideMenuNav.subscriptionPage) { }
                
                NavigationLink(destination: DetailsPage(dataVM: dataVM), isActive: $sideMenuNav.detailsPage) { }
                
                VStack {
                    // Header
                    VStack(spacing: 15) {
                        // -- Side Menu and Pro Button
                        HStack {
                            Image(systemName: "line.3.horizontal").font(.title)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        sideMenuNav.openMenu()
                                    }
                                }
                            Spacer()
                            Button { } label: {
                                HStack(spacing: 2) {
                                    Image(systemName: "suit.diamond")
                                    Text("Pro").bold()
                                }
                                .foregroundColor(.white)
                                .frame(width: 75, height: 30)
                                .background(LinearGradient(colors: [.purple, .pink], startPoint: .top, endPoint: .bottom))
                                .cornerRadius(50)
                            }
                        }
                        .padding(.horizontal).padding(.bottom, 5)
                        //.padding(.top, 42)
                        
                        // -- Categories
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(dataVM.categories, id: \.self) { category in
                                    VStack(spacing: 8) {
                                        Text(category)
                                            .fontWeight(selectedCategory == category ? .bold:.regular)
                                            .foregroundColor(selectedCategory == category ? .black: .gray)
                                            .padding(.horizontal, 8)
                                            .animation(.none, value: selectedCategory)
                                            .onTapGesture {
                                                withAnimation(.easeInOut) {
                                                    selectedCategory = category
                                                    dataVM.showDesiredCategoryTemplates(category: category)
                                                }
                                            }
                                        Capsule().fill(selectedCategory == category ? .black:.clear)
                                            .frame(height: 1)
                                    }
                                    .padding(.bottom, 20)
                                }
                            }
                            .padding(.horizontal)
                        }
                        .frame(width: UIScreen.main.bounds.width, height: 40)
                        
                        
                    }
                    
                    // Templates Showcase
                    ScrollView {
                        if !dataVM.templatesByCategory.isEmpty {
                            if !dataVisual.showSingleItems {
                                LazyVGrid(columns: columns) {
                                    ForEach(dataVM.templatesByCategory, id: \.self) { template in
                                        CoverImageComp(dataVisual: dataVisual, imageUrl: template.templateCoverImageUrlString)
                                            .padding([.bottom], 10)
                                            .onTapGesture {
                                                dataVM.showDetails(template: template)
                                                sideMenuNav.openDetailsPage()
                                            }

                                    }
                                }
                                .transition(AnyTransition.opacity.animation(.easeInOut))
                            } else {
                                LazyVStack {
                                    ForEach(dataVM.templatesByCategory, id: \.self) { template in
                                        CoverImageComp(dataVisual: dataVisual, imageUrl: template.templateCoverImageUrlString)
                                            .padding([.bottom], 10)
                                    }
                                }
                            }
                        } else {
                            ProgressView()
                        }
                    }
                     
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct ListingPage_Previews: PreviewProvider {
    static var previews: some View {
        ListingPage(sideMenuNav: NavigationVM(), dataVisual: DataVisuals())
    }
}
