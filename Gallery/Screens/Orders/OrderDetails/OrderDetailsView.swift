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
            Text("Beneficiary: \(order.beneficiary?.uuidString ?? "No Beneficiary")")
            Text("Items in order: \(order.items.count)")
            Text("Order description: \(order.description)")
            
            List {
                ForEach(order.items) { item in
                    ItemListCell(item: item)
                }
            }
            .listStyle(.plain)
                        
            actionButton(buttonTitle: "Close Order") {
                galleryViewModel.restoreItemsToDeposit(items: order.items)
                galleryViewModel.removeAllItemsFromOrder(order)
                dismiss()
            }
        }
    }
}

#Preview {
    OrderDetailsView(order: MockData.order1)
}
