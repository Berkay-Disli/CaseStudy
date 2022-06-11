//
//  Cart.swift
//  CaseStudy
//
//  Created by Berkay Disli on 11.06.2022.
//

import Foundation

struct Cart: Identifiable {
    let id = UUID().uuidString
    let templateItem: [Template]
}
