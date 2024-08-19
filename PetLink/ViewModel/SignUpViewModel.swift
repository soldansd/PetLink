//
//  AuthenticationViewModel.swift
//  PetLink
//
//  Created by Даниил Соловьев on 19/08/2024.
//

import Foundation

class SignUpViewModel: ObservableObject {
    
    @Published var credentials = Credentials(email: "", password: "", type: .user)
    
}
