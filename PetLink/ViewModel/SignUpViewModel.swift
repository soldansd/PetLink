//
//  AuthenticationViewModel.swift
//  PetLink
//
//  Created by Даниил Соловьев on 19/08/2024.
//

import Foundation

final class SignUpViewModel: ObservableObject {
    
    @Published var credentials = Credentials(email: "", password: "", type: .user)
    @Published var confrimPassword = ""
    @Published var error: Error?
    
    var signUpDisabled: Bool {
        return credentials.email.isEmpty || credentials.password.isEmpty || confrimPassword.isEmpty
    }
    
    
    func signUp() async -> UUID? {
        do {
            let id = try await NetworkManager.shared.signUp(credentials, for: "")
            return id
        } catch let err {
            print("Sign Up Error. \(err.localizedDescription)")
            await MainActor.run {
                error = err
            }
            return nil
        }
    }
}
