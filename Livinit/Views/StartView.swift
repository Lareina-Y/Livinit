//
//  StartView.swift
//  Livinit
//
//  Created by Lareina Yang on 3/15/25.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack {      
            // Get Start Button
            PrimaryButton(
                title: "GET STARTED",
                action: {
                    authViewModel.navigateTo(.login)
                }
            )
        }
    }
}

#Preview {
    StartView()
        .environmentObject(AuthViewModel())
}
