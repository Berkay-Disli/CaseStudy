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
            HStack {
                if let image = template.templateCoverImageUrlString {
                    KFImage(URL(string: image))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 190)
                }
                
                
                VStack(alignment: .trailing, spacing: 0) {
                    if let section = template.section {
                        Text(section)
                            .font(.system(size: 40)).bold()
                            .lineLimit(2)
                            .frame(width: 200, alignment: .trailing)
                    }
                    
                    Button {
                        // download except the cover image
                    } label: {
                        Text("Download 😏")
                            .font(.title2).foregroundColor(.pink)
                            .fixedSize()
                            
                            .padding(.top)
                    }

                }
                
                Spacer()
                Rectangle().fill(LinearGradient(colors: [.pink, .pink, .orange], startPoint: .top, endPoint: .bottom))
                    
                    .frame(width: 30 ,height: 190)
                    
            }
            .padding([.top, .bottom, .leading])
            
            Divider()
        }
        
    }
}

struct SingleCartItem_Previews: PreviewProvider {
    static var previews: some View {
        SingleCartItem(template: Template(templateCoverImageUrlString: "https://storage.googleapis.com/download/storage/v1/b/storly-7a4ba.appspot.com/o/templates%2Fresized%2F605a3e25c643fd000430f394_1635351106182.jpg?generation=1635351106661335&alt=media", section: "Minimal", isFree: false, canvasImages: [CanvasImages(frame1080x1920Model: FrameModel(width: 0, height: 0, x: 0, y: 0), defaultImageString: "")]))
    }
}

