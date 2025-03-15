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
    
    func navigateTo(_ screen: AuthScreen) {
        currentScreen = screen
    }
} 