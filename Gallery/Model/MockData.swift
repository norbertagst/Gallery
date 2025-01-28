//
//  MockData.swift
//  Gallery
//
//  Created by Norbert Agoston on 28.01.2025.
//

import Foundation

struct MockData {
    // Item
    
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
    
    //Contact
    static let contact = Contact(name: "John Doe", organisation: "MET")
    
    static let contact1 = Contact(name: "John Doe", organisation: "MET")
    static let contact2 = Contact(name: "Jane Doe", organisation: "ART")
    static let contact3 = Contact(name: "John Dere")
    static let contact4 = Contact(name: "Black Adder", organisation: "England")

    static let contacts = [contact1, contact2, contact3, contact4]
}

