//
//  NewContactView.swift
//  Gallery
//
//  Created by Norbert Agoston on 28.01.2025.
//

import SwiftUI

struct NewContactView: View {
    @EnvironmentObject var galleryViewModel: GalleryViewModel
    @State var newContact = Contact()
    @Binding var newContactPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Contact")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 50)
            
            Form {
                TextField("Name", text: $newContact.name)
                    .autocorrectionDisabled()
                
                TextField("Organisation", text: $newContact.organisation)
                    .autocorrectionDisabled()
            }
            
            actionButton(buttonTitle: "Save Contact") {
                galleryViewModel.addNewContactToGallery(with: newContact.name, organisation: newContact.organisation)
                newContactPresented = false
            }
        }
    }
}

#Preview {
    NewContactView(newContactPresented: .constant(false))
}

