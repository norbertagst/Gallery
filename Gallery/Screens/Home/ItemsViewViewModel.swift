//
//  ItemsViewViewModel.swift
//  Gallery
//
//  Created by Norbert Agoston on 16.01.2025.
//

import SwiftUI

class ItemsViewViewModel: ObservableObject {
    @Published var isShowingNewItemView = false
    @Published var isShowingItemDetailView = false
    @Published var selectedItem: Item?
}
