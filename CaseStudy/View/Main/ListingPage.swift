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
    let columns: [GridItem] = [GridItem(.flexible(), spacing: -20, alignment: .center),
                               GridItem(.flexible(), spacing: -20, alignment: .center)]
    
    
    var body: some View {
        VStack {
            // Header
            VStack(spacing: 15) {
                // -- Side Menu and Pro Button
                HStack {
                    Image(systemName: "line.3.horizontal").font(.title)
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
                .padding(.horizontal)
                
                // -- Categories
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(dataVM.categories, id: \.self) { category in
                            VStack {
                                Text(category)
                                    .fontWeight(selectedCategory == category ? .bold:.regular)
                                    .foregroundColor(selectedCategory == category ? .black: .gray)
                                    .padding(.horizontal, 8)
                                    .animation(.none, value: selectedCategory)
                                    .onTapGesture {
                                        withAnimation(.easeInOut) {
                                            selectedCategory = category
                                        }
                                    }
                                Capsule().fill(selectedCategory == category ? .black:.clear)
                                    .frame(height: 1)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(width: UIScreen.main.bounds.width, height: 40)
                
                
            }
            
            // Templates Showcase
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(1...20, id: \.self) { template in
                        CoverImageComp()
                            .padding([.bottom], 10)
                    }
                }
            }
            
            
        }
    }
}

struct ListingPage_Previews: PreviewProvider {
    static var previews: some View {
        ListingPage()
    }
}
