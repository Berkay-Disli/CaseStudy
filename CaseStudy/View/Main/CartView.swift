//
//  CartView.swift
//  CaseStudy
//
//  Created by Berkay Disli on 11.06.2022.
//

import SwiftUI
import SwiftUIPager

struct CartView: View {
    @EnvironmentObject var dataVM: DataViewModel
    @StateObject var page: Page = .first()
    @State private var index = 0

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("My Cart")
                Spacer()
                Button {
                    // clear cart with animation
                    withAnimation(.easeInOut) {
                        dataVM.emptyCart()
                    }
                } label: {
                    Image(systemName: "cart.badge.minus")
                }

            }
            .font(.title2)
            .foregroundColor(.pink)
            .padding()
            
            
            if !dataVM.cartItems.isEmpty {
                Pager(page: page, data: dataVM.cartItems, id: \.self) { template in
                    if let imgStr = template.templateCoverImageUrlString {
                        SingleCartItem(template: template)
                    }
                }
                .onPageChanged({ index in
                    self.index = index
                })
                .loopPages()
            } else {
                Spacer()
                Text("Your cart is empty! 🥳")
                    .font(.largeTitle)
                    .foregroundColor(.pink)
                    .transition(AnyTransition.scale.animation(.easeInOut))
                    Spacer()
            }
            
            Spacer()
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(DataViewModel())
    }
}
