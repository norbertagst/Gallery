//
//  GalleryViewModel.swift
//  Gallery
//
//  Created by Norbert Agoston on 27.01.2025.
//

import SwiftUI

class GalleryViewModel: ObservableObject {
    @Published var items = MockData.items
    @Published var contacts = MockData.contacts
    
    func addNewItemToGallery(with name: String, description: String) {
        let newItem = Item(name: name, description: description)
        items.append(newItem)
    }
    
    func addNewContactToGallery(with name: String, organisation: String) {
        let newContact = Contact(name: name, organisation: organisation)
        contacts.append(newContact)
    }
    
//    func removeFromCart(_ product: Product) {
//        items.removeAll { $0.id == product.id }
//    }
}
