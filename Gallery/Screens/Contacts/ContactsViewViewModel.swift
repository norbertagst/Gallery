//
//  ContactsViewViewModel.swift
//  Gallery
//
//  Created by Norbert Agoston on 28.01.2025.
//

import SwiftUI

class ContactsViewViewModel: ObservableObject {
    @Published var isShowingNewContactView = false
    @Published var isShowingContactDetailsView = false
    @Published var selectedContact: Contact?
}
