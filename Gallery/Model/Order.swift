//
//  Order.swift
//  Gallery
//
//  Created by Norbert Agoston on 16.01.2025.
//

import Foundation

struct Order: Identifiable {
    let id = UUID()
    let beneficiary: UUID // A contact's UUID
    let items: [Item]
}
