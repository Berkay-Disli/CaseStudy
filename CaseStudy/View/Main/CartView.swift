//
//  CartView.swift
//  CaseStudy
//
//  Created by Berkay Disli on 11.06.2022.
//

import SwiftUI
import SwiftUIPager
import Kingfisher

struct CartView: View {
    @EnvironmentObject var dataVM: DataViewModel
    @StateObject var page: Page = .first()
    @State private var index = 0
    let downLoader = ImageDownloader.default

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
                    SingleCartItem(template: template)
                }
                .onPageChanged({ index in
                    self.index = index
                })
                .loopPages()
                .frame(height: UIScreen.main.bounds.height * 0.7)
                
                Button {
                    // download the template with index..
                    // remove it from cart
                    print(dataVM.cartItems[index].canvasImages[0].defaultImageString)
                    let image = KFImage(URL(string: dataVM.cartItems[index].canvasImages[0].defaultImageString))
                    UIImageWriteToSavedPhotosAlbum(KFImage(URL(string: dataVM.cartItems[index].canvasImages[0].defaultImageString)).asUIImage(), nil, nil, nil)
                    
                } label: {
                    Text("Download")
                        .font(.title2).bold().foregroundColor(.white)
                        .frame(width: 180, height: 50)
                        .background(.pink)
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 5)
                }

                
                Spacer()
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


extension View {
// This function changes our View to UIView, then calls another function
// to convert the newly-made UIView to a UIImage.
    public func asUIImage() -> UIImage {
        let controller = UIHostingController(rootView: self)
        
        controller.view.frame = CGRect(x: 0, y: CGFloat(Int.max), width: 1, height: 1)
        UIApplication.shared.windows.first!.rootViewController?.view.addSubview(controller.view)
        
        let size = controller.sizeThatFits(in: UIScreen.main.bounds.size)
        controller.view.bounds = CGRect(origin: .zero, size: size)
        controller.view.sizeToFit()
        
// here is the call to the function that converts UIView to UIImage: `.asUIImage()`
        let image = controller.view.asUIImage()
        controller.view.removeFromSuperview()
        return image
    }
}

extension UIView {
// This is the function to convert UIView to UIImage
    public func asUIImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
