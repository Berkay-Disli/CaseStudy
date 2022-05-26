//
//  CoverImageComp.swift
//  CaseStudy
//
//  Created by Berkay Disli on 25.05.2022.
//

import SwiftUI
import Kingfisher

struct CoverImageComp: View {
    @ObservedObject var dataVisual: DataVisuals
    let imageUrl: String
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            KFImage(URL(string: imageUrl))
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Image(systemName: "suit.diamond")
                .font(.caption)
                .foregroundColor(.white)
                .padding(4)
                .background(LinearGradient(colors: [.purple, .pink], startPoint: .top, endPoint: .bottom))
                .clipShape(Circle())
                .padding(8)
                .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 0)
            
            VStack {
                Spacer()
                Image(systemName: "heart")
                    .font(.caption)
                    .foregroundColor(.black)
                    .padding(4)
                    .background(.white)
                    .clipShape(Circle())
                    .padding(8)
                    .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 0)
            }
        }
        // Frame changes according to listing style -> (2x2 Grid or Single per Page)
        .frame(width: !dataVisual.showSingleItems ? UIScreen.main.bounds.width * 0.425:UIScreen.main.bounds.width * 0.8, height: !dataVisual.showSingleItems ? UIScreen.main.bounds.height * 0.35 : UIScreen.main.bounds.height * 0.65)
        .cornerRadius(20)
    }
}

struct CoverImageComp_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageComp(dataVisual: DataVisuals(), imageUrl: "")
    }
}
