//
//  Contact.swift
//  Gallery
//
//  Created by Norbert Agoston on 16.01.2025.
//

import Foundation

struct Contact: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var organisation: String
    var imageName: String
    var currentOrder: UUID?
    
    init(name: String = "", organisation: String = "", imageName: String = "DefaultUser", currentOrder: UUID? = nil) {
        self.name = name
        self.organisation = organisation
        self.currentOrder = currentOrder
        self.imageName = imageName
    }
}
