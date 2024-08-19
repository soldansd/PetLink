//
//  SignUpView.swift
//  PetLink
//
//  Created by Даниил Соловьев on 19/08/2024.
//

import SwiftUI

@MainActor
struct SignUpView: View {
    
    @StateObject var signUpVM = SignUpViewModel()
    @EnvironmentObject var auth: Authentication
    
    var body: some View {
        VStack(spacing: 30) {
            Picker("Choose a type", selection: $signUpVM.credentials.type) {
                ForEach(CustomerType.allCases) { typeCase in
                    Text(typeCase.rawValue)
                }
            }
            .pickerStyle(.segmented)
            
            TextField("Enter your email", text: $signUpVM.credentials.email)
                .keyboardType(.emailAddress)
            
            SecureField("Enter your password", text: $signUpVM.credentials.password)
            SecureField("Confrim your password", text: $signUpVM.confrimPassword)
            
            Button {
                Task {
                    if let id = await signUpVM.signUp() {
                        auth.user = User()
                    }
                }
            } label: {
                Text("Sign Up")
            }
            .disabled(signUpVM.signUpDisabled)
        }
        .textInputAutocapitalization(.never)
        
    }
}

#Preview {
    SignUpView()
        .environmentObject(Authentication())
}
