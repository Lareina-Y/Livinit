//
//  LivinitApp.swift
//  Livinit
//
//  Created by Lareina Yang on 2/27/25.
//

import SwiftUI

@main
struct LivinitApp: App {
    var body: some Scene {
        WindowGroup {
            // ContentView()           // Start From the Main Screen
            AuthNavigationView()    // Start From the Onboarding Screens
        }
    }
}
