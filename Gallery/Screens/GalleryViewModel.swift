//
//  GalleryViewModel.swift
//  Gallery
//
//  Created by Norbert Agoston on 27.01.2025.
//

import SwiftUI

class GalleryViewModel: ObservableObject {
    @Published var items = MockData.items
    
    func addNewItemToGallery(with name: String, description: String) {
        let newItem = Item(name: name, description: description)
        items.append(newItem)
    }
    
//    func removeFromCart(_ product: Product) {
//        items.removeAll { $0.id == product.id }
//    }
}
