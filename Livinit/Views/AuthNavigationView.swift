//
//  AuthNavigationView.swift
//  Livinit
//
//  Created by Claude on 3/15/25.
//

import SwiftUI

struct AuthNavigationView: View {
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                switch authViewModel.currentScreen {
                case .splash:
                    SplashView()
                        .onAppear {
                            // Simulate splash screen delay
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                // Check if user has seen start screen before
                                if authViewModel.hasSeenStartScreen {
                                    // If yes, go directly to login
                                    authViewModel.navigateTo(.login)
                                } else {
                                    // If no, show start screen
                                    authViewModel.navigateTo(.start)
                                }
                            }
                        }
                
                case .start:
                    StartView()
                        .environmentObject(authViewModel)
                
                case .login:
                    LoginView()
                        .environmentObject(authViewModel)
                
                case .signup:
                    SignupView()
                        .environmentObject(authViewModel)
                
                case .main:
                    ContentView()
                        .environmentObject(authViewModel)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    AuthNavigationView()
} 
