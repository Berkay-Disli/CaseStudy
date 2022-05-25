//
//  SubscriptionPage.swift
//  CaseStudy
//
//  Created by Berkay Disli on 25.05.2022.
//

import SwiftUI

struct SubscriptionPage: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2).ignoresSafeArea()
            VStack {
                ZStack(alignment: .leading) {
                    Image("girl")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width, height: 321)
                    Color.black
                        .frame(width: UIScreen.main.bounds.width * 0.5, height: 319)
                        .opacity(0.12)
                    
                    VStack {
                        HStack {
                            Image(systemName: "xmark")
                                .font(.title2).foregroundColor(.white)
                                .padding()
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
                
                VStack(spacing: 10) {
                    Text("Premium Service 🥳")
                        .font(.title).bold()
                    
                    Text("Take part and enjoy this beautiful application.")
                }
                
                
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
