//
//  ProfilePage.swift
//  Livinit
//
//  Created by Lareina Yang on 3/6/25.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Profile Page")
                        
            // Logout button
            PrimaryButton(
                title: "Logout",
                action: {
                    // Navigate back to login page
                    authViewModel.navigateTo(.login)
                },
                backgroundColor: .red
            )
            .padding(.bottom, 30)
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
}
