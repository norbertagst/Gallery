//
//  OrderDetailsView.swift
//  Gallery
//
//  Created by Norbert Agoston on 07.03.2025.
//

import SwiftUI

struct OrderDetailsView: View {
    @EnvironmentObject var galleryViewModel: GalleryViewModel
    @Environment(\.dismiss) private var dismiss
    var order: Order
    var body: some View {
        VStack {
            Text("Order Id: \(order.id.uuidString)")
            Text("Beneficiary: \(galleryViewModel.beneficiaryName(for: order.beneficiary))")
            Text("Items in order: \(order.items.count)")
            Text("Order notes: \(order.notes)")
            
            List {
                ForEach(order.items) { item in
                    ItemListCell(item: item)
                }
            }
            .listStyle(.plain)
                        
            actionButton(buttonTitle: "Close Order") {
                galleryViewModel.closeOrder(order)
                dismiss()
            }
        }
    }
}

#Preview {
    OrderDetailsView(order: MockData.order1)
}
