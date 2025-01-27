//
//  NewItemView.swift
//  Gallery
//
//  Created by Norbert Agoston on 17.01.2025.
//

import SwiftUI

struct NewItemView: View {
    @EnvironmentObject var galleryViewModel: GalleryViewModel
    @State var newItem = Item()
    @State var showTechniqueDialog = false
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 50)
            
            Form {
                TextField("Name", text: $newItem.name)
                    .autocorrectionDisabled()
                
                TextField("Description", text: $newItem.description)
                    .autocorrectionDisabled()
                
                HStack {
                    Text("Technique")
                    Spacer()
                    Button {
                        showTechniqueDialog = true
                    } label: {
                        HStack {
                            Text(newItem.technique.description)
                                .bold()
                            Image(systemName: "chevron.up.chevron.down")
                        }

                    }
                }
                Text("Creation Date: \(newItem.dateCreated.formattedYear())")
                DatePicker("Creation Date", selection: $newItem.dateCreated, displayedComponents: .date)
                    .datePickerStyle(.wheel)
            }
            .confirmationDialog("Set Technique", isPresented: $showTechniqueDialog, titleVisibility: .visible) {
                Button("\(Technique.oilOnCanvas.description)") { newItem.technique = .oilOnCanvas }
                Button("\(Technique.graphic.description)") { newItem.technique = .graphic }
            }
            
            actionButton(buttonTitle: "Save Item") {
                galleryViewModel.addNewItemToGallery(with: newItem.name, description: newItem.description)
                newItemPresented = false
            }
        }
//        let dimension: Dimension
//        let imageName: String
//        let dateCreated: Date
    }
}

struct actionButton: View {
    let buttonTitle: String
    let action: () -> ()
    var body: some View {
        Button {
            action()
        } label: {
            Text(buttonTitle)
                .padding()
                .foregroundStyle(.white)
                .background(.gray)
                .bold()
                .clipShape(
                    RoundedRectangle(cornerRadius: 10)
                )
        }
    }
}

#Preview {
    NewItemView(newItemPresented: .constant(false))
}
