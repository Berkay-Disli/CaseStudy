//
//  ListingPage.swift
//  CaseStudy
//
//  Created by Berkay Disli on 25.05.2022.
//

import SwiftUI

struct ListingPage: View {
    @StateObject var dataVM = DataViewModel()
    // Select categories
    @State private var selectedCategory = "Birthday"
    @ObservedObject var navigationController: NavigationVM
    @ObservedObject var dataVisual: DataVisuals
    
    // Grid
    let columns: [GridItem] = [GridItem(.flexible(), spacing: -20, alignment: .center),
                               GridItem(.flexible(), spacing: -20, alignment: .center)]
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .leading) {
                
                // Hidden navigationlinks with no label
                NavigationLink(destination: SubscriptionPage(), isActive: $navigationController.subscriptionPage) { }
                NavigationLink(destination: DetailsPage(dataVM: dataVM, navigationController: navigationController), isActive: $navigationController.detailsPage) { }
                
                VStack {
                    // Header
                    header
                    
                    // Templates Showcase
                    ScrollView(showsIndicators: false) {
                        // If no template is available, progress view will show
                        if !dataVM.templatesByCategory.isEmpty {
                            // Either a GridLayout
                            if !dataVisual.showSingleItems {
                                gridLayout
                            } else {    // Or single layout
                                singleLayout
                            }
                        } else {
                            ProgressView()
                        }
                    }
                     
                }
            }
            .onAppear(perform: {
                navigationController.showTabBar()
            })
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct ListingPage_Previews: PreviewProvider {
    static var previews: some View {
        ListingPage(navigationController: NavigationVM(), dataVisual: DataVisuals())
    }
}




extension ListingPage {
    var header: some View {
        VStack(spacing: 15) {
            // -- Side Menu and Pro Button
            HStack {
                Image(systemName: "line.3.horizontal").font(.title)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            navigationController.openMenu()
                            navigationController.hideTabBar()
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
    }
    
    var gridLayout: some View {
        LazyVGrid(columns: columns) {
            ForEach(dataVM.templatesByCategory, id: \.self) { template in
                if let imgUrl = template.templateCoverImageUrlString {
                    CoverImageComp(dataVisual: dataVisual, imageUrl: imgUrl)
                        .padding([.bottom], 10)
                        .onTapGesture {
                            dataVM.showDetails(template: template)
                            navigationController.hideTabBar()
                            navigationController.openDetailsPage()
                            
                        }
                }

            }
        }
        .transition(AnyTransition.opacity.animation(.easeInOut))
    }
    
    var singleLayout: some View {
        LazyVStack {
            ForEach(dataVM.templatesByCategory, id: \.self) { template in
                if let imgUrl = template.templateCoverImageUrlString {
                    CoverImageComp(dataVisual: dataVisual, imageUrl: imgUrl)
                        .padding([.bottom], 10)
                        .onTapGesture {
                            dataVM.showDetails(template: template)
                            navigationController.hideTabBar()
                            navigationController.openDetailsPage()
                            
                        }
                }
            }
        }
    }
    
}
