//
//  Contact.swift
//  Gallery
//
//  Created by Norbert Agoston on 16.01.2025.
//

import Foundation

struct Contact: Identifiable {
    let id = UUID()
    let name: String
//    let location: String
    var currentOrder: UUID
}
