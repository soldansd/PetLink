//
//  Authentication.swift
//  PetLink
//
//  Created by Даниил Соловьев on 19/08/2024.
//

import Foundation

class Authentication: ObservableObject {
    
    @Published private var isValidated = false
    @Published private var _user: User?
    @Published private var _shelter: Shelter?
    
    var user: User? {
        get { _user }
        set {
            _shelter = nil
            _user = newValue
        }
    }
    
    var shelter: Shelter? {
        get { _shelter }
        set {
            _user = nil
            _shelter = newValue
        }
    }
    
    func updateValidation(_ isValid: Bool) {
        isValidated = isValid
    }
}
