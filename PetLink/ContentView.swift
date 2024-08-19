//
//  ContentView.swift
//  PetLink
//
//  Created by Даниил Соловьев on 19/08/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var auth = Authentication()
    
    var body: some View {
        if let user = auth.user {
            UserTabView()
        } else if let shelter = auth.shelter {
            ShelterTabView()
        } else {
            SignUpView()
                .environmentObject(auth)
        }
    }
}

#Preview {
    ContentView()
}
