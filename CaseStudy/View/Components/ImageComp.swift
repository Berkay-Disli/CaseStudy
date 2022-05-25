//
//  ImageComp.swift
//  CaseStudy
//
//  Created by Berkay Disli on 25.05.2022.
//

import SwiftUI
import Kingfisher

struct ImageComp: View {
    let imgUrl: String
    
    var body: some View {
        VStack {
            KFImage(URL(string: imgUrl))
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct ImageComp_Previews: PreviewProvider {
    static var previews: some View {
        ImageComp(imgUrl: "https://firebasestorage.googleapis.com/v0/b/storly-7a4ba.appspot.com/o/templates%2FyIwPxo1EDNG9IJwN.png?alt=media&token=10d26f78-91be-4c68-ba19-57afb98b1923")
    }
}
