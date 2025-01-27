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

struct MockData {
    static let standardDescription = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    
    static let item1 = Item(name: "Painting 1",
                            description: standardDescription,
                            technique: .graphic,
                            dimension: Dimension(width: 100, height: 100),
                            imageName: "stag",
                            dateCreated: Date(),
                            currentStatus: .inDeposit)
    
    static let item2 = Item(name: "Painting 2",
                            description: standardDescription,
                            technique: .oilOnCanvas,
                            dimension: Dimension(width: 100, height: 100),
                            imageName: "athos",
                            dateCreated: Date(),
                            currentStatus: .inDeposit)
    
    static let item3 = Item(name: "Painting 3",
                            description: standardDescription,
                            technique: .oilOnCanvas,
                            dimension: Dimension(width: 100, height: 100),
                            imageName: "blue",
                            dateCreated: Date(),
                            currentStatus: .inDeposit)
    
    static let item4 = Item(name: "Painting 4",
                            description: standardDescription,
                            technique: .graphic,
                            dimension: Dimension(width: 100, height: 100),
                            imageName: "angel",
                            dateCreated: Date(),
                            currentStatus: .inDeposit)
    
    
    static let items = [item1, item2, item3, item4]
}
