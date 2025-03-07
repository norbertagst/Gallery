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
    
    // TODO: move this to viewMOdel
    @State private var selectedOrderID: UUID?
    @Binding var isTabBarHidden: Bool
    @Binding var addToOrderAction: () -> ()
    
    
    var availableItems: [Item] {
        galleryViewModel.items.filter { $0.currentStatus == .inDeposit }
    }

    var borrowedItems: [Item] {
        galleryViewModel.items.filter {
            if case .borrowed = $0.currentStatus { 
                return true
            } else {
                return false
            }
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            NavigationView {
                VStack {
                    if viewModel.isEditing {
                        SelectOrderView(selectedOrderID: $selectedOrderID,
                                        galleryViewModel: galleryViewModel,
                                        selectedItems: viewModel.selectedItems)
                    }
                    List(selection: $viewModel.selectedItems) {
                        Section(header: Text("Available")) {
                            ForEach(availableItems) { item in
                                ItemListCell(item: item)
                                    .onTapGesture {
                                        if !viewModel.isEditing {
                                            print("Handle on tap ")
                                            viewModel.selectedItem = item
                                            viewModel.isShowingItemDetailView = true
                                        } else {
                                            print("Handle on multiple selection ")
                                        }
                                    }.tag(item)
                            }
                        }
                        
                        Section(header: Text("Borrowed")) {
                            ForEach(borrowedItems) { item in
                                ItemListCell(item: item)
                                    .onTapGesture {
                                        if !viewModel.isEditing {
                                            print("Handle on tap ")
                                            viewModel.selectedItem = item
                                            viewModel.isShowingItemDetailView = true
                                        } else {
                                            print("Handle on multiple selection ")
                                        }
                                    }
                                    .disabled(viewModel.isEditing)
                            }
                        }
                    }
                    .environment(\.editMode, $viewModel.editMode)
                    .onChange(of: viewModel.isEditing, perform: { isEditing in
                        viewModel.editMode = isEditing ? .active : .inactive
                    })
                    .listStyle(.grouped)
                    .navigationTitle("Gallery")
                    .toolbar {
                        Button {
                            print("Add new Item")
                            viewModel.isShowingNewItemView.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                        
                        Button {
                            viewModel.isEditing.toggle()
                            isTabBarHidden.toggle()
                            
                        } label: {
                            if viewModel.isEditing {
                                Text("Done")
                            } else {
                                Image(systemName: "checkmark.circle")
                            }
                        }
                        
                    }
                }
            }
        }
        .sheet(isPresented: $viewModel.isShowingNewItemView) {
            NewItemView()
        }
        .sheet(isPresented: $viewModel.isShowingItemDetailView) {
            ItemDetailsView(selectedItem: viewModel.selectedItem, isShowingItemDetailView: $viewModel.isShowingItemDetailView)
        }
        .onAppear {
            if selectedOrderID == nil {
                selectedOrderID = galleryViewModel.orders.first?.id
            }
            
            addToOrderAction = {
                print("Add to Order")
                galleryViewModel.addItems(selectedItems: viewModel.selectedItems,
                                          toOrder: selectedOrderID)
                
                viewModel.selectedItems.removeAll()
            }
        }
    }
}

struct SelectOrderView: View {
    @Binding var selectedOrderID: UUID?
    @ObservedObject var galleryViewModel: GalleryViewModel
    var selectedItems: Set<Item>
    
    var body: some View {
        Text("You selected \(selectedItems.map { $0.name })")
        Picker("Select an Order", selection: Binding(
            get: { selectedOrderID ?? galleryViewModel.orders.first?.id },
            set: { selectedOrderID = $0 }
        )) {
            ForEach(galleryViewModel.orders) { order in
                Text(order.beneficiary?.uuidString ?? "No benificiary")
                    .tag(order.id as UUID?)
            }
        }
        .pickerStyle(MenuPickerStyle())
    }
}

#Preview {
    ItemsView(isTabBarHidden: .constant(false), addToOrderAction: .constant {})
}
