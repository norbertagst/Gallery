//
//  NewOrderView.swift
//  Gallery
//
//  Created by Norbert Agoston on 28.01.2025.
//

import SwiftUI

struct NewOrderView: View {
    @EnvironmentObject var galleryViewModel: GalleryViewModel
    @Environment(\.dismiss) private var dismiss
    @State var beneficiaryName: String = ""
    @State var beneficiaryID: UUID?
    @State private var selectedBeneficiary: Contact = Contact()
    
    var body: some View {
        VStack {
            Text("New Order")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 50)
            
            Form {
                Text("Selected Beneficiary: \(selectedBeneficiary.name)")
                
                Picker("Select a Beneficiary", selection: $selectedBeneficiary) {
                    ForEach(galleryViewModel.contacts) { contact in
                        Text(contact.name).tag(contact)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            actionButton(buttonTitle: "Save Order") {
                galleryViewModel.addNewOrderToGallery(with: selectedBeneficiary.id)
                dismiss()
            }
        }
        .onAppear {
            guard let contact = galleryViewModel.contacts.first else {
                //handle no contacts case
                return
            }
            selectedBeneficiary = contact
        }
    }
}

#Preview {
    NewOrderView()
}
