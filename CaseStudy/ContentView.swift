//
//  ContentView.swift
//  CaseStudy
//
//  Created by Berkay Disli on 25.05.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabBarNavigator()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataViewModel())
    }
}
