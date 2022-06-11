//
//  CaseStudyApp.swift
//  CaseStudy
//
//  Created by Berkay Disli on 25.05.2022.
//

import SwiftUI

@main
struct CaseStudyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DataViewModel())
        }
    }
}
