//
//  GalleryTabView.swift
//  Gallery
//
//  Created by Norbert Agoston on 16.01.2025.
//

import SwiftUI

struct GalleryTabView: View {
    @State private var isTabBarHidden = false
    @State private var addToOrderAction: () -> () = {}
    
    var body: some View {
//        TabView {
//            ItemsView()
//                .tabItem { Label("Home", systemImage: "house") }
//            ContactsView()
//                .tabItem { Label("Contacts", systemImage: "person") }
//            OrdersView()
//                .tabItem { Label("Orders", systemImage: "bag") }
//        }
        ZStack(alignment: .bottom) {
            TabView {
                ItemsView(isTabBarHidden: $isTabBarHidden, addToOrderAction: $addToOrderAction)
                    .tabItem { Label("Home", systemImage: "house") }
                ContactsView()
                    .tabItem { Label("Contacts", systemImage: "person") }
                OrdersView()
                    .tabItem { Label("Orders", systemImage: "bag") }
            }
            if isTabBarHidden {
                VStack(spacing: 0) {
                    Divider()
                    Button {
                        print("Add to order Parent")
                        addToOrderAction()
                    } label: {
                        Text("Add to Order")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                    }
                    .padding(.top, 10)
                }
                .background(.ultraThinMaterial)
                .transition(.move(edge: .bottom))
            }
        }
    }
}

#Preview {
    GalleryTabView()
}
