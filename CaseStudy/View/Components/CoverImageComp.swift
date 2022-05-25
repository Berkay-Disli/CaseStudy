//
//  CoverImageComp.swift
//  CaseStudy
//
//  Created by Berkay Disli on 25.05.2022.
//

import SwiftUI

struct CoverImageComp: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.gray
            
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
        .frame(width: UIScreen.main.bounds.width * 0.425, height: UIScreen.main.bounds.height * 0.35)
        .cornerRadius(20)
    }
}

struct CoverImageComp_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageComp()
    }
}
