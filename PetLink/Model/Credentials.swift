//
//  AuthenticationModel.swift
//  PetLink
//
//  Created by Даниил Соловьев on 19/08/2024.
//

import Foundation

struct Credentials: Codable {
    var email: String
    var password: String
    var type: CustomerType
}
