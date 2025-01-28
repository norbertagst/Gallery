//
//  Item.swift
//  Gallery
//
//  Created by Norbert Agoston on 16.01.2025.
//

import Foundation
import SwiftUI


struct Dimension {
    var width: Int = 1
    var height: Int = 1
    
    var description: String {
       return "\(width) x \(height) cm"
    }
    
    init(width: Int = 1, height: Int = 1) {
        self.width = width
        self.height = height
    }
}

enum Technique {
    case oilOnCanvas
    case graphic
    
    var description: String {
        switch self {
        case .oilOnCanvas:
            "Oil on canvas"
        case .graphic:
            "Graphic"
        }
    }
}

enum Status {
    case inDeposit
    case borrowed(orderID: UUID)
    
    var description: String {
        switch self {
        case .inDeposit:
            "In deposit"
        case .borrowed(let orderID):
            "Borrowed on order \(orderID)"
        }
    }
}

struct Item: Identifiable {
    let id = UUID()
    var name: String = ""
    var description: String = ""
    var technique: Technique = .oilOnCanvas
    var dimension: Dimension = Dimension()
    var imageName: String = "default"
    var dateCreated: Date = Date()
    var currentStatus: Status = .inDeposit
    
    init(name: String = "", description: String = "", technique: Technique = .oilOnCanvas, dimension: Dimension = Dimension(), imageName: String = "default", dateCreated: Date = Date(), currentStatus: Status = .inDeposit) {
        self.name = name
        self.description = description
        self.technique = technique
        self.dimension = dimension
        self.imageName = imageName
        self.dateCreated = dateCreated
        self.currentStatus = currentStatus
    }
}
