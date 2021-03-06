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
    @State private var index = 0
    
    var items = Array(0..<10)
    var body: some View {
        VStack(spacing: 0) {
            
            //header
            header
            
            // Infinite looping imageshow careousel SwiftUIPager package is used to 'loop'.
            Pager(page: page, data: dataVM.detailImages, id: \.self) { model in
                ImageComp(imgUrl: model.defaultImageString)
            }
            .onPageChanged({ index in
                self.index = index
                print(dataVM.detailedTemplate.canvasImages)
            })
            .loopPages()
            
            // Small Popup of image frame and section details
            popup
            
            
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct DetailsPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailsPage(dataVM: DataViewModel(), navigationController: NavigationVM())
    }
}




extension DetailsPage {
    var header: some View {
        HStack {
            Image(systemName: "chevron.left")
                .onTapGesture {
                    dismiss()
                    navigationController.showTabBar()
                }
                
            Spacer()
            
            // If template is not free, Subscription NavLink appears
            if !(dataVM.detailedTemplate.isFree ?? false) {
                NavigationLink {
                    SubscriptionPage()
                } label: {
                    Text("Subscribe")
                        .bold()
                        .foregroundColor(.pink)
                        .transition(AnyTransition.scale.animation(.easeInOut))
                }
            } else {
                Text("Free")
                    .bold()
                    .foregroundColor(.pink)
                    .transition(AnyTransition.scale.animation(.easeInOut))
            }
        }
        .padding(.horizontal)
        .frame(width: UIScreen.main.bounds.width, height: 70)
    }
    
    var popup: some View {
        VStack {
            // When tappe, it slides up to show popup
            VStack(spacing: 4) {
                Text("Image Details")
                Image(systemName: navigationController.showBottomPopup ? "chevron.down":"chevron.up")
            }
            .foregroundColor(.gray)
            .padding(.bottom, navigationController.showBottomPopup ? 0 : 14)
            .onTapGesture {
                navigationController.changePopupMenu()
            }
            
            HStack(alignment: .top, spacing: 50) {
                VStack(alignment: .leading) {
                    // if index = 0, cover image is shown. Therefore no info will be shown at index 0
                    if index != 0 {
                        HStack {
                            Text("Image Width:").bold()
                            Spacer()
                            Text("\(dataVM.detailImages[index].frame1080x1920Model.width)").bold()
                                .foregroundColor(.pink)
                        }
                        .transition(AnyTransition.opacity.animation(.easeInOut))
                        HStack {
                            Text("Image Height:").bold()
                            Spacer()
                            Text("\(dataVM.detailImages[index].frame1080x1920Model.height)").bold()
                                .foregroundColor(.pink)
                        }
                        .transition(AnyTransition.opacity.animation(.easeInOut))
                    }
                }
                .frame(width: 170)
                
                
                
                VStack(alignment: .leading) {
                    Text("Section")
                        .foregroundColor(.gray)
                    if let section = dataVM.detailedTemplate.section?.uppercased() {
                        Text(section)
                            .font(.title).bold()
                            .foregroundColor(.pink)
                    }
                    
                }
                .padding(.bottom)
            }
            .frame(width: UIScreen.main.bounds.width, height: 90)
            .background(.ultraThinMaterial)
            .padding(.top, 10)
        
        }
        .offset(x: 0, y: !navigationController.showBottomPopup ? 90:0)
        // Line above: Offset will be animated to smoothly move up and down
    }
}
