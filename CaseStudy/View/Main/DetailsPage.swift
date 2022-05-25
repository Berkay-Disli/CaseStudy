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
    var items = Array(0..<10)
    var body: some View {
        VStack {
            Pager(page: page, data: dataVM.detailImages, id: \.self) { model in
                ImageComp(imgUrl: model.defaultImageString)
            }
            .loopPages()
            
            
        }
    }
}

struct DetailsPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailsPage(dataVM: DataViewModel())
    }
}
