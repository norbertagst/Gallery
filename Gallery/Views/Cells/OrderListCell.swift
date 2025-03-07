//
//  OrderListCell.swift
//  Gallery
//
//  Created by Norbert Agoston on 28.01.2025.
//

import SwiftUI

struct OrderListCell: View {
    @EnvironmentObject var galleryViewModel: GalleryViewModel
    let order: Order
    
    var body: some View {
        VStack {
            Text(galleryViewModel.beneficiaryName(for: order.beneficiary))
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Items in order: \(order.items.count)")
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        
    }
}

#Preview {
    OrderListCell(order: MockData.order1)
}
