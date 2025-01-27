//
//  ItemListCell.swift
//  Gallery
//
//  Created by Norbert Agoston on 16.01.2025.
//

import SwiftUI

struct ItemListCell: View {
    let item: Item
    
    var body: some View {
        HStack {
            ScaledImage(name: item.imageName)
                .scaledToFill()
                .frame(width: 120, height: 90)
                .cornerRadius(6.0)
            
            VStack(alignment: .leading) {
                Text(item.name)
                Text(item.technique.description)
                Text("Size \(item.dimension.width) x \(item.dimension.height)")
            }
        }
    }
}

#Preview {
    ItemListCell(item: MockData.item1)
}
