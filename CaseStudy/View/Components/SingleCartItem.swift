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
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                }
                
                Spacer()
                
                if let section = template.section {
                    Text(section)
                        .font(.system(size: 50)).bold()
                        .lineLimit(1)
                        .rotationEffect(Angle(degrees: -90))
                        .fixedSize()
                        .frame(width: 100)
                }
            }
            .padding()
            
            Divider()
        }
        
    }
}

