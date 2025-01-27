//
//  Date+DateFormatting.swift
//  Gallery
//
//  Created by Norbert Agoston on 17.01.2025.
//

import Foundation

extension Date {
    func formattedYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy" // Format for "2024"
        return dateFormatter.string(from: self)
    }
}
