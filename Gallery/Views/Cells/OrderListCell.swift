//
//  OrderListCell.swift
//  Gallery
//
//  Created by Norbert Agoston on 28.01.2025.
//

import SwiftUI

struct OrderListCell: View {
    let beneficiaryName: String
    
    var body: some View {
        Text(beneficiaryName)
    }
}

#Preview {
    OrderListCell(beneficiaryName: "")
}
