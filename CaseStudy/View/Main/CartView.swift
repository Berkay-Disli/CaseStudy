//
//  CartView.swift
//  CaseStudy
//
//  Created by Berkay Disli on 11.06.2022.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var dataVM: DataViewModel
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
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(dataVM.cartItems, id: \.self) { item in
                            SingleCartItem(template: item)
                        }
                    }
                }
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
