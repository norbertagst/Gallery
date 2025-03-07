//
//  GalleryViewModel.swift
//  Gallery
//
//  Created by Norbert Agoston on 27.01.2025.
//

import SwiftUI

class GalleryViewModel: ObservableObject {
    @Published var items = MockData.items
    @Published var contacts = MockData.contacts
    @Published var orders = MockData.orders//[Order]()
    
    func addNewItemToGallery(with name: String, description: String) {
        let newItem = Item(name: name, description: description)
        items.append(newItem)
    }
    
    func addNewContactToGallery(with name: String, organisation: String) {
        let newContact = Contact(name: name, organisation: organisation)
        contacts.append(newContact)
    }
    
    func addNewOrderToGallery(with beneficiary: UUID?) {
        guard let beneficiary else {
            // Maybe handle the error
            return
        }
        let newOrder = Order(beneficiary: beneficiary)
        orders.append(newOrder)
    }
    
    func beneficiaryName(for orderBeneficiary: UUID?) -> String {
        var beneficiaryName = ""
        guard let orderBeneficiary else { return beneficiaryName }
        
        beneficiaryName = contacts.filter { $0.id == orderBeneficiary}.first?.name ?? "Contact Not Found"
        
        return beneficiaryName
    }
    
    func addItems(selectedItems: Set<Item>, toOrder orderID: UUID?) {
        let items = Array(selectedItems)
        guard let orderID else {
            return
        }
        
        for i in items.indices {
            items[i].currentStatus = .borrowed(orderID: orderID)
        }
        
        if let index = orders.firstIndex(where: { $0.id == orderID }) {
            orders[index].items.append(contentsOf: items)
        }
    }
}
