//
//  GalleryTabView.swift
//  Gallery
//
//  Created by Norbert Agoston on 16.01.2025.
//

import SwiftUI

struct GalleryTabView: View {
    var body: some View {
        TabView {
            ItemsView()
                .tabItem { Label("Home", systemImage: "house") }
            ContactsView()
                .tabItem { Label("Contacts", systemImage: "person") }
            OrdersView()
                .tabItem { Label("Orders", systemImage: "bag") }
        }
    }
}

#Preview {
    GalleryTabView()
}
