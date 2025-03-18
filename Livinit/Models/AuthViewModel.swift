//
//  AuthViewModel.swift
//  Livinit
//
//  Created by Claude on 3/15/25.
//

import SwiftUI

enum AuthScreen {
    case splash
    case start
    case login
    case signup
    case main
}

class AuthViewModel: ObservableObject {
    @Published var currentScreen: AuthScreen = .splash
    
    // Key for UserDefaults
    private let hasSeenStartScreenKey = "hasSeenStartScreen"
    
    // Check if user has seen the start screen before
    var hasSeenStartScreen: Bool {
        return UserDefaults.standard.bool(forKey: hasSeenStartScreenKey)
    }
    
    // Mark that user has seen the start screen
    func markStartScreenAsSeen() {
        UserDefaults.standard.set(true, forKey: hasSeenStartScreenKey)
    }
    
    func navigateTo(_ screen: AuthScreen) {
        currentScreen = screen
    }
} 