//
//  ContentView.swift
//  Gallery
//
//  Created by Norbert Agoston on 16.01.2025.
//

import SwiftUI

struct ItemsView: View {
    @EnvironmentObject var galleryViewModel: GalleryViewModel
    @StateObject var viewModel = ItemsViewViewModel()
    
    var body: some View {
        NavigationView {
            List(galleryViewModel.items) { item in
                ItemListCell(item: item)
                    .onTapGesture {
                        viewModel.selectedItem = item
                        viewModel.isShowingItemDetailView = true
                    }
            }
            .listStyle(.plain)
            .navigationTitle("Gallery")
            .toolbar {
                Button {
                    print("Add new Item")
                    viewModel.isShowingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $viewModel.isShowingNewItemView) {
            NewItemView(newItemPresented: $viewModel.isShowingNewItemView)
        }
        .sheet(isPresented: $viewModel.isShowingItemDetailView) {
            ItemDetailsView(selectedItem: viewModel.selectedItem, isShowingItemDetailView: $viewModel.isShowingItemDetailView)
        }
    }
}

#Preview {
    ItemsView()
}
