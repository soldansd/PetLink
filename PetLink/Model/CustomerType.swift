//
//  CustomerType.swift
//  PetLink
//
//  Created by Даниил Соловьев on 19/08/2024.
//

import Foundation

enum CustomerType: String, CaseIterable, Identifiable, Codable {
    case user
    case shelter
    
    var id: CustomerType {
        self
    }
}
