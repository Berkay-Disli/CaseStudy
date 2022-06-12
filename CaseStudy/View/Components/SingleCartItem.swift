//
//  SingleCartItem.swift
//  CaseStudy
//
//  Created by Berkay Disli on 11.06.2022.
//

import SwiftUI
import Kingfisher

struct SingleCartItem: View {
    let template: Template
    
    var body: some View {
        VStack {
            KFImage(URL(string: template.templateCoverImageUrlString ?? ""))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width * 0.7)
            
            Text(template.section?.uppercased() ?? "")
                .font(.largeTitle).bold()
        }
        .padding(.bottom)
    }
}

struct SingleCartItem_Previews: PreviewProvider {
    static var previews: some View {
        SingleCartItem(template: Template(templateCoverImageUrlString: "https://storage.googleapis.com/download/storage/v1/b/storly-7a4ba.appspot.com/o/templates%2Fresized%2F605a3e25c643fd000430f394_1635351106182.jpg?generation=1635351106661335&alt=media", section: "Minimal", isFree: false, canvasImages: [CanvasImages(frame1080x1920Model: FrameModel(width: 0, height: 0, x: 0, y: 0), defaultImageString: "")]))
    }
}

