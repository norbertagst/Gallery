//
//  ContactListCell.swift
//  Gallery
//
//  Created by Norbert Agoston on 28.01.2025.
//

import SwiftUI

struct ContactListCell: View {
    let contact: Contact
    
    var body: some View {
        HStack {
            ScaledImage(name: contact.imageName)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(contact.name)
                Text(contact.organisation)
            }
            .padding(.leading, 20)
        }
    }
}

#Preview {
    ContactListCell(contact: MockData.contact)
}
