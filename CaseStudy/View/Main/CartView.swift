//
//  CartView.swift
//  CaseStudy
//
//  Created by Berkay Disli on 11.06.2022.
//

import SwiftUI

struct CartView: View {
    @
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("My Cart")
                Spacer()
                Image(systemName: "cart.badge.minus")
            }
            .font(.title2)
            .foregroundColor(.pink)
            .padding()
            
            
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(1...5, id: \.self) { item in
                        SingleCartItem(template: <#Template#>)
                    }
                }
            }
            
            Spacer()
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
