//
//  Packages.swift
//  CaseStudy
//
//  Created by Berkay Disli on 25.05.2022.
//

import SwiftUI

struct Packages: View {
    let title: String
    let price: String
    var body: some View {
        VStack {
            Text(title)
            
            Text("$\(price)")
                .font(.title).bold()
        }
        .frame(width: 130, height: 100)
        .background(.white)
    }
}

struct Packages_Previews: PreviewProvider {
    static var previews: some View {
        Packages(title: "Monthly", price: "2,99")
    }
}
