//
//  ContactsView.swift
//  Gallery
//
//  Created by Norbert Agoston on 16.01.2025.
//

import SwiftUI

struct ContactsView: View {
    @EnvironmentObject var galleryViewModel: GalleryViewModel
    @StateObject var viewModel = ContactsViewViewModel()
    
    var body: some View {
        NavigationStack {
            List(galleryViewModel.contacts) { contact in
                ContactListCell(contact: contact)
                    .onTapGesture {
                        viewModel.selectedContact = contact
                        viewModel.isShowingContactDetailsView = true
                    }
            }
            .listStyle(.plain)
            .navigationTitle("Contacts")
            .toolbar {
                Button {
                    print("Add new Contact")
                    viewModel.isShowingNewContactView.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $viewModel.isShowingNewContactView) {
            NewContactView()
        }
    }
}

#Preview {
    ContactsView()
}
