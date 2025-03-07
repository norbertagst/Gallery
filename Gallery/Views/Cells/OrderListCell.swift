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
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("\(order.items.count)")
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        
    }
}

#Preview {
    OrderListCell(order: MockData.order1)
}
