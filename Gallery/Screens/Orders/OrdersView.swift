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
        NavigationStack {
            List(galleryViewModel.orders) { order in
                NavigationLink(value: order) {
                    OrderListCell(order: order)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Orders")
            .navigationDestination(for: Order.self) { order in
                OrderDetailsView(order: order)
            }
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

