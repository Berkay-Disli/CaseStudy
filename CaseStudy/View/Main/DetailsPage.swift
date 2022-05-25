//
//  DetailsPage.swift
//  CaseStudy
//
//  Created by Berkay Disli on 25.05.2022.
//

import SwiftUI
import SwiftUIPager

struct DetailsPage: View {
    //@State private var selectedImage = 0
    @StateObject var page: Page = .first()
    @ObservedObject var dataVM: DataViewModel
    @ObservedObject var navigationController: NavigationVM
    @Environment(\.dismiss) var dismiss
    
    var items = Array(0..<10)
    var body: some View {
        VStack(spacing: 0) {
            
            HStack {
                Image(systemName: "chevron.left")
                    .onTapGesture {
                        dismiss()
                        navigationController.showTabBar()
                    }
                    
                Spacer()
                
                Text(dataVM.detailedTemplate.isFree ? "Free":"Subscribe")
                    .bold()
                    .foregroundColor(.pink)
                    .transition(AnyTransition.scale.animation(.easeInOut))
                    
            }
            .padding(.horizontal)
            .frame(width: UIScreen.main.bounds.width, height: 70)
            
            Pager(page: page, data: dataVM.detailImages, id: \.self) { model in
                ImageComp(imgUrl: model.defaultImageString)
            }
            .loopPages()
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
            
        }
    }
}

struct DetailsPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailsPage(dataVM: DataViewModel(), navigationController: NavigationVM())
    }
}
