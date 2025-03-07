//
//  OrdersView.swift
//  Gallery
//
//  Created by Norbert Agoston on 16.01.2025.
//

import SwiftUI

struct OrdersView: View {
    @EnvironmentObject var galleryViewModel: GalleryViewModel
    @StateObject var viewModel = OrdersViewViewModel()
    
    var body: some View {
        NavigationView {
            List(galleryViewModel.orders) { order in
                OrderListCell(order: order)
                    .onTapGesture {
                        viewModel.selectedOrder = order
                        viewModel.isShowingOrderDetailsView = true
                    }
            }
            .listStyle(.plain)
            .navigationTitle("Orders")
            .toolbar {
                Button {
                    print("Add new Order")
                    viewModel.isShowingNewOrderView.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $viewModel.isShowingNewOrderView) {
            NewOrderView()
        }
    }
}

#Preview {
    OrdersView()
}

