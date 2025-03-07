//
//  GalleryApp.swift
//  Gallery
//
//  Created by Norbert Agoston on 16.01.2025.
//

import SwiftUI

@main
struct GalleryApp: App {
    @StateObject private var galleryViewModel = GalleryViewModel()

    var body: some Scene {
        WindowGroup {
            GalleryTabView()
                .environmentObject(galleryViewModel)
        }
    }
}
