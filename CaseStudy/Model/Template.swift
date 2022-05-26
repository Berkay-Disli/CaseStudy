//
//  Template.swift
//  CaseStudy
//
//  Created by Berkay Disli on 25.05.2022.
//

import Foundation

struct Template: Hashable, Codable {
    let templateCoverImageUrlString: String?
    let section: String?
    let isFree: Bool?
    let canvasImages: [CanvasImages]
}

struct CanvasImages: Hashable, Codable {
    let frame1080x1920Model: FrameModel
    let defaultImageString: String
}


struct FrameModel: Hashable, Codable {
    let width: Int
    let height: Int
    let x: Int
    let y: Int
}


