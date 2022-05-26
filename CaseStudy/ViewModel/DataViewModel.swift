//
//  DataViewModel.swift
//  CaseStudy
//
//  Created by Berkay Disli on 25.05.2022.
//

import Foundation

class DataViewModel: ObservableObject {
    // All templates in an array
    @Published var templates = [Template]()
    // Categories filtered in an array
    @Published var categories = [String]()
    // Templates are filtered by category
    @Published var templatesByCategory = [Template]()
    // Isolated image collection of CLICKED template
    @Published var detailImages = [CanvasImages]()
    // Clicked template
    @Published var detailedTemplate = Template(templateCoverImageUrlString: "", section: "Colors", isFree: true, canvasImages: [CanvasImages(frame1080x1920Model: FrameModel(width: 0, height: 0, x: 0, y: 0), defaultImageString: "")])
    
    // Simple way to filter UNIQUE categories, >> This way there will only be 1 element for 1 category.
    private var categoriesSet = Set<String>()   // Used in setCategories
    
    init() {
        // Data will be brought as soon as this class initializes
        getData()
    }
    
    func getData() {
        guard let url = URL(string: "http://storly-dev.herokuapp.com/storly/api/templates") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                // Create a result array of type 'Template' model.
                let result = try JSONDecoder().decode([Template].self, from: data)
                
                // Published changes are on main thread since the code is inside a completion
                DispatchQueue.main.async {
                    self.templates = result.dropLast(3)
                    self.setCategories()
                    // setCategories func orderes categories alphabetically
                    // So the line below sets the default category selection to first index
                    self.showDesiredCategoryTemplates(category: "Birthday")
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    // Filter categories from the published templates array
    func setCategories() {
        for template in templates {
            guard let section = template.section else { return }
            categoriesSet.insert(section)  // Unique collection, easily done
        }
        // Set >> Array convertion. It's easier to use in 'ForEach' loop
        for category in categoriesSet {
            categories.append(category)
            categories = categories.sorted { $0 < $1 }
        }
    }
    
    // Filter templates array by desired category
    func showDesiredCategoryTemplates(category: String) {
        
        templatesByCategory = templates.filter({($0.section?.localizedCaseInsensitiveContains(category) ?? true)})
    }
    
    // After the cover image is clicked at ListingPage, this function sets the template to show details
    func showDetails(template: Template) {
        // First of, collection cleared
        detailImages.removeAll(keepingCapacity: false)
        
        // to upload 'templateCoverImageUrlString', it is wrapped inside a 'CanvasImages' model and appended to collection
        guard let imgUrl = template.templateCoverImageUrlString else { return }
        detailImages.append(CanvasImages(frame1080x1920Model: FrameModel(width: 0, height: 0, x: 0, y: 0), defaultImageString: imgUrl))
        // The rest of the images are already 'CanvasImages' model. So they are simply appended.
        for image in template.canvasImages {
            detailImages.append(image)
        }
        
        // Function takes 'template' argument and sets detailedTemplate to that argument.
        detailedTemplate = template
    }

    
}
