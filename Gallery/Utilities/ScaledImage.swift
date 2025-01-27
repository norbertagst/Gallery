//
//  ScaledImage.swift
//  Gallery
//
//  Created by Norbert Agoston on 16.01.2025.
//

import SwiftUI

struct ScaledImage: View {
    let name: String
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
    }
}
