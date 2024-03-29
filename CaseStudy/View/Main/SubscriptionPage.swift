//
//  SubscriptionPage.swift
//  CaseStudy
//
//  Created by Berkay Disli on 25.05.2022.
//

import SwiftUI

struct SubscriptionPage: View {
    // Subscription Case is set for default
    @State private var selection: Subscription = .monthly
    @Environment(\.dismiss) var dismiss     // Dismiss the page (function)
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2).ignoresSafeArea()   // Background color
            
            VStack {
                // MainTitle
                Text("Subscription")
                    .font(.title2).bold()
                
                // Main Image and view dismiss button
                image
                
                serviceText
                
                subscriptionTypeSelection
                
                
                bottomTexts
                
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}

struct SubscriptionPage_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionPage()
    }
}


extension SubscriptionPage {
    var image: some View {
        ZStack(alignment: .leading) {
            Image("girl")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width, height: 321)
            // Half the image is slightly darker. (for Before-After look)
            Color.black
                .frame(width: UIScreen.main.bounds.width * 0.5, height: 319)
                .opacity(0.12)
            
            VStack {
                HStack {
                    // Dismiss the view
                    Image(systemName: "xmark")
                        .font(.title2).foregroundColor(.white)
                        .padding()
                        .onTapGesture {
                            dismiss()
                        }
                    Spacer()
                }
                Spacer()
                
                HStack {
                    Text("Before")
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .frame(width: 70, height: 30)
                        .background(LinearGradient(colors: [.purple, .pink], startPoint: .top, endPoint: .bottom))
                        .cornerRadius(50)
                        .padding()
                    
                    Spacer()
                    
                    Text("After")
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .frame(width: 70, height: 30)
                        .background(LinearGradient(colors: [.purple, .pink], startPoint: .top, endPoint: .bottom))
                        .cornerRadius(50)
                        .padding()
                }
            }
                
        }
        .frame(width: UIScreen.main.bounds.width, height: 321)
    }
    
    var serviceText: some View {
        VStack(spacing: 10) {
            Text("Premium Service 🥳")
                .font(.title).bold()
            
            Text("Take part and enjoy this beautiful application.")
        }
        .padding(.top, 30)
    }
    
    var subscriptionTypeSelection: some View {
        HStack {
            // Iterate through all cases of subscription types
            ForEach(Subscription.allCases, id: \.self) { item in
                VStack(spacing: 2) {
                    Text(item.title)
                    Text("$\(item.price)")
                        .font(.title).bold()
                }
                .foregroundColor(selection == item ? .white:.black)
                .frame(width: 130, height: 100)
                .background(selection == item ? .black:.white)
                .cornerRadius(10)
                .onTapGesture {     // on tap, selection is changed
                    withAnimation(.easeInOut) {
                        selection = item
                    }
                }
            }
        }
        .padding(.vertical, 20)
    }
    
    var bottomTexts: some View {
        VStack {
            Button(action: {}, label: {     // button with no function
                Text("Start Now")
                    .font(.title2).bold()
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                    .background(.black)
                    .cornerRadius(10)
                    .padding(.top)
            })
            
            Text("Cancel whenever you want, hopefully not.")
            
            Spacer()
            HStack(spacing: 30) {
                Text("Privacy Policy").bold()
                Text("Terms of Use").bold()
            }
            .foregroundColor(.black)
            .padding(.bottom)
        }
    }
}
