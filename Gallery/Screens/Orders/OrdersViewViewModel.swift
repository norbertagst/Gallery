//
//  OrdersViewViewModel.swift
//  Gallery
//
//  Created by Norbert Agoston on 28.01.2025.
//

import SwiftUI

class OrdersViewViewModel: ObservableObject {
    @Published var isShowingNewOrderView = false
    @Published var isShowingOrderDetailsView = false
    @Published var selectedOrder: Order?
}
