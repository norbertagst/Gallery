//
//  ItemsViewViewModel.swift
//  Gallery
//
//  Created by Norbert Agoston on 16.01.2025.
//

import SwiftUI

class ItemsViewViewModel: ObservableObject {
//    @Published var itemsList = [Item]()
    @Published var itemsList = MockData.items
    @Published var showingNewItemView = false
}
