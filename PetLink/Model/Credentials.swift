//
//  AuthenticationModel.swift
//  PetLink
//
//  Created by Даниил Соловьев on 19/08/2024.
//

import Foundation

struct Credentials: Codable {
    let email: String
    let password: String
    let type: CustomerType
}
