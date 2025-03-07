//
//  ItemDetailsView.swift
//  Gallery
//
//  Created by Norbert Agoston on 27.01.2025.
//

import SwiftUI

struct ItemDetailsView: View {
    let selectedItem: Item?
    @Binding var isShowingItemDetailView: Bool
    
    var body: some View {
        ZStack {
            TabView {
                ItemPresentation(selectedItem: selectedItem)
                ItemDetails(selectedItem: selectedItem)
            }
            .tabViewStyle(.page)
            .background(Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
        }
        .overlay(alignment: .topTrailing) {
            Button {
                isShowingItemDetailView = false
            } label: {
                XDismissButton()
            }
            .padding(.top, 20)
            .padding(.trailing, 20)
        }
    }
}

struct ItemDetails: View {
    let selectedItem: Item?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(selectedItem?.name ?? "")
                .font(.custom("Georgia", size: 24))
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding()
            
            Text(selectedItem?.description ?? "")
                .font(.custom("Arial", size: 17))
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.bottom, 60)
            
            HStack {
                Text(selectedItem?.technique.description ?? "")
                    .font(.custom("Arial", size: 15))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                VerticalLineView()
                
                Text(selectedItem?.dimension.description ?? "")
                    .font(.custom("Arial", size: 15))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                VerticalLineView()
                
                Text(selectedItem?.dateCreated.formattedYear() ?? "")
                    .font(.custom("Arial", size: 15))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
            }
            
            Text("Status: \(selectedItem?.currentStatus.description ?? "")")
                .font(.custom("Arial", size: 17))
                .foregroundColor(.white)
                .padding(.top, 20)
                .padding(.horizontal)
            

//            var dateCreated: Date = Date()
//            var currentStatus: Status = .inDeposit
        }
    }
}

struct VerticalLineView: View {
    var body: some View {
        Rectangle()
            .frame(width: 1 / UIScreen.main.scale, height: 20) // 1 pixel wide
            .foregroundColor(.gray) // Set the color
            .padding() // Optional: Add padding
    }
}

struct ItemPresentation: View {
    let selectedItem: Item?
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                ScaledImage(name: selectedItem?.imageName ?? "default")
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                    .ignoresSafeArea(.all)
                
                VStack {
                    Spacer()
                    LinearGradient(
                        gradient: Gradient(colors: [.clear, .black]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 200) // Set the desired height
                }

                
                VStack(alignment: .leading) {
                    Spacer()
                    
                    Text(selectedItem?.name ?? "")
                        .font(.custom("Georgia", size: 24))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                    
                    Text(selectedItem?.description ?? "")
                        .font(.custom("Arial", size: 17))
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                        .truncationMode(.tail)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.bottom, 60)
                }
            }
        }
    }
}

//struct PageNavigationButton: View {
//    let imageName: String
//    let action: () -> ()
//    
//    var body: some View {
//        Button {
//            action()
//        } label: {
//            ZStack {
//                Circle()
//                    .frame(width: 30, height: 30)
//                    .foregroundColor(.white)
//                
//                Image(systemName: imageName)
//                    .frame(width: 44, height: 44)
//                    .symbolRenderingMode(.palette)
//                    .foregroundStyle(.black, .white)
//            }
//        }
//    }
//}

#Preview {
    ItemDetailsView(selectedItem: MockData.item1, isShowingItemDetailView: .constant(true))
}
