//
//  ContentView.swift
//  Gallery
//
//  Created by Norbert Agoston on 16.01.2025.
//

import SwiftUI

struct ItemsView: View {
    @StateObject var viewModel = ItemsViewViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.itemsList) { item in
                ItemListCell(item: item)
            }
            .listStyle(.plain)
            .navigationTitle("Gallery")
            .toolbar {
                Button {
                    print("Add new Item")
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $viewModel.showingNewItemView) {
            NewItemView(newItemPresented: $viewModel.showingNewItemView)
        }
    }
}

#Preview {
    ItemsView()
}
