//
//  DataViewModel.swift
//  CaseStudy
//
//  Created by Berkay Disli on 25.05.2022.
//

import Foundation

class DataViewModel: ObservableObject {
    @Published var templates = [Template]()
    @Published var categories = [String]()
    @Published var templatesByCategory = [Template]()
    @Published var detailImages = [CanvasImages]()
    
    private var categoriesSet = Set<String>()
    
    init() {
        getData()
    }
    
    func getData() {
        guard let url = URL(string: "http://storly-dev.herokuapp.com/storly/api/templates") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let result = try JSONDecoder().decode([Template].self, from: data)
                
                // published changes are on main thread
                DispatchQueue.main.async {
                    self.templates = result
                    self.setCategories()
                    self.showDesiredCategoryTemplates(category: "Birthday")
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
    func setCategories() {
        for template in templates {
            categoriesSet.insert(template.section)
        }
        for category in categoriesSet {
            categories.append(category)
            categories = categories.sorted { $0 < $1 }
        }
    }
    
    func showDesiredCategoryTemplates(category: String) {
        templatesByCategory = templates.filter({($0.section.localizedCaseInsensitiveContains(category))})
    }
    
    func showDetails(template: Template) {
        detailImages.removeAll(keepingCapacity: false)
        
        detailImages.append(CanvasImages(frame1080x1920Model: FrameModel(width: 0, height: 0, x: 0, y: 0), defaultImageString: template.templateCoverImageUrlString))
        
        for image in template.canvasImages {
            detailImages.append(image)
        }
    }
    
}
